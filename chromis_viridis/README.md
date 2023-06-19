# Directory Structure

| directory-name | date-created | dataset |
| -------------- | ------------ | ------- |
| 1st_sequencing_run | 2023-04-28 | test lane |
| 2nd_sequencing_run | 2023-06-16 | Alb & Contemp sequences |

# Chromis viridis lcWGS

---
Jem Baldisimo
---
This repository outlines the roadmap we followed to move *Chromis viridis* through the [Low Coverage Whole Genome Sequencing Pipeline](https://github.com/philippinespire/pire_lcwgs_data_processing). This provides steps taken & analysis we did to gain insight on the historical population demography of this very popular aquarium fish, also known as the green chromis.

---

## 1. Completed fq.gz pre-processing

The [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing) instructions and scripts (Garcia et al 2021) were used. The purpose of the preprocessing pipeline was to Trim, deduplicate, decontaminate, and repair the raw `fq.gz` files.

<details><summary><i>Checked quality of data using Multi_FASTQC</i></summary>
<p>


Multi_FASTQC [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/chromis_viridis/2nd_sequencing_run/fq_raw/fqc_raw_report.html)
```
Potential issues:
 * duplication - moderate to high in Albatross; low to modeterate in Contemporary --- Higher in Albatross than in  Contemporary
   * Alb: 22.8-79.4%, Contemp: 4.3-32%%
 * gc content - reasonable
   *41%-57%
 *number of reads
   *Albatross - 3.7-131.2 M seq; Contemporary - 1.8-56 M seq
```
</p>
</details>

<details><summary><i>1st trim</i></i></summary>
<p>

 1st FASTP [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/chromis_viridis/2nd_sequencing_run/fq_fp1/1st_fastp_report.html)
```
Potential issues:
 * duplication - Low to moderate in Albatross, low in Contemp
   * Alb: 14.4 to 61.8%, Contemp: 2.4-16%
 * gc content - Reasonable
   * Alb: 39.6-56.8%, Contemp: 41-44.7%
 * Passing filter
   * Alb: 89.8-98.4%, Contemp: 75.4-98.6%
 * % adapter 
   * Alb: 7-86.6% (Only 2 individuals had >77%), Contemp: 9.7-59.7% (Only 5 had >55%)%
 * number of reads
   * Albatross - 3.8-252 M, at least 10 M for majority; Contemp - 3-110 M, at least 7M reads for Contemporary
```
</p>
</details>

<details><summary><i>Clumpify</i></summary>
<p>

 Clumpify [Report](

