## GenErode full Sfa run

### Set up directory

```
cp -r /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_wahab/GenErode_templatedir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full

mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/config
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/historical
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/modern
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/reference
```

Copy all of the historical/contemp fq.gz samples to the appropriate subdirectories. Copy the reference genome to the reference folder.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/fq_raw/Sfa-ABas*.fq.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/historical

cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/fq_raw/Sfa-CBas*.fq.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/modern

cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/reference

gunzip /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/reference/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz

```

Remove mitochondrial scaffold. Rename sequence identifiers to retain only scaffold names in reference genome file.

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/reference

awk '/mitochondrion/{stop=1} stop==0{print}' < GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna >> GCF_902148845.1_fSalaFa1.1_chr1-23.fna

sed 's/ .*//g' GCF_902148845.1_fSalaFa1.1_chr1-23.fna > GCF_902148845.1_fSalaFa1.1_chr1-23_rename.fna

rm GCF_902148845.1_fSalaFa1.1_chr1-23.fna

rm GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna

```

Get outgroup genome files. 
* Go to Genbank -> search Assembly for chromosome-level assemblies of species in. your group (e.g. ovalentaria AND "chromosome"[Assembly Level]) 
* Look through genomes – take ~30-40 that are not individuals from the same species 
* Download the selected files (select Genbank not Refseq, since not all will have Refseq designation). 
* Make a file associating species name with assembly name 
* Upload to Wahab home directory
* Move to you analysis folder

```
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/gerp_outgroups
bash
# from home directory containing folder of genomes
#rename
paste ovalentaria_genome_list ovalentaria_genome_rename  | while read OLD NEW; do mv ${OLD} ${NEW}; done
#copy to analysis folder
while read file; do cp "$file" /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/gerp_outgroups; done < ovalentaria_genome_rename 

```

Get Newick tree:

* upload the list of species names to timetree.org ("Load a List of Species" at the bottom)
* download in Newick format 

Upload newick tree file to your analysis folder in Wahab.

In the tree, rename the focal species with the name of the reference assembly file 

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full
sed -i 's/Salarias_fasciatus/GCF_902148845.1_fSalaFa1.1_chr1-23_rename.fna/g' gerp_tree.nwk
```

Get mitochondrial sequence files.

!! Note - GenErode only seems to check against a standard set of 5 mitochondrial genomes (human/pig/chicken/cow/mouse) even if others are provided in the folder containing mitochondrial reference genomes. I've contacted the developer but they are on leave until August!!

```
while read file; do cp "$file" /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/data/mitogenomes; done < mitolocs
```

### Copy / edit config files

Copy the Sumatran rhino test config file.

```
cp /home/breid/GenErode_testdata/config/config_sum_rhino.yaml /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/config/config.yaml
```

Create the files providing path info for historic samples.

```
vi /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/config/Sfa_32_historical_samples.txt
```

File format + header: samplename_index_lane readgroup_id readgroup_platform path_to_R1_fastq_file path_to_R2_fastq_file. Note that the 3-underscore convention in sample_index_lane must be followed must remove hyphens/underscores from sample names. Make sure space-separated, not tab.

```
samplename_index_lane readgroup_id readgroup_platform path_to_R1_fastq_file path_to_R2_fastq_file
SfaABas001_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_001_Ex1_L3_1.fq.gz historical/Sfa-ABas_001_Ex1_L3_2.fq.gz
SfaABas002_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_002_Ex1_L3_1.fq.gz historical/Sfa-ABas_002_Ex1_L3_2.fq.gz
SfaABas003_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_003_Ex1_L3_1.fq.gz historical/Sfa-ABas_003_Ex1_L3_2.fq.gz
SfaABas004_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_004_Ex1_L3_1.fq.gz historical/Sfa-ABas_004_Ex1_L3_2.fq.gz
SfaABas005_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_005_Ex1_L3_1.fq.gz historical/Sfa-ABas_005_Ex1_L3_2.fq.gz
SfaABas006_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_006_Ex1_L3_1.fq.gz historical/Sfa-ABas_006_Ex1_L3_2.fq.gz
SfaABas007_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_007_Ex1_L3_1.fq.gz historical/Sfa-ABas_007_Ex1_L3_2.fq.gz
SfaABas008_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_008_Ex1_L3_1.fq.gz historical/Sfa-ABas_008_Ex1_L3_2.fq.gz
SfaABas009_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_009_Ex1_L3_1.fq.gz historical/Sfa-ABas_009_Ex1_L3_2.fq.gz
SfaABas010_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_010_Ex1_L3_1.fq.gz historical/Sfa-ABas_010_Ex1_L3_2.fq.gz
SfaABas013_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_013_Ex1_L3_1.fq.gz historical/Sfa-ABas_013_Ex1_L3_2.fq.gz
SfaABas014_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_014_Ex1_L3_1.fq.gz historical/Sfa-ABas_014_Ex1_L3_2.fq.gz
SfaABas016_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_016_Ex1_L3_1.fq.gz historical/Sfa-ABas_016_Ex1_L3_2.fq.gz
SfaABas017_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_017_Ex1_L3_1.fq.gz historical/Sfa-ABas_017_Ex1_L3_2.fq.gz
SfaABas018_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_018_Ex1_L3_1.fq.gz historical/Sfa-ABas_018_Ex1_L3_2.fq.gz
SfaABas019_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_019_Ex1_L3_1.fq.gz historical/Sfa-ABas_019_Ex1_L3_2.fq.gz
SfaABas020_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_020_Ex1_L3_1.fq.gz historical/Sfa-ABas_020_Ex1_L3_2.fq.gz
SfaABas021_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_021_Ex1_L3_1.fq.gz historical/Sfa-ABas_021_Ex1_L3_2.fq.gz
SfaABas022_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_022_Ex1_L3_1.fq.gz historical/Sfa-ABas_022_Ex1_L3_2.fq.gz
SfaABas023_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_023_Ex1_L3_1.fq.gz historical/Sfa-ABas_023_Ex1_L3_2.fq.gz
SfaABas024_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_024_Ex1_L3_1.fq.gz historical/Sfa-ABas_024_Ex1_L3_2.fq.gz
SfaABas025_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_025_Ex1_L3_1.fq.gz historical/Sfa-ABas_025_Ex1_L3_2.fq.gz
SfaABas026_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_026_Ex1_L3_1.fq.gz historical/Sfa-ABas_026_Ex1_L3_2.fq.gz
SfaABas027_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_027_Ex1_L3_1.fq.gz historical/Sfa-ABas_027_Ex1_L3_2.fq.gz
SfaABas028_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_028_Ex1_L3_1.fq.gz historical/Sfa-ABas_028_Ex1_L3_2.fq.gz
SfaABas029_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_029_Ex1_L3_1.fq.gz historical/Sfa-ABas_029_Ex1_L3_2.fq.gz
SfaABas030_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_030_Ex1_L3_1.fq.gz historical/Sfa-ABas_030_Ex1_L3_2.fq.gz
SfaABas031_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_031_Ex1_L3_1.fq.gz historical/Sfa-ABas_031_Ex1_L3_2.fq.gz
SfaABas032_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_032_Ex1_L3_1.fq.gz historical/Sfa-ABas_032_Ex1_L3_2.fq.gz
SfaABas033_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_033_Ex1_L3_1.fq.gz historical/Sfa-ABas_033_Ex1_L3_2.fq.gz
SfaABas034_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_034_Ex1_L3_1.fq.gz historical/Sfa-ABas_034_Ex1_L3_2.fq.gz
SfaABas035_Ex1_L3 HK7K2DSX3:3 illumina historical/Sfa-ABas_035_Ex1_L3_1.fq.gz historical/Sfa-ABas_035_Ex1_L3_2.fq.gz
```

Create the files providing path info for modern samples.

```
vi /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/config/Sfa_49_modern_samples.txt
```

File format + header: samplename_index_lane readgroup_id readgroup_platform path_to_R1_fastq_file path_to_R2_fastq_file. Note that the 3-underscore convention in sample_index_lane must be followed must remove hyphens/underscores from sample names.


```
samplename_index_lane readgroup_id readgroup_platform path_to_R1_fastq_file path_to_R2_fastq_file
SfaCBas001_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_001_Ex1_L3_1.fq.gz modern/Sfa-CBas_001_Ex1_L3_2.fq.gz
SfaCBas002_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_002_Ex1_L3_1.fq.gz modern/Sfa-CBas_002_Ex1_L3_2.fq.gz
SfaCBas003_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_003_Ex1_L3_1.fq.gz modern/Sfa-CBas_003_Ex1_L3_2.fq.gz
SfaCBas006_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_006_Ex1_L3_1.fq.gz modern/Sfa-CBas_006_Ex1_L3_2.fq.gz
SfaCBas007_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_007_Ex1_L3_1.fq.gz modern/Sfa-CBas_007_Ex1_L3_2.fq.gz
SfaCBas008_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_008_Ex1_L3_1.fq.gz modern/Sfa-CBas_008_Ex1_L3_2.fq.gz
SfaCBas009_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_009_Ex1_L3_1.fq.gz modern/Sfa-CBas_009_Ex1_L3_2.fq.gz
SfaCBas010_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_010_Ex1_L3_1.fq.gz modern/Sfa-CBas_010_Ex1_L3_2.fq.gz
SfaCBas014_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_014_Ex1_L3_1.fq.gz modern/Sfa-CBas_014_Ex1_L3_2.fq.gz
SfaCBas015_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_015_Ex1_L3_1.fq.gz modern/Sfa-CBas_015_Ex1_L3_2.fq.gz
SfaCBas016_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_016_Ex1_L3_1.fq.gz modern/Sfa-CBas_016_Ex1_L3_2.fq.gz
SfaCBas017_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_017_Ex1_L3_1.fq.gz modern/Sfa-CBas_017_Ex1_L3_2.fq.gz
SfaCBas019_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_019_Ex1_L3_1.fq.gz modern/Sfa-CBas_019_Ex1_L3_2.fq.gz
SfaCBas020_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_020_Ex1_L3_1.fq.gz modern/Sfa-CBas_020_Ex1_L3_2.fq.gz
SfaCBas021_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_021_Ex1_L3_1.fq.gz modern/Sfa-CBas_021_Ex1_L3_2.fq.gz
SfaCBas023_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_023_Ex1_L3_1.fq.gz modern/Sfa-CBas_023_Ex1_L3_2.fq.gz
SfaCBas025_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_025_Ex1_L3_1.fq.gz modern/Sfa-CBas_025_Ex1_L3_2.fq.gz
SfaCBas026_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_026_Ex1_L3_1.fq.gz modern/Sfa-CBas_026_Ex1_L3_2.fq.gz
SfaCBas027_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_027_Ex1_L3_1.fq.gz modern/Sfa-CBas_027_Ex1_L3_2.fq.gz
SfaCBas028_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_028_Ex1_L3_1.fq.gz modern/Sfa-CBas_028_Ex1_L3_2.fq.gz
SfaCBas029_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_029_Ex1_L3_1.fq.gz modern/Sfa-CBas_029_Ex1_L3_2.fq.gz
SfaCBas030_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_030_Ex1_L3_1.fq.gz modern/Sfa-CBas_030_Ex1_L3_2.fq.gz
SfaCBas031_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_031_Ex1_L3_1.fq.gz modern/Sfa-CBas_031_Ex1_L3_2.fq.gz
SfaCBas032_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_032_Ex1_L3_1.fq.gz modern/Sfa-CBas_032_Ex1_L3_2.fq.gz
SfaCBas033_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_033_Ex1_L3_1.fq.gz modern/Sfa-CBas_033_Ex1_L3_2.fq.gz
SfaCBas036_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_036_Ex1_L3_1.fq.gz modern/Sfa-CBas_036_Ex1_L3_2.fq.gz
SfaCBas039_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_039_Ex1_L3_1.fq.gz modern/Sfa-CBas_039_Ex1_L3_2.fq.gz
SfaCBas041_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_041_Ex1_L3_1.fq.gz modern/Sfa-CBas_041_Ex1_L3_2.fq.gz
SfaCBas042_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_042_Ex1_L3_1.fq.gz modern/Sfa-CBas_042_Ex1_L3_2.fq.gz
SfaCBas043_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_043_Ex1_L3_1.fq.gz modern/Sfa-CBas_043_Ex1_L3_2.fq.gz
SfaCBas044_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_044_Ex1_L3_1.fq.gz modern/Sfa-CBas_044_Ex1_L3_2.fq.gz
SfaCBas046_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_046_Ex1_L3_1.fq.gz modern/Sfa-CBas_046_Ex1_L3_2.fq.gz
SfaCBas048_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_048_Ex1_L3_1.fq.gz modern/Sfa-CBas_048_Ex1_L3_2.fq.gz
SfaCBas056_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_056_Ex1_L3_1.fq.gz modern/Sfa-CBas_056_Ex1_L3_2.fq.gz
SfaCBas059_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_059_Ex1_L3_1.fq.gz modern/Sfa-CBas_059_Ex1_L3_2.fq.gz
SfaCBas061_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_061_Ex1_L3_1.fq.gz modern/Sfa-CBas_061_Ex1_L3_2.fq.gz
SfaCBas062_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_062_Ex1_L3_1.fq.gz modern/Sfa-CBas_062_Ex1_L3_2.fq.gz
SfaCBas066_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_066_Ex1_L3_1.fq.gz modern/Sfa-CBas_066_Ex1_L3_2.fq.gz
SfaCBas067_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_067_Ex1_L3_1.fq.gz modern/Sfa-CBas_067_Ex1_L3_2.fq.gz
SfaCBas073_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_073_Ex1_L3_1.fq.gz modern/Sfa-CBas_073_Ex1_L3_2.fq.gz
SfaCBas076_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_076_Ex1_L3_1.fq.gz modern/Sfa-CBas_076_Ex1_L3_2.fq.gz
SfaCBas078_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_078_Ex1_L3_1.fq.gz modern/Sfa-CBas_078_Ex1_L3_2.fq.gz
SfaCBas084_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_084_Ex1_L3_1.fq.gz modern/Sfa-CBas_084_Ex1_L3_2.fq.gz
SfaCBas086_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_086_Ex1_L3_1.fq.gz modern/Sfa-CBas_086_Ex1_L3_2.fq.gz
SfaCBas088_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_088_Ex1_L3_1.fq.gz modern/Sfa-CBas_088_Ex1_L3_2.fq.gz
SfaCBas090_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_090_Ex1_L3_1.fq.gz modern/Sfa-CBas_090_Ex1_L3_2.fq.gz
SfaCBas091_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_091_Ex1_L3_1.fq.gz modern/Sfa-CBas_091_Ex1_L3_2.fq.gz
SfaCBas092_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_092_Ex1_L3_1.fq.gz modern/Sfa-CBas_092_Ex1_L3_2.fq.gz
SfaCBas096_Ex1_L3 HK7K2DSX3:3 illumina modern/Sfa-CBas_096_Ex1_L3_1.fq.gz modern/Sfa-CBas_096_Ex1_L3_2.fq.gz
```

Edit config file.
Changes:
* line 23: ref_path: "reference/GCF_902148845.1_fSalaFa1.1_chr1-23_rename.fna"
* line 31: historical_samples: "config/Sfa_32_historical_samples.txt"
* line 32: modern_samples: "config/Sfa_49_modern_samples.txt"
* line 89: map_historical_to_mitogenomes: True
* line 97: species_mt_path: "/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/NC_004412.1_mtgenome.fasta"
* line 165: historical_bam_mapDamage: True
* line 173: historical_rescaled_samplenames: ["SfaABas001","SfaABas002","SfaABas003","SfaABas004","SfaABas005","SfaABas006","SfaABas007","SfaABas008","SfaABas009","SfaABas010","SfaABas013","SfaABas014","SfaABas016","SfaABas017","SfaABas018","SfaABas019","SfaABas020","SfaABas021","SfaABas022","SfaABas023","SfaABas024","SfaABas025","SfaABas026","SfaABas027","SfaABas028","SfaABas029","SfaABas030","SfaABas031","SfaABas032","SfaABas033","SfaABas034","SfaABas035"]
* line 486: gerp: True
* line 492: gerp_ref_path: "/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/gerp_outgroups"
* line 501: tree: "/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full/gerp_tree.nwk"

### Run

Copy and run the sbatch file.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_wahab/run_GenErode.sbatch /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full

sbatch run_GenErode.sbatch 
```


