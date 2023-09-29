# Directory Structure

| directory-name | date-created | dataset |
| -------------- | ------------ | ------- |
| 1st_sequencing_run | 2023-07-26 | test lane |
| 2nd_sequencing_run | 2023-08-28 | Alb & Contemp pair from Taw |

# Dascyllus aruanus lcWGS

---

Jem Baldisimo

---
This repository outlines the roadmap we followed to move *Dascyllus aruanus* through the [Low Coverage Whole Genome Sequencing Pipeline](https://github.com/philippinespire/pire_lcwgs_data_processing). This builds on previous work already done by Jordan Rodriguez for analyzing lcWGS for [*Salarias fasciatus*](https://github.com/philippinespire/pire_lcwgs_data_processing/tree/main/salarias_fasciatus). This provides steps taken & analysis we did to gain insight on the historical population demography of this very popular aquarium fish, also known as the humbug dascyllus.

---

## 1. Completed fq.gz pre-processing

The [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing) instructions and scripts (Garcia et al 2021) were used. The purpose of the preprocessing pipeline was to Trim, deduplicate, decontaminate, and repair the raw `fq.gz` files.

<details><summary><i>Checked quality of data using Multi_FASTQC</i></summary>
<p>

Multi_FASTQC [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/dascyllus_aruanus/2nd_sequencing_run/fq_raw/Dar-AJol_001-Ex1-1A-lcwgs-1-2.1_fastqc.html)
```
Potential issues:
 * duplication - low to high in Albatross; low to moderate in Contemporary
   * Alb: 12-88.9%, Contemp: 2.5-60.2%
 * gc content - reasonable
   *43-69%
 *number of reads
   *Albatross - 0.6-96.4 M seq; Contemporary - 0.4-130.9 M seq
```
</p>
</details>

<details><summary><i>1st trim</i></i></summary>
<p>

 1st FASTP [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/dascyllus_aruanus/2nd_sequencing_run/fq_fp1/1st_fastp_report.html)
```
Potential issues:
 * duplication - Low to moderate in Albatross, low in Contemp
   * Alb: 0.9 to 86.7%, Contemp: 0.9-53.9%
 * gc content - Reasonable
   * Alb: 37.4-53.8%, Contemp: 45.4-49.3%
 * Passing filter
   * Alb: 54.8-98.6% (one individual had ~53% but the rest are above 70s, Contemp: 83.3-98.2%
 * % adapter - Alb had very high % of adapters, mostly above 70%. Contemp had mostly 20-40%
   * Alb: 54.3-94%, Contemp: 15.3-73.6%
 * number of reads - Range of reads very erratic for both
   * Albatross - 1 - 271 M seq; Contemp - 1-425 M seq
```
</p>
</details>

