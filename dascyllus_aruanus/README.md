# Directory Structure

| directory-name | date-created | dataset |
| -------------- | ------------ | ------- |
| 1st_sequencing_run | 2023-07-26 | test lane |
| 2nd_sequencing_run | 2023-08-28 | Alb & Contemp pair from Taw |

# Chromis viridis lcWGS

---

Jem Baldisimo

---
This repository outlines the roadmap we followed to move *Chromis viridis* through the [Low Coverage Whole Genome Sequencing Pipeline](https://github.com/philippinespire/pire_lcwgs_data_processing). This builds on previous work already done by Jordan Rodriguez for analyzing lcWGS for [*Salarias fasciatus*](https://github.com/philippinespire/pire_lcwgs_data_processing/tree/main/salarias_fasciatus). This provides steps taken & analysis we did to gain insight on the historical population demography of this very popular aquarium fish, also known as the green chromis.

---

## 1. Completed fq.gz pre-processing

The [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing) instructions and scripts (Garcia et al 2021) were used. The purpose of the preprocessing pipeline was to Trim, deduplicate, decontaminate, and repair the raw `fq.gz` files.

<details><summary><i>Checked quality of data using Multi_FASTQC</i></summary>
<p>


