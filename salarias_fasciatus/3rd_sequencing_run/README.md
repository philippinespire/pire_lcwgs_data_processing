# *Salarias fasciatus* lcWGS, test lane, repooling assessment
### Kevin Labrador
#

## 1. Pre-processing


This follows the instructions from [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing/blob/main/README.md).


<details>
        <summary>0. Set up directory</summary>

Run by klabrador on 2023-05-11

- Go to PIRE lcwgs directory on Wahab and create the appropriate subdirectory for the species.

```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
mkdir 3rd_sequencing_run/
```

- Go to the assigned working directory and create the following subdirs:

```bash
mkdir fq_raw fq_fp1 fq_fp1_clmp fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd
```

</details>


<details>
        <summary>1. Download data from TAMUCC grid</summary>

Run by klabrador on 2023-05-11

- dataset location @ https://gridftp.tamucc.edu/genomics/20230510_PIRE-Sfa-lcwgs/

```bash
cd ./fq_raw
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/gridDownloader.sh . https://gridftp.tamucc.edu/genomics/20230510_PIRE-Sfa-lcwgs/
```

- job submitted: 1594140
- job finished successfully

</details>

<details>
        <summary>2. Proofread the decode file(s)</summary>

Run by klabrador on 2023-05-12

- No. of samples = 83
- All files look good.
 
 
</details>

<details>
        <summary>3. Edit the decode file</summary>

- No need to edit the decode file

</details>


<details>
        <summary>4. Make a copy of the `fq_raw` files prior to renaming </summary>

Run by klabrador on 2023-05-12

```
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/3rd_sequencing_run
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/3rd_sequencing_run/fq_raw

# on wahab replace <yourPireDirPath> with /home/e1garcia/shotgun_PIRE
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/3rd_sequencing_run/fq_raw
screen cp ./* /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/3rd_sequencing_run/fq_raw

# `ctrl-a`  and then `d` to detach from the `screen` terminal

# look at your screen jobs running
screen -ls
```

</details>

<details>
        <summary>5. Perform a renaming dry run</summary>

Run by klabrador on 2023-05-12

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/3rd_sequencing_run/fq_raw

salloc
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Sfa_lcwgs-3_SequenceNameDecode.tsv

```
- looks good

</details>


<details>
        <summary>6. Rename the files for real</summary>

Run by klabrador on 2023-05-12

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Sfa_lcwgs-3_SequenceNameDecode.tsv rename
```


</details>


<details>
        <summary>7. Check data quality</summary>

Run by klabrador on 2023-05-12

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/3rd_sequencing_run

#sbatch Multi_FASTQC.sh "<indir>" "<mqc report name>" "<file extension to qc>"
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report"  "fq.gz"  
```
- job submitted: 1594644
- job finished successfully


</details>


<details>
        <summary>8. First trim</summary>

Run by klabrador on 2023-05-12

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/3rd_sequencing_run
sbatch ../../../pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1
```

- job submitted: 1594648
- job finished successfully

</details>


<details>
        <summary>9a. Remove duplicates</summary>

Run by klabrador on 2023-05-12

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/3rd_sequencing_run
bash ../../../pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/hpc-0289 20
```

- job submitted: 1594654
- job finished...

</details>

<details> <summary>to do</summary>

<details>
        <summary>9b. Check duplicate removal success</summary>

Run by klabrador on 2023-04-29

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/1st_sequencing_run

salloc
enable_lmod
module load container_env mapdamage2

crun R < /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkClumpify_EG.R --no-save
exit
```

- Clumpify successfully worked on all samples.


</details>


<details>
        <summary>9c. Generate metadata on deduplicated FASTQ files</summary>

Run by klabrador on 2023-04-29

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/1st_sequencing_run

sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report"  "fq.gz"

```

- job submitted: 1510090
- job finished successfully

</details>


<details>
        <summary>10. Second Trim</summary>

Run by klabrador on 2023-05-01

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/1st_sequencing_run

# Run cssl script for lcwgs.
sbatch ../../../pire_fq_gz_processing/runFASTP_2_cssl.sbatch fq_fp1_clmp fq_fp1_clmp_fp2

```

- job submitted: 1511948
- job finished successfully


</details>


<details>
        <summary>11. Decontaminate files</summary>

Run by klabrador on 2023-05-01

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/1st_sequencing_run

bash ../../../pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn 20
```

- job submitted: 1511969


Confirm if all files were successfully completed.
```
# Check file count.
ls fq_fp1_clmp_fp2_fqscrn/*tagged.fastq.gz | wc -l
ls fq_fp1_clmp_fp2_fqscrn/*tagged_filter.fastq.gz | wc -l
ls fq_fp1_clmp_fp2_fqscrn/*screen.txt | wc -l
ls fq_fp1_clmp_fp2_fqscrn/*screen.png | wc -l
ls fq_fp1_clmp_fp2_fqscrn/*screen.html | wc -l
## n = 208 for all outfiles

# Check for errors
grep 'error' slurm-fqscrn.*out
grep 'No reads in' slurm-fqscrn.*out
## No errors/no-reads found.
```

- Run MultiQC for fqscrn output.
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/1st_sequencing_run
sbatch ../../../pire_fq_gz_processing/runMULTIQC.sbatch fq_fp1_clmp_fp2_fqscrn fastq_screen_report
```

- job submitted: 1573167
- job finished successfully


</details>


<details>
        <summary>12. Execute `runRepair`</summary>

Run by klabrador on 2023-05-02

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/1st_sequencing_run

sbatch ../../../pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 40
```

- job submitted: 1573173
- job finished successfully


Run `Multi_FASTQC.sh`
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/1st_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "./fq_fp1_clmp_fp2_fqscrn_rprd" "fqc_rprd_report" "fq.gz"
```

- job submitted: 1590137
- job finished successfully

</details>


<details>
        <summary>13. Clean Up</summary>

```
mkdir logs
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/1st_sequencing_run
mv *out logs/
```
</details>

</details>
