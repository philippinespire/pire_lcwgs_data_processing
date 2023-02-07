# hypoatherina_temminckii lcwgs

---

## test lane processing

### Steps 1-8

* Run by cbird on 2023-01-28
* completed gracefully
* _*several sp-era-site combos have reads so short that they're failing the filter*_
* _*several libs have a very high gc content*_

### Step 9

* Run by cbird on 2023-01-29
* completed gracefully

### Steps 9b-c

* Run by cbird on 2023-01-30
* completed gracefully

### Step 10

* Run by cbird on 2023-01-30

### Step 11
* FQSCRN run by cbird

* Completion and MultiQC run by klabrador on 2023-02-05

> Confirm if all files were successfully completed.
>> Input file count: 1634 \
>> Output file count: 1634 \
Looks good.

> Check for errors
>> No errors returned.

* MultiQC job submitted (jobID: 1239214)
	* Run completed successfully

### Step 12
* Run by klabrador on 2023-02-05

* runREPAIR job submitted (jobID: 1239216)
	* Run completed successfully

* MultiQC job submitted (jobID: 1239217)
	* Run completed successfully

### Step 13
* Move to next step

### Step 14
* Run by klabrador on 2023-02-05

### MultiQC Troubleshooting
* Run by klabrador on 2023-02-07

* cbird: Due to the volume of files being processed by MultiQC, the output file ("multiqc_general_stats.txt") needed to harvest the metadata was not generated. There is a need to modify the configuration of the pipeline and add more rows in the outfile. \

* mdong: There is no global config file for MultiQC. Solutions are:\ 
	* Create a config file within the working directory and indicate the necessary changes in configuration.
	* Run `crun cp /opt/conda/lib/python3.9/site-packages/multiqc/utils/config_defaults.yaml multiqc_config.yaml` 


Trying Option 1:

```
# Create a multiqc_config.yaml file and configure as necessary.
nano multiqc_config.yaml

# In the .yaml file, add the following line:
## max_table_rows: 3000

# Modify the runMULTIQC.sbatch script to add the configuration.
## Just to be on the safe side, copy the script to working directory prior to modification.
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/hypoatherina_temminckii
cp ../../pire_fq_gz_processing/runMULTIQC.sbatch .

## Add the following argument to `srun crun multiqc`: --config ./multiqc_config.yaml

# salloc into a free node and run the script.
salloc

sbatch ./runMULTIQC.sbatch "fq_raw" "fqc_raw_report" "fq.gz"

# On hindsight, there really was no need to salloc because I am running an .sbatch script.
```

> Job submitted on 2023-02-07 @ 11:23
>> jobID: 1240249 \
>> job finished successfully.

Trying cbird's solution:

``` 
## Add the following argument to `srun crun multiqc`:  --cl-config "max_table_rows: 3000"
sbatch ./runMULTIQC.sbatch "fq_raw" "fqc_raw_report" "fq.gz"
```
> Job submitted on 2023-02-07 @ 11:36
>> jobID: 1240269 \
>> job finished successfully.

> Script modification worked. I am now comfortable in changing the script at its original location.
>> Cannot modify script at `pire_fq_gz_processing/` directory due to permission issues.

