# PIRE lcWGS Data Processing

```
/archive/carpenterlab/pire/pire_lcwgs_data_processing
```
---

## Steps to Process Your Data


<details><summary>1. Complete fq.gz Pre-processing</summary>
<p>


## 1. Complete `fq.gz` Pre-processing

Within your species repository, follow the [pire_fq_gz_processing steps linked here](https://github.com/philippinespire/pire_fq_gz_processing), then return here and continue.

---

</p>
</details>


<details><summary>2. Get your reference genome</summary>
<p>

## 2. Get your reference genome

Within your sequencing run, make a new directory `refGenome`:
```
cd /archive/carpenterlab/pire/pire_<species_name>_lcwgs/#_sequencing_run
mkdir refGenome
```

**Now, see if there is a chromosome-level reference genome available for your species on ncbi**: https://www.ncbi.nlm.nih.gov/datasets/genome/

If there is, download it to your reference genome folder.

Example species– Sphaeramia orbicularis: https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_902148855.1/

Then, navigate to "FTP".

You will need to download the file that ends in "genomic.fna.gz" (true for all species)

```
cd refGenome

# wget <link to page with genome files>/<full file name on website>
wget https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_902148855.1/GCF_902148855.1_fSphaOr1.1_genomic.fna.gz
```
The file will then download into refGenome.

**If there is not a reference genome available on ncbi**, we may have one available in house. We make several genomes and choose the best to make probes from for cssl and to map against.  If probes have been made for this species then we probably want to use that genome.  You can look in the probes repo to see which genome was used, then copy it from the `pire_ssl_data_processing` repo.

Otherwise, to figure out which reference genome to use, consult the readme for your species in the [pire_ssl_data_processing](https://github.com/philippinespire/pire_ssl_data_processing) repo. 

Example species–Och: [pire_ssl_data_processing/ostorhinchus_chrysopomus/README.md](https://github.com/philippinespire/pire_ssl_data_processing/blob/main/ostorhinchus_chrysopomus/README.md)

Find the Summary of QUAST & BUSCO Results table, and use it to identify the best assembly:

### Summary of QUAST & BUSCO Results

Species    |Assembly    |Data Type    |SCAFIG    |Covcutoff    |Genome Scope v.    |No. of Contigs    |Largest Contig    |Total Length    |% Genome Size Completeness    |N50    |L50    |Ns per 100 kbp    |BUSCO Single Copy
------  |------  |------ |------ |------ |------  |------ |------ |------ |------ |------  |------ |------ |------
Och  |A  |decontam       |contigs       |off       |2       |  81865  | 168825  | 817740343  | 38.84 % | 13163  |  17352  |  0  | 63.63%
Och  |A  |decontam       |scaffolds       |off       |2    |  79271  |  199604 |    825105417  |  38.84 % | 14040  | 16206  | 20.53  | 65%
Och  |B  |decontam       |contigs       |off       |2       |  84901  |  182776  |   802206314  |  38.83 % |  12200  |  18516  |  0  | 61.98%
Och  |B  |decontam       |scaffolds       |off       |2    |  82315  |  191507  |   810219895  |  38.83 % |  12992  |  17358  |  19.79  | 63.19%
Och  |C  |decontam       |contigs       |off       |2       |  85612  |  191640  |  823945406  | 38.77 % | 12468  | 18377  |  0  |  61.57%
Och  |C  |decontam       |scaffolds       |off       |2    |  78378  |  276968  |   847729770  | 38.80 % |  14799  |  15555 | 177.47 | 67.03%
Och  |allLibs  |decontam       |contigs       |off       |2    |  84458  |  179505 |   855174075  |  38.85 % |  13388  | 17693  |  0  | 54.07%
Och  |allLibs  |decontam       |scaffolds       |off       |2   |  75507  |  277781  |   878447116  |  38.88 % |  16447  |  14525  | 195.13 | 68.96%

In this case, scaffold assembly of all libraries (last row) created the best assembly based on its highest BUSCO score and N50 score. We will use this as our reference genome.

Copy this genome into `refGenome`:
```
# cp /home/e1garcia/shotgun_PIRE/pire_ssl_data_processing/<species_name>/<best assembly>/scaffolds.fasta /archive/carpenterlab/pire/pire_<species_name>_lcwgs/#_sequencing_run/refGenome/

cp /home/e1garcia/shotgun_PIRE/pire_ssl_data_processing/ostorhinchus_chrysopomus/SPAdes_allLibs_decontam_R1R2_noIsolate/scaffolds.fasta /archive/carpenterlab/pire/pire_ostorhinchus_chrysopomus_lcwgs/2nd_sequencing_run/refGenome/
```

---

</p>
</details>


<details><summary>3. Curate the reference genome</summary>
<p>

## 3. Curate the reference genome

Before embarking upon mapping, it is a good idea to curate your reference genome. 

For a chromosome scale genome, rename the chromosomes in the FASTA files to be intuitive (chr01, chr01, ...) while retaining the accession number.

For chromosome-scale genomes taken from GenBank, it is a good idea to remove any scaffolds representing the mitochondrial genome first (if any are identified as such).

* Example species– Salarias fasciatus
  ```
  # get the line num for every chrom, contig, and scaffold in the genome download and save to file
  zgrep -n '^>' GCF_902148845.1_fSalaFa1.1_genomic.fna.gz > GCF_902148845.1_fSalaFa1.1_genomic_linenums.txt
      
  # get mitogenome, which starts on line 9968937, and save to file (will be different depending on your genome)
  zcat GCF_902148845.1_fSalaFa1.1_genomic.fna.gz | tail -n +9968937 > NC_004412.1_mtgenome.fasta
      
  # get chromes 1-7 and save to file
  zcat GCF_902148845.1_fSalaFa1.1_genomic.fna.gz | head -n 3077487 > NC_043745.1-NC_043751.1_chr1-7.fasta
      
  # get chromes 8-23, theres no 21, and save to file
  zcat GCF_902148845.1_fSalaFa1.1_genomic.fna.gz | tail -n +3431318 | head -n 5857623 > NC_043752.1-NC_043766.1_chr8-23.fasta
      
  # concatenating and gzipping the chromosomes and mitogenome into one file
  cat NC_043745.1-NC_043751.1_chr1-7.fasta NC_043752.1-NC_043766.1_chr8-23.fasta NC_004412.1_mtgenome.fasta | gzip > GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz
  ```

In either case of an NCBI genome or an in-house SSL genome, it is highly recommended to remove small scaffolds. Having many small scaffolds (<20kbp) tends to be the primary issue in long GenErode or ATLAS runtimes or failures. 

To remove these scaffolds, you can use the `removesmalls.pl` script. We generally remove scaffolds <20kbp in length. This should also remove any mitochondrial scaffolds.

```
cp /home/e1garcia/shotgun_PIRE/REUs/2022_REU/PSMC/scripts/removesmalls.pl <directory with reference genome>

#for ssl in-house:
perl removesmalls.pl 20000 <filename of ssl assembly> > reference.denovoSSL.<speciescode>.20k.fasta

#for ncbi:
perl removesmalls.pl 20000 <filename of ncbi genome> > reference.genbank.<speciescode>.20k.fasta
```

Now, make sure it worked. Check the length of the filtered assembly, which tells you the number of scaffolds left after filtering, and compare it to the pre-filtered genome:
```
# filtered:
cat reference.genbank.<speciescode>.20k.fasta | grep "^>" | wc -l
(a smaller number)

# original:
cat reference.genbank.<speciescode>.fasta | grep "^>" | wc -l
(a larger number)
```

---

</p>
</details>


<details><summary>4. (Optional) Map your reads to your reference genome</summary>
<p>

## 4. (Optional) Mapping your reads to your reference genome with dDocent.

To do a simple mapping of reads to the reference, you can use dDocent. Note that our preferred method of mapping for use in downstream analyses is now to use the GenErode pipeline (see below).

Start by cloning the dDocentHPC repo to gain access to the scripts we need to run:
```
# in seq_run directory:
git clone https://github.com/cbirdlab/dDocentHPC
```

Create a `mkBAM_ddocent` directory and copy all `fq.gz` files from `fq_fp1_clmp_fp2_fqscrn_rprd` into this new directory
```
# in #_sequencing_run directory

mkdir mkBAM_ddocent
rsync fq_fp1_clmp_fp2_fqscrn_rprd/*fq.gz mkBAM_ddocent
```
Copy the reference genome to `mkBAM_ddocent`:
```
# ncbi: cp refGenome/<ncbi genome name ending in genomic.fna.gz> mkBAM_ddocent/reference.genbank.<species code>.fasta
# ssl: cp refGenome/<ssl assembly filename, usually: scaffold.fasta> mkBAM_ddocent/reference.denovoSSL.<species code>.fasta

#examples:
  #ncbi:
cp refGenome/GCF_902148855.1_fSphaOr1.1_genomic.fna.gz mkBAM_ddocent/reference.genbank.Sor.fasta

  #ssl:
cp refGenome/scaffolds.fasta mkBAM_ddocent/reference.denovoSSL.Och.fasta
```
Get the scripts we need to run:
```
cd mkBAM_ddocent/
cp ../dDocentHPC/configs/config.6.lcwgs .
cp ../dDocentHPC/dDocentHPC.sbatch .
```
Now, we need to edit the scripts:
```
nano config.6.lcwgs

# within file:
# change Cutoff1 and Cutoff2 to "genbank" if ncbi or "denovoSSL" if ssl, and "<species code>" as follows:

----------mkREF: Settings for de novo assembly of the reference genome----------------------------------------->
PE              Type of reads for assembly (PE, SE, OL, RPE)                                    PE=ddRAD & ezRA>
0.9             cdhit Clustering_Similarity_Pct (0-1)                                                   Use cdh>
genbank         Cutoff1 (integer)                                                                              >
Sor             Cutoff2 (integer)                                                                              >
0.05    rainbow merge -r <percentile> (decimal 0-1)                                             Percentile-base>
0.95    rainbow merge -R <percentile> (decimal 0-1)                                             Percentile-base>
--------------------------------------------------------------------------------------------------------------->
```
```
nano dDocentHPC.sbatch

# within file:
# change where the "#" is to load the newest version as follows:

enable_lmod
# module load container_env ddocent/2.7.8
module load container_env ddocent/2.9.4
```

Now, you can map your reads.

Run the `dDocentHPC.sbatch` script which maps reads to a reference genome and creates BAM files:
```
cd mkBAM_ddocent
sbatch dDocentHPC.sbatch mkBAM config.6.lcwgs
```

---

</p>
</details>


<details><summary>5. (Optional) Filter the binary alignment maps</summary>
<p>

## 5. Optional) Filter the binary alignment maps

Again, use dDocent.

```
bash
sbatch dDocentHPC.sbatch fltrBAM config.6.lcwgs
```

---

</p>
</details>


<details><summary>6. (Optional) Summarize Read Mapping Performance</summary>
<p>

## 6. (Optional) Summarize Read Mapping Performance / Merge Runs

See the [process_sequencing_metadata](https://github.com/philippinespire/process_sequencing_metadata) repo for instructions.

If you have .bam files from individuals that were sequenced over multiple runs, you can merge these files using modified versions of the existing scripts used for cssl (`runmerge_2runs_lcwgs_array.bash` and `runmerge_2runs_lcwgs_array.sbatch`). As currently written, these will merge .bam files with the same individual ID that have produced by dDocent in two different sequencing_run directories, while keeping a record of unmerged files. The `copyunmerged.sbatch` script can then be used to copy the files that have not been merged.

After merging, you can use `mappedReadStats.sbatch` to get depth and coverage statistics.

```bash
# on wahab replace <yourPireDirPath> with /home/e1garcia/shotgun_PIRE
cd <yourPireDirPath>/pire_<ssl-or-cssl-or-lcwgs>_data_processing/<genus_species>
# sbatch mappedReadStats.sbatch "-RG.bam"
sbatch ../../pire_fq_gz_processing/mappedReadStats.sbatch mkBAM mkBAM/coverageMappedReads 
```

---

</p>
</details>


</details>

<details><summary>7. Map, filter, assess damage patterns, and calculate GERP scores using GenErode. </summary>
<p>

## 7. Map, filter, assess damage patterns, and calculate GERP scores using GenErode.

Our preferred method for mapping historical and contemporary datasets is now to use the GenErode pipeline, which will also perform several other useful functions (i.e. calculating evolutionary conservation/GERP scores and running MapDamage to adjust for historical damage).

See the [instructions for running GenErode on Wahab](https://github.com/philippinespire/pire_lcwgs_data_processing/tree/main/scripts/GenErode_wahab) for more details.

---

</p>
</details>


<details><summary>8. (Optional) Correct for damage and calculate theta using ATLAS </summary>
<p>

## 8. (Optional) Correct for damage and calculate theta using ATLAS

[ATLAS](https://atlaswiki.netlify.app/getting_started) is a software package designed specifically for working with low-coverage historical DNA. Our initial experiments with ATLAS were promising but subsequent analyses across a large number of datasets indicated that it might still be difficult to compare Albatross and contemporary results and to interpret ATLAS's estimates of theta, as there were clear depth-theta relationships that were not corrected in the contemporary datasets.

Instructions and scripts used to run ATLAS can be found [here](https://github.com/philippinespire/pire_lcwgs_data_processing/tree/main/scripts/ATLAS_wahab).

---

</p>
</details>

<details><summary>9. Estimate diversity, divergence and selection using ANGSD. </summary>
<p>

## 9. Estimate diversity, divergence and selection using ANGSD.

Currently the preferred method for conducting downstream analyses on PIRE lcwgs datasets.

[see notes on using angsd and related program on ODU hpcs](angsd_on_wahab_turing.md)

See the [ANGSD_Wahab](https://github.com/philippinespire/pire_lcwgs_data_processing/tree/main/scripts/ANGSD_wahab) subdirectory for instructions on using ANGSD.

---

</p>
</details>

<details><summary>10. (Optional) Extract mitochondrial genomes from lcwgs data using MitoZ.</summary>
<p>

## 10. (Optional) Extract mitochondrial genomes from lcwgs data using MitoZ.

It may be useful to extract mitochondrial sequences from lcwgs data to confirm species identity. See the [MitoZ](https://github.com/philippinespire/pire_lcwgs_data_processing/tree/main/scripts/MitoZ_wahab) folder for more information.

---

</p>
</details>

<details><summary>11. Uploading Species Data (GEOME, NCBI, FigShare)  </summary>

## 11. Uploading Species Data (GEOME, NCBI, FigShare)

We want to make sure that reads and metadata are uploaded to GEOME and NCBI, that the genome used for mapping is on NCBI, that final genotype likelihoods are uploaded to Github/Zenodo, that all of these datasets are linked from the main readme for a species, and that the repo is made public. 

<details><summary>A. Uploading Metadata to GEOME</summary>

## GEOME

The [Genomic Observatories Metadatabase (GeOMe)](https://geome-db.org/) is a web-based database for capturing and managing metadata for biological samples. 

<details><summary>I. Filling out the metadata spreadsheet</summary>
  
### Filling out the metadata spreadsheet:

To begin, you need to download a metadata template excel sheet. You can either download the template from the GEOME_Metadata folder on OneDrive, or from the [GEOME PIRE Project](https://geome-db.org/workbench/project-overview) (click “Generate Template” on the left-hand taskbar, then select “Philippines PIRE 2023 Template” under “Template Config”). Note: I believe GEOME updated their system, which has caused the worksheet download feature to not work properly. If you see "Samples" as the only worksheet option, it's the wrong sheet.

For a single species, you will, at minimum, need one sheet per era (Albatross/Contemporary). A new spreadsheet will need to be added if multiple years exist amongst eras, and/or if there are multiple sites. For example, Gerres oyena needed 3 metadata spreadsheets– there was only one site, but albatross individuals were collected in 2 different years. Another example is Hmi– 4 metadata sheets were generated as each era had 2 separate sites. If you have multiple runs of the same individuals, these do not need separate sheets.

#### Filename format: `<Speciescode>_<Year>_<Municipality>_<Province>_<SeqType>`
- Example: Sne_1909_Biri_NorthernSamar_lcwgs

I will now walk you through how to fill out each column in the spreadsheet, in order.

**`materialSampleID`**
- This will be the prefix of your fqgz file, and this must match exactly for GEOME to appropriately pair metadata with the associated fastq file. Unfortunately, GEOME does not recognize the character "-" so we will have to rename every one of our fqgz files prior to uploading (we'll do this later) from this format: "Sne-ABir_001" to this: "SneABir001". That being said, we will populate our materialSampleID column with prefixes in that corrected format.
- An easy way to get those IDs is to go into your sequencing_run/fq_raw directory, and run this (you can add `| grep 'C'` to the end if you want to specify era):
  - `ls *fq.gz  | cut -c1-12 | uniq | sed 's/[-_]//g'`
  - If you do not have the fqgz files in your fq_raw directory, or there is no fq_raw directory, you can modify the search by either changing *fq.gz to a different suffix and/or changing into a different directory that has your file names present
- <ins>If you have multiple runs of the same species, you will need to append a "_lib1", "_lib2", etc. to the end of this ID.</ins> Number the libraries based on number of appearances. (Example, Sne Bir appeared in the 4th and 5th sequencing runs, but I would not list the lib as "_lib4 " and "_lib5", but rather 1 and 2 based on the actual number of runs for that site).
- An easy way to get this is to run (will append lib number to the end of printed output):
  - `ls *fq.gz | cut -c1-12 | uniq | sed 's/[-_]//g' | sed 's/$/_lib1/'`

**`principalInvestigator`**
- Kent_Carpenter

**`yearCollected`**
- You can find this in the [Lot Sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B9E5DA055-65CC-449A-92E1-3537C1B9949D%7D&file=Lot_sheet.xlsx&action=default&mobileredirect=true) on OneDrive under the "Date_Collected" column

**`decimalLatitude`** & **`decimalLongitude`**
- Pull from “[Philippine Albatross Collections working copy](https://www.google.com/maps/d/edit?mid=1leLurkYXC3FezrY59AhoU0QTjvi4fsIl&amp;usp=sharing)” Google Map.
- Click on the collection flag for your site, and copy the lat/long to 3 decimal points.

**`locality`**
- In the format: Municipality_Province. You can look for this in various sheets, or use google. If unsure, ask on Slack.
  - For Albatross individuals collected between 1907-1910, this sheet may be helpful: [ALBATROSS_1907-1910updatedALLrecordsNotations.xlsx](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7BC924AA0F-278E-48EA-A078-5F708220687F%7D&file=ALBATROSS_1907-1910updatedALLrecordsNotations.xlsx&action=default&mobileredirect=true)
- For multi-word municipalities/provinces (i.e. Matnog Bay, Northern Samar, etc), use capital letters to separate the words. Ex: MatnogBay_Sorsogon, Biri_NorthernSamar
  - GEOME used to allow for hyphens/dashes (Matnog-Bay_Sorsogon, Biri_Northern-Samar), but has since updated their system.

**`country`**
- Philippines

**`genus`**
- Say your species is Sphaeramia nematoptera, genus would be "Sphaeramia".

**`specificEpithet`**
 - Say your species is Sphaeramia nematoptera, this would be "nematoptera".

**`lifeStage`**
- Default to “adult” if you have no other information. It should be noted on the [Lot Sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B9E5DA055-65CC-449A-92E1-3537C1B9949D%7D&file=Lot_sheet.xlsx&action=default&mobileredirect=true) under the “Notes” column if the specimens are larvae or juveniles.

**`monthCollected`** 
- List the month as a number (1-12). Found on the [Lot Sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B9E5DA055-65CC-449A-92E1-3537C1B9949D%7D&file=Lot_sheet.xlsx&action=default&mobileredirect=true) under the “Date_Collected” column.

**`dayCollected`** 
- List the day as a number (1-31). Found on the [Lot Sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B9E5DA055-65CC-449A-92E1-3537C1B9949D%7D&file=Lot_sheet.xlsx&action=default&mobileredirect=true) under the “Date_Collected” column.

**`georeferenceProtocol`** 
- GoogleMaps

**`permitInformation`** 
- If your contemporary specimens are from Palawan, fill in Palawan Council for Sustainable Development GP# 2022-4(R1).
- If your specimens are from anywhere else, fill in “NA”.

**`tissueType`** 
- "muscle"
- Unless otherwise stated

**`preservative`** 
- 75% ethanol or DESS.
- Check the “Storage_solution” column on the [Lot Sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B9E5DA055-65CC-449A-92E1-3537C1B9949D%7D&file=Lot_sheet.xlsx&action=default&mobileredirect=true).
- If it says “EtOH”, record “75% ethanol”.
- Refers to the solution used to preserve the full specimen.

**`catalogNumber`**
- The Individual_ID from the [Individual_sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7BD84C712C-816F-420F-82D2-784C244B201D%7D&file=Individual_sheet.xlsx&action=default&mobileredirect=true) (file path: Database/Individual_sheet.xlsx).
- Example: Aen-AHam_001.
- If the prefix of your fqgz files follows this format, you could also run this in your fq_raw directory, which is especially useful if you are not working with every individual in a lot.
  - `ls *fq.gz | cut -c1-12 | uniq`

**`occurrenceRemarks`**
- Check the notes on the [Lot Sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B9E5DA055-65CC-449A-92E1-3537C1B9949D%7D&file=Lot_sheet.xlsx&action=default&mobileredirect=true) and the Field Notes (file path: Database/Field Collections) to see if there are any comments on the species occurrence.
- If there are none, fill in “NA”. This field will most likely be filled in with “NA”.

**`voucherCatalogNumber`** 
- For Albatross individuals, the “New_USNM_Number” found on the [Individual_sheet.xlsx](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7BD84C712C-816F-420F-82D2-784C244B201D%7D&file=Individual_sheet.xlsx&action=default&mobileredirect=true) or the [Biorepository_Smithsonian sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7BE91DB72A-921D-4BD7-B46B-7CA3A6E86196%7D&file=Biorepository_Smithsonian.xlsx&action=default&mobileredirect=true) (file path: Database/Biorepository_Database/Biorepository_Smithsonian.xlsx).
  - Example: 455096
- For contemporary individuals, use the contemporary lot number found on the [Lot Sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B9E5DA055-65CC-449A-92E1-3537C1B9949D%7D&file=Lot_sheet.xlsx&action=default&mobileredirect=true) under the “Lot_ID” column.
  - Example: SAM-2022_02_10

**`identificationRemarks`**
- Check the notes on the [Lot Sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B9E5DA055-65CC-449A-92E1-3537C1B9949D%7D&file=Lot_sheet.xlsx&action=default&mobileredirect=true) and the Field Notes (file path: Database/Field Collections) to see if there are any comments on identification.
- If there are none, fill in “NA”.

**`identifiedBy`**
- Found on the [Lot Sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B9E5DA055-65CC-449A-92E1-3537C1B9949D%7D&file=Lot_sheet.xlsx&action=default&mobileredirect=true) under the “Species_verified” column.
- List names with an underscore between the first and last name.
  - If there is more than one name, use a space and the pipe operator “|” between each name (the pipe operator is specified to be used in the GEOME FAQs).
    - Example: Kent_Carpenter | Abner_Bucol

**`previousIdentifications`** 
- Check the “Notes” column on the [Lot Sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B9E5DA055-65CC-449A-92E1-3537C1B9949D%7D&file=Lot_sheet.xlsx&action=default&mobileredirect=true) to see if this species was previously identified as something different.
- If there are no notes to indicate this, fill in “NA”.

**`scientificName`**
- Format: Genus_species
  - Example: Sphaeramia_nematoptera

**`yearIdentified`**
- On the [Lot Sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B9E5DA055-65CC-449A-92E1-3537C1B9949D%7D&file=Lot_sheet.xlsx&action=default&mobileredirect=true), look at the column "Species_verified".
- When there is no date, only the name of the person:
  - For Contemporary: use the date of collection (under "Date_Collected").
  - For Albatross: we assume it was IDed at the same time as contemporary, so use the year listed in "Species_verified" for the associated contemporary lot.

**`samplingProtocol`**
- For Contemporary collections: fill in “marketcollection”.
- For Albatross collections:
  - check the site on the “[Philippine Albatross Collections working copy](https://www.google.com/maps/d/edit?mid=1leLurkYXC3FezrY59AhoU0QTjvi4fsIl&amp;usp=sharing)” Google Map. It may contain the notes with the sampling methods.
    - Examples include “dynamite” and “beachseine”.
  - If not listed on Google Maps, try this: [Albatross Philippines Expedition Stations(Philippines Expedition).csv](https://drive.google.com/file/d/1CLNuOJJAoEva_7wqxqVX3mDaNFH0cr-r/view?usp=sharing)
   
**`fieldNotes`**
- For Albatross: check for notes in the site on the “[Philippine Albatross Collections working copy](https://www.google.com/maps/d/edit?mid=1leLurkYXC3FezrY59AhoU0QTjvi4fsIl&amp;usp=sharing)” Google Map.
- For Contemporary: copy or summarize from the field notes (file path: Database/Field Collections) if you are able to access them. Otherwise, ask the project owner, giving them the species name and collection date.

**`tissueID`**
- This will be the exact same as your first column, `materialSampleID`.
  - Example: SneABir001_lib2
- Again, no special charcters will be recognized, so only underscores are allowed.

**`tissueInstitution`**
- USNM

**`tissueSamplingYear`** 
- Pull from the “Date_Subsampling” column on the [Extractions_sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B7631F787-D146-4E74-8D67-26C9B7947117%7D&file=Extractions_sheet.xlsx&action=default&mobileredirect=true) (file path: Database/Extractions_sheet.xlsx).
- Refers to the year the tissue was subsampled.

**`tissueRecordedBy`** 
- Pull from the “Subsampler” column on the [Extractions_sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B7631F787-D146-4E74-8D67-26C9B7947117%7D&file=Extractions_sheet.xlsx&action=default&mobileredirect=true).
- List names with an underscore between the first and last name.
- If there is more than one name, use a space and the pipe operator “|” between each name.
  - Example: John_Schaefer | David_Baker

**`tissuePreservative`**
- 95% ethanol

**`tissueRemarks`**
- Check the “Notes” column on the [Extractions_sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B7631F787-D146-4E74-8D67-26C9B7947117%7D&file=Extractions_sheet.xlsx&action=default&mobileredirect=true).
- If none, fill in “NA”.

</details>

<details><summary>II. Creating your fastq text file</summary>

### Creating your fastq text file: 

Before uploading to GEOME, we need to create a text file with the names of all of our fastq files (1 text file per sheet). The prefix must match what we wrote for our materialSampleID in our spreadsheet. We will be renaming our files later, before we upload the sequences to NCBI, but for now just the intended filenames is fine. 

I find the easiest way to do this is to run a variation of this command in your terminal (in fq_raw):
```
ls *fq.gz | awk -F'[-_]' '{print $1 $2 $3 "_lib1-" $4 "-" $5 "-" $6 "-" $7 "-" $8}' 
```
You may need to edit it based on how your files are named. 
- `ls *fq.gz` lists all fastq files in your directory. You can change it to `ls *A*fq.gz` or `ls *C*fq.gz` if you want to specify era
- `-F'[-_]'` tells `awk` to split each filename using both - and _ as field separators
- `print` will then manipulate the original filename by changing how each separated field is handled, also adding in the _lib number (if needed)
  - example: `Och-ACan_001-Ex1-1A-lcwgs-1-1.1.fq.gz`, with that command, becomes `OchACan001_lib1-Ex1-1A-lcwgs-1-1.1.fq.gz`
  - BUT, if I ran this on `Sne-ATaw_001-Ex1-lcwgs.1.fq.gz`, it would become: `SneATaw001_lib1-Ex1-lcwgs.1.fq.gz---` because I only have 5 fields that are separated by a - or _, not 8
    - SO, I would edit my command to be: `ls *fq.gz | awk -F'[-_]' '{print $1 $2 $3 "_lib1-" $4 "-" $5}'` to print: `SneATaw001_lib1-Ex1-lcwgs.1.fq.gz`

An issue you may run in to is that the raw files are not in the fq_raw directory. Sometimes files are deleted by users once processing is complete in an attempt to maximize storage space. In this case, it might be easiest to skip to the B. NCBI "Step I. Renaming and Downloading Raw Files to Your Home Directory" and working with that dir instead of fq_raw.

(Optional) Another workaround would be to redownload the files into fq_raw. Usually these can be found in `/archive/carpenterlab/pire/downloads/<species_name>/<sequencing_run>/fq_raw`, but if the directory is older, it may be in a different location. Check the readme for that run to find out where the files are located.

For example, Sne 2nd sequencing run was missing the raw files. Once I located the files, I ran the following to copy them over:
```
cp /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/2nd_sequencing_run/fq_raw/*fq.gz /archive/carpenterlab/pire/pire_sphaeramia_nematoptera_lcwgs/2nd_sequencing_run/fq_raw/.
```
Then I ran the rename script:
```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Sne_LCWGS-testlane_SequenceNameDecode.tsv rename
```
Now I was able to get my fq list, say for albatross:
```
ls Sne-A*fq.gz | awk -F'[-_]' '{print $1 $2 $3 "_lib1-" $4 "-" $5 "-" $6 "-" $7 "-" $8}'
SneABir001_lib1-Ex1-9A-lcwgs-1-1.1.fq.gz
SneABir001_lib1-Ex1-9A-lcwgs-1-1.2.fq.gz
SneABir002_lib1-Ex1-9B-lcwgs-1-1.1.fq.gz
SneABir002_lib1-Ex1-9B-lcwgs-1-1.2.fq.gz
SneABir003_lib1-Ex1-9C-lcwgs-1-1.1.fq.gz
SneABir003_lib1-Ex1-9C-lcwgs-1-1.2.fq.gz
SneABir004_lib1-Ex1-9D-lcwgs-1-1.1.fq.gz
SneABir004_lib1-Ex1-9D-lcwgs-1-1.2.fq.gz
SneABir005_lib1-Ex1-9E-lcwgs-1-1.1.fq.gz
SneABir005_lib1-Ex1-9E-lcwgs-1-1.2.fq.gz
SneABir006_lib1-Ex1-9F-lcwgs-1-1.1.fq.gz
SneABir006_lib1-Ex1-9F-lcwgs-1-1.2.fq.gz
SneABir007_lib1-Ex1-9G-lcwgs-1-1.1.fq.gz
SneABir007_lib1-Ex1-9G-lcwgs-1-1.2.fq.gz
SneABir008_lib1-Ex1-9H-lcwgs-1-1.1.fq.gz
SneABir008_lib1-Ex1-9H-lcwgs-1-1.2.fq.gz
SneABir009_lib1-Ex1-10A-lcwgs-1-1.1.fq.gz
SneABir009_lib1-Ex1-10A-lcwgs-1-1.2.fq.gz
SneABir010_lib1-Ex1-10B-lcwgs-1-1.1.fq.gz
SneABir010_lib1-Ex1-10B-lcwgs-1-1.2.fq.gz
SneABir011_lib1-Ex1-10C-lcwgs-1-1.1.fq.gz
SneABir011_lib1-Ex1-10C-lcwgs-1-1.2.fq.gz
SneABir012_lib1-Ex1-10D-lcwgs-1-1.1.fq.gz
SneABir012_lib1-Ex1-10D-lcwgs-1-1.2.fq.gz
SneABir013_lib1-Ex1-10E-lcwgs-1-1.1.fq.gz
SneABir013_lib1-Ex1-10E-lcwgs-1-1.2.fq.gz
SneABir014_lib1-Ex1-10F-lcwgs-1-1.1.fq.gz
SneABir014_lib1-Ex1-10F-lcwgs-1-1.2.fq.gz
SneABir015_lib1-Ex1-10G-lcwgs-1-1.1.fq.gz
SneABir015_lib1-Ex1-10G-lcwgs-1-1.2.fq.gz
SneABir016_lib1-Ex1-10H-lcwgs-1-1.1.fq.gz
SneABir016_lib1-Ex1-10H-lcwgs-1-1.2.fq.gz
SneABir017_lib1-Ex1-11A-lcwgs-1-1.1.fq.gz
SneABir017_lib1-Ex1-11A-lcwgs-1-1.2.fq.gz
SneABir018_lib1-Ex1-11B-lcwgs-1-1.1.fq.gz
SneABir018_lib1-Ex1-11B-lcwgs-1-1.2.fq.gz
SneABir019_lib1-Ex1-11C-lcwgs-1-1.1.fq.gz
SneABir019_lib1-Ex1-11C-lcwgs-1-1.2.fq.gz
SneABir020_lib1-Ex1-11D-lcwgs-1-1.1.fq.gz
SneABir020_lib1-Ex1-11D-lcwgs-1-1.2.fq.gz
SneABir021_lib1-Ex1-11E-lcwgs-1-1.1.fq.gz
SneABir021_lib1-Ex1-11E-lcwgs-1-1.2.fq.gz
SneABir022_lib1-Ex1-11F-lcwgs-1-1.1.fq.gz
SneABir022_lib1-Ex1-11F-lcwgs-1-1.2.fq.gz
SneABir023_lib1-Ex1-11G-lcwgs-1-1.1.fq.gz
SneABir023_lib1-Ex1-11G-lcwgs-1-1.2.fq.gz
SneABir024_lib1-Ex1-11H-lcwgs-1-1.1.fq.gz
SneABir024_lib1-Ex1-11H-lcwgs-1-1.2.fq.gz
SneABir025_lib1-Ex1-12A-lcwgs-1-1.1.fq.gz
SneABir025_lib1-Ex1-12A-lcwgs-1-1.2.fq.gz
SneABir026_lib1-Ex1-12B-lcwgs-1-1.1.fq.gz
SneABir026_lib1-Ex1-12B-lcwgs-1-1.2.fq.gz
SneABir027_lib1-Ex1-12C-lcwgs-1-1.1.fq.gz
SneABir027_lib1-Ex1-12C-lcwgs-1-1.2.fq.gz
SneABir028_lib1-Ex1-12D-lcwgs-1-1.1.fq.gz
SneABir028_lib1-Ex1-12D-lcwgs-1-1.2.fq.gz
```
Now, paste those filenames into a text file. If you have multiple runs (i.e. _lib1, _lib2, etc) make sure these are included in the file as well.
- For Mac, you can open TextEdit > New Document > Format > Make Plain text.
- For PC, paste into an excel sheet, making sure each line contains a single filename > "Save As" > "Text (Tab Delimited)” format).

I'd title the file: `fastq_<metadata spreadsheet name>` to make sure theres no confusion later on.
- Example: `fastq_Sne_1909_Biri_NorthernSamar_lcwgs`

</details>

<details><summary>III. Creating an Expedition</summary>

### Creating an Expedition:

To start uploading metadata, we need to create the appropriate expedition.

First, make sure you are signed into [GEOME](https://geome-db.org/workbench/project-overview).

Then click on "Project Expeditions" under "Admin" on the left-hand taskbar. Click on "+ Create Expedition".

Follow our formula for naming the expedition (Spp_Year_Municipality_Province_SeqType). This should be the same name as your metadata sheet.
- Example: `Sne_1909_Biri_NorthernSamar_lcwgs`
- Note: GEOME previously allowed for "-" between words, but has since updated their system. Two-word municipality/provinces were written with a hyphen (Biri_Northern-Samar), but moving forward they should be written as "Biri_NorthernSamar".

Expediton Title and Expedition Code will be the same.

</details>

<details><summary>IV. Load Data to GEOME</summary>

### Load Data:

Once the expedition has been created, click on "Load Data" in the left-hand taskbar. 

-  **Data Type**: Select...
    -  Excel Workbook
    -  Fastq

- **Excel Workbook**: Upload your metadata spreadsheet

- **FASTQ Filenames CSV**: Upload your .txt file
 
- **Library Layout**: Paired End (make sure you have a forward (1.fq.gz) and reverse (2.fq.gz) read for every individual)

- **Library Strategy**:
  - For LCWGS: select "WGS"
  - For CSSL: select "Other"
  - For SSL: select "WGS"

 - **Library Source**: GENOMIC

- **Library Selection**:
  - For LCWGS: select "other"
  - For CSSL: select "Reduced Representation"
  - For SSL: select "size fractionation"
 
- **Platform**: ILLUMINA

- **Instrument Model**: Illumina NovaSeq 6000

- **Protocol Citation or Website**: KAPA HyperPlus Kit

- **Expedition Name**: Select the appropriate expedition.

Now click "Load".
- You will get errors related to "sex" and "coordinateUncertaintyInMeters". This is okay. Click continue.
- If you get any other error message, you should make sure everything on your end was correctly inputted.

Once everything has been loaded, make sure it looks correct. 
- Generally, you should only have 1 "Event". Examples for why you might have 2-3 include: different "dayCollected" (usually within a day of one another) and different "decimalLatitude"/"decimalLongitude" (same site code, just slightly different location– usually close by).
- I would double check any instance where you have more than 1 event. If any of the above examples apply, then all is okay. If they do not, something on your metadata spreadsheet may have been put in wrong. If you dragged cells to autofill portions of your sheet, make sure numbers did not sequentially add.

</details>

<details><summary>V. Tracking Progress</summary>

### Tracking Progress:

Once your expedition has been properly loaded, track your progress on the [Sequence_info_sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B96577AF0-69E8-48F5-A3BD-0990B8285C27%7D&file=Sequence_info_sheet.xlsx&action=default&mobileredirect=true) (filepath: Database/Sequence_info_sheet.xlsx). 

Fill out: "Data_Uploaded_By", "GEOME_Expedition_Name", and "GEOME_Expedition_GUID".

</details>

---

</details>

<details><summary>B. Uploading Raw Files to the NCBI Sequence Read Archive (SRA)</summary>

## NCBI Sequence Read Archive (SRA)
<p>
  
Now that your metadata has been uploaded to GEOME, we can move on to submitting our raw reads to the [NCBI SRA](https://www.ncbi.nlm.nih.gov/sra/docs/). 
</p>

<details><summary>I. Renaming and Downloading Raw Files to Your Home Directory</summary>

### Renaming and Downloading Raw Files to Your Home Directory:

To prepare for SRA uploading, we need to copy the fq.gz files to our home directory (~) and rename them to match the new prefix we used for `materialSampleID` in our metadata spreadsheet.

You can do this however you want, but what has been the easiest for me is as follows: 
- Make a directory to hold your fastq files in your home dir:
  ```
  mkdir ~/Sne_1909_Biri_NorthernSamar_lcwgs
  ```
- Now I prepare for copying and renaming the files. To do this, I make a google sheet.
  - I paste the names of all my raw files (using `ls Sne-A*gz -1` in the directory with the raw files) into column B
  - I paste the target filenames in column C (using the fastq .txt file we created earlier).
  - Then, in column A, I type "cp" and drag it to fill all rows.
  - Finally, I do a series of Find and Replace(shift+command+h),
    - I select all content in column C and "Find: SneABir" and "Replace with: ./SneABir"
    - In column B, (if working with multiple runs), I select all filenames associated with lib1 and "Find: Sne-ABir" and "Replace with: $lib1path/Sne-ABir". Then I do the same for lib2– "Find: Sne-ABir" and "Replace with: $lib2path/Sne-ABir". If it's only one run you can just select the whole column and do the same.
  - Your spreadsheet should look like this:
  ```
  |   A   |                      B                          |                      C                     |
  |-------|-------------------------------------------------|--------------------------------------------|
  | cp	| $lib1path/Sne-ABir_001-Ex1-9A-lcwgs-1-1.1.fq.gz | ./SneABir001_lib1-Ex1-9A-lcwgs-1-1.1.fq.gz |
  | cp	| $lib1path/Sne-ABir_001-Ex1-9A-lcwgs-1-1.2.fq.gz | ./SneABir001_lib1-Ex1-9A-lcwgs-1-1.2.fq.gz |
  [...]
  | cp	| $lib2path/Sne-ABir_028-Ex1-12D-lcwgs-1-2.1.fq.gz| ./SneABir028_lib2-Ex1-12D-lcwgs-1-2.1.fq.gz |
  | cp	| $lib2path/Sne-ABir_028-Ex1-12D-lcwgs-1-2.2.fq.gz| ./SneABir028_lib2-Ex1-12D-lcwgs-1-2.2.fq.gz |
  ```
- Now in the fastq directory we just made, we'll make a quick script to copy the files over. This script copies each original raw file (using the full path) to the current directory you are in (~/<fastq_dir>) and renames it in the process.
  - Add `.sh` to the end of your script name
  - Add a shebang `#!/bin/bash` to the first line
  - Add your lib absolute filepaths
  - And then paste the contents of your spreadsheet below it
  ```
  nano SneABircopyfiles.sh

  #!/bin/bash

  lib1path=/archive/carpenterlab/pire/pire_sphaeramia_nematoptera_lcwgs/2nd_sequencing_run/fq_raw
  lib2path=/archive/carpenterlab/pire/pire_sphaeramia_nematoptera_lcwgs/3rd_sequencing_run/fq_raw

  cp	$lib1path/Sne-ABir_001-Ex1-9A-lcwgs-1-1.1.fq.gz	        ./SneABir001_lib1-Ex1-9A-lcwgs-1-1.1.fq.gz
  cp	$lib1path/Sne-ABir_001-Ex1-9A-lcwgs-1-1.2.fq.gz	        ./SneABir001_lib1-Ex1-9A-lcwgs-1-1.2.fq.gz
  [...]
  cp	$lib2path/Sne-ABir_028-Ex1-12D-lcwgs-1-2.1.fq.gz	./SneABir028_lib2-Ex1-12D-lcwgs-1-2.1.fq.gz
  cp	$lib2path/Sne-ABir_028-Ex1-12D-lcwgs-1-2.2.fq.gz	./SneABir028_lib2-Ex1-12D-lcwgs-1-2.2.fq.gz
  ```
- Run the script:
  ```
  ./SneABircopyfiles.sh
  ```

Make sure all files are there, then remove the script:
```
ls *gz -1 | wc -l
112

rm SneABircopyfiles.sh 
```
</details>

<details><summary>II. Downloading files from GEOME</summary>

### Downloading files from GEOME:

Go to the [GEOME Project Overview](https://geome-db.org/workbench/project-overview) and find your expedition. 

To the right of the GUID, you'll find a download button. Select "Fastq - SRA Metadata". 

A file called "sra-files" will download to your computer. To avoid any confusion, I recommend renaming it immediately.

</details>

<details><summary>III. NCBI SRA Submission</summary>

### NCBI SRA Submission:

Go to the [NCBI SRA Submission website](https://submit.ncbi.nlm.nih.gov/subs/sra/), and either log in or create an account. Click the blue "New Submission" button.

Any information for entry boxes not addressed below are not necessary and can be left blank. 

<ins>**1> Submitter**</ins>
- Enter your personal information.
- For UCSC affiliates:
  - Submitting organization: **University of California, Santa Cruz**
  - Department: **Ecology and Evolutionary Biology**
  - Street: **130 McAllister Way**
  - City: **Santa Cruz**
  - State: **California**
  - Postal code: **95060**
  - Country: **USA**
 
<ins>**2> General Info**</ins>

* Do you already have a BioProject accession number for this research? **No**
* Do you already have BioSample accession numbers for these samples? **No**
* When should this submission be released to the public? **Release on specified date or upon publication, whichever is first**
* Projected release date: Choose something a few years out, unless you have been told to make the data public now.

<ins>**3> Project Info**</ins>

* Project title: **Sphaeramia_nematoptera_1909_Biri_NorthernSamar_lcwgs**
  * Format the project title similarly to the format we use for expedition names, but with the entire species name rather than the 3-digit code
* Public description: **Low-coverage Whole Genome Sequencing (lcWGS) data for the fish Sphaeramia nematoptera collected in 1909 in Biri, Northern Samar, Philippines.**
* Relevance: **Evolution**
* Is your project part of an umbrella project which is already registered with NCBI? **No**
* External links:
  * Description: **Philippines PIRE Project: Centennial Genetic and Species Transformations in the Epicenter of Marine Biodiversity**
  * URL: **https://sites.wp.odu.edu/PIRE/philippines/**
  
  [ + Add another link]
  * Description: **Philippines PIRE Project Metadata**
  * URL: **https://geome-db.org/workbench/project-overview?projectId=511**

* Select your grants
  
    [ + Add grants] > "Enter grants manually"
  * Grant ID: **OISE-1743711**
  * Grant title: **Centennial Genetic and Species Transformations in the Epicenter of Marine Biodiversity**
  * Agency: **National Science Foundation**
  * Agency abbr.: **NSF**

<ins>**4> Biosample Type**</ins>

* Select "**Model organism or animal**" under NCBI packages

<ins>5> Biosample Attributes</ins>

* How do you want to provide your BioSample attributes? **Upload a file using Excel or text format (tab-delimited) that includes the attributes for each of your BioSamples**
- Within the `sra-files.zip` folder you downloaded from GEOME, select the **bioSample-attributes.tsv** file.
  - You will get the following error messages, which you can safely ignore:
    - "Warning:Submission processing may be delayed due to necessary curator review." (sample names)
    - "Warning:We will automatically transform the attribute value(s) you provided as follows" (date transformation)
      - Another special case error message: we have seen cases for users working in marine systems where locality is often based on nearby terrestrial locations, and the SRA responds with a warning that the locality is invalid since it is located in the warning. This particular message may be ignored for marine users where this is intentional.
  - Any other error messages should be investigated and fixed.

<ins>**6> SRA Metadata**</ins>

* How do you want to provide your metadata? **Upload a file using Excel or text format (tab-delimited)**
- Within the `sra-files.zip` folder you downloaded from GEOME, select the **sra-metadata.tsv** file.
  - The following error can be safely ignored:
    - "Warning:Please describe your library selection in the design description if you choose "other" as a library selection."
  - Any other error messages should be investigated and fixed.
 
<ins>**7> Files**</ins>

* How do you want to provide files for this submission? **FTP or Aspera Command Line file preload**
* If this is your first time loading files onto ncbi, <ins>this is how to set up the aspera command line interface:</ins>
  1. Below the "Select preload folder" blue button, you will see an expandable tab titled "Aspera command line instructions". Click to expand it. You don't need to follow those instructions, but find the "key file" link in step 2 under "Next, upload your data". Download the key file to your computer.
  2. Once the key file has been downloaded, titled `aspera.open.ssh`, you need to upload it into your home (~) directory. The following command is what worked for me, but you will need to edit your aspera filepath depending on where it downloaded to you device, and replace [hpc-0373] with your wahab username.
     ```
     scp ~/Downloads/aspera.openssh hpc-0373@wahab.hpc.odu.edu:~/.
     ```
  3. Now, log back into wahab, and get a node (type `salloc` in your terminal).
  4. Load the aspera module: `module load container_env aspera-cli`
  5. Find the path to the Aspera ascp executable by running: `crun.aspera-cli ascli config ascp show`. You will need to note the path to the ascp file, which should look like this: `/home/hpc-0373/.aspera/sdk/ascp`
  6. Now, find the command listed in step 3, under "Next, upload your data". It should look something like this:

     `ascp -i <path/to/key_file> -QT -l100m -k1 -d <path/to/folder/containing files> subasp@upload.ncbi.nlm.nih.gov:uploads/gmazzei_ucsc.edu_ExrXy7CA`

      * You will replace `ascp` with the ascp path we just got,
      * `<path/to/key_file>` with the absolute path to the `aspera.open.ssh` file we uploaded to our home dir,
      * and the `<path/to/folder/containing files>` to the path to the folder holding our renamed fastq files.
        * Note: in the future, the only thing you will need to change in this command is the `<path/to/folder/containing files>`. Everything else will always be the same.
    It should look something like this:

      `/home/hpc-0373/.aspera/sdk/ascp -i /home/hpc-0373/aspera.openssh -QT -l100m -k1 -d /home/hpc-0373/Sne_1909_Biri_Northern-Samar_lcwgs subasp@upload.ncbi.nlm.nih.gov:uploads/gmazzei_ucsc.edu_ExrXy7CA`
     
* If aspera has already been set up, or you've completed the instructions above, you're ready to run the command provided by NCBI to upload your data (see step vi. above on how to edit your command). You will begin to see your files upload.
    ```
    [hpc-0373@wahab-01 ~]$ /home/hpc-0373/.aspera/sdk/ascp -i /home/hpc-0373/aspera.openssh -QT -l100m -k1 -d /home/hpc-0373/Sne_1909_Biri_Northern-Samar_lcwgs subasp@upload.ncbi.nlm.nih.gov:uploads/gmazzei_ucsc.edu_ExrXy7CA
    SneABir021_lib2-Ex1-11E-lcwgs-1-2.1.fq.gz                                 100%  502MB 97.3Mb/s    00:46    
    SneABir016_lib1-Ex1-10H-lcwgs-1-1.2.fq.gz                                 100%  221MB 97.3Mb/s    01:05    
    SneABir015_lib1-Ex1-10G-lcwgs-1-1.2.fq.gz                                 100%  227MB 97.3Mb/s    01:25    
    SneABir006_lib2-Ex1-9F-lcwgs-1-2.2.fq.gz                                  100%   91MB 97.3Mb/s    01:33    
    SneABir008_lib1-Ex1-9H-lcwgs-1-1.2.fq.gz                                   42%   21MB 97.2Mb/s    00:02 ETA
    ```
    * Files will not upload if your computer shuts off. If your connection breaks, simply rerun the command and it will pick up where it left off.
* Once your files have all uploaded, you can go back to the SRA submission page and click the blue "Select preload folder" button. You should see your folder name here. (Note: it takes about 10 minutes for files to appear on NCBI.) 
* Click Continue. If any files are missing, you will be notified.

<ins>**8> Review and Submit**</ins>

* Make sure everything looks good and you are ready to submit!
* Within a few minutes, you should recieve an email notifying you that your submission has been successfully registered with the BioProject Database. It will also contain your BioProject ID, which you can also find on your [NCBI Submission Portal](https://submit.ncbi.nlm.nih.gov/subs/sra/), under status (begins with PRJNA).

**ERRORS:** It may happen that a few days after you submit your data, you may be notified that some of your files were corrupted and could not be processed. To fix this, you need to create a new directory specifically for these re-uploads in your home dir, and redownload each file that was corrupted into it. Files should be downloaded from its earliest source, so wherever it was stored immediately off of the sequencer– not from the fq_raw directory. Each file should be renamed to exactly match what was uploaded to NCBI. Once these files are copied+renamed, rerun the aspera command, replacing your directory name with your new one containing the re-uploads. Select this folder within the SRA Submission, and resubmit.


</details>

<details><summary>IV. Tracking Progress</summary>

### Tracking Progress:

Like with GEOME, track your progress on the [Sequence_info_sheet](https://olddominion.sharepoint.com/:x:/r/sites/CarpenterMolecularLab/_layouts/15/Doc.aspx?sourcedoc=%7B96577AF0-69E8-48F5-A3BD-0990B8285C27%7D&file=Sequence_info_sheet.xlsx&action=default&mobileredirect=true) (filepath: Database/Sequence_info_sheet.xlsx). 

Fill out: "NCBI_Bioproject_Accession_Number", "NCBI_Project_Title", and "NCBI_Data_Public?" (likely no).

**Now you have successfully uploaded your data to NCBI/GEOME!**

You can safely remove the folder housing your renamed files from your home directory.
```
[hpc-0373@wahab-01 ~]$ rm -rf Sne_1909_Biri_Northern-Samar_lcwgs/
```
</details>

---
</details>

<details><summary>C. Uploading Genotype Likelihoods to Github or Zenodo</summary>

## Uploading Genotype Likelihoods

[Zenodo](https://zenodo.org/) is an online repository that we will use to store genotype likelihood files that are too large for Github. For smaller files, GitHub remains the preferred storage method.

### Getting Started:

First, locate your genotype likelihood file. This will be the `angsd_depth1_15_notrans.beagle.gz` file generated during the ANGSD pipeline.
```
(model)
cd /archive/carpenterlab/pire/pire_<species_name>_lcwgs/<ANGSD_directory>
ls angsd_depth1_15_notrans.beagle.gz

(example)
[hpc-0373@wahab-01 ~]$ cd /archive/carpenterlab/pire/pire_atherinomorus_duodecimalis_lcwgs/ANGSD_Adu_Dba
[hpc-0373@wahab-01 ANGSD_Adu_Dba]$ ls angsd_depth1_15_notrans.beagle.gz
angsd_depth1_15_notrans.beagle.gz
```

Next, check the file size. If it is under 100M = We will upload to Github. If it is over 100M = We will upload to Zenodo. 
```
(model)
ls -lh angsd_depth1_15_notrans.beagle.gz

(example)
[hpc-0373@wahab-01 ANGSD_Adu_Dba]$ ls -lh angsd_depth1_15_notrans.beagle.gz
-rw-r--r-- 1 hpc-0373 carpenter 2.4M May  1 20:24 angsd_depth1_15_notrans.beagle.gz
```

Click on the applicable route based on your file size.

<details><summary>Uploading to Github:</summary>

### Uploading to Github (files <100M):

First, move to the species directory and open the `.gitignore` file:
```
(model)
cd /archive/carpenterlab/pire/pire_<species_name>_lcwgs
nano .gitignore

(example)
[hpc-0373@wahab-01 ANGSD_Adu_Dba]$ cd ..
[hpc-0373@wahab-01 pire_atherinomorus_duodecimalis_lcwgs]$ nano .gitignore
```

Now, we want to add a negation rule to make an exception for this specific beagle file. At the end of the `.gitignore` file, comment out what you are doing, and then paste the beagle filepath (starting from your current dir) following an "!":
```
(model)
# Allow genotype likelihood file to be tracked
!<angsd_dir>/angsd_depth1_15_notrans.beagle.gz

(example)
# Allow genotype likelihood file to be tracked
!ANGSD_Adu_Dba/angsd_depth1_15_notrans.beagle.gz
```

Track the changes made to the gitignore file:
```
git pull
git add .gitignore
git commit -m "adding exception rule to gitignore for genotype likelihood file"
git push
```
Now, track the beagle file:
```
git add ANGSD_Adu_Dba/angsd_depth1_15_notrans.beagle.gz
git commit -m "tracking genotype likelihood file"
git push
```
Check your github repo to make sure the file was uploaded. If so, you're all set.

</details>

<details><summary>Uploading to Zenodo:</summary>

### Uploading to Zenodo (files >100M):

For larger files, we will download them  to our local device, upload them to Zenodo, and track this info on the species repo. 

First, note the absolute filepath to your genotype likelihood file:
```
(model)
/archive/carpenterlab/pire/pire_<species_name>_lcwgs/<angsd_dir>/angsd_depth1_15_notrans.beagle.gz

(example)
/archive/carpenterlab/pire/pire_zenarchopterus_dispar_lcwgs/angsd_analysis/angsd_depth1_15_notrans.beagle.gz
```

Now we are going to download this to our device, adding the species code to the downloaded file name:
```
(model)
logout
scp <usrname>@wahab.hpc.odu.edu:<file path> <destination path>/<Spp>_angsd_depth1_15_notrans.beagle.gz

(example)
[hpc-0373@wahab-01 angsd_analysis]$ logout
Connection to wahab.hpc.odu.edu closed.
(base) Giannas-Laptop:~ giannamazzei$ scp hpc-0373@wahab.hpc.odu.edu:/archive/carpenterlab/pire/pire_zenarchopterus_dispar_lcwgs/angsd_analysis/angsd_depth1_15_notrans.beagle.gz ~/Desktop/Zdi_angsd_depth1_15_notrans.beagle.gz
```

Next, go to [Zenodo](https://zenodo.org/).
* For new/returning users, click "Log In" in the upper right corner. Choose "Sign In with GitHub".
* Once registered/signed in, click the plus sign "+" icon in the upper right by your username and choose "New Upload".
* Click "Upload Files" and choose the beagle file you just downloaded to your computer.

### Filling out identifying information:

<ins>**Basic Information:**</ins>

- Digital Object Identifier- Do you already have a DOI for this upload? **No, I need one**
  - Click "Get One Now"
- Resource type: **Dataset**
- Title: **-Species name- Beagle File**
  - ex. Zenarchopterus dispar Beagle File
- Publicaton Date: **Current date**
- Creators: **Add Creator**
  - In this section, you will first add the lead researcher who ran the bioinformatics pipeline.
    - Family Name: **Last Name**
    - Given Name: **First Name**
    - Affiliations: **University**
    - Role: **Data Curator**
  - Now, you will add information for the following people. You can manually add this information, or use the "Search for persons by name, identifier, or affiliation..." search bar. If you use the search feature, you will need to update the university affiliation for Malin and Brendan.
    - **Kent Carpenter, Old Dominion University, ORCID 0000-0003-3618-1811**
    - **Malin Pinsky, University of California Santa Cruz, ORCID 0000-0002-8523-8952**
    - **Christopher E Bird, Texas A&M Corpus Christi, ORCID 0000-0003-0228-3318**
    - **Brendan Reid, University of California Santa Cruz, ORCID 0000-0003-4063-3956**
- Description: **Beagle file of genotype likelihoods produced by ANGSD from samples of -Species name- from the Philippines.**

<ins>**Recommended Information:**</ins>

- Keywords and Subjects: **temporal genomics**

<ins>**Funding:**</ins>

- "+ Add Custom"
  - Funder: **US National Science Foundation**
  - Number: **OISE-1743711**
  - Title: **Centennial Genetic and Species Transformations in the Epicenter of Marine Biodiversity**

- "+ Add Custom"
  - Funder: **US National Science Foundation**
  - Number: **DEB-2343787**
  - Title: **Collaborative Research: The Albatross Re-Collection Project for a Century of Genomic Change in the Tropics**

<ins>**Software:**</ins>

- Repository URL: **github URL**
  - ex. https://github.com/philippinespire/pire_zenarchopterus_dispar_lcwgs

### Publishing:

Once everything has been filled out, you can click the green "Publish" button.

</details>


### Tracking Progress:

In either case of file upload to Github or Zenodo, we need to link to this dataset in the main README for the species. 

Navigate to Github and find your species README.

In it, add a link to either the file on github:
  - ex: https://github.com/philippinespire/pire_atherinomorus_duodecimalis_lcwgs/blob/main/ANGSD_Adu_Dba/angsd_depth1_15_notrans.beagle.gz

Or the Zenodo DOI:
  - ex: https://doi.org/10.5281/zenodo.17172692

Finally, make sure this README is public.

Now you have successfully uploaded and tracked your genotype likelihood file!

---
</details>


