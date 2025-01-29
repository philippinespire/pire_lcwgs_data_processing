# *Spratelloides gracilis* lcWGS, test lane
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
mkdir -p spratelloides_gracilis/1st_sequencing_run/
```

- Go to the assigned working directory and create the following subdirs:

```bash
mkdir fq_raw fq_fp1 fq_fp1_clmp fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd
```
</details>

If the repositories have been cloned previously, just use `git pull` to update your local repo.

<details>
        <summary>1. Retrieve data from ODU HPC Archive </summary>

- dataset location at /archive/carpenterlab/pire/downloads/spratelloides_gracilis/1st_sequencing_run/fq_raw

```bash
cd ./fq_raw
screen rsync -vr /archive/carpenterlab/pire/downloads/spratelloides_gracilis/1st_sequencing_run/fq_raw/ .
```

All files synced successfully. 
- N = 398 samples * 2 reads = 796 fq.gz files 
- File sizes were larger in home directory (198 Gb) than in ODU HPC Archive (152 Gb).
- `ls -lhS` shows that individual file sizes were similar.

**Check download:**
Ran by KL on 2024-01-31

A) `gridDownloader.sh`
- I did not use `gridDownloader.sh`, so I have no log file to check.

B) Validate the `fq.gz` files

```bash
bash # only run bash if you are not already in bash
cd /home/klab/PIRE/pire_lcwgs_data_processing/spratelloides_gracilis/1st_sequencing_run
SCRIPT=/home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/validateFQPE.sbatch
DIR=./fq_raw
fqPATTERN="*fq.gz"
sbatch $SCRIPT $DIR $fqPATTERN
```
- jobID: 2917062
- Examined SLURM `out` file and `$DIR/fqValidationReport.txt`. No errors were found on the fq.gz files.

```
less -S valiate_FQ_-2917062.out
less -S $DIR/fqValidationReport.txt | grep "OK" | wc -l
```

</details>

<details>
        <summary>2. Proofread the decode file(s)</summary>

Run by klabrador on 2024-01-31

```
salloc
bash

cd /home/klab/PIRE/pire_lcwgs_data_processing/spratelloides_gracilis/1st_sequencing_run/fq_raw

ls *1.fq.gz | wc -l
# 398 

ls *2.fq.gz | wc -l
# 398

wc -l *.tsv
# 399 - 1 (header) = 398 

cat *.tsv | sort | uniq | wc -l
# 399 - 1 (header) = 398 samples 
```
- Decode file looks good.

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
cd /home/klab/PIRE/pire_lcwgs_data_processing/spratelloides_gracilis/1st_sequencing_run/fq_raw
# salloc (already in node)
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Sgr_lcwgs-TestLane_SequenceNameDecode.tsv
```
- Looks good.

</details>

<details>
        <summary>6. Rename the files for real</summary>

Run by klabrador on 2024-01-31

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/spratelloides_gracilis/1st_sequencing_run/fq_raw
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Sgr_lcwgs-TestLane_SequenceNameDecode.tsv rename
```
- renaming successful

</details>

<details>
        <summary>7. Check data quality</summary>

Run by klabrador on 2024-01-31

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/spratelloides_gracilis/1st_sequencing_run

#sbatch Multi_FASTQC.sh "<indir>" "<mqc report name>" "<file extension to qc>"
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report"  "fq.gz"

```
- jobID = 2917136
- job finished successfully

<details> 
	<summary>QC Results (TO BE UPDATED)</summary> 

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

Run by klabrador on 2024-01-31

```
cd /home/klab/PIRE/pire_lcwgs_data_processing/spratelloides_gracilis/1st_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1
```
- jobID: 2917138
- job finished successfully

```
Potential issues (to be updated):
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

<details>
	<summary>9. Remove Duplicates with Clumpify</summary>

<details>
        <summary>9a/b. Remove duplicates</summary>

Run by lweeks on 2024-02-02.

```bash
cd /home/hpc-0351/pire_lcwgs_data_processing/spratelloides_gracilis/1st_sequencing_run
bash /../../../pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/hpc-0351 20
```

</details>

<details>
        <summary>9c. Check duplicate removal success</summary>

Run by lweeks on 2024-02-05

```bash
cd /home/hpc-0351/pire_lcwgs_data_processing/spratelloides_gracilis/1st_sequencing_run

salloc
enable_lmod
module load container_env R/4.2

crun R > ../../../pire_fq_gz_processing/checkClumpify_EG.R --no-save

```

</details>

<details>
        <summary>9d. Clean the scratch drive</summary>

Run by lweeks on 2024-02-05

```
sbatch /../../../pire_fq_gz_processing/cleanSCRATCH.sbatch /scratch/hpc-0351 "*clumpify*temp*"
```

</details>

<details>
        <summary>9e. Generate metadata on deduplicated FASTQ files</summary>

Run by klabrador on 2024-02-05

```
cd /../../../pire_lcwgs_data_processing/spratelloides_gracilis/1st_sequencing_run

sbatch /../../../pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report"  "fq.gz"
```

</details>


</details>

<details>
        <summary>10. Second Trim</summary>

Run by lweeks on 2024-02-05

```
# Run cssl script for lcwgs.
sbatch /../../../pire_fq_gz_processing/runFASTP_2.sbatch fq_fp1_clmp fq_fp1_clmp_fp2 33

```

</details>

<details>
        <summary>11. Decontaminate Files</summary>

<details>
	<summary>11a. Run fastq_screen</summary>

Run by lweeks on 2024-02-05
```bash
bash ../../../pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 /scratch/hpc-0351/fq_fp1_clmp_fp2_fqscrn 20
```

</details>

<details>
        <summary>11b. Check for errors</summary>

Run by lweeks on 2024-02-05

```bash

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

Run by lweeks on 2024-02-12

```
sbatch /../../../pire_fq_gz_processing/runMULTIQC.sbatch fq_fp1_clmp_fp2_fqscrn fastq_screen_report
```

</details>

</details>

<details>
        <summary>12. Repair FASTQ files</summary>

Run by lweeks on 2024-02-12

```
sbatch ../../../pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 5
```
Run Multi_FASTQC.sh
```

sbatch ../../../pire_fq_gz_processing/Multi_FASTQC.sh "./fq_fp1_clmp_fp2_fqscrn_rprd" "fqc_rprd_report" "fq.gz"

```


</details>

<details>
        <summary>13. Clean up</summary>

```
mv *out /logs/

```
