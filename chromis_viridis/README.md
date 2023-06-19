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

 1st FASTP [Report](
```
Potential issues:
 * duplication - xx
   * Alb: xx%, Contemp: xx%, one w/ xx%
 * gc content - xx
   * Alb: xx%, Contemp: xx%
 * Passing filter
   * Alb: xx%, Contemp: xx%
 * % adapter 
   * Alb: xx%, Contemp: xx%
 * number of reads
   * Albatross - xxM, at least xxxM for majority; Contemp - xxM, xxs reads for Contemporary
```
</p>
</details>

<details><summary><i>Clumpify</i></summary>
<p>

 Clumpify [Report](

