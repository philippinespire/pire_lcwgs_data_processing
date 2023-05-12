# *Chanos chanos* lcWGS, test lane 
### Kevin Labrador
#

## 1. Pre-processing


This follows the instructions from [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing/blob/main/README.md).


<details>
        <summary>0. Set up directory</summary>

- Go to PIRE lcwgs directory on Wahab and create the appropriate subdirectory for the species.

```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing
mkdir -p gotanco-chanos_chanos/1st_sequencing_run/
```

- Go to the assigned working directory and create the following subdirs:

```bash
mkdir fq_raw fq_fp1 fq_fp1_clmp fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd
```

</details>


<details>
        <summary>1. Download data from TAMUCC grid</summary>

- dataset location @ https://gridftp.tamucc.edu/genomics/20230425_Gotanco-lcwgs-testlane/

```bash
cd ./fq_raw
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/gridDownloader.sh . https://gridftp.tamucc.edu/genomics/20230425_Gotanco-lcwgs-testlane/ https://gridftp.tamucc.edu/genomics/20230425_Gotanco-lcwgs-testlane/https://gridftp.tamucc.edu/genomics/20230425_Gotanco-lcwgs-testlane/https://gridftp.tamucc.edu/genomics/20230425_Gotanco-lcwgs-testlane/
```

</details>

<details>
        <summary>2-6. Rename files</summary>

- Steps 2 - 6 not needed for this library. Proceed to Step 7.

</details>

<details>
        <summary>7. Check data quality</summary>

Run by klabrador on 2023-04-28

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report" "fq.gz"
```

- job submitted: 1508245
- job finished successfully


</details>


<details>
        <summary>8. First trim</summary>

Run by klabrador on 2023-04-28

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run
sbatch ../../../pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1
```

- job submitted: 1508254
- job finished successfully

</details>


<details>
        <summary>9a. Remove duplicates</summary>

Run by klabrador on 2023-04-28

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run
bash ../../../pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/hpc-0289 20
```

- job submitted: 1508327
- job finished successfully

</details>


<details>
        <summary>9b. Check duplicate removal success</summary>

Run by klabrador on 2023-04-29

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run

salloc
enable_lmod
module load container_env mapdamage2

crun R < /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkClumpify_EG.R --no-save
exit
```

- Clumpify succesfully worked on all samples


</details>


<details>
        <summary>9c. Generate metadata on deduplicated FASTQ files</summary>

Run by klabrador on 2023-04-29

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run

sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report"  "fq.gz"

```

- job submitted: 1510098
- job finished successfully

</details>


<details>
        <summary>10. Second Trim</summary>

Run by klabrador on 2023-05-01

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run

# Run cssl script for lcwgs.
sbatch ../../../pire_fq_gz_processing/runFASTP_2_cssl.sbatch fq_fp1_clmp fq_fp1_clmp_fp2
```

- job submitted: 1511956
- job finished; multiQC report was not included in outfile, but multiQC output was present in output directory

</details>

<details>
        <summary>11. Decontaminate files</summary>

Run by klabrador on 2023-05-01

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run

bash ../../../pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn 20
``` 

- job submitted: 1512034

Confirm if all files were successfully completed.
```
# Check file count.
ls fq_fp1_clmp_fp2_fqscrn/*tagged.fastq.gz | wc -l
ls fq_fp1_clmp_fp2_fqscrn/*tagged_filter.fastq.gz | wc -l
ls fq_fp1_clmp_fp2_fqscrn/*screen.txt | wc -l
ls fq_fp1_clmp_fp2_fqscrn/*screen.png | wc -l
ls fq_fp1_clmp_fp2_fqscrn/*screen.html | wc -l
## n = 600 for all outfiles

# Check for errors
grep 'error' slurm-fqscrn.*out
grep 'No reads in' slurm-fqscrn.*out
## No errors/no-reads found.
```

- Run MultiQC for fqscrn output.
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run
sbatch ../../../pire_fq_gz_processing/runMULTIQC.sbatch fq_fp1_clmp_fp2_fqscrn fastq_screen_report
```

- job submitted: 1572126
- job finished successfully

</details>


<details>
        <summary>12. Execute `runRepair`</summary>

Run by klabrador on 2023-05-02

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run

sbatch ../../../pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 40
```

- job submitted: 1573172
- job got stuck. Rerun

Rerun by klabrador on 2023-05-03

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run

sbatch ../../../pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 40
```
- job submitted: 1590145
- job terminated early without finishing all samples. Rerun.
- job submitted: 1590190
- still the same problem... let me just delete the contents of the directory and rerun the entire thing.
-- there were problems in processing R2... RAM issues?

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run

# increase allocation from 40 to 50
sbatch ../../../pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 50
```
- job submitted: 1590207
- job finished successfully


Run `Multi_FASTQC.sh`
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "./fq_fp1_clmp_fp2_fqscrn_rprd" "fqc_rprd_report" "fq.gz"
```
- job submitted: 1590236
- job finished successfully

</details>

<details>
        <summary>13. Clean Up</summary>

```
mkdir logs
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run
mv *out logs/
```

