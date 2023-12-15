### try GenErode using Goy reference (scaffolds >20kbp)

cp -r /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/GenErode_templatedir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k 

mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k/config
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k/historical
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k/modern
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k/reference

Copy all of the historical/contemp fq.gz samples to the appropriate subdirectories. Copy the reference genome to the reference folder.

```
rsync /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/fq_raw/Goy-APnd*.fq.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k/historical

rsync /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/fq_raw/Goy-CPnd*.fq.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k/modern

rsync /home/e1garcia/shotgun_PIRE/REUs/2022_REU/Allison/gerres_oyena_PSMC/reference.denovoSSL.Goy20k.fasta /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k/reference

```

Get outgroup genome files and tree from previous run.

```
rsync -r /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_full/gerp_outgroups /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k
rsync /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_full/gerp_tree.nwk /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k

#In the tree, rename the focal species with the name of the reference assembly file 

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k
sed -i 's/GCF_902148845.1_fSalaFa1.1_chr1-23_rename.fna/reference.denovoSSL.Goy20k.fasta/g' gerp_tree.nwk
```

Get mitochondrial sequence files.

!! Note - GenErode only seems to check against a standard set of 5 mitochondrial genomes (human/pig/chicken/cow/mouse) even if others are provided in the folder containing mitochondrial reference genomes. I've contacted the developer but they are on leave until August!!

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_full/data/mitogenomes/*.fasta /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k/data/mitogenomes
```

### Copy / edit config files

Copy the files providing path info for historic + modern samples from previous run.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_full/config/Goy_32_historical_samples.txt /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_full/config/Goy_49_modern_samples.txt /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k
```

Copy config file from previous run and edit paths / etc.

Changes:
* line 23: ref_path: "reference/reference.denovoSSL.Goy20k.fasta"
* line 492: gerp_ref_path: "/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k/gerp_outgroups"
* line 501: tree: "/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k/gerp_tree.nwk"

### Run

Copy and run the sbatch file.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/run_GenErode.sbatch /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/GenErode_Goy_20k

sbatch run_GenErode.sbatch 
```

