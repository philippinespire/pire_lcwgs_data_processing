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
