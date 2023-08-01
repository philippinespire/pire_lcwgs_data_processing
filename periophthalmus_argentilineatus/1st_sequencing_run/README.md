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
## There is a discrepancy in the file size when using `cp` for copying. I switched to `rsync`.
rsync -av fq_fp1_clmp_fp2 /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/1st_sequencing_run

# Decontaminated file
rsync -av fq_fp1_clmp_fp2_fqscrn_rprd /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/1st_sequencing_run

# Check if file size is equal between the origin and destination directories.
du -sh *
du -sh /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/1st_sequencing_run/*
```

- Even with rsync, there appears to be discrepancies in the total file size. I checked the no. of reads for randomly selected libraries, and it was the same between the origin and destination.
- I still cannot figure out what caused the discrepancy.



3. Delete the unneeded files

```
# create log file before removing
ls -ltrh *raw*/*fq.gz > deleted_files_log
ls -ltrh *fp1/*fq.gz >> deleted_files_log
ls -ltrh *clmp/*fq.gz >> deleted_files_log
ls -ltrh *fqscrn/*fastq.gz >> deleted_files_log

# remove files
rm *raw*/*fq.gz
rm *fp1/*fq.gz
rm *clmp/*fq.gz
rm *fqscrn/*fastq.gz

```

4. Document the new size of directories

```
du -h | sort -rh > Par_lcwgs_afterDeleting_InterimFiles
```
- File size = 77 Gb

Freed space: 279 Gb - 77 Gb =  202 Gb

5. Move the cleaning files into the logs dir.

```
mv deleted_files_log logs
``` 
</details>



