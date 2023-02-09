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

