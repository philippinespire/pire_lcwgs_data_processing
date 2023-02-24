# Siganus fuscescens lcWGS 
### Kevin Labrador
#


## 1. Pre-processing


This follows the instructions from [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing/blob/main/README.md).

<details>
	<summary>Housekeeping</summary>

1. Setup Computer 
	- Computer set-up following C.Bird's [instructions](https://github.com/kllabrador/TAMUCC_GCL_Bioinformatics/blob/main/ComputerSetUp.md)
  
2. Go to [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing/blob/main/README.md). Follow instructions.

3. Identify HPC being used: Wahab
  
4. Log-in to Wahab

```bash
ssh hpc-0289@wahab.hpc.odu.edu
# Refer to private notes for password
```
5. Check if git username and email address are registered on Wahab. If not, follow [instructions](https://linuxize.com/post/how-to-configure-git-username-and-email/)

```
git config -l

# If not configured properly, do the following:

git config --global user.name "kllabrador"
git config --global user.email "kllabrador@up.edu.ph"
```

6. Make sure to `git pull` before each session, and then `add`, `commit`, and `push` after each session.

</details>


<details>
	<summary>0. Set up directory</summary>
	
- Go to E.Garcia's directory 
- All directories have already been prepared beforehand, so there is no need to create a personal subdirectory.

```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens
```

- Go to the assigned working directories and create the following subdirs:
  
```bash
mkdir fq_fp1 fq_fp1_clmp fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd
```
</details>


<details>
	<summary>1. Download data from TAMUCC grid</summary>

> This was already done by E.Garcia.

</details>


<details>
	<summary>2. Proofread the decode file(s)</summary>

- Review the decode file

```bash
cd ./fq_raw
less *SequenceNameDecode.txt
```

>The naming convention for the decode file's Extraction_ID was not followed. Details are as follows:
>> two underscores used (e.g., `Sfu-ABai_005_Ex1-1A-lcwgs-1-1`)

> Is the dataset complete?
>> Yes (n = 8)

> Are there duplicate of libraries?
>> No	

</details>


<details>
	<summary>3. Edit the decode file</summary>

> Decode file was renamed (*original_deprecated.txt), and copy was then created (*fixed.txt) and edited as per naming convention.
>> Second underscore was changed into a dash
    
```
mv Sfu_lcwgs_SequenceNameDecode.txt Sfu_lcwgs_SequenceNameDecode_original_deprecated.txt
cp *deprecated.txt Sfu_lcwgs_SequenceNameDecode_fixed.txt

sed "s/_Ex/-Ex/" *fixed.txt

# Check if the naming error is fixed. If so,
sed -i "s/_Ex/-Ex/" *fixed.txt
```
</details>


<details>
	<summary>4. Make a copy for the fq_raw files prior to renaming.</summary>

```
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens/fq_raw
```

- Permission denied. Cannot access RC directory.
- Skip this part and move on to renaming.
</details>


<details>
	<summary>5. Perform a renaming dry run</summary>

- Use the fixed decode file to rename the raw `fq.gz` files. Use the pre-written bash script for renaming.
  
```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens/fq_raw
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Sfu_lcwgs_SequenceNameDecode_fixed.txt
```

> Permission denied
>> chmod 770 the fixed file I made.
>> did not work 
>> I might have write privileges, but not execute (C.Bird)
>> Wait for permission to be granted. 

> C.Bird did this part

</details>


<details>
	<summary>6. Rename the files for real</summary>

```bash

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens/fq_raw

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash  *fixed.txt rename
			
#you will need to say y 2X
```
> C.Bird did this part

</details>


<details>
	<summary>7. Check the quality of the data. Run `fastqc`</summary>

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens
sbatch --mail-user=klabrador@islander.tamucc.edu --mail-type=END /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report" "fq.gz"
```

> Unable to *.sh file. Request for permission.

> Was able to submit job on second attempt on 2023-01-29
>> jobID: 1223883
>> jobFinished; Runtime = 00:07:29

### MultiQC output

```
Potential Issues:
	* % duplication 
		* Alb: 16.50 - 28.20%
	* GC Content 
		* Alb: 46 - 47%
	* number of reads 
		* Alb: 18 - 31.7 M
```
> Ask Chris how to detect "potential issues".

</details>


<details>
	<summary>8. First trim</summary>

- Execute `runFASTP_1st_trim.sbatch`

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens

sbatch --mail-user=klabrador@islander.tamucc.edu --mail-type=END ../../pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1

```
> sbatch error. 
>> "This does not look like a batch script."\
>> But... the script looks like a batch script to me.\
>> Forwarded issue to CBird.

> Job submitted on second run on 2023-01-29
>> jobID: 1224232\
>> job finished; Runtime: 00:07:44

- Check for potential issues

Potential issues:
	* % duplication
		* Alb: 11.30 - 16.60%
	* GC content
		* Alb: 40.00 - 45.00%
	* passing filter
		* Alb: 98.40 - 99.10%
	* % adapter
		* Alb: 66.60 - 93.60%
	* number of reads
		* Alb: 35.60 - 62.50 M

</details>

<details>
        <summary>9a. Remove Duplicates</summary>

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens 
bash ../../pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/hpc-0289 8

# check to be sure the job is running
watch squeue -u hpc-0289

```
> Job submitted on 2023-01-29
>> jobID: 1224681

> Job cancelled on 2023-02-01
>> Something is wrong. There are no files in the destination dir. - C.Bird

> Job resubmitted on 2023-02-01
>> jobID: 1229386\
>> job finished; runtime: not recorded

</details>

<details>
        <summary>9b. Check duplicate removal success</summary>

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens

salloc #because R is interactive and takes a decent amount of memory, we want to grab an interactive node to run this
enable_lmod
module load container_env mapdamage2

crun R < /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkClumpify_EG.R --no-save
exit #to relinquish the interactive node
```
> Clumpify successfully worked on all samples.

</details>


<details>
        <summary>9c. Generate metadata on deduplicated FASTQ files</summary>

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report"  "fq.gz"

# check to be sure the job is running
watch squeue -u hpc-0289
```

> Job submitted on 2023-02-02
>> jobID: 1233901
>> job finished; runtime: not recorded

</details>


<details>
        <summary>10. Second trim</summary>

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens

sbatch ../../pire_fq_gz_processing/runFASTP_2_cssl.sbatch fq_fp1_clmp fq_fp1_clmp_fp2
```

> Job submitted on 2023-02-02
>> jobID: 1233939\
>> job finished; runtime: not recorded 

Note to self: start recording runtime as well.


</details>


<details>
        <summary>11. Decontaminate files</summary>

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens
bash ../../pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn 20

watch squeue -u hpc-0289
```

> Job submitted on 2023-02-03 @ 21:50
>> jobID: 1237860
>> straggler identified: Sfu-ABai_005-Ex1-1A-lcwgs-1-1.clmp.fp2_r1

I should ask Chris why I get a lot of stragglers on my runs...

```
# Create a straggler subdir, then move Sfu-ABai_005*.fq.gz samples to the subdir.
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens/fq_fp1_clmp_fp2_stragglers
mv /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens/fq_fp1_clmp_fp2/Sfu-ABai_005*.fq.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens/fq_fp1_clmp_fp2_stragglers

# Rerun fastqscrn
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens
bash ../../pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2_stragglers fq_fp1_clmp_fp2_fqscrn 20 

```

> Job submitted on 2023-02-05 @ ~ 00:00  
>> jobID: 1238191/92 \
>> job still struggling... it has been 15h now and there is no progress... \
>> Third time's the charm (?) \
>> job cancelled on 2023-02-05 @ 10:53

> Job resubmitted on 2023-02-05 @ 10:54 
>> jobID: 1239151/52 \
>> job has been running for 3 days now. \
>> job cancelled on 2023-02-05 @ 20:07



Check if all files were successfully completed

```
ls fq_fp1_clmp_fp2_fqscrn/*tagged.fastq.gz | wc -l
# 16

ls fq_fp1_clmp_fp2_fqscrn/*tagged_filter.fastq.gz | wc -l 
# 16

ls fq_fp1_clmp_fp2_fqscrn/*screen.txt | wc -l
# 16

ls fq_fp1_clmp_fp2_fqscrn/*screen.png | wc -l
# 16

ls fq_fp1_clmp_fp2_fqscrn/*screen.html | wc -l
# 16

```

* All files seems to have completed succesfully, but the MultiQC did not seem to work. Check with Chris if I can rerun the QC later.


* Rerun MultiQC
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runMULTIQC.sbatch "fq_fp1_clmp_fp2_fqscrn" "fastq_screen_report" "fq.gz"
``
> Job submitted on 2023-02-09 @ 20:17
>> jobID: 1242935 \

</details>


<details>
        <summary>12. Repair FASTQ files</summary>
* Run by klabrador on 2023-02-09

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 40
```
> Job submitted on 2023-02-09 @ 20:17
>> jobID: 1242942 \
>> job completed succesfully

Run MultiQC

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "./fq_fp1_clmp_fp2_fqscrn_rprd" "fqc_rprd_report" "fq.gz"
```
> Job submitted on 2023-02-09 @ 20:22
>> jobID: 1242946 \
>> job completed succesfully

</details>


<details>
        <summary>13. Calculate % reads lost in each step</summary>
* Not done

</details>


<details>
        <summary>14. Clean up</summary>
* Run by klabrador on 2023-02-09

</details>

## 2. Mapping to Reference Mitogenome

This maps the repaired `*fq.gz` files to a reference genome. As per cbird's instructions, I should map Sfu to the mtDNA genome of the most closely related species for which there's an mtgenome on GenBank.

This follows the instructions on [pire_lcwgs_data_processing](https://github.com/philippinespire/pire_lcwgs_data_processing).


<details>
        <summary>1. Complete fq.gz preprocessing</summary>

* Completed on 2023-02-09

</details>



<details>

        <summary>2. Get the reference genome</summary>

* Run by klabrador on 2023-02-17

```
# Make a refGenome directory
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens
mkdir refGenome

# In the refGenome directory, download the mitogenome of the species that is most closely related to Sfu
## There is no reference genome for the study species on NCBI's database.
## There are no available genomes for any Siganid species on the database.
## There is a published complete mtgenome of the study species ([Oh et al., 2007](https://doi.org/10.1080/10425170701248525); accession no. EF025185.1)
cd refGenome
wget "https://www.ncbi.nlm.nih.gov/sviewer/viewer.fcgi?id=NC_009572.1&db=nuccore&report=fasta&retmode=text" -O NC_009572.1

# Zip the file
cat NC_009572.1 | gzip > NC_009572.1_Sfu_mtgen.fna.gz
```

</details>


<details>

        <summary>3. Map reads to reference genome</summary>

* Run by klabrador on 2023-02-17

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens
sbatch ../scripts/mkBAM.sbatch "fq_fp1_clmp_fp2_fqscrn_rprd/*.fq.gz" ./refGenome/NC_009572.1_Sfu_mtgen.fna.gz ./mkBAM
```

> Job submitted on 2023-02-17 @ 11:40 
>> jobID: 1260784 \
>> job completed, but with warnings: 
	* "Cannot index files compressed with gzip." 
	* "Failed to build index file for reference file.

> rroberts suggested using the reference's raw fasta file, not the zip file.
>> Redo job using the fasta file.

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens
sbatch ../scripts/mkBAM.sbatch "fq_fp1_clmp_fp2_fqscrn_rprd/*.fq.gz" ./refGenome/NC_009572.1.fasta ./mkBAM
```

> Job submitted on 2023-02-17 @ 12:31
>> jobID: 1260955 \
>> job completed successfully.

</details>


<details>

        <summary>4. Filter BAM files</summary>
* Run by klabrador on 2023-02-17

```
sbatch ../scripts/fltrBAM.sbatch ./mkBAM
```

> Job submitted on 2023-02-17 @ 12:10 
>> jobID: 1260871 \
>> job failed \ 
>> Error: The sbatch file searches for the script at /home/e1garcia/shotgun_PIRE/home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/fltrBAM.bash. The said script has already been deprecated on the said directory. The *.bash script directory should be redirected.

</details>

So, it looks like I have been doing the assembly wrong. I should have used the (cbird's dDocent scripts)[https://github.com/cbirdlab/dDocentHPC].


<details>

        <summary>5. Prepare directory for dDocent runs</summary>
* Run by klabrador on 2023-02-24

I renamed the "mkBAM" directory to "mkBAM_dev". I then created a subdirectory, "scratch_dir", which contains the old *bam* files. 
The "mkBAM_dev" will serve as my "project directory".

I copied several files from the dDocentHPC directory to the mkBAM_dev directory.
These were the same files that I found in the Sfa mkBAM_dev2 directory:

	* config.6.lcwgs
	* dDocentHPC_dev.sbatch
	* dDocentHPC_dev2.sbatch
 
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens/mkBAM_dev
cp ../../../dDocentHPC/configs/config.6.lcwgs .
cp ../../../dDocentHPC/dDocentHPC_dev.sbatch .
cp ../../../dDocentHPC/dDocentHPC_dev2.sbatch .
```

Copy the repaired *R1/R2.fq.gz files to the project directory.

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/siganus_fuscescens
cp fq_fp1_clmp_fp2_fqscrn_rprd/*fq.gz mkBAM_dev/
```

... to be continued
