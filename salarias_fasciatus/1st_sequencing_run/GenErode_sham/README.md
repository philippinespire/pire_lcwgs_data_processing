## GenErode reassign modern as historical for MapDamage

### Get / setup directory

```
cp -r /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/GenErode_templatedir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_sham
```

Make directories within this directory to hold your config file, "historical", and reference genome.

```
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_sham/config
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_sham/historical
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_sham/reference
```

For the test - copy the first few contemp fq.gz samples to the appropriate subdirectories (labelled historic). Copy the reference genome to the reference folder.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/fq_raw/Sfa-CBas_00*.fq.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_sham/historical

cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_sham/reference

gunzip /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_sham/reference/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz
```

Rename to only include the scaffold names in FASTA description (>) lines. Retain only the first scaffold.

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_sham/reference

sed -n '/>NC_043746.1/q;p' GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna > GCF_902148845.1_fSalaFa1.1_chr1.fna

sed 's/ .*//g' GCF_902148845.1_fSalaFa1.1_chr1.fna > GCF_902148845.1_fSalaFa1.1_chr1_rename.fna

rm GCF_902148845.1_fSalaFa1.1_chr1.fna

rm GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna
```

### Copy / edit config files

Copying the config files from the previous test run.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_raw/config/config.yaml /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_sham/config

cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_test_onescaf/config/Sfa_7_modern_samples.txt /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_sham/config/Sfa_7_pseudohistoric_samples.txt
```

Edit with names of "historic" samples.


### Try to run!

Copy and run the sbatch file.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/run_GenErode.sbatch /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_sham

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_sham

sbatch run_GenErode.sbatch
```
