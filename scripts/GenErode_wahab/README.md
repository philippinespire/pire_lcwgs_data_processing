# Running GenErode on Wahab

[GenErode](https://github.com/NBISweden/GenErode/) is a pipeline for quantifying genetic erosion using temporal genomic samples.

It can estimate changes in genome-wide heterozygosity and deleterious variants as well as identify runs of homozygosity (inbreeding).

It can also do some auxiliary tasks that will be useful for PIRE such as estimate post-mortem damage (using MapDamage), identify contamination by mapping to a mitochondrial reference panel, and calculate GERP scores using a set of outgroup genomes and a dated phylogenetic tree.

A road map for using GenErode on Wahab is included below.

**GERP scores** analysis was traditionally performed to rescale bases with ATLAS. This is no longer the default. Rescaling is now done with MapDamage, which is also included in the GenErode pipeline (2025). Running GERP is therefore **optional**.

<details><summary>Summary</summary>

### Summary

#### Script:
`run_GenErode.sbatch`
`run_GenErode_unlock.sbatch`

#### Input:

**Modern & Historical raw \*.fq.gz files**

`<Spp>_<Era><Site>_<Ind>*.fq.gz`

**20k Reference Genome**

`reference.denovoSSL.<Spp>20k.fasta` 

or 

`reference.genbank.Spp20k.fasta`

**GERP Outgroups (Optional)**
```
# dated phylogenetic tree
gerp_tree.nwk

# ~30 chromosome-level genomes of outgroup species. e.g.
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

`GenErode_Spp_20k/results/modern/mapping/reference.denovoSSL.<Spp>20k/`

**Modern Output Files**

`<Spp>C<Site><Ind>.merged.rmdup.merged.realn.bam`

**Historical Output Directory**

`GenErode_Spp_20k/results/historical/mapping/reference.denovoSSL.<Spp>20k/`

**Historical Output Files**

`<Spp>A<Site><Ind>.merged.rmdup.merged.realn.rescaled.bam`

**GERP Scores Output Directory**

`GenErode_Spp_20k/results/gerp`

**GERP Scores Output File**

`reference.denovoSSL.<Spp>20k.ancestral.rates.gz`

</details>

<details><summary>1. Set-Up</summary>

### 1. Set-up

The directory structure and file naming format are important.  

Create the GenErode directory structure. Create the GenErode directory according to your species code (Spp) and add "_20k", which is a reference to the 20k reference genome that will be used. Make subdirectories within this GenErode directory to hold the config files, historical \*.fq.gz files, modern \*.fq.gz files, and reference genome. If you are going to be calculating GERP scores or mapping to a mitochondrial reference panel make folders for those files too.
```
cd /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/

mkdir GenErode_<Spp>_20k

cd /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k

mkdir config historical modern reference gerp_outgroups mitochondria
```

Copy the contents of the template folder to your GenErode directory.
```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_wahab/GenErode_templatedir/ /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k
```

Copy the GenErode scripts `run_GenErode.sbatch` and `run_GenErode_unlock.sbatch` to your analysis directory (GenErode_Spp_20k).
```
cp home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_wahab/run_GenErode*.sbatch /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/ 
```

All sequencing data and reference genomes have to be within their respective subdirectdory in the main analysis directory. This includes lcWGS data, and if applicable SSL data. Count those files then copy them to the appropriate subdirectories. Don't include Undetermined\*.fq.gz files. Consider running this independently for each different site/population of the same species. Below is an example for *Lethrinus variegatus* from Pandanon (Pnd). Adjust accordingly.

#### Historical
```
# 1st run
ls /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/1st_sequencing_run/fq_raw/Lva-APnd*.fq.gz | wc -l
94

rsync -a /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/1st_sequencing_run/fq_raw/Lva-APnd*.fq.gz /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/historical &

# 2nd run
ls /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/2nd_sequencing_run/fq_raw/Lva-APnd*.fq.gz | wc -l
94

rsync -a /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/2nd_sequencing_run/fq_raw/Lva-APnd*.fq.gz /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/historical &

#confirm all files were transferred
ls /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/historical/Lva-APnd*.fq.gz | wc -l
188
```

#### Modern
```
# SSL
ls /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_ssl_data_processing/lethrinus_variegatus/fq_raw_shotgun/Lva-CPnd*fq.gz | wc -l
6

rsync -a /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_ssl_data_processing/lethrinus_variegatus/fq_raw_shotgun/ /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/modern &

# 1st run
ls /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/1st_sequencing_run/fq_raw/Lva-CPnd*.fq.gz | wc -l
96

rsync -a /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/1st_sequencing_run/fq_raw/Lva-CPnd*.fq.gz /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/modern &

# 2nd run
ls /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/2nd_sequencing_run/fq_raw/Lva-CPnd*.fq.gz | wc -l
96

rsync -a /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/2nd_sequencing_run/fq_raw/Lva-CPnd*.fq.gz /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/modern &

#confirm all files were transferred
ls /archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/modern/Lva-CPnd*.fq.gz | wc -l
198
```

#### Reference

Use the 20k version (scaffolds > 20kbp) of the best reference genome that was used for probe development and mapping (mkBAM_ddocent). However, if probe development and mapping used different reference genomes, then use the reference genome that was used for mapping, unless the reference genome that was used for probe design is significantly better. You should confirm the statistics of the genomes used for probe development and mapping on your species' [SSL page](https://github.com/philippinespire/pire_ssl_data_processing). The best assembly is determined by the following metrics: 1. BUSCO; 2. N50; 3. Genome size completeness; 4. L50; 5. Largest contig.

If there is no 20k reference genome, create it. First copy the best reference genome (e.g. `scaffolds.fasta`) to the `GenErode_Spp_20k/reference` directory.

Create 20k reference genome: `reference.denovoSSL.<Spp>20k.fasta`
```
cd /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/reference

perl /home/e1garcia/shotgun_PIRE/REUs/2022_REU/PSMC/scripts/removesmalls.pl 20000 scaffolds.fasta > reference.denovoSSL.<Spp>20k.fasta
```

#### GERP Outgroups (Optional)

Copy gerp scripts to the species' gerp_outgroups directory.
```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_wahab/gerp_outgroups/*.sh /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/gerp_outgroups/
```

Identify the ~30 closest relatives of your species with chromosome-level genomes. These species' genomes need to be in your gerp_outgroups directory. Use the [Phylogenetic classification of bony fishes (Betancur et al 2017)](https://github.com/philippinespire/pire_ssl_data_processing/blob/main/scripts/Betancur2017_families.pdf) to identify your species' Family and Order and its closest relatives. You can check the `GenErode_Spp_20k/gerp_outgroups/` directories of other species to see if the genomes of your species' outgroups have already been downloaded and renamed. If there aren't enough relevant genomes already on the HPC, then you'll have to download them from [Genbank](https://www.ncbi.nlm.nih.gov/datasets/genome/). Start by searching for the genus, family, then order of your species. Make sure they are chromosome-level genomes. 

<details><summary>available outgroup genomes</summary>

```
# Ambassis buruensis: Family - Ambassidae, Order - Incertae Sedis between Atheriniformes and Mugiliformes (33)
/archive/carpenterlab/pire/pire_ambassis_buruensis_lcwgs/GenErode_Abu_20k/gerp_outgroups

# Chromis viridis: Family - Pomacentridae, Order - Incertae Sedis between Atheriniformes and Mugiliformes (30)
/archive/carpenterlab/pire/pire_chromis_viridis_lcwgs/2nd_sequencing_run/GenErode/gerp_outgroups

# Corythoichthys haematopterus: Family - Syngnathidae, Order - Syngnathiformes (33)
/archive/carpenterlab/pire/pire_corythoichthys_haematopterus_lcwgs/GenErode_Cha_20k/gerp_outgroups

# Dascyllus aruanus: Family - Pomacentridae, Order - Incertae Sedis between Atheriniformes and Mugiliformes (30)
/archive/carpenterlab/pire/pire_dascyllus_aruanus_lcwgs/2nd_sequencing_run/GenErode/gerp_outgroups

# Gerres oyena: Family - Gerreidae, Order Gerreiformes (34)
/archive/carpenterlab/pire/pire_gerres_oyena_lcwgs/1st_sequencing_run/GenErode_Goy_20k/gerp_outgroups

# Hypoatherina temminckii: Family - Atherinidae, Order - Atheriniformes (32)
/archive/carpenterlab/pire/pire_hypoatherina_temminckii_lcwgs/GenErode_Hte_20k/gerp_outgroups

# Lethrinus variegatus: Family - Lethrinidae, Order - Spariformes (31)
/archive/carpenterlab/pire/pire_lethrinus_variegatus_lcwgs/GenErode_Lva_20k/gerp_outgroups 

# Ostorhinchus chrysopomus: Family - Apogonidae, Order - Kurtiformes (32)
/archive/carpenterlab/pire/pire_ostorhinchus_chrysopomus_lcwgs/GenErode_Och/gerp_outgroups

# Parupeneus barberinus: Family - Mullidae, Order - Syngnathiformes (31)
/archive/carpenterlab/pire/pire_parupeneus_barberinus_lcwgs/GenErode_Pbb/gerp_outgroups

# Pseudanthias squamipinnis: Family - Serranidae/Anthiadidae, Order - Perciformes (27)
/archive/carpenterlab/pire/pire_pseudanthias_squamipinnis_lcwgs/2nd_sequencing_run/GenErode/gerp_outgroups

# Sphaeramia nematoptera: Family - Apogonidae, Order - Kurtiformes (27)
/archive/carpenterlab/pire/pire_sphaeramia_nematoptera_lcwgs/3rd_sequencing_run/GenErode/gerp_outgroups

# Sphaeramia orbicularis: Family - Apogonidae, Order - Kurtiformes (31)
/archive/carpenterlab/pire/pire_sphaeramia_orbicularis_lcwgs/GenErode_Sor_20k/gerp_outgroups

# Sphyraena obtusata: Family - Sphyraenidae, Order - Incertae Sedis between Istiophoriformes and Carangiformes (35)
/archive/carpenterlab/pire/pire_sphyraena_obtusata_lcwgs/GenErode_Sob_20k/gerp_outgroups

# Stethojulis interrupta: Family - Labridae, Order - Labriformes (37)
/archive/carpenterlab/pire/pire_stethojulis_interrupta_lcwgs/1st_sequencing_run/GenErode_Sin_20k/gerp_outgroups

# Taeniamia zosterophora: Family - Apogonidae, Order - Kurtiformes (31)
/archive/carpenterlab/pire/pire_taeniamia_zosterophora_lcwgs/2nd_sequencing_run/GenErode_20k_2runs_2/gerp_outgroups

# Zenarchopterus dispar: Family - Zenarchopteridae, Order - Beloniformes (31)
/archive/carpenterlab/pire/pire_zenarchopterus_dispar_lcwgs/GenErode_Zdi_4/gerp_outgroups
```

</p>
</details> 

Create a .txt file with a list of the scientific names of your species and its ~30 closest relatives with chromosome-level genomes from Genbank. This will be used to create a dated phylogenetic tree (`gerp_tree.nwk`). 

All scientific names need an underscore between genus and species (Genus_species). Put your species of interest at the top. Then put the rest below in alphabetical order. 

<details><summary>speciesnames.txt</summary>

```
Lethrinus_variegatus
Acanthopagrus_latus
Ammodytes_dubius
Ammodytes_marinus
Antennarius_maculatus
Antennarius_striatus
Chaetodon_trifascialis
Cheilinus_undulatus
Chelmon_rostratus
Diplodus_puntazzo
Hyperoplus_immaculatus
Hyperoplus_lanceolatus
Karalla_daura
Labroides_dimidiatus
Labrus_bergylta
Labrus_mixtus
Lagodon_rhomboides
Lateolabrax_maculatus
Lutjanus_erythropterus
Notolabrus_celidotus
Pagrus_major
Pao_palembangensis
Rhomboplites_aurorubens
Scatophagus_argus
Sparus_aurata
Symphodus_melops
Takifugu_bimaculatus
Takifugu_rubripes
Tautogolabrus_adspersus
Thamnaconus_septentrionalis
```

</p>
</details> 

Create the file `filenames.txt` with the URLs of each of the genomes of these species from NCBI. They should be in the same order as the species in `speciesnames.txt`, excluding the first line, which contains the name of your species. All URLs should end in \*genomic.fna.gz. These files can be used to download all of the genomes at once using wget.

<details><summary>filenames.txt</summary>

```
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/904/848/185/GCF_904848185.1_fAcaLat1.1/GCF_904848185.1_fAcaLat1.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/026/122/265/GCA_026122265.1_UConn_ADub_2022/GCA_026122265.1_UConn_ADub_2022_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/949/987/685/GCA_949987685.1_fAmmMar1.1/GCA_949987685.1_fAmmMar1.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/013/358/685/GCA_013358685.1_fAntMac1.pri/GCA_013358685.1_fAntMac1.pri_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/040/054/535/GCA_040054535.1_ASM4005453v1/GCA_040054535.1_ASM4005453v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/039/877/785/GCA_039877785.1_fChaTrf1.hap1/GCA_039877785.1_fChaTrf1.hap1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/018/320/785/GCF_018320785.1_ASM1832078v1/GCF_018320785.1_ASM1832078v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/017/976/325/GCF_017976325.1_fCheRos1.pri/GCF_017976325.1_fCheRos1.pri_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/963/678/695/GCA_963678695.2_Dpuntazzo_v2/GCA_963678695.2_Dpuntazzo_v2_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/949/357/725/GCA_949357725.1_fHypImm3.1/GCA_949357725.1_fHypImm3.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/026/929/865/GCA_026929865.2_TBG_H_lanceolatus_asm_v1.1/GCA_026929865.2_TBG_H_lanceolatus_asm_v1.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/029/224/185/GCA_029224185.1_ASM2922418v1/GCA_029224185.1_ASM2922418v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/030/710/495/GCA_030710495.1_ASM3071049v1/GCA_030710495.1_ASM3071049v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/963/930/695/GCF_963930695.1_fLabBer1.1/GCF_963930695.1_fLabBer1.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/963/584/025/GCF_963584025.1_fLabMix1.1/GCF_963584025.1_fLabMix1.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/039/737/535/GCA_039737535.1_Lrho_1.0/GCA_039737535.1_Lrho_1.0_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/031/216/445/GCA_031216445.1_YSFRI_Lmacu_1.1/GCA_031216445.1_YSFRI_Lmacu_1.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/020/091/685/GCA_020091685.1_ASM2009168v1/GCA_020091685.1_ASM2009168v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/009/762/535/GCF_009762535.1_fNotCel1.pri/GCF_009762535.1_fNotCel1.pri_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/040/436/345/GCA_040436345.1_Pma_NU_1.0/GCA_040436345.1_Pma_NU_1.0_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/015/343/265/GCA_015343265.1_ASM1534326v1/GCA_015343265.1_ASM1534326v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/041/380/415/GCA_041380415.1_vsnapper_v1/GCA_041380415.1_vsnapper_v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/020/382/885/GCF_020382885.2_fScaArg1.pri/GCF_020382885.2_fScaArg1.pri_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/900/880/675/GCF_900880675.1_fSpaAur1.1/GCF_900880675.1_fSpaAur1.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/947/650/265/GCA_947650265.1_fSymMel2.1/GCA_947650265.1_fSymMel2.1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/004/026/145/GCA_004026145.2_XU_Tbim_1.0/GCA_004026145.2_XU_Tbim_1.0_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/901/000/725/GCF_901000725.2_fTakRub1.2/GCF_901000725.2_fTakRub1.2_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/020/745/685/GCA_020745685.1_fTauAds1.pri.cur/GCA_020745685.1_fTauAds1.pri.cur_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/009/823/395/GCA_009823395.1_ASM982339v1/GCA_009823395.1_ASM982339v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/962/446/985/GCA_962446985.1_fXyrNov1.1/GCA_962446985.1_fXyrNov1.1_genomic.fna.gz
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

# output
Total files listed: $total_files
Missing files: $missing_files
```

The file names of the downloaded genomes will be all of the text after the last forward slash (/) in the URLs. The file names of the downloaded genomes need to be changed to `Genus_species.fa.gz`. This can be done one at a time with a simple `mv` command. Alternatively you can edit the script `rename_genomes.sh` to do it all at once. You can edit this script with the information from your files `speciesnames.txt` and `filenames.txt`. If you have kept the species names and their URLs in the same order, excluding the first line in `speciesnames.txt` that has your Genus_species, this should be a simple copy and paste. Then just add `mv` before the genome file names and `.fa.gz` at the end of each Genus_species.  

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

</details>

<details><summary>2. Get Newick tree</summary>

### 2. Get Newick tree (Optional)

Create a dated phylogenetic tree. 

Upload `speciesnames.txt` to [TimeTree of Life](https://timetree.org/) using the `Choose File` button at the bottom under **Load a List of Species**. The file `speciesnames.txt`  includes all of the gerp_outgroup species. Download the .nwk and .jpg files that TimeTree creates. Upload those to the `GenErode_Spp_20k/gerp_outgroup` directory. Rename the NEWICK file from `speciesnames.nwk` to `gerp_tree.nwk`.
```
mv speciesnames.nwk gerp_tree.nwk
```

Replace your `Genus_species` in `gerp_tree.nwk` with the name of the reference genome, which should be `reference.denovoSSL.<Spp>20k.fasta`. 
```
sed -i 's/Genus_species/reference.denovoSSL.<Spp>20k.fasta/g' gerp_tree.nwk
```

</details>

<details><summary>3. Config Files</summary>

### 3. Config Files

GenErode uses `config.yaml` to run. It also requires you to make two config files: `modern_samples.txt` and `historical_samples.txt`. These config files are specific to your data. In these config files, each unique sample gets its own line with its unique forward and reverse read files. The R1_fastq_file and R2_fastq_file in the header of these config files correspond to the \*.1.fq.gz and \*.2.fq.gz files that are preceded by a unique sample name.

These 2 config files have the same header: 
```
samplename_index_lane readgroup_id readgroup_platform path_to_R1_fastq_file path_to_R2_fastq_file
```

Example `modern_samples.txt` with 1 sample.
```
samplename_index_lane readgroup_id readgroup_platform path_to_R1_fastq_file path_to_R2_fastq_file
LvaCPnd001_Ex11A_L2 HJCYVCCX2:2 illumina modern/Lva-CPnd_001-Ex1-1A-lcwgs-2-1.1.fq.gz modern/Lva-CPnd_001-Ex1-1A-lcwgs-2-1.2.fq.gz
```

samplename: LvaCPnd001

<Spp><Era><Site><Ind>

index: Ex11A

<ExtractionID><WellID>

lane: L2

LaneID is not always present in the new file name (\*.fq.gz), but it can be extracted from the old file names in the fq_raw directories for each run, including SSL. This can be done using the `config_generode_old_new_lane.sh` script.

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

1. Copy config scripts to your species' config directory.
```
cd /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/config

cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_wahab/config/config* /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/config/
```

2. Edit the user-defined variables in the scripts `config_generode_old_new_lane.sh`, `config_historical_samples.sh`, `config_modern_samples.sh` to reflect your species. Edit the paths if necessary.
```
# User-defined variables for species and species code (Spp).
# For species use lowercase and an underscore so the directory path can be identified (e.g. lethrinus_variegatus)
species="genus_species"
# For Spp, this is the three letter species code. Capitalize the first letter.
Spp="Spp"
```

3. Identify all `old_new_config.log` files

The `config_generode_old_new_lane.sh` script requires the `old_new_config.log` files from each fq_raw directory that will be used in GenErode. However, sometimes the files `old_new_config.log` are not present. In that case, they can be either manually created, or manually entered into the config files later. 
```
# 1st run
ls ../../1st_sequencing_run/fq_raw/old_new_filenames.log

# 2nd run
ls ../../2nd_sequencing_run/fq_raw/old_new_filenames.log

# 3rd run # you may only have 2 runs
ls ../../3rd_sequencing_run/fq_raw/old_new_filenames.log

# SSL. This might be in a different location or have a different directory naming structure. This file may not have been created. e.g.
ls /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_ssl_data_processing/lethrinus_variegatus/fq_raw_shotgun/old_new_config.log
```

The SSL files will likely be in 1 of these 3 locations. Check these locations for the SSL `old_new_config.log` if you are using SSL data: 
```
ls /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_ssl_data_processing/
ls /archive/carpenterlab/pire/pire_ssl_data_processing/
ls /home/e1garcia/shotgun_PIRE/pire_ssl_data_processing/
```

4. Run `config_generode_old_new_lane.sh` to create `old_new_lane_GenErode_Spp_config.log`. The file `old_new_lane_GenErode_Spp_config.log` does not have a header, but the columns are `origFileName newFileName lane`.
```
bash generode_config_old_new_lane.sh
```

The output will tell you which `old_new_config.log` files were used to create `old_new_lane_GenErode_Spp_config.log`, which will be used by `config_historical_samples.sh` and `config_modern_samples.sh`. 

5. Run `config_modern_samples.sh`.
```
bash config_modern_samples.sh
```

Output example:
```
Modern samples processing completed. Output saved to modern_samples.txt
All 99 1.fq.gz and 99 2.fq.gz files were incorporated into modern_samples.txt
```
These values should be the same and should be half of the total number of modern \*.fq.gz files in the modern directory. 

6. Run `config_historical_samples.sh`. 
```
bash config_historical_samples.sh
```

Output example:
```
Historical samples processing completed. Output saved to historical_samples.txt
All 94 1.fq.gz and 94 2.fq.gz files were incorporated into historical_samples.txt
```
These values should be the same and should be half of the total number of historical \*.fq.gz files in the historical directory.  

7. Run `config_historical_rescaled_samplenames.sh`. This file doesn't need to be edited. It creates the file `historical_rescaled_samplenames.txt`, which can be pasted into line 173 in the `config.yaml` file.
```
bash config_historical_rescaled_samplenames.sh
```

8. Edit `config.yaml` to reflect the analyses you want to conduct in GenErode.

<details><summary>config.yaml example</summary>

```
line 23: ref_path: "/archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/reference/reference.denovoSSL.<Spp>20k.fasta"
line 31: historical_samples: "config/historical_samples.txt"
line 32: modern_samples: "config/modern_samples.txt"
Line 70: fastq_processing: True
line 89: map_historical_to_mitogenomes: False
line 165: historical_bam_mapDamage: True
line 173: historical_rescaled_samplenames: ["LvaAPnd001","LvaAPnd002","LvaAPnd003"]
line 446: snpEff: False
line 455: gtf_path: ""
line 486: gerp: False
line 492: gerp_ref_path: "/archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/gerp_outgroups"
line 501: tree: "/archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/gerp_outgroups/gerp_tree.nwk"
```

</p>
</details>

</p>
</details>

</details>

<details><summary>4. Run GenErode</summary>

### 4. Run GenErode

Move to your species' GenErode_Spp_20k directory and run the GenErode script `run_GenErode.sbatch`. 
```
sbatch run_GenErode.sbatch
```

If it is locked then unlock it with:
```
sbatch run_GenErode_unlock.sbatch
```

</details>

<details><summary>5. Check Results</summary>

### 5. Check if run successfully finished.

**Check log files**

If a run successfully finishes, there will be no error messages in the log file.

**Check MultiQC files**

If a subworkflow (e.g. trimming, mapping, indel realigning) successfully finished, a MultiQC file will be generated. The MultiQC files are located under the /stats/ directories.

e.g. `results/historical/trimming/stats`.

**Count the number of Modern input samples: \*.fq.gz**
```
find /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/modern -maxdepth 1 -type f -name '<Spp>-C<Site>_*' -printf '%f\n' | cut -c 10-12 | sort | uniq | wc -l
```

**Count the number of Modern output files: \*.merged.rmdup.merged.realn.bam**
```
ls /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/results/modern/mapping/reference.denovoSSL.<Spp>20k/*.merged.rmdup.merged.realn.bam | wc -l
```

**Count the number of Modern output files: \*.merged.rmdup.merged.realn.bai**
```
ls /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/results/modern/mapping/reference.denovoSSL.<Spp>20k/*.merged.rmdup.merged.realn.bai | wc -l
```

**Count the number of Historical input samples: \*.fq.gz**
```
find /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/historical -maxdepth 1 -type f -name '<Spp>-A<Site>_*' -printf '%f\n' | cut -c 10-12 | sort | uniq | wc -l
```

**Count the number of Historical output files: \*.merged.rmdup.merged.realn.bam**
```
ls /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/results/historical/mapping/reference.denovoSSL.<Spp>20k/*.merged.rmdup.merged.realn.rescaled.bam | wc -l
```

**Count the number of Historical output files: \*.merged.rmdup.merged.realn.bam.bai**
```
ls /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/results/historical/mapping/reference.denovoSSL.<Spp>20k/*.merged.rmdup.merged.realn.rescaled.bam.bai | wc -l
```

**GERP Scores File (Optional)**
```
ls /archive/carpenterlab/pire/pire_<genus_species>_lcwgs/GenErode_<Spp>_20k/results/gerp/reference.denovoSSL.<Spp>20k.ancestral.rates.gz
```

If all output has been created, then GenErode has successfully run. Move on to the next step in the pipeline. Note that each input sample should have 1 `\*.merged.rmdup.merged.realn.rescaled.bam` and 1 `\*.merged.rmdup.merged.realn.rescaled.bai` file.

## 6. Check output: QC checks

The pipeline may have successfully finished, but how did the samples actually perform? Check the files below to assess sample and mapping quality.

**Mapping statistics**
`results/historical/mapping/reference/stats/bams_indels_realigned`

- <sample>.merged.rmdup.merged.realn.bam.qualimap/: folder with mapping statistics, including insert size, coverage across the genome, average coverage per contig, etc.
- <sample>.merged.rmdup.merged.realn.repma.Q30.bam.dpstats.txt: file containing average genome-wide coverage after filtering for MQ (mapping quality) 30 and masking repeat regions
- <sample>.merged.rmdup.merged.realn.repma.Q30.bam.dp.hist.pdf: coverage histogram
- <sample>.merged.rmdup.merged.realn.bam.stats.txt: file containing number of mapped reads.

**DNA damage**
`results/historical/mapping/reference/stats/bams_rescaled`

- <sample>.merged.rmdup.merged.realn.bam.mapDamage: folder containing mapDamage statistics, including fragmentmisincroporation plots and damage rates.

**Fastq statistics**
`results/historical/trimming/stats`

</details>
