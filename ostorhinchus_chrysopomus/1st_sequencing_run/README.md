# *Ostorhinchus chrysopomus* lcWGS, test lane
### Kevin Labrador
#


## 1. Pre-processing


This follows the instructions from [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing/blob/main/README.md).


<details>
        <summary>0. Set up directory</summary>

Run by KL on 2024-01-30

- All runs are now done inside our personal directory on Wahab. Make a local PIRE directory and clone all needed repositories from Github before starting.

```
cd /home/klab
mkdir PIRE

#cd to your working dir then clone directories
cd PIRE
git clone https://github.com/philippinespire/pire_fq_gz_processing.git
git clone https://github.com/philippinespire/pire_lcwgs_data_processing.git
```

- Go to PIRE directory and create the appropriate subdirectory for the species.

```bash
cd /home/klab/PIRE/pire_lcwgs_data_processing
mkdir -p ostorhinchus_chrysopomus/1st_sequencing_run/
```

- Go to the assigned working directory and create the following subdirs:

```bash
mkdir fq_raw fq_fp1 fq_fp1_clmp fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd
```

If the repositories have been cloned previously, just use `git pull` to update your local repo.


</details>

<details>
        <summary>1. Retrieve data from ODU HPC Archive </summary>

- dataset location at /archive/carpenterlab/pire/downloads/ostorhinchus_chrysopomus/1st_sequencing_run/fq_raw

```bash
cd ./fq_raw
screen rsync -vr /archive/carpenterlab/pire/downloads/ostorhinchus_chrysopomus/1st_sequencing_run/fq_raw/ .
```

All files synced successfully. 
- N = 197 samples * 2 reads = 394 fq.gz files
- File sizes were larger in home directory (66 Gb) than in ODU HPC Archive (51 Gb). 
- `ls -lhS` shows that individual file sizes were similar.
 
**Check download:**
Ran by KL on 2024-01-31

A) `gridDownloader.sh`
- I did not use `gridDownloader.sh`, so I have no log file to check.

B) Validate the `fq.gz` files

```bash
bash # only run bash if you are not already in bash
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run
SCRIPT=/home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/validateFQPE.sbatch
DIR=./fq_raw
fqPATTERN="*fq.gz"
sbatch $SCRIPT $DIR $fqPATTERN
```
- jobID: 2917027
- Examined SLURM `out` file and `$DIR/fqValidationReport.txt`. No errors were found on the fq.gz files.

```
less -S $DIR/fqValidationReport.txt | grep "OK" | wc -l
```

**Rename file**
- One fq.gz read pair was named `Undetermined_Undetermined_HJLFCCCX2_L3_1.fq.gz`.
- Sharon said to just ignore the `Undetermined` files.
- I changed the extension of the `Undetermined` files to "*.fq.gzx" so that they will not be included in the pipeline.
 
</details>

<details>
        <summary>2. Proofread the decode file(s)</summary>

Run by klabrador on 2024-01-31

```
salloc
bash

cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run/fq_raw

ls *1.fq.gz | wc -l
# 196 (Excludes the Undetermined sample)

ls *2.fq.gz | wc -l
# 196 (Excludes the Undetermined sample)

wc -l *.tsv
# 198 - 1 (header) - 1 (undetermined sample) = 196 samples

cat *.tsv | sort | uniq | wc -l
# 198 - 1 (header) - 1 (undetermined sample) = 196 samples 
```
- Decode file looks good.
- The file extension of the undetermined files was changed from `*fq.gz` to `*fq.gzx` so that they will not be included downstream.

</details>

<details>
        <summary>3. Edit the decode file</summary>

- No need to edit the decode file.

</details>


<details>
        <summary>4. Make a copy of the `fq_raw` files prior to renaming </summary>

- Not done. 
- There is a back-up of the exact same files at ODU HPC Archive. Check with PIRE if they still need a backup on the rc_carpenterlab_ngs directory


</details>


<details>
        <summary>5. Perform a renaming dry run</summary>

Run by klabrador on 2024-01-31

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run/fq_raw
# salloc (already in node) 
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Och_LCWGS-TestLane_SequenceNameDecode.tsv
```
- Looks good.

</details>

<details>
        <summary>6. Rename the files for real</summary>

Run by klabrador on 2024-01-31

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run/fq_raw
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Och_LCWGS-TestLane_SequenceNameDecode.tsv rename
```
- renaming successful

</details>

<details>
        <summary>7. Check data quality</summary>

Run by klabrador on 2024-01-31

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run

#sbatch Multi_FASTQC.sh "<indir>" "<mqc report name>" "<file extension to qc>"
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report"  "fq.gz"

```
- jobID = 2917090
- job finished successfully

<details> 
	<summary>QC Results</summary> 

```
Potential issues:  
  * % duplication
	* Alb: 2.60 - 29.40%, Contemp: 2.40 - 17.00%
  * GC content 
	* Alb: 40 - 55%, Contemp: 39 - 45%
	* Albatross Och samples have bimodal GC content.
  * number of reads - 90 libraries have read counts < 100k
	* Alb: 0 - 5.8 M, Contemp: 0 - 6.8 M

```

</details>


</details>


<details>
        <summary>8. First trim</summary>

Run by klabrador on 2024-01-31

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1
```
- jobID: 2917106
- job finished successfully

```
Potential issues:
  * % duplication 
    * Alb: 0.70 - 28.50%, Contemp: 1.40 - 11.30%
  * GC content
    * Alb: 37.70 - 55.50%, Contemp: 38.70 - 43.50%
  * passing filter 
    * Alb: 88.40 - 99.10%, Contemp: 89.30 - 98.70%
  * % adapter
    * Alb: 23.60 - 94.50%, Contemp: 7.40 - 88.50%
  * number of reads (passed filter)
    * Alb: 0.1 - 5.76 M, Contemp: 0 - 6.77 M
```
</details>

</details>

<details>
	<summary>9. Remove Duplicates with Clumpify</summary>

<details>
        <summary>9a. Remove duplicates</summary>

Run by klabrador on 2024-01-31

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/klab 20
```

- jobID: 2917146
- job finished succesfully
</details>

<details>
        <summary>9b. Addressing memory errors</summary>

- No memory errors to address.
</details>

<details>
        <summary>9c. Check duplicate removal success</summary>

Run by klabrador on 2024-02-01

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run

salloc
enable_lmod

# Update the container from mapdamage2 to R/4.2
module load container_env R/4.2

# Modify R script to change the pattern search from "clmp_" to "clmp_r", then run:
crun R < /home/klab/PIRE/pire_fq_gz_processing/checkClumpify_EG.R --no-save

```
- Clumpify successfully worked on all samples!

</details>


<details>
        <summary>9d. Clean the scratch drive</summary>

Run by klabrador on 2024-02-01

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/cleanSCRATCH.sbatch /scratch/klab "*clumpify*temp*"
```

- jobID: 2919534
- job finished successfully

</details>

<details>
        <summary>9e. Generate metadata on deduplicated FASTQ files</summary>

Run by klabrador on 2024-02-01

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run

sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report"  "fq.gz"
```
- jobID: 2919538
- job finished successfully

</details>


</details>

<details>
        <summary>10. Second Trim</summary>

Run by klabrador on 2024-02-01

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run

# Run cssl script for lcwgs.
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_2.sbatch fq_fp1_clmp fq_fp1_clmp_fp2 33

```
- jobID: 2919539
- job finished successfully

FastQC Results

```
Potential issues:
  * % duplication
    * Alb: 0.00 - 5.90%, Contemp: 0.20 - 2.90%
  * GC content
    * Alb: 37.60 - 54.90%, Contemp: 38.70 - 43.40%
  * passing filter 
    * Alb: 96.90 - 99.40%, Contemp: 97.70 - 99.40%
  * % adapter
    * Alb: 1.00 - 3.90%, Contemp: 0.40 - 3.50%
  * number of reads (passed filter) 
    * Alb: 0.00 - 9.57 M, Contemp: 0.01 - 11.65 M
```

</details>

<details>
        <summary>11. Decontaminate Files</summary>


<details>
	<summary>11a. Run fastq_screen</summary>

Run by klabrador on 2024-02-01
```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run

bash # only run when out of bash

fqScrnPATH=/home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash
indir=fq_fp1_clmp_fp2
outdir=/scratch/klab/fq_fp1_clmp_fp2_fqscrn
nodes=20

bash $fqScrnPATH $indir $outdir $nodes
```
- jobID: 2919588
- job finished successfully

</details>

<details>
        <summary>11b. Check for errors</summary>

Run by klabrador on 2024-02-04

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run

bash
outdir=/scratch/klab/fq_fp1_clmp_fp2_fqscrn
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/validateFQ.sbatch $outdir "*filter.fastq.gz"

less -S $outdir/fqValidationReport.txt file | grep "OK" | wc -l
# All 392 files were tagged as "OK" based on the validation report.

```
- jobID: 2925015
- job finished successfully

Confirm that all files were successfully completed (2024-02-04)

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run
# Check that all 5 files were created for each *fq.gz file

bash
indir=fq_fp1_clmp_fp2
outdir=/scratch/klab/fq_fp1_clmp_fp2_fqscrn

ls $outdir/*r1.tagged.fastq.gz | wc -l
ls $outdir/*r2.tagged.fastq.gz | wc -l
ls $outdir/*r1.tagged_filter.fastq.gz | wc -l
ls $outdir/*r2.tagged_filter.fastq.gz | wc -l 
ls $outdir/*r1_screen.txt | wc -l
ls $outdir/*r2_screen.txt | wc -l
ls $outdir/*r1_screen.png | wc -l
ls $outdir/*r2_screen.png | wc -l
ls $outdir/*r1_screen.html | wc -l
ls $outdir/*r2_screen.html | wc -l
### All counts = 196

# for each, you should have the same number as the number of input files (number of fq.gz files)
ls $indir/*r1.fq.gz | wc -l
ls $indir/*r2.fq.gz | wc -l
### All counts = 196

#you should also check for errors in the *out files:
#this will return any out files that had a problem

#do all out files at once
grep 'error' slurm-fqscrn.*out
grep 'No reads in' slurm-fqscrn.*out
grep 'FATAL' slurm-fqscrn.*out   # unknown userid is from a bad node, use sacct to find node id and report to your PI who will report to the hpc administrator
### No keyword hit. All's good.

# Check for temp files
ls $outdir/*temp*
### No temp files found
```

</details>

<details>
	<summary>11c. Diagnose errors</summary>
No error found.

</details>

<details>
        <summary>11d. Rerun files that failed</summary>
No files to rerun.

</details>

<details>
        <summary>11e. Move output files</summary>

Run by klabrador on 2024-02-04

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run
outdir=/scratch/klab/fq_fp1_clmp_fp2_fqscrn
fqscrndir=fq_fp1_clmp_fp2_fqscrn
screen mv $outdir $fqscrndir

# screen sockets: 3391498
# to leave screen: ctrl-a d  


```
</details>


<details>
        <summary>11f. Run MultiQC</summary>

Run by klabrador on 2024-02-04

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runMULTIQC.sbatch fq_fp1_clmp_fp2_fqscrn fastq_screen_report
```
- jobID: 2925150
- job finished successfully

MultiQC output (To be updated)
```
Potential Issues:

* one hit, one genome, no ID
	* Alb:
	* Contemp:

* no one hit, one genome to any potential contaminators (bacteria, virus, human, etc)
	* Alb:
	* Contemp:	

```

</details>

</details>

<details>
        <summary>12. Repair FASTQ files</summary>

Run by klabrador on 2024-02-04

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 8
```
- jobID: 2925151
- job finished successfully

Confirm if paired end *fq.gz files are complete and formatted correctly
```
SCRIPT=/home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/validateFQPE.sbatch
DIR=fq_fp1_clmp_fp2_fqscrn_rprd
fqPATTERN="*fq.gz"
sbatch $SCRIPT $DIR $fqPATTERN
```
- jobID: 2925373
- job finished successfully
- no errors reported

Run Multi_FASTQC.sh
```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run

sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "./fq_fp1_clmp_fp2_fqscrn_rprd" "fqc_rprd_report" "fq.gz"

```
- jobID: 2925374
- job finished successfully

MultiQC output (To be updated)
```
Potential Issues

* % duplication
	* Alb: 
	* Contemp: 

* % GC Content 
	* Alb: 
	* Contemp: 

* Number of reads (M_seqs)
	* Alb:  
	* Contemp: 
```

</details>

<details>
        <summary>13. Clean up</summary>

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/ostorhinchus_chrysopomus/1st_sequencing_run
mkdir logs
mv *out logs/

```
