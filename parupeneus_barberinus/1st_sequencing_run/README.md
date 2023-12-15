# *Parupeneus barberinus* lcWGS, test lane
### Kevin Labrador
#


## 1. Pre-processing


This follows the instructions from [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing/blob/main/README.md).


<details>
        <summary>0. Set up directory</summary>

Run by KL on 2023-12-07

- Go to PIRE lcwgs directory on Wahab and create the appropriate subdirectory for the species.

```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing
mkdir -p parupeneus_barberinus/1st_sequencing_run/
```

- Go to the assigned working directory and create the following subdirs:

```bash
mkdir fq_raw fq_fp1 fq_fp1_clmp fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd
```
</details>

<details>
        <summary>1. Retrieve data from ODU HPC Archive </summary>

- dataset location @ /archive/carpenterlab/pire/downloads/parupeneus_barberinus/1st_sequencing_run/fq_raw

```bash
cd ./fq_raw
rsync -vr /archive/carpenterlab/pire/downloads/parupeneus_barberinus/1st_sequencing_run/fq_raw/ .
```
All files synced successfully. File sizes were equal between source and destination directories.
- N = 81 samples * 2 reads = 162 fq.gz files


**Check download:**
A) `gridDownloader.sh`
- I did not use `gridDownloader.sh`, so I have no log file to check.

B) Validate the `fq.gz` files

```bash
bash # only run bash if you are not already in bash
SCRIPT=/home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/validateFQPE.sbatch
DIR=./fq_raw
fqPATTERN="*fq.gz"
sbatch $SCRIPT $DIR $fqPATTERN
```
- jobID: 2751677
- Examined SLURM `out` file and `$DIR/fqValidationReport.txt`. No errors were found on the fq.gz files.


**Rename file**
- One fq.gz read pair was named `Undetermined_Undetermined_22CVWFLT3_L1_*.fq.gz`.
- I need to figure out what this file is and rename it.
- It looks like we only have 80 samples for Pbb. Check what the `Undetermined` file is. Confirm with Sharon.
- Sharon said to just ignore the `Undetermined` files for now.
- I changed the extension of the `Undetermined` files to "*.fq.gzx" so that they will not be included in the pipeline.
 

</details>

<details>
        <summary>2. Proofread the decode file(s)</summary>

Run by klabrador on 2023-12-08

```
salloc
bash

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run/fq_raw

ls *1.fq.gz | wc -l
# 81 (Includes the Undetermined sample)

ls *2.fq.gz | wc -l
# 81 (Includes the Undetermined sample)

wc -l *.tsv
# 81 - 1 (header) = 80 samples

cat *.tsv | sort | uniq | wc -l
# 81 - 1 (header) = 80 samples 
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

Run by klabrador on 2023-04-28

```
mkdir -p /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run/fq_raw

# on wahab replace <yourPireDirPath> with /home/e1garcia/shotgun_PIRE
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run/fq_raw
screen cp ./* /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run/fq_raw

## I cannot seem to copy the fq.gz files to rc_carpenter_ngs. There is a back-up of the exact same files at ODU HPC Archive. Check with PIRE if they still need a backup on the rc_carpenterlab_ngs directory

```


</details>


<details>
        <summary>5. Perform a renaming dry run</summary>

Run by klabrador on 2023-12-08

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run/fq_raw

salloc
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Pbb-LCWGS-TestLane_SequenceNameDecode.tsv
```
- Looks good.

</details>

<details>
        <summary>6. Rename the files for real</summary>

Run by klabrador on 2023-12-08

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run/fq_raw
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Pbb-LCWGS-TestLane_SequenceNameDecode.tsv rename
```
- renaming successful

</details>

<details>
        <summary>7. Check data quality</summary>

Run by klabrador on 2023-12-08

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run

#sbatch Multi_FASTQC.sh "<indir>" "<mqc report name>" "<file extension to qc>"
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report"  "fq.gz"

```
- jobID = 2752786
- job finished successfully

<details> 
	<summary>QC Results</summary> 

```
Potential issues:  
  * % duplication - high duplication in Albatross samples (> 50%)
	* Alb: 4.80 - 65.30%, Contemp: 3.20 - 10.30%
  * GC content - high GC content in Albtross samples 
	* Alb: 48 - 80%, Contemp: 48 - 53%
  * number of reads - some samples have read counts < 100k
	* Alb: 0.00 - 93.9 M, Contemp: 0.7 - 13.8 M
	* Samples with raw read count < 100k:
		- Pbb_AGal_013: 20,100
		- Pbb-AGal_014: 46,332
		- Pbb-AGal_015: 45,668
		- Pbb-AGal_016: 60,625
		- Pbb-AGal_017: 94,464
		- Pbb-AGal_018: 20,739
		- Pbb-AGal_019: 80,086

```


</details>


</details>


<details>
        <summary>8. First trim</summary>

Run by klabrador on 2023-12-08

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1
```
- jobID: 2752787
- job finished successfully

```
Potential issues:
  * % duplication 
    * Alb: 0.70 - 24.20%, Contemp: 2.00 - 6.80%
  * GC content
    * Alb: 40.90 - 53.30%, Contemp: 47.10 - 51.10%
  * passing filter - low rate 
    * Alb: 39.90 - 96.20%, Contemp: 94.70 - 98.10%
  * % adapter
    * Alb: 60.40 - 97.60%, Contemp: 39.50 - 75.80%
  * number of reads (passed filter) - low reads for Albatross samples
    * Alb: 0.04 - 164.42 M, Contemp: 1.31 - 26.85 M
```
</details>

</details>

<details>
	<summary>9. Remove Duplicates with Clumpify</summary>

<details>
        <summary>9a/b. Remove duplicates</summary>

Run by klabrador on 2023-12-11

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/klab 20
```

- jobID: 2765310
- job got stuck; review files for rerun
	- Pbb-AGal_023 (r1/r2)
	- Pbb-AGal_024 (r1/r2)
	- Pbb-AGal_033 (r1/r2)


Rerun stragglers
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run

# Create a directory for stragglers.
mkdir fq_fp1_stragglers

# Create a text file containing the names of stragglers, and then move them using a custom bash script.
bash move_files.bash fq_fp1 fq_fp1_stragglers files2move.txt

# Once all stragglers were transferred to the correct directory, rerun clumpify.
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1_stragglers fq_fp1_clmp /scratch/klab 2
```
- jobID: 2767928
- job finished successfully

Return stragglers to the fq_fp1 directory.
```
mv fq_fp1_stragglers/*fq.gz fq_fp1

# Delete temporary stragglers directory
rm -r fq_fp1_stragglers
```

</details>

<details>
        <summary>9c. Check duplicate removal success</summary>

Run by klabrador on 2023-12-12

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run

salloc
enable_lmod
module load container_env mapdamage2

crun R
install.packages ("tidyverse")
# I cannot install tidyverse within the container. The following error is returned: 

## Warning in dir.create(lockdir, recursive = TRUE) :
## cannot create dir '/opt/mapdamage2/lib/R/library/00LOCK-fastmap', reason 'Function not implemented'
## Installation of dependencies had non-zero exit status.

# This goes on for other dependencies.
```

</details>


<details>
        <summary>9d. Clean the scratch drive</summary>

Run by klabrador on 2023-12-12

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/cleanSCRATCH.sbatch /scratch/klab "*clumpify*temp*"
```
- jobID: 2768052
- job finished successfully

</details>

<details>
        <summary>9e. Generate metadata on deduplicated FASTQ files</summary>

Run by klabrador on 2023-12-12

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run

sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report"  "fq.gz"
```
- jobID: 2768058

</details>


</details>

<details>
        <summary>10. Second Trim</summary>

Run by klabrador on 2023-05-01

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run

# Run cssl script for lcwgs.
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_2.sbatch fq_fp1_clmp fq_fp1_clmp_fp2 33

```
- jobID: 2768064
- job finished successfully

FastQC Results

```
Potential issues:
  * % duplication
    * Alb: 0.00 - 2.60%, Contemp: 0.10 - 0.80%
  * GC content
    * Alb: 40.90 - 54.70%, Contemp: 47.00 - 50.80%
  * passing filter 
    * Alb: 96.60 - 98.40%, Contemp: 97.20 - 97.90%
  * % adapter
    * Alb: 2.00 - 5.80%, Contemp: 1.50 - 2.80%
  * number of reads (passed filter) - low reads for Albatross samples
    * Alb: 0.04 - 111.92 M, Contemp: 1.20 - 23.43 M
```

</details>

<details>
        <summary>11. Decontaminate Files</summary>


<details>
	<summary>11a. Run fastq_screen</summary>

Run by klabrador on 2023-12-13
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run

bash

fqScrnPATH=/home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash
indir=fq_fp1_clmp_fp2
outdir=/scratch/klab/fq_fp1_clmp_fp2_fqscrn
nodes=20

bash $fqScrnPATH $indir $outdir $nodes
```
- jobID: 2769384
- job finished; check for errors.

</details>

<details>
        <summary>11b. Check for errors</summary>

Run by klabrador on 2023-12-14

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run

bash
outdir=/scratch/klab/fq_fp1_clmp_fp2_fqscrn
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/validateFQ.sbatch $outdir "*filter.fastq.gz"

less -S $outdir/fqValidationReport.txt file
# All 160 files were tagged as "OK" based on the validation report.

```
- jobID: 2772246
- job finished successfully

Confirm that all files were successfully completed (2023-12-15)

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run

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
### All counts = 80

# for each, you should have the same number as the number of input files (number of fq.gz files)
ls $indir/*r1.fq.gz | wc -l
ls $indir/*r2.fq.gz | wc -l
### All counts = 80

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

Run by klabrador on 2023-12-15

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run
outdir=/scratch/klab/fq_fp1_clmp_fp2_fqscrn
fqscrndir=fq_fp1_clmp_fp2_fqscrn
screen mv $outdir $fqscrndir
# to leave screen: ctrl-a d  


```
</details>


<details>
        <summary>11f. Run MultiQC</summary>

Run by klabrador on 2023-12-15

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runMULTIQC.sbatch fq_fp1_clmp_fp2_fqscrn fastq_screen_report
```
- jobID: 2774130


</details>

<details>
        <summary>12. Repair FASTQ files</summary>

Run by klabrador on 2023-12-15

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/parupeneus_barberinus/1st_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 8
```
- jobID: 2774132


