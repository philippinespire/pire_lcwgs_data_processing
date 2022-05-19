# Salarias fasciatus lcwgs

---

Jordan Rodriguez

---
This repository outlines the roadmap we followed to get *Salarias fasciatus* through the [Low Coverage Whole Genome Sequencing Pipeline](https://github.com/philippinespire/pire_lcwgs_data_processing) and the analysis we did in order to gain insight on the historical population demography of this aquarium fish. 

---

## 1. Preprocessing FqGZ files

I followed the [pire_fq_gq_processing](https://github.com/philippinespire/pire_fq_gz_processing) instructions and scripts

At the second fastp, we noticed a motif in the first 14 bp of the reads, so we split the data into 2 paths

* fp2: not clipping the first 14 bp
* fp2b: clipping off the first 14 bp

---

## 2. Getting only the Chromosomes and mtGenome from the Genome Download

```bash
# Download the genome 
wget https://ftp.ncbi.nih.gov/genomes/refseq/vertebrate_other/Salarias_fasciatus/all_assembly_versions/GCF_902148845.1_fSalaFa1.1/GCF_902148845.1_fSalaFa1.1_genomic.fna.gz

# get the line num for every chrom, contig, and scaffold in the genome download and save to file
zgrep -n '^>' GCF_902148845.1_fSalaFa1.1_genomic.fna.gz > GCF_902148845.1_fSalaFa1.1_genomic_linenums.txt

# get mitogenome, which starts on line 9968937, and save to file
zcat GCF_902148845.1_fSalaFa1.1_genomic.fna.gz | tail -n +9968937 > NC_004412.1_mtgenome.fasta

# get chromes 1-7 and save to file
zcat GCF_902148845.1_fSalaFa1.1_genomic.fna.gz | head -n 3077487 > NC_043745.1-NC_043751.1_chr1-7.fasta

# get chromes 8-23, theres no 21, and save to file
zcat GCF_902148845.1_fSalaFa1.1_genomic.fna.gz | tail -n +3431318 | head -n 5857623 > NC_043752.1-NC_043766.1_chr8-23.fasta

# concatenating and gzipping the chromosomes and mitogenome into one file
cat NC_043745.1-NC_043751.1_chr1-7.fasta NC_043752.1-NC_043766.1_chr8-23.fasta NC_004412.1_mtgenome.fasta | gzip > GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz
```

---

## 3. Mapping & Filtering Bams

I followed the [pire_lcwgs_data_processing](https://github.com/philippinespire/pire_lcwgs_data_processing) repo instructions

After step 5. 'Filter the binary alignment maps', separate the filtered bam files from the raw bam files.

```bash 
 cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
 mkdir fltrBAM
 mv mkBAM/*fltrd* fltrBAM/
```

---

## 4. Sequencing Calculations 

I cloned [rroberts_thesis](https://github.com/cbirdlab/rroberts_thesis) into `/home/e1garcia/shotgun_PIRE/` on wahab.hpc.odu.edu server to make the [`mappedReadStats.sbatch`](https://github.com/cbirdlab/rroberts_thesis/blob/main/scripts/bam_processing/mappedReadStats.sbatch) script easily accessible from any species directory.

I followed the [read_mapping_summary](https://github.com/cbirdlab/read_mapping_summary) section B. repo instructions.

Here are the visual results:

![](plots/pct_cov_meandepth_Sfa.png)

![](plots/prop_seqs_mapped_Sfa.png)

--- 

## 5. Make a PopMap File

We need to make a popmap file that has 2 columns, populationID and IndiviudalID, here we use the filtered bam files and some bash commands to make the popmap.

```bash
bash
paste <( ls fltrBAM/*bam | sed -e 's/^.*\///' -e 's/_.*$//' ) <( ls fltrBAM/*bam | sed -e 's/^.*\///' -e 's/_L[1-8]_.*bam$//' -e 's/_Ex[1-9].*$//' ) > fltrBAM/popmap_sfa.tsv
```

---

## 6. Convert the Filtered BAM Files to a Beagle File Using Angsd

It is important to note that there are stringent default filters that are employed by Angsd during the creation of the beagle file, which may remove data that we do not want to remove. To navigate this, we made `mkBGL.sbatch`, where we ran a series of 6 tests ranging from lenient filtering to stringent filtering. The last assigned `TODO` and `FILTERS` are the parameters that will be applied when the script is ran. 

To make the beagle file, run the `mkBGL.sbatch` script from the species directory. Here is the code I used when running test06: 
```bash
# done on USER@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
# Angsd outputs files to the mkBGL dir, so it may be usefiul to create this dir before running the script if you haven't already
mkdir mkBGL
# $1=fltrBAMdir $2=outPREFIX
sbatch scripts/mkBGL.sbatch fltrBAM test06
```

*Soon, we will be creating files for the `initial_bgl_filters` and `final_bgl_filters` for them to be fed to the script instead of hardcoded -- coming soon*

### Determining final `mkBGL.sbatch` settings

After running 6 tests, we determined the final mkBGL settings that we believed fit best for *Salarias fasciatus*. To do this, We first subset the data for easier handling and faster visualization in R using the following code for each test:

```bash
# here, we take only the first 100000 rows of our data and redirect that into a new file
zcat test06.snpStat.gz | head -n 100000 > test06.100k.snpStat
```

Next, edit the `.gitignore` file located in the parent dir to allow the subsetted txt file through when pushing changes. Pull the changes to your local computer and open the `processSnpStat.R` script.

You are now in the R environment:

After loading the needed librarys and data, make sure to change the `numInd` and `minInd` to the appropriate values for your dataset. Here, we use 81 and 41.
```R
numInd=81
minInd=41
```
This script will output a series of 12 plots: Positive Strand Read Counts, Negative Strand Read Counts, Positive Strand Minor AF, Negative Strand Minor AF, Strand Bias 1, Strand Bias 2, Strand Bias 3, HWE P Value, Base Quality P Value, Mapping Quality P Value, Edge P Value, and Het Stat P Value.

These plots, along with the PCA plots (created in step. 9), helped us to determine the final beagle file parameters needeed. If you are not satisfied with the plots, return to the `mkBGL.sbatch` script and modify the filters at this time. Continue to change the settings until you are satisfied.

---

## 7. Run [PCAngsd](http://popgen.dk/software/index.php/PCAngsd) : `runPCANGSD_selection_maptest.sbatch`

After following Demo 1 and 2 of the [PCAngsd tutorial](http://popgen.dk/software/index.php/PCAngsd), we created `runPCANGSD_selection_maptest`. The objective is to use PCAngsd to estimate the covariance matrix while jointly estimating the individual allele frequencies. 

Run `runPCANGSD_selection_maptest.sbatch` on the test beagle file. Here is the code I used for test06:
```bash
$1= InBGL $2=outDIR $3=outFilePREFIX $4=minMaf 
sbatch scripts/runPCANGSD_selection_maptest.sbatch ./mkBGL/test06.beagle.gz ./PCAngsd_selection test06_PCAngsd_selection_maptest 0.05
```

After the script finishes running, view the `.out` file and report the # SNPs retained and # Principal Components. Here are the stats for the tests we ran (minMaf 0.05):

| test##   | # SNPs retained | # Principal Components |
|----------|-----------------|------------------------|
| test 01  |     13345151    |            1           |
| test 02  |     7876119     |            1           |
| test 03  |     7780498     |            1           | 
| test 04  |     701713      |            1           |
| test 05  |     2772817     |            1           |
| test 06  |     560777      |            1           | 

---

## 8. Visualize results using `plotPCANGSD_selection.R`

Pull changes to your local computer and open `plotPCANGSD_selection.R` in Rstudio.

We only wanted to see the various PCAs for our test beagle files, so we read in the `.cov` from  file and the `popmap_sfa.tsv` file, and skipped to the portion titiled `#### visual pca ####` 

3 resulting PCAs are generated. 

---

## 9. Filter the Beagle File: Removing sites that dont pass

run `findSitesWithMinIndPerPop.bash`

```bash
$1=inFILE $2=outFILE
sbatch scripts/findSitesWithMinIndPerPop.bash test06.geno.gz mkBGL/test06.minIndPerPop20.sites
```
This will output a `.sites` file that describes sites where there at least 20 individualts per pop. This file will be used for argument 2 of `fltrBGL2.sbatch`. See code. 

run `fltrBGL2.sbatch`

```bash 
$1=bglFile $2=sitesFile
sbatch scripts/fltrBGL2.sbatch mkBGL/test06.beagle.gz mkBGL/test06.minIndPerPop20.sites
```
This will output a `*_fltrd.beagle.gz` file that can be used in step 7. Go back and run `runPCANGSD_selection_maptest.sbatch` on the filtered data. 

---

## 10. Run `runPCANGSD_selection_maptest.sbatch` on filtered data

Here, I ran `runPCANGSD_selection_maptest.sbatch` on test06 filtered data with minMaf = 0.05, 0.0, 0.1, 0.2, and 0.3. This is the code I ran with a minMaf = 0.05:

```bash 
$1= InBGL $2=outDIR $3=outFilePREFIX $4=minMaf 
sbatch scripts/runPCANGSD_selection_maptest.sbatch ./mkBGL/test06_fltrd.beagle.gz ./PCAngsd_selection test06_fltrd_maptest 0.05 
```










 
