## GenErode test run with raw fq files/

Running GenErode with a minimal reference, shortened scaffold name.

### Get / setup directory

```
cp -r /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/GenErode_templatedir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw
```

Make directories within this directory to hold your config file, historical, modern, and reference genome.

```
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw/config
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw/historical
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw/modern
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw/reference
```

For the test - copy the first few historical/contemp fq.gz samples to the appropriate subdirectories. Copy the reference genome to the reference folder.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/fq_raw/Sfa-ABas_00*.fq.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw/historical

cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/fq_raw/Sfa-CBas_00*.fq.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw/modern

cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw/reference

gunzip /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw/reference/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz
```

Rename to only include the scaffold names in FASTA description (>) lines. Retain only the first scaffold.

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw/reference

sed -n '/>NC_043746.1/q;p' GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna > GCF_902148845.1_fSalaFa1.1_chr1.fna

sed 's/ .*//g' GCF_902148845.1_fSalaFa1.1_chr1.fna > GCF_902148845.1_fSalaFa1.1_chr1_rename.fna

rm GCF_902148845.1_fSalaFa1.1_chr1.fna

rm GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna


```

### Copy / edit config files

Copying the config files from the previous test run.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test_onescaf/config/config.yaml /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw/config

cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test_onescaf/config/Sfa_9_historical_samples.txt /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw/config

cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test_onescaf/config/Sfa_7_modern_samples.txt /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw/config

```

### Try to run!

Copy and run the sbatch file.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/run_GenErode.sbatch /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw

sbatch run_GenErode.sbatch
```
