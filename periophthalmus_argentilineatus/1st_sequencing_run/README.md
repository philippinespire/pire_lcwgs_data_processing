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

<details> 
	<summary>Clean up</summary>
Run by klabrador on 2023-08-01

I have to clean up the species directory to make more space. I followd the **CLEANING UP** section in the [pire_ssl_data_processing](https://github.com/philippinespire/pire_ssl_data_processing).


1. Check initial file size

```
du -h | sort -rh > Par_lcwgs_beforeDeleting_InterimFiles

```
- File size: 279 Gb

2. Make a copy of important files in the RC.

```
# Get inside a node
salloc

# Confirm that the RC directory for the species exist
ls /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/1st_sequencing_run

# Contaminated file
cp -R fq_fp1_clmp_fp2/*fq.gz /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/1st_sequencing_run

# Decontaminated file
cp -R fq_fp1_clmp_fp2_fqscrn_rprd /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/1st_sequencing_run

# Check if file size is equal between the origin and destination directories.
du -sh fq_fp1_clmp_fp2/*fq.gz
du -sh /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/1st_sequencing_run/fq_fp1_clmp_fp2/*fq.gz

## There appears to be missing files here. 






</details>

