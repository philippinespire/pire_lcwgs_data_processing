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

## 2. Process Sequencing Metadata

This section wrangles the information generated from the previous section and use that to generate plots and tables that are needed to assess library parameters (e.g., proportion of reads filtered, read lengths). This follows the instructions from [process_sequencing_metadata](https://github.com/philippinespire/process_sequencing_metadata). 


- Run by klabrador on 2023-05-05
- Run done on [ODU's OnDemand](https://wiki.hpc.odu.edu/en/open-ondemand) 


## 3. Prepare Reference Genome

This section prepares the reference genome, which will serve as the scaffold for the assembly. This follows the instructions from [pire_lcwgs_data_processing](https://github.com/philippinespire/pire_lcwgs_data_processing)

<details>
        <summary>1. Get your reference genome</summary>

Run by klabrador on 2023-05-15

Create a new directory for the reference genome
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run
mkdir refGenome
cd ./refGenome
```

Download the reference genome from NCBI through the (RefSeq database)[https://ftp.ncbi.nlm.nih.gov/genomes/refseq/]. Retrieve the *.fna.gz file for the species.

``` 
wget https://ftp.ncbi.nlm.nih.gov/genomes/refseq/vertebrate_other/Chanos_chanos/latest_assembly_versions/GCF_902362185.1_fChaCha1.1/GCF_902362185.1_fChaCha1.1_genomic.fna.gz
```
- Reference genome successfully downloaded.

</details>


<details>
        <summary>2. Curate the reference genome</summary>

Run by klabrador on 2023-05-15

```
# Get the line number for every chromosome, contig, and scaffold in the genome.
zgrep -n '^>' GCF_902362185.1_fChaCha1.1_genomic.fna.gz > GCF_902362185.1_fChaCha1.1_genomic_linenum.txt

# Extract the mitogenome and save to file
zcat GCF_902362185.1_fChaCha1.1_genomic.fna.gz | tail -n +8211456 > NC_004693.1_mtgenome.fasta

# Extract the chromosomes and save to file. Make sure to use the line number before that of the next accession number in the sequence.
## For example, the line number for the last chromosome of the reference used here (chr16: NC_044510.1) starts at 7969298, followed by an unplaced genomic scaffold (NW_022111401.1) at line number 8201217. This means that chr16 ends at the "line number before that of the next accession number in the sequence" (i.e., 8201216).   
zcat GCF_902362185.1_fChaCha1.1_genomic.fna.gz | head -n 8201216 > NC_044496.1-NC_044510.1_chr1-16.fasta

# Concatenate and the chromosomes and mitogenome into one file.
cat NC_044496.1-NC_044510.1_chr1-16.fasta NC_004693.1_mtgenome.fasta > GCF_902362185.1_fChaCha1.1_chr1-16-mtgen.fasta

```

</details>

## 4. Map reads to reference genome

This section maps the repaired *fq.gz files to the curated reference genome. This follows the instructions from (dDocentHPC)[https://github.com/cbirdlab/dDocentHPC].

<details>
        <summary>1. Prepare directory for dDocent runs</summary>

* Run by klabrador on 2023-05-15

```
# Create the mkBAM_dev subdirectory in the working directory
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run
mkdir mkBAM_dev


# Softlink the re-paired *repr.R1/R2.fq.gz files to the mkBAM_dev directory.
ln -s ./fq_fp1_clmp_fp2_fqscrn_rprd/*repr.R*.fq.gz ./mkBAM_dev

# Copy the reference genome to the mkBAM_dev directory, then rename the reference to adhere to the pipeline's naming convention ("reference.[AccessionNo].[referenceType].fasta"). 
cp refGenome/GCF_902362185.1_fChaCha1.1_chr1-16-mtgen.fasta ./mkBAM_dev 
cd ./mkBAM_dev
mv GCF_902362185.1_fChaCha1.1_chr1-16-mtgen.fasta reference.902362185.genome.fasta


# Copy scripts needed from the dDocentHPC repo
cp /home/e1garcia/shotgun_PIRE/dDocentHPC/configs/config.6.lcwgs ./mkBAM_dev
cp /home/e1garcia/shotgun_PIRE/dDocentHPC/dDocentHPC_dev2.sbatch ./mkBAM_dev

# Edit the *sbatch script to change the path where the *.bash script is called. The last line of the *sbatch script should now be:
## crun.ddocent bash /home/e1garcia/shotgun_PIRE/dDocentHPC/dDocentHPC_dev.bash $FUNCTION $CONFIG


# Edit the config file to assign the correct ID for the reference genome.
## under mkREF: set Cutoff1 to 902362185
## under mkREF: sete Cutoff2 to genome


```

</details>

<details>
        <summary>2. Run mkBAM</summary>

- Run by klabrador on 2023-05-15

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run/mkBAM_dev
sbatch dDocentHPC_dev2.sbatch mkBAM config.6.lcwgs
```

- job submitted: 1595680
