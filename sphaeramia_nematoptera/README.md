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

<details><summary><i>Checked Fastqscreen files</i></summary>
<p>
 MultiQC [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/fq_fp1_clmp_fp2_fqscrn/fastq_screen_report.html)

```
Potential issues:
  * one hit, one genome, no ID -
     Alb: %, Contemp: %
  * no one hit, one genome to any potential contaminators (bacteria, virus, human, etc) -
    * Alb: %, Contemp: %
```
</p>
</details>


<details><summary><i>Reviewed Fastqscreen repaired files</i></summary>
<p>
MultiQC [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/fq_fp1_clmp_fp2_fqscrn_rprd/fqc_rprd_report.html)

 ```
Potential issues:
  * % duplication -
     Alb: 3-30%, Contemp: 0.8-22.4%
  * GC content -
    * Alb: 36-61%, Contemp: 37-41%
  * number of reads -
    * Alb: 4.5-31.9 mil, Contemp: 0.5-79.0 mil
```
</p>
</details>

---

## 2. Copied the Reference Genome into the species folder

I made the refGenome folder in the directory and copied the genome assembled from the SSL processing repo for this species.

---
## 3. 
