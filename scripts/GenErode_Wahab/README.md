# Running GenErode on Wahab

[GenErode](https://github.com/NBISweden/GenErode/) is a pipeline for quantifying genetic erosion using temporal genomic samples.

It can estimate changes in genome-wide heterozygosity and deleterious variants as well as identify runs of homozygosity (inbreeding).

It can also do some auxiliary tasks that will be useful for PIRE such as estimate post-mortem damage (using MapDamage), identify contamination by mapping to a mitochondrial reference panel, and calculate GERP scores using a set of outgroup genomes and a dated phylogenetic tree.

A road map for using GenErode on Wahab is included below.

#### Script:
`run_GenErode.sbatch`

#### Input:
**Modern & Historical fq_raw Files**
`<Spp>_<Era><Site>_IndividualID*.fq.gz`

**20k Reference Genome**
`reference.denovoSSL.Spp20k.fasta`

**GERP Outgroups**
```
# dated phylogenetic tree
gerp_tree.nwk

# ~30 chromosome-level genomes of outgroup species e.g.
Echeneis_naucrates.fa.gz
Neostethus_bicornis.fa.gz
Cynoglossus_semilaevis.fa.gz
```

**Config Files**
```
config.yaml
modern_samples.txt
historical_samples.txt
```

#### Output (relevant to pipeline):
**Modern Output Directory**
`GenErode_Spp_20k/results/modern/mapping/reference.denovoSSL.Spp20k/`

**Modern Output Files**
`SppC<Site><IndID>.merged.rmdup.merged.realn.bam`

**Historical Output Directory**
`GenErode_Spp_20k/results/historical/mapping/reference.denovoSSL.Spp20k/`

**Historical Output Files**
`SppA<Site><IndID>.merged.rmdup.merged.realn.rescaled.bam`

**GERP Scores Output Directory**
`GenErode_Spp_20k/results/gerp`

**GERP Scores Output File**
`reference.denovoSSL.Abu20k.ancestral.rates.gz`


<details><summary>1. Set-Up</summary>

### 1. Set-up

The directory structure and the directory and file naming format is important.  

Make a copy of the template folder, renaming it according to your species code (Spp) and add "_20k", which is a reference to the 20k reference genome that will be used. 
```
cd /archive/carpenterlab/pire/pire_<Genus_species>_lcwgs/

cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/GenErode_templatedir /archive/carpenterlab/pire/pire_<Genus_species>_lcwgs/GenErode_<Spp>_20k
```

Make a README.md file to track your work within this directory. Make directories within this directory to hold your config file, historical, modern, and reference genome. If you are going to be calculating GERP scores or mapping to a mitochondrial reference panel make folders for those files too.

```
cd /archive/carpenterlab/pire/pire_<Genus_species>_lcwgs/GenErode_<Spp>_20k

mkdir config historical modern reference gerp_outgroups mitochondria
```

All sequencing data and reference genomes have to be within their respective subdirectdory in the main analysis directory. This includes SSL, test lanes, and LCWGS data. Count those files then copy them to the appropriate subdirectories. Don't include Undetermined\*.fq.gz files. Below is an example for *Lethrinus variegatus* from Pandanon (Pnd). Adjust accordingly.

#### Historical
```
# 1st run
ls /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/1st_sequencing_run/fq_raw/Lva-APnd*.fq.gz | wc -l
94

rsync -a /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/1st_sequencing_run/fq_raw/Lva-APnd*.fq.gz /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/historical &

# 2nd run
ls /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/2nd_sequencing_run/fq_raw/Lva-APnd*.fq.gz | wc -l
94

rsync -avh /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/2nd_sequencing_run/fq_raw/Lva-APnd*.fq.gz /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/historical

# 3rd run
ls /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/3rd_sequencing_run/fq_raw/Lva-APnd*.fq.gz | wc -l
94

rsync -avh /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/3rd_sequencing_run/fq_raw/Lva-APnd*.fq.gz /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/historical

#confirm all files were transferred
ls /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/historical/Lva-APnd*.fq.gz | wc -l
282
```

#### Modern
```
# SSL
ls /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_ssl_data_processing/lethrinus_variegatus/fq_raw_shotgun/Lva-CPnd*fq.gz | wc -l
6

rsync -avh /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_ssl_data_processing/lethrinus_variegatus/fq_raw_shotgun/ /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/modern

# 1st run
ls /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/1st_sequencing_run/fq_raw/Lva-CPnd*.fq.gz | wc -l
96

rsync -a /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/1st_sequencing_run/fq_raw/Lva-CPnd*.fq.gz /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/modern &

# 2nd run
ls /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/2nd_sequencing_run/fq_raw/Lva-CPnd*.fq.gz | wc -l
96

rsync -avh /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/2nd_sequencing_run/fq_raw/Lva-CPnd*.fq.gz /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/modern

# 3rd run
ls /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/3rd_sequencing_run/fq_raw/Lva-CPnd*.fq.gz | wc -l
96

rsync -avh /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/3rd_sequencing_run/fq_raw/Lva-CPnd*.fq.gz /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/modern

#confirm all files were transferred
ls /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/modern/Lva-CPnd*.fq.gz | wc -l
294
```

#### Reference

Use the 20k version (scaffolds > 20kbp) of the best reference genome that was used for probe development and mkBAM. 

If there is no 20k reference genome, create it. First copy the best reference genome (e.g. `scaffolds.fasta`) to the `GenErode_Spp_20k/reference` directory.

Create 20k reference genome: `reference.denovoSSL.Spp20k.fasta`
```
cd /archive/carpenterlab/pire/pire_genus_species_lcwgs/GenErode_Spp_20k/reference

perl /home/e1garcia/shotgun_PIRE/REUs/2022_REU/PSMC/scripts/removesmalls.pl 20000 scaffolds.fasta > reference.denovoSSL.Spp20k.fasta
```

</details>


#### GERP Outgroups

Copy gerp scripts to the species' gerp_outgroups directory.
```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/gerp_outgroups/*.sh /archive/carpenterlab/pire/pire_genus_species_lcwgs/GenErode_Spp_20k/gerp_outgroups/
```

Identify the ~30 closest relatives of your species with chromosome-level genomes. These species' genomes will be your gerp_outgroups. Start by checking the closest relatives of your species in the [Phylogenetic classification of bony fishes](https://github.com/philippinespire/pire_ssl_data_processing/blob/main/scripts/Betancur2017_families.pdf) by Betancur et al (2017). You can check the `GenErode_Spp_20k/gerp_outgroups/` directories of other species to see if the genomes of your outgroup species have already been downloaded and renamed. If there aren't enough relevant genomes already on the HPC, then you'll have to download them from [Genbank](https://www.ncbi.nlm.nih.gov/datasets/genome/). Start by searching for the genus, family, then order of your species. Make sure they are chromosome-level genomes. 

<details><summary>downloaded outgroup genomes</summary>

```
# incertae sedis between Istiophoriformes and Carangiformes
/archive/carpenterlab/pire/pire_sphyraena_obtusata_lcwgs/GenErode_Sob_20k/gerp_outgroups

# incertae sedis between Atheriniformes and Mugiliformes
/archive/carpenterlab/pire/pire_ambassis_buruensis_lcwgs/GenErode_Abu_20k/gerp_outgroups

# Spariformes
/archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/gerp_outgroups

# Syngnathiformes
/archive/carpenterlab/pire/pire_corythoichthys_haematopterus_lcwgs/GenErode_Cha_20k/gerp_outgroups
```

</p>
</details> 

Create a .txt file with a list of the scientific names of your species and its ~30 closest relatives with chromosome-level genomes from Genbank. This will be used to create a dated phylogenetic tree (`gerp_tree.nwk`). 

All scientific names need an underscore between genus and species (Genus_species). Put your species of interest at the top. Then put the rest below in alphabetical order. 

<details><summary>speciesnames.txt</summary>

```
Ambassis_buruensis
Acanthochromis_polyacanthus
Amphilophus_citrinellus
Amphiprion_ocellaris
Amphiprion_percula
Astatotilapia_calliptera
Blennius_ocellaris
Chelon_labrosus
Cololabis_saira
Dascyllus_trimaculatus
Fundulus_heteroclitus
Gambusia_affinis
Gouania_willdenowi
Kryptolebias_marmoratus
Lipophrys_pholis
Maylandia_zebra
Melanotaenia_boesemani
Mugil_cephalus
Nematolebias_whitei
Neolamprologus_multifasciatus
Neostethus_bicornis
Odontesthes_bonariensis
Oreochromis_aureus
Oreochromis_niloticus
Oryzias_curvinotus
Oryzias_latipes
Oryzias_melastigma
Parachromis_managuensis
Parambassis_ranga
Petenia_splendida
Poecilia_reticulata
Salarias_fasciatus
Telmatherina_bonti
Xiphophorus_maculatus
```

</p>
</details> 

Create the file `filenames.txt` with the URLs of each of the genomes of these species from NCBI. They should be in the same order as the species in `speciesnames.txt`, excluding the first line, which contains the name of your species. All URLs should end in \*genomic.fna.gz. These files can be used to download all of the genomes at once using wget.

<details><summary>filenames.txt</summary>

```
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/021/347/895/GCF_021347895.1_KAUST_Apoly_ChrSc/GCF_021347895.1_KAUST_Apoly_ChrSc_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/013/435/755/GCA_013435755.1_ASM1343575v1/GCA_013435755.1_ASM1343575v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/022/539/595/GCF_022539595.1_ASM2253959v1/GCF_022539595.1_ASM2253959v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/022/539/595/GCF_022539595.1_ASM2253959v1/GCF_022539595.1_ASM2253959v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/900/246/225/GCF_900246225.1_fAstCal1.2/GCF_900246225.1_fAstCal1.2_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/963/422/515/GCA_963422515.1_fBleOce1.1/GCA_963422515.1_fBleOce1.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/963/514/085/GCA_963514085.1_fCheLab1.1/GCA_963514085.1_fCheLab1.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/033/807/715/GCF_033807715.1_fColSai1.1/GCF_033807715.1_fColSai1.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/024/666/655/GCA_024666655.1_DTR_v1.0/GCA_024666655.1_DTR_v1.0_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/011/125/445/GCF_011125445.2_MU-UCD_Fhet_4.1/GCF_011125445.2_MU-UCD_Fhet_4.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/019/740/435/GCF_019740435.1_SWU_Gaff_1.0/GCF_019740435.1_SWU_Gaff_1.0_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/900/634/775/GCF_900634775.1_fGouWil2.1/GCF_900634775.1_fGouWil2.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/001/649/575/GCF_001649575.2_ASM164957v2/GCF_001649575.2_ASM164957v2_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/963/383/615/GCA_963383615.1_fLipPho2.1/GCA_963383615.1_fLipPho2.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/238/955/GCF_000238955.4_M_zebra_UMD2a/GCF_000238955.4_M_zebra_UMD2a_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/017/639/745/GCF_017639745.1_fMelBoe1.pri/GCF_017639745.1_fMelBoe1.pri_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/022/458/985/GCF_022458985.1_CIBA_Mcephalus_1.1/GCF_022458985.1_CIBA_Mcephalus_1.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/014/905/685/GCF_014905685.2_NemWhi1/GCF_014905685.2_NemWhi1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/963/576/455/GCA_963576455.2_fNeoMul1.2/GCA_963576455.2_fNeoMul1.2_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/902/685/375/GCA_902685375.1_fNeoBic2.1/GCA_902685375.1_fNeoBic2.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/902/685/375/GCA_902685375.1_fNeoBic2.1/GCA_902685375.1_fNeoBic2.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/942/865/GCA_027942865.1_fOdoBon6.hap1/GCA_027942865.1_fOdoBon6.hap1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/942/865/GCA_027942865.1_fOdoBon6.hap1/GCA_027942865.1_fOdoBon6.hap1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/013/358/895/GCF_013358895.1_ZZ_aureus/GCF_013358895.1_ZZ_aureus_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/001/858/045/GCF_001858045.2_O_niloticus_UMD_NMBU/GCF_001858045.2_O_niloticus_UMD_NMBU_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/023/969/325/GCA_023969325.1_ASM2396932v1/GCA_023969325.1_ASM2396932v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/234/675/GCF_002234675.1_ASM223467v1/GCF_002234675.1_ASM223467v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/922/805/GCF_002922805.2_ASM292280v2/GCF_002922805.2_ASM292280v2_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/040/437/545/GCA_040437545.1_ASM4043754v1/GCA_040437545.1_ASM4043754v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/900/634/625/GCF_900634625.1_fParRan2.1/GCF_900634625.1_fParRan2.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/040/437/555/GCA_040437555.1_P_splendida_v1.0/GCA_040437555.1_P_splendida_v1.0_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/633/615/GCF_000633615.1_Guppy_female_1.0_MT/GCF_000633615.1_Guppy_female_1.0_MT_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/902/148/845/GCF_902148845.1_fSalaFa1.1/GCF_902148845.1_fSalaFa1.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/933/228/915/GCA_933228915.1_fTelBon1.1/GCA_933228915.1_fTelBon1.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/775/205/GCF_002775205.1_X_maculatus-5.0-male/GCF_002775205.1_X_maculatus-5.0-male_genomic.fna.gz
```

</p>
</details>

Use the script `download_genomes.sh` to download all of the genomes of your species' closest relatives from `filenames.txt`.

<details><summary>download_genomes.sh</summary>

```
#!/bin/bash

# Check if filenames.txt file exists
if [[ ! -f filenames.txt ]]; then
  echo "Error: filenames.txt file not found!"
  exit 1
fi

# Read each line from the filenames.txt file and use wget to download
while IFS= read -r url; do
  # Trim whitespace and any trailing characters
  trimmed_url=$(echo "$url" | tr -d '\r' | xargs)

  echo "Downloading $trimmed_url ..."

  # Check if the URL is not empty before downloading
  if [[ -n "$trimmed_url" ]]; then
    wget "$trimmed_url"
  else
    echo "Skipping empty URL."
  fi
done < filenames.txt

echo "Download completed."
```

</p>
</details>

Download genomes.
```
bash download_genomes.sh
```

Use the script `check_genomes.sh` to confirm that all of the genomes of your species' closest relatives from `filenames.txt` have been successfully downloaded.

<details><summary>check_genomes.sh</summary>

```
#!/bin/bash

# File containing the list of URLs
FILENAME_LIST="filenames.txt"

# Check if the file exists
if [[ ! -f "$FILENAME_LIST" ]]; then
  echo "Error: $FILENAME_LIST not found!"
  exit 1
fi

# Initialize counters
total_files=0
missing_files=0

# Read each URL from filenames.txt
while IFS= read -r url; do
  # Extract the filename from the URL (everything after the last '/')
  filename=$(basename "$url")

  # Trim any leading or trailing whitespace, newline, or carriage return characters
  filename=$(echo "$filename" | tr -d '\r' | xargs)

  # Increment the total files counter
  total_files=$((total_files + 1))

  # Check if the file exists in the current directory
  if [[ -f "$filename" ]]; then
    echo "Found: $filename"
  else
    echo "Missing: $filename"
    missing_files=$((missing_files + 1))
  fi
done < "$FILENAME_LIST"

# Summary
echo "Total files listed: $total_files"
echo "Missing files: $missing_files"
```

</p>
</details>

```
bash check_genomes.sh
```
Total files listed: $total_files
Missing files: $missing_files

The file names of the downloaded genomes will be all of the text after the last forward slash (/) in the URLs. The file names of the downloaded genomes need to be changed to `Genus_species.fa.gz`. This can be done one at a time with a simple `mv` command. Alternatively you can edit the script `rename_genomes.sh` to do it all at once. You can edit this script with the information from your files `speciesnames.txt` and `filenames.txt`. If you have kept the species' names and their URLs in the same order, excluding the first line in `speciesnames.txt` that has your Genus_species, this should be a simple copy and paste. Then just add `mv` before the genome file names and `.fa.gz` at the end of each Genus_species.  

<details><summary>rename_genomes.sh</summary>

```
#! /bin/bash

# this script needs to be edited with information from your species!
# this script renames files
# ~30 closest relatives of your species with chromosome-level genomes from Genbank.
# it renames the genome file names of the ~30 closest relatives of your species that you downloaded from GenBank that end in *genomic.fna.gz
# it renames these files to Genus_species.fa.gz
# use the information from your files speciesnames.txt and filenames.txt to edit this file

# example:

# mv GCF_021347895.1_KAUST_Apoly_ChrSc_genomic.fna.gz Acanthochromis_polyacanthus.fa.gz
# mv GCA_013435755.1_ASM1343575v1_genomic.fna.gz Amphilophus_citrinellus.fa.gz
```

</p>
</details>

Rename files.
```
bash rename_genomes.sh
```

<details><summary>2. Get Newick tree</summary>

### 2. Get Newick tree

Create a dated phylogenetic tree. 

Upload `speciesnames.txt` to [TimeTree of Life](https://timetree.org/) using the `Choose File` button at the bottom under **Load a List of Species**. The file `speciesnames.txt`  includes all of the gerp_outgroup species. Download the .nwk and .jpg files that TimeTree creates. Upload those to the `GenErode_Spp_20k/gerp_outgroup` directory. Rename the file from `speciesnames.nwk` to `gerp_tree.nwk`.
```
mv speciesnames.nwk gerp_tree.nwk
```
Replace your Genus_species in `gerp_tree.nwk` with the name of the reference genome, which should be `reference.denovoSSL.Spp20k.fasta`: 
```
sed -i 's/Genus_species/reference.denovoSSL.Spp20k.fasta/g' gerp_tree.nwk
```

</details>

<details><summary>3. Edit config files</summary>

### 3. Edit config files

Copy config scripts to your species' config directory.
```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/config/config* /archive/carpenterlab/pire/pire_genus_species_lcwgs/GenErode_Spp_20k/config/
```
GenErode uses `config.yaml` to run. It also requires you to make two config files: `modern_samples.txt` and `historical_samples.txt`. These config files are specific to your data. In these config files, each unique sample gets its own line with its unique forward and reverse read files. The R1_fastq_file and R2_fastq_file in the header of these config files correspond to the \*.1.fq.gz and \*.2.fq.gz files that are preceded by a unique sample name.

Each config file has the same header: 
```
samplename_index_lane readgroup_id readgroup_platform path_to_R1_fastq_file path_to_R2_fastq_file
```
Example `modern_samples.txt` with 1 sample. 
```
samplename_index_lane readgroup_id readgroup_platform path_to_R1_fastq_file path_to_R2_fastq_file
LvaCPnd001_Ex11A_L2 HJCYVCCX2:2 illumina modern/Lva-CPnd_001-Ex1-1A-lcwgs-2-1.1.fq.gz modern/Lva-CPnd_001-Ex1-1A-lcwgs-2-1.2.fq.gz
```

samplename: LvaCPnd001

<Spp><Era><Site><IndividualID>

index: Ex11A

<ExtractionID><WellID>

lane: L2

LaneID is not always present in the new file name (\*.fq.gz), but it can be extracted from the old file name in the fq_raw directories for each run, including SSL. This can be done using the `config_generode_old_new_lane.sh` script.

readgroup_id: HJCYVCCX2:2

Readgroup_ID is located in the first line of each \*.fq.gz file. Each unique sample should have the same readgroup_id in the first line of its \*.1.fq.gz and \*.2.fq.gz files. The readgroup_id is the text between the 3rd and 5th colon (:). 

example: `@E00558:814:HJCYVCCX2:2:1101:8410:1502 1:N:0:ACGTTACC+GAGNTACG`

readgroup_platform: illumina

path_to_R1_fastq_file: modern/Lva-CPnd_001-Ex1-1A-lcwgs-2-1.1.fq.gz

path_to_R2_fastq_file:modern/Lva-CPnd_001-Ex1-1A-lcwgs-2-1.2.fq.gz

Use relative paths. 

These config files can be manually (painstakingly) created for each species...or you can use the directions below to create these config files using the config scripts.

<details><summary>Creating config files</summary>

#### Creating config files

The script `config_generode_old_new_lane.sh` will be used to create the file `old_new_lane_GenErode_Spp_config.log`. This will be used as an input for the scripts `config_modern_samples.sh` and `config_historical_samples.sh`, which will create the files `modern_samples.txt` and `historical_samples.txt`, respectively. Each script should be run in the config directory. Each scripts need to be edited for the user-defined variables: `species` and `Spp`. These scripts require the input file `old_new_lane_GenErode__config.log`, which is created from the bash script `generode_config_old_new_lane.sh`.

1. Identify all `old_new_config.log` files

The `config_generode_old_new_lane.sh` script requires the `old_new_config.log` files from each fq_raw directory that will be used in GenErode.
```
cd /archive/carpenterlab/pire/pire_genus_species_lcwgs/GenErode_Spp_20k/config

# 1st run
ls ../../1st_sequencing_run/fq_raw/old_new_filenames.log

# 2nd run
ls ../../2nd_sequencing_run/fq_raw/old_new_filenames.log

# 3rd run # you may only have 2 runs
ls ../../3rd_sequencing_run/fq_raw/old_new_filenames.log

# SSL. This might be in a different location and it might not have been created. e.g.
ls /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_ssl_data_processing/lethrinus_variegatus/fq_raw_shotgun/old_new_config.log
```

The SSL files will likely be in 1 of these 3 locations. Check these locations for `old_new_config.log`: 
```
ls /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_ssl_data_processing/
ls /archive/carpenterlab/pire/pire_ssl_data_processing/
ls /home/e1garcia/shotgun_PIRE/pire_ssl_data_processing/
```

However sometimes they don't have the file `old_new_config.log`. If this is not present, this can be manually created. e.g.
```
# SSL files
ls /home/e1garcia/shotgun_PIRE/pire_ssl_data_processing/lethrinus_variegatus/fq_raw_shotgun/*.fq.gz
Lva-CPnd_006A_L3_1.fq.gz
Lva-CPnd_006A_L3_2.fq.gz
Lva-CPnd_006G_L3_1.fq.gz
Lva-CPnd_006G_L3_2.fq.gz
Lva-CPnd_006H_L3_1.fq.gz
Lva-CPnd_006H_L3_2.fq.gz

# newFileNames.txt
cat /home/e1garcia/shotgun_PIRE/pire_ssl_data_processing/lethrinus_variegatus/fq_raw_shotgun/newFileNames.txt
Lva-CPnd_006A_L3_
Lva-CPnd_006G_L3_
Lva-CPnd_006H_L3_

# origFileNames.txt
cat /home/e1garcia/shotgun_PIRE/pire_ssl_data_processing/lethrinus_variegatus/fq_raw_shotgun/origFileNames.txt
LvaC00610A_CKDL220006132-1a-AK6260-7UDI214_HK52YDSX3_L3_
LvaC0069G_CKDL220006132-1a-AK6881-GC12_HK52YDSX3_L3_
LvaC0069H_CKDL220006132-1a-AK6881-7UDI246_HK52YDSX3_L3_

nano /home/e1garcia/shotgun_PIRE/pire_ssl_data_processing/lethrinus_variegatus/fq_raw_shotgun/old_new_config.log

LvaC00610A_CKDL220006132-1a-AK6260-7UDI214_HK52YDSX3_L3_1.fq.gz Lva-CPnd_006A_L3_1.fq.gz
LvaC0069G_CKDL220006132-1a-AK6881-GC12_HK52YDSX3_L3_1.fq.gz     Lva-CPnd_006G_L3_1.fq.gz
LvaC0069H_CKDL220006132-1a-AK6881-7UDI246_HK52YDSX3_L3_1.fq.gz  Lva-CPnd_006H_L3_1.fq.gz
LvaC00610A_CKDL220006132-1a-AK6260-7UDI214_HK52YDSX3_L3_2.fq.gz Lva-CPnd_006A_L3_2.fq.gz
LvaC0069G_CKDL220006132-1a-AK6881-GC12_HK52YDSX3_L3_2.fq.gz     Lva-CPnd_006G_L3_2.fq.gz
LvaC0069H_CKDL220006132-1a-AK6881-7UDI246_HK52YDSX3_L3_2.fq.gz  Lva-CPnd_006H_L3_2.fq.gz
```

2. Run `config_generode_old_new_lane.sh`

Once all of the `old_new_config.log` files have been identified, edit user-defined variables in the script `config_generode_old_new_lane.sh`. 
```
# User-defined variables for species and species code (Spp).
# For species use lowercase and an underscore so the directory path can be identified (e.g. lethrinus_variegatus)
species="lethrinus_variegatus"
# For Spp, this is the three letter species code. Capitalize the first letter.
Spp="Lva"

# Define the lcwgs & ssl directory path using the species variable. Edit if necessary. Check SSL. 
lcwgs_path=$"/archive/carpenterlab/pire/pire_${species}_lcwgs"
ssl_path=$"/home/e1garcia/shotgun_PIRE/pire_ssl_data_processing/${species}"

# Define the input files. Edit if necessary. Check SSL.
file1="${lcwgs_path}/1st_sequencing_run/fq_raw/old_new_filenames.log"
file2="${lcwgs_path}/2nd_sequencing_run/fq_raw/old_new_filenames.log"
file3="${lcwgs_path}/3rd_sequencing_run/fq_raw/old_new_filenames.log"
file4="${ssl_path}/fq_raw_shotgun/old_new_filenames.log"
```

Run `config_generode_old_new_lane.sh` to create `old_new_lane_GenErode_Spp_config.log`. The file `old_new_lane_GenErode_Spp_config.log` does not have a header, but the columns are `origFileName newFileName lane`.
```
cd /archive/carpenterlab/pire/pire_genus_species_lcwgs/GenErode_Ssp_20k/config

bash generode_config_old_new_lane.sh
```
The output will tell you which `old_new_config.log` files were used to create `old_new_lane_GenErode_Spp_config.log`, which will be used by `config_historical_samples.sh` and `config_modern_samples.sh`. 

#### Historical
run `config_historical_samples.sh`
```
bash config_historical_samples.sh
```
Output
```
Historical samples processing completed. Output saved to historical_samples.txt
All 141 1.fq.gz and 141 2.fq.gz files were incorporated into historical_samples.txt
```

#### Modern
run `config_modern_samples.sh`
```
bash config_modern_samples.sh
```



#### Edit the config files

Template config files are located in `home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/config`.

Currently these are the files used to conduct the white rhino reference test run.

Edit the config.yaml files to reflect the analyses you want to conduct in GenErode.

Edit the `*historical_samples.txt` and `*modern_samples.txt` files to reflect your sample information.

</details>

<details><summary>4. Run GenErode</summary>

### 4. Run GenErode

#### Run the pipeline

Copy `home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/run_GenErode.sbatch` to your analysis folder.
```
cd 

cp home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/run_GenErode.sbatch . 
```

Move to this folder and run with `sbatch run_GenErode.sbatch`.

If it is locked then unlock it with:


</details>

<details><summary>5. Check results</summary>

### 5. Check results


</details>
