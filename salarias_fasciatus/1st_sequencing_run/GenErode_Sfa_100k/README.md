## GenErode full Sfa run

### Set up directory

```
cp -r /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/GenErode_templatedir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k

mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k/config
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k/historical
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k/modern
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k/reference
```

Copy all of the historical/contemp fq.gz samples to the appropriate subdirectories. Copy the reference genome to the reference folder.

```
rsync /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/fq_raw/Sfa-ABas*.fq.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k/historical

rsync /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/fq_raw/Sfa-CBas*.fq.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k/modern

rsync /home/e1garcia/shotgun_PIRE/2022_PIRE_omics_workshop/salarias_fasciatus/PSMC/data/reference.denovoSSL.Sfa20k.fasta /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k/reference

```

Get outgroup genome files and tree from previous run.

```
rsync -r /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/gerp_outgroups /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k
rsync /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/gerp_tree.nwk /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k

#In the tree, rename the focal species with the name of the reference assembly file 

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k
sed -i 's/GCF_902148845.1_fSalaFa1.1_chr1-23_rename.fna/reference.denovoSSL.Sfa20k.fasta/g' gerp_tree.nwk
```

Get mitochondrial sequence files.

!! Note - GenErode only seems to check against a standard set of 5 mitochondrial genomes (human/pig/chicken/cow/mouse) even if others are provided in the folder containing mitochondrial reference genomes. I've contacted the developer but they are on leave until August!!

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/data/mitogenomes/*.fasta /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k/data/mitogenomes
```

### Copy / edit config files

Copy the files providing path info for historic + modern samples from previous run.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/config/Sfa_32_historical_samples.txt /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/config/Sfa_49_modern_samples.txt /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k
```

Copy config file from previous run and edit paths / etc.

Changes:
* line 23: ref_path: "reference/GCF_902148845.1_fSalaFa1.1_chr1-23_rename.fna"
* line 31: historical_samples: "config/Sfa_32_historical_samples.txt"
* line 32: modern_samples: "config/Sfa_49_modern_samples.txt"
* line 89: map_historical_to_mitogenomes: True
* line 97: species_mt_path: "/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/NC_004412.1_mtgenome.fasta"
* line 165: historical_bam_mapDamage: True
* line 173: historical_rescaled_samplenames: ["SfaABas001","SfaABas002","SfaABas003","SfaABas004","SfaABas005","SfaABas006","SfaABas007","SfaABas008","SfaABas009","SfaABas010","SfaABas013","SfaABas014","SfaABas016","SfaABas017","SfaABas018","SfaABas019","SfaABas020","SfaABas021","SfaABas022","SfaABas023","SfaABas024","SfaABas025","SfaABas026","SfaABas027","SfaABas028","SfaABas029","SfaABas030","SfaABas031","SfaABas032","SfaABas033","SfaABas034","SfaABas035"]
* line 486: gerp: True
* line 492: gerp_ref_path: "/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k/gerp_outgroups"
* line 501: tree: "/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k/gerp_tree.nwk"

### Run

Copy and run the sbatch file.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/run_GenErode.sbatch /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_100k

sbatch run_GenErode.sbatch 
```
