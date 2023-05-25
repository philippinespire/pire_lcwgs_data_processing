# periophthalmus_argentilineatus lcwgs

---

## test lane processing

### Steps 1-8

* Run by cbird on 2023-01-28
* completed gracefully
* results generally look good given this is a test lane

### Step 9 deduplicate

* Run by cbird on 2023-01-29
* completed gracefully

### Steps 9b-c

* Run by cbird on 2023-01-30
* completed gracefully

### Step 10-11 fp2 & decontam

* Run by cbird on 2023-01-30

### Step 12  Repair fq files

* Run by cbird on 2023-01-31

### Run MultiQC 
* Run by klabrador on 2023-02-07 

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus

# fq_fp1_clmp_fp2_fqscrn
sbatch ../../pire_fq_gz_processing/runMULTIQC.sbatch "fq_fp1_clmp_fp2_fqscrn" "fastq_screen_report" "fq.gz"
## jobID: 1240508
## cbird did the run earlier
```


