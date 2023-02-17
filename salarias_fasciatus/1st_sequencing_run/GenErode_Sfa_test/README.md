## GenErode test run for Sfa

### Set up your analysis folder

Make a copy of the template folder, renaming it according to your species name.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/GenErode_templatedir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test
```

I replaced the GenErode readme with another README.md file to track work within this directory.

Make directories within this directory to hold your config file, historical, modern, and reference genome.

```
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test/config
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test/historical
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test/modern
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test/reference
```

For the test - copy the first few historical/contemp fq.gz samples to the appropriate subdirectories. Copy the reference genome to the reference folder.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/fq_fp1_clmp_fp2b_fqscrn_rprd/Sfa-ABas_00*.fq.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test/historical

cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/fq_fp1_clmp_fp2b_fqscrn_rprd/Sfa-CBas_00*.fq.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test/modern

cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test/reference

gunzip /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test/reference/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz
```

### Copy / edit config files

Copying the Sumatran rhino test config file.

```
cp /home/breid/GenErode_testdata/config/config_sum_rhino.yaml /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test/config/config.yaml
```

Create the files providing path info for historic samples.

```
vi /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test/config/Sfa_9_historical_samples.txt
```

File format + header: samplename_index_lane readgroup_id readgroup_platform path_to_R1_fastq_file path_to_R2_fastq_file

```
samplename_index_lane readgroup_id readgroup_platform path_to_R1_fastq_file path_to_R2_fastq_file
Sfa-ABas_001_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_001_Ex1_L3_clmp.fp2_repr.R1.fq.gz historical/Sfa-ABas_001_Ex1_L3_clmp.fp2_repr.R1.fq.gz
Sfa-ABas_002_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_002_Ex1_L3_clmp.fp2_repr.R1.fq.gz historical/Sfa-ABas_002_Ex1_L3_clmp.fp2_repr.R1.fq.gz
Sfa-ABas_003_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_003_Ex1_L3_clmp.fp2_repr.R1.fq.gz historical/Sfa-ABas_003_Ex1_L3_clmp.fp2_repr.R1.fq.gz
Sfa-ABas_004_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_004_Ex1_L3_clmp.fp2_repr.R1.fq.gz historical/Sfa-ABas_004_Ex1_L3_clmp.fp2_repr.R1.fq.gz
Sfa-ABas_005_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_005_Ex1_L3_clmp.fp2_repr.R1.fq.gz historical/Sfa-ABas_005_Ex1_L3_clmp.fp2_repr.R1.fq.gz
Sfa-ABas_006_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_006_Ex1_L3_clmp.fp2_repr.R1.fq.gz historical/Sfa-ABas_006_Ex1_L3_clmp.fp2_repr.R1.fq.gz
Sfa-ABas_007_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_007_Ex1_L3_clmp.fp2_repr.R1.fq.gz historical/Sfa-ABas_007_Ex1_L3_clmp.fp2_repr.R1.fq.gz
Sfa-ABas_008_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_008_Ex1_L3_clmp.fp2_repr.R1.fq.gz historical/Sfa-ABas_008_Ex1_L3_clmp.fp2_repr.R1.fq.gz
Sfa-ABas_009_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_009_Ex1_L3_clmp.fp2_repr.R1.fq.gz historical/Sfa-ABas_009_Ex1_L3_clmp.fp2_repr.R1.fq.gz
```

Create the files providing path info for modern samples.

```
vi /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test/config/Sfa_7_modern_samples.txt
```

File format + header: samplename_index_lane readgroup_id readgroup_platform path_to_R1_fastq_file path_to_R2_fastq_file

```
samplename_index_lane readgroup_id readgroup_platform path_to_R1_fastq_file path_to_R2_fastq_file
Sfa-CBas_001_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_001_Ex1_L3_clmp.fp2_repr.R1.fq.gz modern/Sfa-CBas_001_Ex1_L3_clmp.fp2_repr.R1.fq.gz
Sfa-CBas_002_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_002_Ex1_L3_clmp.fp2_repr.R1.fq.gz modern/Sfa-CBas_002_Ex1_L3_clmp.fp2_repr.R1.fq.gz
Sfa-CBas_003_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_003_Ex1_L3_clmp.fp2_repr.R1.fq.gz modern/Sfa-CBas_003_Ex1_L3_clmp.fp2_repr.R1.fq.gz
Sfa-CBas_004_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_006_Ex1_L3_clmp.fp2_repr.R1.fq.gz modern/Sfa-CBas_006_Ex1_L3_clmp.fp2_repr.R1.fq.gz
Sfa-CBas_007_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_007_Ex1_L3_clmp.fp2_repr.R1.fq.gz modern/Sfa-CBas_007_Ex1_L3_clmp.fp2_repr.R1.fq.gz
Sfa-CBas_008_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_008_Ex1_L3_clmp.fp2_repr.R1.fq.gz modern/Sfa-CBas_008_Ex1_L3_clmp.fp2_repr.R1.fq.gz
Sfa-CBas_009_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_009_Ex1_L3_clmp.fp2_repr.R1.fq.gz modern/Sfa-CBas_009_Ex1_L3_clmp.fp2_repr.R1.fq.gz
```

Edit config file.

```
vi /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test/config/config.yaml
```

Changes:
* line 23 - ref_path = "GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna"
* line 31 - historical_samples = "config/Sfa_9_historical_samples.txt"
* line 32 - modern_samples = "config/Sfa_7_modern_samples.txt" 
* line 109 - mapping = True
* line 165 - historical_bam_mapDamage = TRUE
* line 173 - historical_rescaled_samplenames = ["Sfa-ABas_001_Ex1_L3","Sfa-ABas_002_Ex1_L3","Sfa-ABas_003_Ex1_L3","Sfa-ABas_004_Ex1_L3","Sfa-ABas_005_Ex1_L3","Sfa-ABas_006_Ex1_L3","Sfa-ABas_007_Ex1_L3","Sfa-ABas_008_Ex1_L3","Sfa-ABas_009_Ex1_L3"]

### Try to run!

Copy and run the sbatch file.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/run_GenErode.sbatch /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test

sbatch run_GenErode.sbatch 
```
