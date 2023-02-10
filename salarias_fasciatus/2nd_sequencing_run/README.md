# Salarias fasciatus 2nd test lane
### Kevin Labrador
#


## 1. Pre-processing

This follows the instructions from [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing/blob/main/README.md).

### Steps 1 - 4 
* Run by cbird. 


<details>
	<summary>5. Perform a renaming dry run </summary>

* Run by klabrador on 2023-02-08
* Review decode file just in case.
        * nSamples = 99
        * Decode file looks good.

```
salloc 

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Sfa_lcwgsTestLane_SequenceNameDecode.tsv

```

</details>


<details>
	<summary>6. Rename the files for real</summary>

* Run by klabrador on 2023-02-08

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Sfa_lcwgsTestLane_SequenceNameDecode.tsv rename
			
#you will need to say y 2X
```

* Renaming successful.

</details>


<details>
        <summary>7. Check data quality with `fastqc`</summary>

* Run by klabrador on 2023-02-08

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/2nd_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report"  "fq.gz"
```
> Job submitted on 2023-02-08 @ 08:32
>> jobID: 1240714

</details>


<details>
        <summary>8. First trim</summary>

* Run by klabrador on 2023-02-08

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/2nd_sequencing_run
sbatch --mail-user=klabrador@islander.tamucc.edu --mail-type=END /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1
```

> Job submitted on 2023-02-08 @ 08:35
>> jobID: 1240718 \
>> job completed successfully 

</details>


<details>
        <summary>9a. Remove duplicates</summary>

* Run by klabrador on 2023-02-08


```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/2nd_sequencing_run
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/hpc-0289 20
```

> Job submitted on 2023-02-08 @ 10:30 
>> jobID: 1241299 \
>> job completed sucessfully. 


</details>


<details>
        <summary>9b. Check duplicate removal success</summary>
* Run by klabrador on 2023-0208
* Clumpify successfully worked on all samples.

</details>


<details>
        <summary>9c. Generate metadata on deduplicated FASTQ files</summary>

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/2nd_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report"  "fq.gz"

```
> Job submitted on 2023-02-08 @ 20:00
>> jobID: 1241803 \
>> job completed successfully

</details>


<details>
        <summary>10. Second trim</summary> 
* Run by klabrador on 2023-02-08

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/2nd_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_2_cssl.sbatch fq_fp1_clmp fq_fp1_clmp_fp2

```
> Job submitted on 2023-02-08 @ 20:05
>> jobID: 1241806 \
>> job completed successfully.

</details>


<details>
        <summary>11. Decontaminate files</summary>
* Run by klabrador on 2023-02-08

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/2nd_sequencing_run
bash  /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn 20

```
> Job submitted on 2023-02-08 @ 20:19
>> jobID: 1241812/13 \
>> fqscrn_mqc is lagging behind (similar to what I encountered with Sfu). 
>> job cancelled on 2023-02-09 @ 19:49

* Check if files are complete or if there are errors
	* All *fqscrn outfiles returned n = 197. There should be 198.
		* Straggler identified: Sfa-ABas_002-Ex1-7D-lcwgs-1-T.clmp.fp2_r1.fq.gz
	* No errors in log (*.out) files.
	* MultiQC log shows that run has completed, but it is still running in hpc node.

* Copy stragglers into a *straggler directory, then rerun runFQSCRN_6.

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/2nd_sequencing_run
mkdir fq_fp1_clmp_fp2_stragglers
cp ./*fp2/Sfa-ABas_002-Ex1-7D*fq.gz ./*stragglers


bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2_stragglers fq_fp1_clmp_fp2_fqscrn 20
```


> Job submitted on 2023-02-09 @ 18:41
>> jobID: 1242806/07 \
>> job succesfully completed.


* Check if files are complete or if there are errors
        * All *fqscrn outfiles returned n = 198. 
        * No errors in log (*.out) files.
        * MultiQC log shows that run has completed, but it is still running in hpc node.

</details>


<details>
        <summary>12. Repair FASTQ Files</summary>
* Run by klabrador on 2023-02-09

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/2nd_sequencing_run

sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 40
```

> Job submitted on 2023-02-09 @ 19:30
>> jobID: 1242873 
>> job succesfully completed.

Run MultiQC
```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "./fq_fp1_clmp_fp2_fqscrn_rprd" "fqc_rprd_report" "fq.gz"
```

> Job submitted on 2023-02-09 @ 19:37
>> jobID: 1242879
>> job succesfully completed.


</details>


<details>
        <summary>13. Calculate percent of reads lost in each step</summary>
* Not done


</details>


<details>
        <summary>14. Clean up</summary>
* Run by klabrador on 2023-02-09
</details>


<details>
        <summary>Rerun MultiQC on *fqscrn directory</summary>
* Run by klabrador on 2023-02-09

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/2nd_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runMULTIQC.sbatch "fq_fp1_clmp_fp2_fqscrn" "fastq_screen_report" "fq.gz"
```
> Job submitted on 2023-02-09 @ 19:57
>> jobID: 1242909
>> job succesfully completed.







