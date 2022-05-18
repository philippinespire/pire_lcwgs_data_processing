# Salarias fasciatus lcwgs

---

Jordan Rodriguez

---
This repository outlines the roadmap we followed to get *Salarias fasciatus* through the [Low Coverage Whole Genome Sequencing Pipeline](../) and the analysis we did in order to gain insight on the historical population demography of this aquarium fish. 

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

## 5. Convert the Filtered BAM Files to a Beagle File Using Angsd

*Note: be mindful of the possible default filters employed by angsd. See section b.*

a. To make the beagle file, you can use the `mkBGL.sbatch` script which accepts the directory with the filtered BAM files and a gzipped reference genome. The script will make a bgzipped reference genome and an fai index file. If a valid bgzipped reference genome and matching fai index file already exists, then mkBGL.sbatch accepts the bgzipped reference genome. 

```bash
# login to user@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus

# angsd outputs files to the present directory, so it's best to create an out dir and move there
mkdir mkBGL

# sbatch mkBGL.sbatch FilteredBamDir GzippedRefGenome
sbatch ../../mkBGL.sbatch fltrBAM GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz
```

It's a good idea to name the beagle file descriptively, so that it is easy to know the data that it contains.  Here, we used all filtered Sfa BAM files to make the beagle file.

```bash
mv mkBGL.beagle.gz Sfa-ABas-CBas_all-GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen_clmp_fp2_repr_fltrd.beagle.gz

# if the file name is unweildy, such as the one above you could store it in an enviromental variable to make it easier to use later
# you may need to enter bash for the following command to work
bglFile=Sfa-ABas-CBas_all-GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen_clmp_fp2_repr_fltrd.beagle.gz
```

b. In Downstream analysis, we realized that there were stringent default filters that were employed by angsd during the creation of the beagle file, removing data that we did not want to remove. To combat this, we made `mkBGL2.sbatch`, where we ran a series of 7 tests with different filter parameters indicated in the script. 

*Soon, we will be creating files for the `initial_bgl_filters` and `final_bgl_filters` for them to be fed to the script instead of hardcoded -- coming soon*

```bash 
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
$1=fltrBAMdir $2=outPREFIX
sbatch scripts/mkBGL2.sbatch fltrBAM test06
```

After running seven tests, we determined the final mkBGL settings that we believed fit best for *Salarias fasciatus*. We first subset the data for easier handling and faster visualization in R using the following code:

```bash 
zcat test06.snpStat.gz | head -n 100000 > test06.100k.snpStat
```

Next, edit the `.gitignore` file located in the parent dir to allow the subsetted txt file through when pushing changes. Pull the changes to your local computer and open the `processSnpStat.R` script.

You are now in the R environment:

After loading the needed librarys and data, make sure to change the `numInd` and `minInd` to the appropriate values for your dataset.
```R
numInd=81
minInd=30
```

---

## 6. Make a PopMap File

We need to make a popmap file that has 2 columns, populationID and IndiviudalID, here we use the filtered bam files and some bash commands to make the popmap.

```bash
bash
paste <( ls fltrBAM/*bam | sed -e 's/^.*\///' -e 's/_.*$//' ) <( ls fltrBAM/*bam | sed -e 's/^.*\///' -e 's/_L[1-8]_.*bam$//' -e 's/_Ex[1-9].*$//' ) > fltrBAM/popmap_sfa.tsv
```

## 7. Run [PCAngsd](http://popgen.dk/software/index.php/PCAngsd)

Tutorial: [http://www.popgen.dk/software/index.php/PCAngsdTutorial](http://www.popgen.dk/software/index.php/PCAngsdTutorial)

The path to file that you have now intuitively renamed above will need to be set as the first argument in the command line when running the `runPCANGSD.sbatch` script.  Make sure you've completed the previous step and you've saved the name of the beagle file into a variable named `bglFile`. The second and third arguments will create the out directory and the prefix to the out files.

```bash
# login to user@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
# $1=bglFile $2=OUTDIR $3=OUT_PREFIX
sbatch scripts/runPCANGSD.sbatch ./mkBGL/$bglFile ./PCAngsd out_PCAngsd
```

---

## 8. Wrangle Output from PCAngsd and Visualize Results

When PCAngsd is complete you can use `processPCAngsd_out.R` to visualize the results

But first, you have to make sure the correct packages are installed

```bash
enable_lmod
module load container_env ngsTools
module load R/4.1.3
crun R
```

You are now in the R environment

```R
install.packages("tidyverse")  #this takes a while
# say yes, and yes again,
# if you have xming turned on an working (windows subsystem linux on windows) then a window will pop up, select first option, otherwise,
# use mirror 1, say yes, wait for this to finish

install.packages("RcppCNPy")
```


```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
Rscript ../processPCAngsd_out.R PCAngsd/out_PCAgsd.cov PCAngsd/out_PCAgsd.selection.npy PCAngsd/out_PCAgsd.maf.npy fltrBAM/popmap_sfa.tsv   
```

add visual here 

---

## 9. Run Variants of PCAngsd 

In your species directory, make a copy of the runPCANGSD.sbatch script and appropriately name it.
```bash
# login to user@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
less runPCANGSD.sbatch # copy code
nano runPCANGSD_allelefreq.sbatch # paste code & edit
# edit the script as needed and save the script
```

When applying different aspects of the [PCAngsd tutorial](http://www.popgen.dk/software/index.php/PCAngsdTutorial) to your dataset, run the scripts from the species directory; the script will generate the out directory that you name as the second argument in the command line.

I made intuitively named copies of the `runPCANGSD.sbatch` script and similarly named the paired out directory for the below PCAngsd variants.

### Estimating Individual Allele Frequencies : `runPCANGSD_allelefreq.sbatch`
```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
# $1=bglFile $2=OUTDIR $3=OUT_PREFIX
sbatch scripts/runPCANGSD_allelefreq.sbatch ./mkBGL/$bglFile ./PCAngsd_allelefreq out_PCAngsd_allelefreq
```

### Without Estimating Individual Allele Frequencies : `runPCANGSD_noallelefreq.sbatch`
```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
sbatch scripts/runPCANGSD_noallelefreq.sbatch ./mkBGL/$bglFile ./PCAngsd_noallelefreq out_PCAngsd_noallelefreq
```

### Admixture based on two PC : `runPCANGSD_admix.sbatch`
```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
sbatch scripts/runPCANGSD_admix.sbatch ./mkBGL/$bglFile ./PCAngsd_admix out_PCAngsd_admix
```

### Inbreeding in the admixed individuals : `runPCANGSD_inbred_admix.sbatch`
```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
sbatch scripts/runPCANGSD_inbred_admix.sbatch ./mkBGL/$bglFile ./PCAngsd_inbred_admix out_PCAngsd_inbred_admix
```

### Inbreeding with individual allele frequencies : `runPCANGSD_inbred_allelefreq.sbatch`
```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
sbatch scripts/runPCANGSD_inbred_allelefreq.sbatch ./mkBGL/$bglFile ./PCAngsd_inbred_allelefreq out_PCAngsd_inbred_allelefreq
```

---

## 10. Wrangle Outputs from PCAngsd Variants and Visualize Results

Make sure the correct packages are installed

```bash
enable_lmod
module load container_env ngsTools
module load R/4.1.3
crun R
```

```R
install.packages("tidyverse")  #this takes a while
# say yes, and yes again,
# if you have xming turned on an working (windows subsystem linux on windows) then a window will pop up, select first option, otherwise,
# use mirror 1, say yes, wait for this to finish

install.packages("RcppCNPy")
```

Pull any changes to the species directory to your local computer and open `plotPCANGSD_allelefreq.R` in Rstudio.

### Estimating Individual Allele Frequencies: `plotPCANGSD_allelefreq.R`

I read in the `.tsv` pop map created above and the `.cov` out file from `runPCANGSD_allelefreq.sbatch` script into the `plotPCANGSD_allelefreq.R` script in Rstudio and ran the script.

Here were the results: 

PC1 v PC2 
![](plots/PCAngsd_allelefreq1.png)

PC1 v PC3
![](plots/PCAngsd_allelefreq2.png)

PC2 v PC3
![](plots/PCAngsd_allelefreq3.png)

### Without Estimating Individual Allele Frequencies: `plotPCANGSD_allelefreq.R`

To visualize the results from the `runPCANGSD_noallelefreq.sbatch` script, we again used the `plotPCANGSD_allelefreq.R` script in Rstudio, but read in the `.cov` out file from the `runPCANGSD_noallelefreq.sbatch` script. 

Here were the results: 

PC1 v PC2 
![](plots/PCAngsd_noallelefreq1.png)

PC1 v PC3
![](plots/PCAngsd_noallelefreq2.png)

PC2 v PC3
![](plots/PCAngsd_noallelefreq3.png)

### Admixture based on two PC: `plotPCANGSD_admix.R`

I created `plotPCANGSD_admix.R` by adapting the instructions from the [PCAngsd tutorial](http://www.popgen.dk/software/index.php/PCAngsdTutorial). To visualize results from the `runPCANGSD_admix.sbatch` script, I opened and ran `plotPCANGSD_admix.R` in Rstudio.

Here were the results: 

![](plots/PCAngsd_admix.png)

---

## 11. Selection

Here, we followed the Demo 2 portion of the [PCAngsd tutorial](http://popgen.dk/software/index.php/PCAngsd)

The objective is to use PCAngsd to estimate the covariance matrix while jointly estimating the individual allele frequencies.

### Infer selection accross the genome:

Now let's try to use the PC to infer selection along the genome based on the PCA.

I made yet another version of the `runPCAngsd` script and named it `runPCAngsd_selection.sbatch`.

This is the code I used:
```bash 
done on USER@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
sbatch scripts/runPCANGSD_selection.sbatch ./mkBGL/$bglFile ./PCAngsd_selection out_PCAngsd_selection
```
Now check the `.sites` file in the `out_PCAngsd_selection` out dir. If the file contains only zeros, you will need to modify your beagle file and rerun the above command. The `.` in the default chromosome marker can be removed and replaced using the following code:
*note: I made a copy of my beagle file to ensure I did not accidentally compromise the original file. I copied the bgl file into the Sfa dir. 
```bash
done on USER@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
zcat Sfa-ABas-CBas_all-GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen_clmp_fp2_repr_fltrd.beagle.gz | \
sed -e "s/NC_043745\.1/CHR01/" \
-e "s/NC_043745\.1/CHR01/" \
-e "s/NC_043746\.1/CHR02/" \
-e "s/NC_043747\.1/CHR03/" \
-e "s/NC_043748\.1/CHR04/" \
-e "s/NC_043749\.1/CHR05/" \
-e "s/NC_043750\.1/CHR06/" \
-e "s/NC_043751\.1/CHR07/" \
-e "s/NC_043752\.1/CHR08/" \
-e "s/NC_043753\.1/CHR09/" \
-e "s/NC_043754\.1/CHR10/" \
-e "s/NC_043755\.1/CHR11/" \
-e "s/NC_043756\.1/CHR12/" \
-e "s/NC_043757\.1/CHR13/" \
-e "s/NC_043758\.1/CHR14/" \
-e "s/NC_043759\.1/CHR15/" \
-e "s/NC_043760\.1/CHR16/" \
-e "s/NC_043761\.1/CHR17/" \
-e "s/NC_043762\.1/CHR18/" \
-e "s/NC_043763\.1/CHR19/" \
-e "s/NC_043764\.1/CHR20/" \
-e "s/NC_043765\.1/CHR22/" \
-e "s/NC_043766\.1/CHR23/" \
-e "s/NC_004412\.1/MIT01/" | \
less -S \
> Sfa-ABas-CBas_all-GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen_clmp_fp2_repr_fltrd_rnmd.beagle | \
gzip Sfa-ABas-CBas_all-GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen_clmp_fp2_repr_fltrd_rnmd.beagle
```
*note: The outputted beagle file will be unzipped, and thus will need to be rezipped with `gzip`. The command `gzip` will add the `.gz` to the end of your file, so don't include it in your redirect name. 

*tip: if you are unsure if your file is gzipped, you can use the command `file`, see below. 

```bash 
file FILENAME 
```

Now, rerun the `runPCAngsd_selection.sbatch` script with the modified beagle file and check to make sure the `.sites` file in the `out_PCAngsd_selection` out dir contains values. 

### Visualize results using `plotPCANGSD_selection.R`

results coming soon :)












 
