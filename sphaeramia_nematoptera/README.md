# Sphaeramia nematoptera lcWGS

---

Jem Baldisimo

---
This repository outlines the roadmap we followed to move *Sphaeramia nematoptera* through the [Low Coverage Whole Genome Sequencing Pipeline](https://github.com/philippinespire/pire_lcwgs_data_processing). This builds on previous work already done by Jordan Rodriguez for analyzing lcWGS for [*Salarias fasciatus*](https://github.com/philippinespire/pire_lcwgs_data_processing/tree/main/salarias_fasciatus). This provides steps taken & analysis we did to gain insight on the historical population demography of this very popular aquarium fish, also known as the pajama cardinalfish.

---

## 1. Completed fq.gz pre-processing

The [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing) instructions and scripts (Garcia et al 2021) were used. The purpose of the preprocessing pipeline was to Trim, deduplicate, decontaminate, and repair the raw `fq.gz` files.

<details><summary><i>Checked quality of data using Multi_FASTQC</i></summary>
<p>



 Multi_FASTQC [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/fq_raw_lcwgs/fqc_raw_report.html)
```
Potential issues:
 * duplication - moderate to high, but only for 1-3 individuals
   * Alb: 17.8-60%, Contemp: 10.4-71%
 * gc content - reasonable
   * 48-62%
 *number of reads
   *Albatross - 24-91.9 M; Contemporary - 1.5-75.8 M
```
</p>
</details>

<details><summary><i>1st trim</i></i></summary>
<p>

 1st FASTP [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/fq_fp1/1st_fastp_report.html)
```
Potential issues:
 * duplication - moderate to high, but only for 1-3 individuals
   * Alb: 13-43%, Contemp: 7-30%, one w/ 69%
 * gc content - reasonable
   * Alb: 36-65%, Contemp: 37-41%
 * Passing filter
   * Alb: 77-96%, Contemp: 74.5-98%%
 * % adapter 
   * Alb: 39.8-87.1%, Contemp: 29-64.7%%
 * number of reads
   * Albatross - 49-175 M, at least 50 M for majority; Contemp - 2-275 M, less reads for Contemporary
```
</p>
</details>

<details><summary><i>Clumpify</i></summary>
<p>

 Clumpify [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/fq_fp1_clmp/fqc_clmp_report.html)

```
bash ../../pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/jbald004 20
#copied the checkClumpify_EG.R file to the fq_fp1_clmp folder after running clumpify
cp /home/e1garcia/shotgun_PIRE/pire_cssl_data_processing/leiognathus_equula/fq_fp1_clmp/checkClumpify_EG.R .
#ran checkClumpify_EG.R in the fq_fp1_clmp folder
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/fq_fp1_clmp
salloc
enable_lmod
module load container_env mapdamage2
crun R <checkClumpify_EG.R --no-save
```
Clumpify worked well so I moved on to the next step
</p>
</details>

<details><summary><i>2nd Trim</i></summary>
<p>

```
sbatch ../../pire_fq_gz_processing/runFASTP_2_cssl.sbatch fq_fp1_clmp fq_fp1_clmp_fp2
```

Fastp2 [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/fq_fp1_clmp_fp2/2nd_fastp_report.html)
```
Potential issues:
  * % duplication -
    * Alb: 2-11%, Contemp: 0.7-28%
  * GC content -
    * Alb: 36.2-65%, Contemp: 37.3-41.8%
  * passing filter -
    * Alb: 98.5-99.2%, Contemp: 98.6-99.4%
  * % adapter -
    * Alb: 0.5-1.1%, Contemp: 0.5-1.7%
  * number of reads -
    * Alb: 34-105 mil, Contemp: 1-173 mil
```
</p>
</details>

<details><summary><i>Checked Fastqscreen files</i></summary>
<p>
 MultiQC [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/fq_fp1_clmp_fp2_fqscrn/fastq_screen_report.html)

```
Potential issues:
  * one hit, one genome, no ID -
     Alb: 43-92%, Contemp: 93-94%
  * no one hit, one genome to any potential contaminators (bacteria, virus, human, etc) -
    * Alb: 3.7-21%, Contemp: 1.9-7%%
```
</p>
</details>


<details><summary><i>Reviewed Fastqscreen repaired files</i></summary>
<p>
MultiQC [Report](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/fq_fp1_clmp_fp2_fqscrn_rprd/fqc_rprd_report.html)

 ```
Potential issues:
  * % duplication -
     Alb: 3-30%, Contemp: 0.8-22.4%
  * GC content -
    * Alb: 36-61%, Contemp: 37-41%
  * number of reads -
    * Alb: 4.5-31.9 mil, Contemp: 0.5-79.0 mil
```
</p>
</details>

---

## 2. Copied the Reference Genome into the species folder

I made the refGenome folder in the directory and copied the genome assembled from the SSL processing repo for this species.

---
## 3. Mapped & Filtered BAM files

Created mkBAM folder & linked fq.gz files from fq_fp1_clmp_fp2_fqscrn_repaired:

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera
mkdir mkBAM
ln fq_fp1_clmp_fp2_fqscrn_repaired/*fq.gz mkBAM
```

Copied dDocent config file & edited it to suit the lcwgs data
```
cp ../../../dDocentHPC/configs/config.6.cssl .
mv config.6.cssl config.6.lcwgs
```

After changing the settings, I executed this command:
```
sbatch ../../../dDocentHPC/dDocentHPC_dev2.sbatch mkBAM config.6.lcwgs
```

To filter resulting BAM files, I executed the following command:
```
sbatch ../../../dDocentHPC/dDocentHPC_dev2.sbatch fltrBAM config.6.lcwgs
```
---
## 4. Visualised results using the Process Sequencing Metadata Repo
I followed Kevin's repo for [Process Sequencing Metadata](https://github.com/philippinespire/process_sequencing_metadata).

Results are uploaded in my folder:
```
cd /home/jbald004/process_sequencing_metadata/out/lcwgs_Sne
```

Graphs showed information on depth of coverage for both Albatross & Contemporary

## 5. GenErode, a bioinformatics pipeline to investigate genome erosion
I followed Brendan's repository for processing Salarias fasciatus [here](https://github.com/philippinespire/pire_lcwgs_data_processing/tree/main/salarias_fasciatus/1st_sequencing_run/GenErode_Sfa_full)

More specifically, here's what I did:

<details><summary><i>Set-up GenErode_Sne_full folder:</i></summary>
<p>

```
#copied the GenErode template directory from Wahab
cp -r /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/GenErode_templatedir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/GenErode_Sne_full

#made directories within my new folder
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/GenErode_templatedir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/GenErode_Sne_full
mkdir config
mkdir historical
mkdir modern
mkdir reference
```
</p>
</details>

<details><summary><i>Copied the files needed under each folder:</i></i></summary>
<p>

```
#historical folder
cd historical
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/fq_raw_lcwgs/Sne-ATaw*.fq.gz .

#modern folder
#navigated to modern/
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/fq_raw_lcwgs/Sne-CTaw*.fq.gz .

#reference
#navigated to reference folder & then copied the reference fasta file under refGenome
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/refGenome/*.fasta .
```

</p>
</details>

<details><summary><i>Removed mitochondrial scaffold:</i></i></summary>
<p>

```
#navigate to the GenErode reference folder
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/GenErode_Sne_full/reference

awk '/mitochondrion/{stop=1} stop==0{print}' < Sne_scaffolds_allLibs_decontam_R1R2_noIsolate.fasta >> Sne_scaffolds_allLibs_decontam_R1R2_noIsolate2.fasta

sed 's/ .*//g' Sne_scaffolds_allLibs_decontam_R1R2_noIsolate2.fasta >Sne_scaffolds_allLibs_decontam_R1R2_noIsolate3.fasta

#renamed the final fasta file to have 'rename' on file name instead of '3' to be consistent with how Brendan did it
mv Sne_scaffolds_allLibs_decontam_R1R2_noIsolate3.fasta Sne_scaffolds_allLibs_decontam_R1R2_noIsolate_rename.fasta

#deleted the other interim files
rm Sne_scaffolds_allLibs_decontam_R1R2_noIsolate.fasta
rm Sne_scaffolds_allLibs_decontam_R1R2_noIsolate2.fasta
```
</p>
</details>

<details><summary><i>Got outgroup genome files & made a Newick tree:</i></i></summary>
<p>

S. nematoptera is under the Apogonidae family so on GenBank, I did a search for chromosome level assemblies and found assemblies for fishes under Kurtiformes, Gobiaria, and Eupercaria to find almost 30 species with chromosome level genome assemblies. My list of species is uploaded [here](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/GenErode_Sne_full/Speciesnames.txt) and my decode file can be found [here](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/GenErode_Sne_full/SpeciesSequenceDecode.txt)

I made the Newick tree by uploading my species list, but then I found that Cottoperca gobio, Epinephelus moara, and Siphamia tubifer could not be found, so I did not upload the genomes of these species on to the gerp_outgroups folder.
To get the Newick tree:
* upload the list of species names to timetree.org ("Load a List of Species" at the bottom)
* download in Newick format
* upload file to analysis folder (GenErode_Sne_full)

Then, rename the focal species w/ the name of the reference assembly file:
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/GenErode_Sne_full
sed -i 's/Sphaeramia_nematoptera/Sne_scaffolds_allLibs_decontam_R1R2_noIsolate_rename.fasta/g' gerp_tree.nwk

</p>
</details>

<details><summary><i>Copy and Edit Config files:</i></i></summary>
<p>

```
#Copy the test file you need to edit and change file name to config.yaml
cp /home/breid/GenErode_testdata/config/config_sum_rhino.yaml /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/GenErode_Sne_full//config.yaml
```

Edited the files to provide the path info for historic samples & modern samples. My files can be found in the [config](https://github.com/philippinespire/pire_lcwgs_data_processing/tree/main/sphaeramia_nematoptera/GenErode_Sne_full/config) folder

I made edits to the config file based on Brendan's recommendations & my final config file can be found [here](https://github.com/philippinespire/pire_lcwgs_data_processing/blob/main/sphaeramia_nematoptera/GenErode_Sne_full/config/config.yaml)

</p>
</details>

<details><summary><i>Run GenErode:</i></i></summary>
<p>

To run GenErode, you need to copy the sbatch file & run it in your analysis folder:
```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/run_GenErode.sbatch /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/GenErode_Sne_full
#navigate to analysis folder
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/GenErode_Sne_full/
#run the sbatch file
sbatch run_GenErode.sbatch 
```
</p>
</details>
