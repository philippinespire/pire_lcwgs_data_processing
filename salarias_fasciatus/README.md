# Salarias fasciatus lcwgs

---

Jordan Rodriguez

---
This repository outlines the roadmap we followed to move *Salarias fasciatus* through the [Low Coverage Whole Genome Sequencing Pipeline](https://github.com/philippinespire/pire_lcwgs_data_processing) and the analysis we did in order to gain insight on the historical population demography of this popular aquarium fish species, also known as the jewelled blenny. 

---

## 1. Preprocessing FqGZ files

I followed the [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing) instructions and scripts (Garcia et al 2021). The purpose of the preprocessing pipeline was to Trim, deduplicate, decontaminate, and repair the raw `fq.gz` files.

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

I followed the [pire_lcwgs_data_processing](https://github.com/philippinespire/pire_lcwgs_data_processing) repo instructions (Bird et al. 2022).

After step 5. 'Filter the binary alignment maps', I separated the filtered bam files from the raw bam files.

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

[Percent Coverage & Mean Depth Plot](plots/pct_cov_meandepth_Sfa.png)

[Proportion of Mapped Sequences Plot](plots/prop_seqs_mapped_Sfa.png)

--- 

## 5. Make a PopMap File

We need to make a popmap file that has 2 columns, populationID and IndiviudalID, here we use the filtered bam files and some bash commands to make the popmap.

```bash
bash
paste <( ls fltrBAM/*bam | sed -e 's/^.*\///' -e 's/_.*$//' ) <( ls fltrBAM/*bam | sed -e 's/^.*\///' -e 's/_L[1-8]_.*bam$//' -e 's/_Ex[1-9].*$//' ) > fltrBAM/popmap_sfa.tsv
```

---

## 6. Convert the Filtered BAM Files to a Beagle File Using Angsd

It is important to note that there are stringent default filters that are employed by ANGSD during the creation of the beagle file, which will remove data that we do not want to remove. To navigate this, we made [`mkBGL.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/mkBGL.sbatch), where we ran a series of 6 tests ranging from lenient to stringent filtering. The last assigned `TODO` and `FILTERS` are the parameters that will be applied when the script is ran. Optimally, you should only have to make two beagle files; the first beagle file gives insight to the appropriate filter parameters needed for the second and final beagle file. You may need to make additional beagle files if the filters need to be adjusted. 

### a. Make beagle file with minimal filters 

You must first minimally filter the data so that you can accurately set the filter parameters for the final beagle file. 

To make the minimally filtered beagle file, run the [`mkBGL.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/mkBGL.sbatch) script with minimal `TODO` and `FILTERS` settings. Here is the code I used when making the `initial.beagle.gz` file: 
```bash
# done on USER@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
# ANGSD outputs files to the mkBGL dir, so it may be usefiul to create this dir before running the script if you haven't already
mkdir mkBGL
# $1=fltrBAMdir $2=outPREFIX
sbatch scripts/mkBGL.sbatch fltrBAM Sfa-ABas-CBas_all_initial
```
When running the above code again for the final beagle file, make sure to replace "initial" to "final" when naming the prefix.  

*Note: check the `.args` and the `.err` files to see what filters were applied to the run (double check that the ones you indicated are the ones listed), and which errors might have occurred during the run*

*Soon, we will be creating files for the `initial_bgl_filters` and `final_bgl_filters` for them to be fed to the script instead of hardcoded -- coming soon*

### b. Determine final [`mkBGL.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/mkBGL.sbatch) settings

Now that we have a minimally filtered beagle file, we can begin to visualize this data in order to determine the final filter settings. To do this, We first subsetted the `snpStat.gz` out file for easier handling and faster visualization in R using the following code for each test:

```bash
# here, we take only the first 100000 rows of our data and redirect that into a new file
zcat Sfa-ABas-CBas_all_initial.snpStat.gz | head -n 100000 > Sfa-ABas-CBas_all_initial.100k.snpStat
```

Next, edit the `.gitignore` file located in the parent dir to allow the subsetted txt file through when pushing changes. Pull the changes to your local computer and open the [`processSnpStat.R`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/processSnpStat.R) script.

You are now in the R environment:

After loading the needed librarys and data, make sure to change the `numInd` and `minInd` to the appropriate values for your dataset. Here, we use 81 and 41.
```R
numInd=81
minInd=41
```
This script will output a series of 12 plots: Positive Strand Read Counts, Negative Strand Read Counts, Positive Strand Minor AF, Negative Strand Minor AF, Strand Bias 1, Strand Bias 2, Strand Bias 3, HWE P Value, Base Quality P Value, Mapping Quality P Value, Edge P Value, and Het Stat P Value.

These plots, along with the PCA plots (created in step. 8), helped us to determine the final beagle file parameters needeed. If you are not satisfied with the plots, return to the [`mkBGL.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/mkBGL.sbatch) script and modify the filters at this time. Continue to change the settings until you are satisfied.

---

## 7. Run [PCAngsd](http://popgen.dk/software/index.php/PCAngsd) : [`runPCANGSD_selection_maptest.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/runPCANGSD_selection_maptest.sbatch)

After following Demo 1 and 2 of the [PCAngsd tutorial](http://popgen.dk/software/index.php/PCAngsd), we created [`runPCANGSD_selection_maptest`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/runPCANGSD_selection_maptest.sbatch). The objective is to use PCAngsd to estimate the covariance matrix while jointly estimating the individual allele frequencies. 

Run [`runPCANGSD_selection_maptest.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/runPCANGSD_selection_maptest.sbatch) on the beagle file. Here is the code I used for the final beagle file:
```bash
$1= InBGL $2=outDIR $3=outFilePREFIX $4=minMaf 
sbatch scripts/runPCANGSD_selection_maptest.sbatch ./mkBGL/Sfa-ABas-CBas_all_final.beagle.gz ./PCAngsd_selection  Sfa-ABas-CBas_all_final_PCAngsd_selection_maptest 0.05
```

After the script finishes running, view the `.out` file and report the # SNPs retained and # Principal Components. Here are the stats for the tests we ran (minMaf 0.05):

| test##             | # SNPs retained | # Principal Components |
|--------------------|-----------------|------------------------|
| test 01 (initial)  |     13345151    |            1           |
| test 02            |     7876119     |            1           |
| test 03            |     7780498     |            1           | 
| test 04            |     701713      |            1           |
| test 05            |     2772817     |            1           |
| test 06 (final)    |     560777      |            1           | 

*Chris Bird will be creating a script that culls this information from the outfiles and inputs into a .tsv so that it does not need to be manually entered. Coming soon!

---

## 8. Visualize results using [`plotPCANGSD_selection.R`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/plotPCANGSD_selection.R)

Pull changes to your local computer and open [`plotPCANGSD_selection.R`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/plotPCANGSD_selection.R) in Rstudio.

We wanted to see the various PCAs for our initial beagle file (and subsequently the final beagle file), so we read in the `.cov` file and the `popmap_sfa.tsv` file, and skipped to the portion titiled `#### READ IN PCA DATA ####`. Run everything from here down.

*Chris will be creating a script for the Manhattan plots that you currently see but skip over in the current script, coming soon!*

3 resulting PCAs are generated. If you are not satisfied with the PCA plots, return to step 6. and filter the data further until you are satisfied. Ideally, you'll want to move on to step 9. with ONLY the final beagle file. The final beagle file for *Salarias fasciatus* is named Sfa-ABas-CBas_all_final.beagle.gz and is located in the mkBGL dir.

---

## 9. Filter the Beagle File: Removing sites that dont pass

run [`findSitesWithMinIndPerPop.bash`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/findSitesWithMinIndPerPop.bash)

```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
$1=inFILE $2=outFILE
sbatch scripts/findSitesWithMinIndPerPop.bash mkBGL/Sfa-ABas-CBas_all_final.geno.gz mkBGL/Sfa-ABas-CBas_all_final.minIndPerPop20.sites
```
This will output a `.sites` file that describes sites where there are at least 20 individuals. This file will be used for argument 2 of [`fltrBGL2.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/fltrBGL2.sbatch). See code. 

run [`fltrBGL2.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/fltrBGL2.sbatch)

```bash 
$1=bglFile $2=sitesFile
sbatch scripts/fltrBGL2.sbatch mkBGL/Sfa-ABas-CBas_all_final.beagle.gz mkBGL/Sfa-ABas-CBas_all_final.minIndPerPop20.sites
```
This will output a `*_fltrd.beagle.gz` file that can be used in step 10. Run `runPCANGSD_selection_maptest.sbatch` on the filtered data. 

---

## 10. Run [`runPCANGSD_selection_maptest.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/runPCANGSD_selection_maptest.sbatch) on filtered data

Here, I ran [`runPCANGSD_selection_maptest.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/runPCANGSD_selection_maptest.sbatch) on the final filtered data with minMaf = 0.05, 0.0, 0.1, 0.2, and 0.3. This is the code I ran with a minMaf = 0.05:

```bash 
$1= InBGL $2=outDIR $3=outFilePREFIX $4=minMaf 
sbatch scripts/runPCANGSD_selection_maptest.sbatch ./mkBGL/Sfa-ABas-CBas_all_final_fltrd.beagle.gz ./PCAngsd_selection Sfa-ABas-CBas_all_final_fltrd_maptest 0.05 
```
Here are the `.out` file stats for Sfa-ABas-CBas_all_final_fltrd_maptest with different minMaf settings: 

|  minMaf  | # SNPs retained | # Principal Components |
|----------|-----------------|------------------------|
|   0.0    |     2184249     |            1           |
|   0.05   |     505308      |            1           |
|   0.1    |     287167      |            1           | 
|   0.2    |     145575      |            1           |
|   0.3    |     78719       |            1           | 

Now, return to the instructions in step 8. and visualize the plots for the filtered data using [`plotPCANGSD_selection.R`]

---

## 11. Run [`runPCANGSD_selection_maptest.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/runPCANGSD_selection_maptest.sbatch) on filtered data by chromosome:

To observe the principle component analyses per chromosome, we first renamed the rows of `final_fltrd.beagle.gz` file from the NCBI chromosome identification starting with "NC_" to something more intuitive: "CHR01_, CHR02_, ..."

here was the code I used:
```bash
done on USER@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
zcat mkBGL/Sfa-ABas-CBas_all_final_fltrd.beagle.gz | \
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
> Sfa-ABas-CBas_all_final_fltrd_rnmd.beagle
# gzip the above file
```

*note: I gzipped the renamed beagle and the final file name appears Sfa-ABas-CBas_all_final_fltrd_rnmd.beagle.gz

### a. Making bgl for each chromosome 
```bash
done on USER@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_pire/pire_lcwgs_data_processing/salarias_fasciatus/mkBGL

#CHR01:
cat <(zcat Sfa-ABas-CBas_all_final_fltrd_rnmd.beagle.gz | \
head -n1) <(zcat Sfa-ABas-CBas_all_final_fltrd_rnmd.beagle.gz | \
grep "^CHR01") | \
gzip > CHR01.beagle.gz


#CHR02:
cat <(zcat Sfa-ABas-CBas_all_final_fltrd_rnmd.beagle.gz | \
head -n1) <(zcat Sfa-ABas-CBas_all_final_fltrd_rnmd.beagle.gz | \
grep "^CHR02") | \
gzip > CHR02.beagle.gz
```
all of the new beagle files will output to the mkBGL dir. 

### b. Running PCAngsd on each beagle 

following the code in step 7., we ran [`runPCANGSD_selection_maptest.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/runPCANGSD_selection_maptest.sbatch) on each chromosome beagle file. Here is the code I used for the first chromosome:

```bash
$1= InBGL $2=outDIR $3=outFilePREFIX $4=minMaf 
sbatch scripts/runPCANGSD_selection_maptest.sbatch ./mkBGL/CHR01.beagle.gz ./PCAngsd_selection  CHR01_PCAngsd_selection_maptest 0.05
```

Here are the `.out` file stats for each chromosome with a minmaf setting of 0.05:

|  CHR##   | # SNPs retained | # Principal Components |
|----------|-----------------|------------------------|
|    1     |     29307       |            1           |
|    2     |     25286       |            1           |
|    3     |     19537       |            1           | 
|    4     |     26160       |            1           |
|    5     |     27400       |            1           | 
|    6     |     29689       |            1           |
|    7     |     22719       |            1           |
|    8     |     16591       |            1           | 
|    9     |     20014       |            1           |
|   10     |     22804       |            1           | 
|   11     |     24756       |            1           |
|   12     |     25087       |            1           |
|   13     |     23686       |            1           | 
|   14     |     29783       |            1           |
|   15     |     22196       |            1           | 
|   16     |     24272       |            1           |
|   17     |     14125       |            1           |
|   18     |     24300       |            1           | 
|   19     |     20924       |            1           |
|   20     |     25549       |            1           | 
|   22     |     23016       |            1           | 
|   23     |     8090        |            1           |
|  MIT0    |     0           |            0           | 

*Chris will make a script to cull this info from the .out files (currently located in the PCAngsd_selection dir)* 

### c. Visualize the results using [`plotPCANGSD_selection.R`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/plotPCANGSD_selection.R). 

Pull changes to your local computer and follow step 8. visualize the scree plot and all three PCAs for each chromosome. The script allows you to save these as either .png files or as pdfs, if you wish to save these plots.  

---

## 12. run [ANGSD/NgsRelate](https://github.com/ANGSD/NgsRelate):

NgsRelate is used to infer relatedness, inbreeding coefficients, & other summary statistics for pairs of individuals by using genotype likelihoods. The genotype likelihoods file needed for ngsRelate is a `.glf.gz` file. We obtained another likelihood file in step 6. when we used angsd to output a beagle file, which will also work in the new version of ngsRelate with the option`-G` instead of `-g`. We used the reccommended `glf.gz` file input for our analysis.

*Note: We made a `runNGSRELATEbgl.sbatch` script for running ngsRelate with `.bgl.gz` file input. Original script is named `runNGSRELATE.sbatch` -- we may delete.*

### a. Creating a `.glf.gz` file

We ran the [`mkGLF.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/mkGLF.sbatch) to output this file. here is the code we used:
```bash
done on USER@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/
$1=inDIR $2=sitesFILE
sbatch scripts/mkGLF.sbatch fltrBAM/ mkBGL/Sfa-ABas-CBas_all_final.minIndPerPop20.sites
```
This will output a `.glf.gz` genotype likelihoods file located in the `mkGLF` dir.

### b. Run [`runNGSRELATEglf.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/runNGSRELATEglf.sbatch) using `.glf.gz` and `.mafs.gz` files

I followed example 1. of the [`ANGSD/NgsRelate` Repository](https://github.com/ANGSD/NgsRelate)

NgsRelate accepts two (2) input files: the file containing allele frequencies ending in `.mafs.gz` and the genotype likliehoods file ending in `.glf.gz`. 

the `ANGSD/NgsRelate` repo indicated that we needed to extract the frequency column from the allele frequency file (`.mafs.gz`) and remove the header to make it in the format that NgsRelate needs. We included this code in our [`runNGSRELATEglf.sbatch`](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/runNGSRELATEglf.sbatch) scripts to remove this extra step. 

Using our `.glf.gz` genotype likelihoods file and `mafs.gz` allele freqs file, we used the following code to run NgsRelate:
```bash
on USER@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_pire/pire_lcwgs_data_processing/salarias_fasciatus
$1=inGlfFILE $2=inMafsFILE $3=numLIBS $4=outDIR $5=outFilePREFIX
sbatch scripts/runNGSRELATEglf.sbatch mkGLF/Sfa-ABas-CBas_all_final_fltrd.glf.gz mkBGL/Sfa-ABas-CBas_all_final_fltrd.mafs.gz 81 ./ngsRelate out_NgsRelate
```

---

## 13. Run [fgvieira/ngsLD](https://github.com/fgvieira/ngsLD)

NgsLD is a program that calculates pairwise Linkage Disequilibrium (LD) under a probabilistic framework. It does so by avoiding genotype calling and using genotype likelihoods or posterior probabilities.

This was the code I used:
```bash 
# done on USER@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
# $1=inGlfFILE $2=numLIBS $3=numSITES $4=sitesFILE $5=outDIR $6=outFileNAME
# needed to guzip the glf.gz file because, just because
sbatch ./scripts/runNGSLD.sbatch mkGLF/Sfa-ABas-CBas_all_final_fltrd.glf 81 509340 mkGLF/Sfa-ABas-CBas_all_final_fltrd.glf.pos.gz ./ngsLD Sfa-ABas-CBas_all_final_fltrd.glf.ld 
```

The output from ngsLD is a tsv file that contains plenty of great information, but to make the output compatible with SNeP,we need to reformat the file. To do this, we ran [LD2SNeP.R](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/LD2SNeP.R) in Rstudio.

Once the correctly formatted tsv file is obtained, save the file to the ngsLD directory and run SNeP on the hpc.

After running SNeP with this data, we ran into some issues that we believe will be solved through seperating the historical from the contemporary samples and creating LD output for both.

One way we approached this was to revert back to the .glf file creation (Step. 12a), and create a seperate .glf for Historical and Contemp. To do this, we modified and used used `mkGLF.sbatch` and ran the following code. note that new bamNames.txt files are created in the fltrBAM dir for each era. 
```bash 
Done on wahab
cd /home/e1garcia/shotgun_pire_pire_lcwgs_data_processing/salarias_fasciatus/
sbatch scripts/mkGLF.sbatch fltrBAM/ mkBGL/Sfa-ABas-CBas_all_final.minIndPerPop20.sites Sfa-CBas_only_final_fltrd "*CBas*bam"
sbatch scripts/mkGLF.sbatch fltrBAM/ mkBGL/Sfa-ABas-CBas_all_final.minIndPerPop20.sites Sfa-ABas_only_final_fltrd_redo "*ABas*bam"
```
Then, we considered creating a more "from scratch" script to do this same thing, so we created `mkGLF_fromScratch.sbatch` and ran the following code:
```bash 
sbatch scripts/mkGLF_fromScratch.sbatch fltrBAM/ Sfa-CBas_only_final_fltrd_minind20_redo "*CBas*bam" 20
sbatch scripts/mkGLF_fromScratch.sbatch fltrBAM/ Sfa-ABas_only_final_fltrd_minind20_redo "*ABas*bam" 20
sbatch scripts/mkGLF_fromScratch.sbatch fltrBAM/ Sfa-ABas_only_final_fltrd_minind16_redo "*ABas*bam" 16
```


We then considered using the previously made chromosome by chromosome beagle files to further refine our observation. Since we already made beagle files for each chromosome (Step 11a.), we needed to split those by era, then run each through ngsLD.

I used the code in step 11 to rename the .pos file (I created a copy of `Sfa-ABas-CBas_all_final_fltrd.glf.pos.gz` and named it `Sfa-ABas-CBas_all_final_fltrd_rnmd.glf.pos.gz`) in mkGLF dir, and then I ran the following code to create a new file with just the first CHR0:
```bash 
zcat mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd.glf.pos.gz | grep CHR01 > mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR01.glf.pos
#dont forget to gzip this file again.
```
I did this for each CHR0#.

I ran a test with this code:
```bash 
sbatch scripts/runNGSLD.sbatch mkBGL/CHR01.beagle.gz 81 29508 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR01.glf.pos.gz ./ngsLD Sfa-ABas-CBas_all_final_fltrd_TEST.glf.ld
```
We ran into issues becaue the .pos files and the chromosome beagles were not filtered the same (bgls missing minMAF filter)

Chris Bird was able to filter each chromosome bgl to be compatible with our .pos files (code here), so I was able to run the following code:

Historical Era Chromosomes 1-23 (omit 21): 
I ran a test on ABas_CHR01 with the "--ignore_miss_data" flag removed from the ngsLD script to see what would change. the name of this output is `Sfa-ABas_only_final_fltrd_CHR01_wMissData.beagle.ld`, located in the ngsLD dir. 
```bash 
Done on wahab 
cd /home/e1garcia/shotgun_pire_pire_lcwgs_data_processing/salarias_fasciatus/
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR01_fltrd.beagle.gz 32 29508 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR01.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR01.glf.ld *need to rename this file when done 
sbatch scripts/runNGSLD_withMissData.sbatch mkBGL/ABas_CHR01_fltrd.beagle.gz 32 29508 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR01.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR01_wMissData.beagle.ld 
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR02_fltrd.beagle.gz 32 25469 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR02.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR02.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR03_fltrd.beagle.gz 32 19835 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR03.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR03.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR04_fltrd.beagle.gz 32 26318 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR04.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR04.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR05_fltrd.beagle.gz 32 27549 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR05.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR05.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR06_fltrd.beagle.gz 32 29879 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR06.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR06.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR07_fltrd.beagle.gz 32 22855 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR07.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR07.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR08_fltrd.beagle.gz 32 16704 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR08.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR08.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR09_fltrd.beagle.gz 32 20152 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR09.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR09.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR10_fltrd.beagle.gz 32 22998 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR10.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR10.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR11_fltrd.beagle.gz 32 24994 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR11.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR11.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR12_fltrd.beagle.gz 32 25181 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR12.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR12.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR13_fltrd.beagle.gz 32 23816 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR13.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR13.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR14_fltrd.beagle.gz 32 30115 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR14.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR14.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR15_fltrd.beagle.gz 32 22452 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR15.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR15.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR16_fltrd.beagle.gz 32 24399 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR16.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR16.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR17_fltrd.beagle.gz 32 14225 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR17.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR17.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR18_fltrd.beagle.gz 32 24543 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR18.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR18.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR19_fltrd.beagle.gz 32 21021 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR19.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR19.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR20_fltrd.beagle.gz 32 25776 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR20.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR20.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR22_fltrd.beagle.gz 32 23221 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR22.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR22.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_CHR23_fltrd.beagle.gz 32 8330 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR23.glf.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_CHR23.beagle.ld
```

Then I did this for the Contemporary era: 1-23 (omit 21)
```
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR01_fltrd.beagle.gz 49 29508 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR02.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR02.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR02_fltrd.beagle.gz 49 25469 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR02.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR02.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR03_fltrd.beagle.gz 49 19835 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR03.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR03.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR04_fltrd.beagle.gz 49 26318 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR04.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR04.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR05_fltrd.beagle.gz 49 27549 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR05.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR05.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR06_fltrd.beagle.gz 49 29879 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR06.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR06.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR07_fltrd.beagle.gz 49 22855 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR07.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR07.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR08_fltrd.beagle.gz 49 16704 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR08.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR08.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR09_fltrd.beagle.gz 49 20152 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR09.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR09.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR10_fltrd.beagle.gz 49 22998 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR10.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR10.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR11_fltrd.beagle.gz 49 24994 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR11.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR11.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR12_fltrd.beagle.gz 49 25181 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR12.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR12.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR13_fltrd.beagle.gz 49 23816 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR13.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR13.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR14_fltrd.beagle.gz 49 30115 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR14.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR14.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR15_fltrd.beagle.gz 49 22452 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR15.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR15.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR16_fltrd.beagle.gz 49 24399 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR16.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR16.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR17_fltrd.beagle.gz 49 14225 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR17.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR17.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR18_fltrd.beagle.gz 49 24543 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR18.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR18.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR19_fltrd.beagle.gz 49 21021 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR19.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR19.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR20_fltrd.beagle.gz 49 25776 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR20.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR20.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR22_fltrd.beagle.gz 49 23221 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR22.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR22.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_CHR23_fltrd.beagle.gz 49 8330 mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd_CHR23.glf.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_CHR23.beagle.ld
```

Then, we removed the `--rnd_sample` and `--min_maf` flags in the `ngsLD.sbatch` script, (Chris remade each beagle and pos file for Alb. and Contemp. with minmaf settings of 0.5, 0.1, 0.2, 0.3 for each chromosome in mkBGL dir.) see below code:
```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/mkBGL

zcat Sfa-ABas-CBas_all_final_fltrd_rnmd.glf.pos.gz | cut -f1-2 | tr "\t" "_" > Sfa-ABas-CBas_all_final_fltrd_rnmd.glf.snp_list.txt

for i in $(ls CHR??.beagle.gz); do

# bglFile=CHR01.beagle.gz
bglFile=$i
outBglFile=$(echo $bglFile | sed 's/\.beagle\.gz/_fltrd\.beagle/')
snpListFile=../mkGLF/Sfa-ABas-CBas_all_final_fltrd_rnmd.glf.snp_list.txt
snpListFile=$(echo $snpListFile | sed "s/\.txt$//")

cat <(zcat $bglFile | head -n1) <(zcat $bglFile | awk 'NR==FNR{a[$1]=$1OFS$2;next}{$1=a[$1];print}' OFS='\t' $snpListFile.txt - | grep -Pv "^\t") | gzip > ${outBglFile}.gz
# cat <(zcat $mafsFile | head -n1) <(zcat $mafsFile | awk 'NR==FNR{a[$1,$2]=$1OFS$2;next}{$1=a[$1,$2];print}' OFS='\t' $snpListFile.tsv - | grep -Pv "^\t" | cut -f1-2,4-) | gzip > ${outMafsFile}.gz

zcat $outBglFile | cut -f1-99 | gzip > ABas_${outBglFile}.gz
zcat $outBglFile | cut -f1-3,100- | gzip > CBas_${outBglFile}.gz

done
```
The files created by this script use the `Sfa-ABas-CBas_all_final_fltrd_rnmd.pos.gz`


To test the resolution of these settings, we first ran `ngsLD.sbatch` on CHR01 beagles with minMaf settings of 0.05, 0.1, 0.2, & 0.3 for Alb. and Contemp. samples. 

*Note: $NumSITES is found from counting the number of lines in the .pos file (wc -l)

This is the code I ran:

```bash
#Done on USER@wahab.hpc.odu.edu
/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
$1=InBGL $2=numLIBS $3=numSITES $4=posFILE $5=outDIR $6=outFilePREFIX 
#minMaf 0.05 A&C
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.05_CHR01.beagle.gz 32 28901 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.05_CHR01.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_maf0.05_CHR01.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.05_CHR01.beagle.gz 49 28901 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.05_CHR01.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_maf0.5_CHR01.beagle.ld

#minMaf 0.1 A&C
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.1_CHR01.beagle.gz 32 16822 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.1_CHR01.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_maf0.1_CHR01.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.1_CHR01.beagle.gz 49 16822 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.1_CHR01.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_maf0.1_CHR01.beagle.ld

#minMaf 0.2 A&C
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.2_CHR01.beagle.gz 32 8371 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.2_CHR01.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_maf0.2_CHR01.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.2_CHR01.beagle.gz 49 8371 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.2_CHR01.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_maf0.2_CHR01.beagle.ld

#minMaf 0.3 A&C
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.3_CHR01.beagle.gz 32 4528 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.3_CHR01.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_maf0.3_CHR01.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.3_CHR01.beagle.gz 49 4528 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.3_CHR01.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_maf0.3_CHR01.beagle.ld
```

Then I ran `ngsLD.sbatch` on CHR04 beagles with minMaf settings of 0.1, 0.2, & 0.3 for Alb. and Contemp. samples (beagles are already filtered, the minMaf setting in ngsLD was off).
This was the code I ran:

```bash 
#maf 0.05
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.05_CHR04.beagle.gz 32 25851 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.05_CHR04.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_maf0.05_CHR04.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.05_CHR04.beagle.gz 49 25851 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.05_CHR04.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_maf0.05_CHR04.beagle.ld

#maf 0.01
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.1_CHR04.beagle.gz 32 16126 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.1_CHR04.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_maf0.1_CHR04.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.1_CHR04.beagle.gz 49 16126 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.1_CHR04.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_maf0.1_CHR04.beagle.ld
                                                                                                              
#maf 0.02
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.2_CHR04.beagle.gz 32 9114 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.2_CHR04.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_maf0.2_CHR04.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.2_CHR04.beagle.gz 49 9114 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.2_CHR04.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_maf0.2_CHR04.beagle.ld

#maf 0.03
sbatch scripts/runNGSLD.sbatch mkBGL/ABas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.3_CHR04.beagle.gz 32 5342 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.3_CHR04.pos.gz ./ngsLD Sfa-ABas_only_final_fltrd_maf0.3_CHR04.beagle.ld
sbatch scripts/runNGSLD.sbatch mkBGL/CBas_Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.3_CHR04.beagle.gz 49 5342 mkBGL/Sfa-ABas-CBas_all_final_fltrd_rnmd_maf0.3_CHR04.pos.gz ./ngsLD Sfa-CBas_only_final_fltrd_maf0.3_CHR04.beagle.ld
```

---
Analysis To Do (up next):
Linkage Blocks 
LD Decay (would need to add flag --rmd_sample)
LD Blocks 

for methods: add "we used 2x -4x because in ngsLD, anything below 1x is comprimised"

 ---
 
## 14. Run [SNeP](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/salarias_fasciatus/scripts/runSNeP.sbatch):

### a. LD output to SNeP input (r2_pearson). 
this is the code used to transform

```bash 
for i in $(ls Sfa*CHR??.beagle.ld); do
cat <(echo -e "CHR\tdist (bp)\tr2") \
<(cat $i | tr ":" "\t" | cut -f1,9-10 | grep -v 'nan') > \
$i.snep_in.pearsonr2
done
```

I ran the above code with these modifications for Alb. & Contemp. CHR01 minmaf 0.1, 0.2, 0.3

```bash 
for i in $(ls Sfa*maf0.*CHR??.beagle.ld); do 
cat <(echo -e "CHR\tdist (bp)\tr2") \
<(cat $i | tr ":" "\t" | cut -f1,9-10 | grep -v 'nan') > \
$i.snep_in 
done
```
## run `runSNeP.sbatch` on transformed files 
This was the code I ran (originally):
```bash 
Done on USER@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/SNeP
sbatch ../scripts/runSNeP.sbatch ../ngsLD/SNeP_infile.tsv ./Sfa-ABas-CBas_all_final_fltrd_
```
8/26/22 This is the code I ran (CHR01, maf 0.1, 0.2, 0.3, Alb & Contemp.)(r2 pearson)
```bash 
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/SNeP
#CHR01 minMaf 0.1, 0.2, 0.3 A & C
sbatch ../scripts/runSNeP.sbatch ../ngsLD/Sfa-ABas_only_final_fltrd_maf0.1_CHR01.beagle.ld.snep_in ./Sfa-ABas_only_final_fltrd_maf0.1_CHR01.beagle.ld.snep_out
sbatch ../scripts/runSNeP.sbatch ../ngsLD/Sfa-CBas_only_final_fltrd_maf0.1_CHR01.beagle.ld.snep_in ./Sfa-CBas_only_final_fltrd_maf0.1_CHR01.beagle.ld.snep_out
sbatch ../scripts/runSNeP.sbatch ../ngsLD/Sfa-ABas_only_final_fltrd_maf0.2_CHR01.beagle.ld.snep_in ./Sfa-ABas_only_final_fltrd_maf0.2_CHR01.beagle.ld.snep_out
sbatch ../scripts/runSNeP.sbatch ../ngsLD/Sfa-CBas_only_final_fltrd_maf0.2_CHR01.beagle.ld.snep_in ./Sfa-CBas_only_final_fltrd_maf0.2_CHR01.beagle.ld.snep_out
sbatch ../scripts/runSNeP.sbatch ../ngsLD/Sfa-ABas_only_final_fltrd_maf0.3_CHR01.beagle.ld.snep_in ./Sfa-ABas_only_final_fltrd_maf0.3_CHR01.beagle.ld.snep_out
sbatch ../scripts/runSNeP.sbatch ../ngsLD/Sfa-CBas_only_final_fltrd_maf0.3_CHR01.beagle.ld.snep_in ./Sfa-CBas_only_final_fltrd_maf0.3_CHR01.beagle.ld.snep_out
```

### b. LD output to SNeP input (r2)
8/27/22 We decided to move forward with r2 output from SNeP instead of r2_pearson, so we transformed the CHR04 LD outputs using this code:
```bash 
for i in $(ls Sfa*CHR??.beagle.ld); do
cat <(echo -e "CHR\tdist (bp)\tr2") \
<(cat $i | tr ":" "\t" | cut -f1,9,13 | grep -v 'nan') > \
$i.snep_in.r2
done
```
Then I ran SNeP on CHR04 with the following code:
```
```

Then I renamed the CHR01 LD outputs that used the r2_pearson outputs (before we decided to go with r2) from `Sfa-CBas_only_final_fltrd_maf0.?_CHR01.beagle.ld.snep_in` to `Sfa-CBas_only_final_fltrd_maf0.?_CHR01.beagle.ld.snep_in.pearsonr2`


THen I ran SNeP on CHR01 with the following code:
```
```



