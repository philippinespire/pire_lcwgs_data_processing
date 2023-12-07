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


Check download:
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


</details>




