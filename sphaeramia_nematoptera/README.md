# Sphaeramia nematoptera lcWGS

---

Jem Baldisimo

---
This repository outlines the roadmap we followed to move *Sphaeramia nematoptera* through the [Low Coverage Whole Genome Sequencing Pipeline](https://github.com/philippinespire/pire_lcwgs_data_processing). This builds on previous work already done by Jordan Rodriguez for analyzing lcWGS for [*Salarias fasciatus*](https://github.com/philippinespire/pire_lcwgs_data_processing/tree/main/salarias_fasciatus). This provides steps taken & analysis we did to gain insight on the historical population demography of this very popular aquarium fish, also known as the pajama cardinalfish.

---

## 1. Completed fq.gz pre-processing

The [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing) instructions and scripts (Garcia et al 2021) were used. The purpose of the preprocessing pipeline was to Trim, deduplicate, decontaminate, and repair the raw `fq.gz` files.

<details><summary><i>Checked quality of data using Multi_FASTQC</i></summary>
<p>



 Multi_FASTQC [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/fq_raw_lcwgs/fqc_raw_report.html)
```
Potential issues:
 * duplication - moderate to high, but only for 1-3 individuals
   * Alb: 17.8-60%, Contemp: 10.4-71%
 * gc content - reasonable
   * 48-62%
 *number of reads
   *Albatross - 24-91.9 M; Contemporary - 1.5-75.8 M
```
</p>
</details>

<details><summary><i>1st trim</i></i></summary>
<p>

 1st FASTP [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/fq_fp1/1st_fastp_report.html)
```
Potential issues:
 * duplication - moderate to high, but only for 1-3 individuals
   * Alb: 13-43%, Contemp: 7-30%, one w/ 69%
 * gc content - reasonable
   * Alb: 36-65%, Contemp: 37-41%
 * Passing filter
   * Alb: 77-96%, Contemp: 74.5-98%%
 * % adapter 
   * Alb: 39.8-87.1%, Contemp: 29-64.7%%
 * number of reads
   * Albatross - 49-175 M, at least 50 M for majority; Contemp - 2-275 M, less reads for Contemporary
```
</p>
</details>

<details><summary><i>Clumpify</i></summary>
<p>

 Clumpify [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/fq_fp1_clmp/fqc_clmp_report.html)

```
bash ../../pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/jbald004 20
#copied the checkClumpify_EG.R file to the fq_fp1_clmp folder after running clumpify
cp /home/e1garcia/shotgun_PIRE/pire_cssl_data_processing/leiognathus_equula/fq_fp1_clmp/checkClumpify_EG.R .
#ran checkClumpify_EG.R in the fq_fp1_clmp folder
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/fq_fp1_clmp
salloc
enable_lmod
module load container_env mapdamage2
crun R <checkClumpify_EG.R --no-save
```
Clumpify worked well so I moved on to the next step
</p>
</details>

<details><summary><i>2nd Trim</i></summary>
<p>

```
sbatch ../../pire_fq_gz_processing/runFASTP_2_cssl.sbatch fq_fp1_clmp fq_fp1_clmp_fp2
```

Fastp2 [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/fq_fp1_clmp_fp2/2nd_fastp_report.html)
```
Potential issues:
  * % duplication -
    * Alb: 2-11%, Contemp: 0.7-28%
  * GC content -
    * Alb: 36.2-65%, Contemp: 37.3-41.8%
  * passing filter -
    * Alb: 98.5-99.2%, Contemp: 98.6-99.4%
  * % adapter -
    * Alb: 0.5-1.1%, Contemp: 0.5-1.7%
  * number of reads -
    * Alb: 34-105 mil, Contemp: 1-173 mil
```
</p>
</details>

<details><summary><i>Checked Fastqscreen repaired files</i></summary>
<p>
 MultiQC [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/fq_fp1_clmp_fp2_fqscrn_rprd/fqc_rprd_report.html)

```
EDIT THIS:
Potential issues:
  * % duplication -
     Alb: 3-37%, Contemp: 0.9-22.2%
  * GC content -
    * Alb: 35-64%, Contemp: 37-41%
  * number of reads -
    * Alb: 1.7-22.5 mil, Contemp: 0.3-56.4 mil
```
</p>
</details>


## 2. Mapped FASTQ to reference genome

I mapped the repaired fqscrn files to the reference genome we assembled for Sphaeramia nematoptera

```bash
sbatch ../scripts/mkBAMlcwgs.sbatch "fq_fp1_clmp_fp2_fqscrn_rprd/*fq.gz" "/home/e1garcia/shotgun_PIRE/pire_ssl_data_processing/sphaeramia_nematoptera/probe_design/Sne_scaffolds_allLibs_decontam_R1R2_noIsolate.fasta" mkBAM
```

---

## 3. Filtered Raw Bam Files

```bash 
 sbatch ../scripts/fltrBAMwgs.sbatch mkBAM
```

---

## 4. Sequencing Calculations 

```bash
sbatch ../../pire_fq_gz_processing/mappedReadStats.sbatch mkBAM mkBAM/coverageMappedReads "_fltrd.bam" #_fltrd.bam added to accommodated for filtered bam file extension
```

Here are the visual results:

[Percent Coverage & Mean Depth Plot](Ask Chris how)

[Proportion of Mapped Sequences Plot] (Ask Chris how))

--- 

## 5. Make a PopMap File

We need to make a popmap file that has 2 columns, populationID and IndiviudalID, here we use the filtered bam files and some bash commands to make the popmap.

```bash
bash
paste <( ls mkBAM/*_fltrd.bam | sed -e 's/^.*\///' -e 's/_.*$//' ) <( ls mkBAM/*_fltrd.bam | sed -e 's/^.*\///' -e 's/_L[1-8]_.*_fltrd.bam$//' -e 's/_Ex[1-9].*$//' ) > mkBAM/popmap_sne.tsv
```

---

## 6. Convert the Filtered BAM Files to a Beagle File Using Angsd

I followed how Jordan first made a beagle file with minimal filters, then determined the final filter settings.

### a. Make beagle file with minimal filters 

```bash
# done on USER@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera
# ANGSD outputs files to the mkBGL dir, so it may be usefiul to create this dir before running the script if you haven't already
mkdir mkBGL
# $1=fltrBAMdir $2=outPREFIX
sbatch scripts/mkBGL.sbatch mkBAM Sne-ATaw-CTaw_all_initial
```
When running the above code again for the final beagle file, make sure to replace "initial" to "final" when naming the prefix.  

*Note: check the `.args` and the `.err` files to see what filters were applied to the run (double check that the ones you indicated are the ones listed), and which errors might have occurred during the run*

*Soon, we will be creating files for the `initial_bgl_filters` and `final_bgl_filters` for them to be fed to the script instead of hardcoded -- coming soon*

STOPPED HERE - mkBGL running 11/30/2022

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
