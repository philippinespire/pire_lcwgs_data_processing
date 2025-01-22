# pire_lcwgs_data_processing

---

# Steps to Process Your Data

---

<details><summary>1. Complete `fq.gz` preprocessing</summary>
<p>


## 1. Complete fq.gz preprocessing

goto the [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing) repo and complete the steps then return here

---

</p>
</details>


<details><summary>2. Get your reference genome</summary>
<p>

## 2. Get your reference genome

Goto your species dir, make a new directory `refGenome`, and `cd` into it

```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/<Genus_species>
mkdir refGenome
cd refGenome
```

then either download from ncbi (example is given for Salarias fasciatus):

```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/<Genus_species>


# Download the genome
wget https://ftp.ncbi.nih.gov/genomes/refseq/vertebrate_other/Salarias_fasciatus/all_assembly_versions/GCF_902148845.1_fSalaFa1.1/GCF_902148845.1_fSalaFa1.1_genomic.fna.gz

# get the line num for every chrom, contig, and scaffold in the genome download and save to file
zgrep -n '^>' GCF_902148845.1_fSalaFa1.1_genomic.fna.gz > GCF_902148845.1_fSalaFa1.1_genomic_linenums.txt

# get mitogenome, which starts on line 9968937, and save to file
zcat GCF_902148845.1_fSalaFa1.1_genomic.fna.gz | tail -n +9968937 > NC_004412.1_mtgenome.fasta

# get chromes 1-7 and save to file
zcat GCF_902148845.1_fSalaFa1.1_genomic.fna.gz | head -n 3077487 > NC_043745.1-NC_043751.1_chr1-7.fasta

# get chromes 8-23, theres no 21, and save to file
zcat GCF_902148845.1_fSalaFa1.1_genomic.fna.gz | tail -n +3431318 | head -n 5857623 > NC_043752.1-NC_043766.1_chr8-23.fasta

# concatenating and gzipping the chromosomes and mitogenome into one file
cat NC_043745.1-NC_043751.1_chr1-7.fasta NC_043752.1-NC_043766.1_chr8-23.fasta NC_004412.1_mtgenome.fasta | gzip > GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz
```

or copy from the location where it was constructed.  We make several genomes and choose the best to make probes from for cssl and to map against.  If probes have been made for this species then we probably want to use that genome.  You can look in the probes repo to see which genome was used, then copy it from the `pire_ssl_data_processing` repo.

```bash
# in house ssl genomes are in the 
cp locationofrefgenome .
```

---

</p>
</details>


<details><summary>3. Curate the reference genome</summary>
<p>

## 3. Curate the reference genome

Before embarking upon mapping, it is a good idea to curate your reference genome. 

For a chromosome scale genome, rename the chromosomes in the FASTA files to be intuitive (chr01, chr01, ...) while retaining the accession number.

For chromosome-scale genomes taken from GenBank, it is a good idea to remove any scaffolds representing the mitochondrial genome first.

```bash
# Download the genome
wget https://ftp.ncbi.nih.gov/genomes/refseq/vertebrate_other/Salarias_fasciatus/all_assembly_versions/GCF_902148845.1_fSalaFa1.1/GCF_902148845.1_fSalaFa1.1_genomic.fna.gz

# get the line num for every chrom, contig, and scaffold in the genome download and save to file
zgrep -n '^>' GCF_902148845.1_fSalaFa1.1_genomic.fna.gz > GCF_902148845.1_fSalaFa1.1_genomic_linenums.txt

# get mitogenome, which starts on line 9968937, and save to file
zcat GCF_902148845.1_fSalaFa1.1_genomic.fna.gz | tail -n +9968937 > NC_004412.1_mtgenome.fasta

# get chromes 1-7 and save to file
zcat GCF_902148845.1_fSalaFa1.1_genomic.fna.gz | head -n 3077487 > NC_043745.1-NC_043751.1_chr1-7.fasta

# get chromes 8-23, theres no 21, and save to file
zcat GCF_902148845.1_fSalaFa1.1_genomic.fna.gz | tail -n +3431318 | head -n 5857623 > NC_043752.1-NC_043766.1_chr8-23.fasta

# concatenating and gzipping the chromosomes and mitogenome into one file
cat NC_043745.1-NC_043751.1_chr1-7.fasta NC_043752.1-NC_043766.1_chr8-23.fasta NC_004412.1_mtgenome.fasta | gzip > GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz
```

...or, you can copy from the location where we constructed a draft reference genome from SSL data.  We make several genomes and choose the best to make probes from for cssl and to map against.  If probes have been made for this species then we probably want to use that genome.  You can look in the probes repo to see which genome was used, then copy it from the `pire_ssl_data_processing` repo.

```bash
# in house ssl genomes are in the 
cp locationofrefgenome .
```

In-house SSL genomes will contain many small scaffolds that may increase processing time or make processing impossible for some applications (i.e. GenErode). To remove these scaffolds, you can use the [removesmalls.pl](https://github.com/philippinespire/REUs/blob/master/2022_REU/PSMC/scripts/removesmalls.pl) script. We generally remove scaffolds <20kbp in length. This should also remove any mitochondrial scaffolds.

```
perl ../scripts/removesmalls.pl 20000 <speciescode>_shotgun_assembly.fa > reference.denovoSSL.<speciescode>20k.fasta
```

---

</p>
</details>


<details><summary>4. (Optional) Map your reads to your reference genome</summary>
<p>

## 4. (Optional) Mapping your reads to your reference genome with dDocent.

To do a simple mapping of reads to the reference, you can use dDocent. Note that our preferred method of mapping for use in downstream analyses is now to use the GenErode pipeline (see below).

```bash
git clone https://github.com/cbirdlab/dDocentHPC

mkdir mkBAM_ddocent

#copy fq.gz to mkBAM_ddocent folder
rsync fq_fp1_clmp_fp2_fqscrn_rprd/*fq.gz mkBAM_ddocent

#copy reference genome to mkBAM_ddocent folder. naming convention: reference.[type: denovoSSL/GenBank].[speciescode].fasta
#example for Hte
cp refGenome/Hte_final_best_assembly.fasta mkBAM_ddocent/reference.denovoSSL.Htebest.fasta

cd mkBAM_ddocent
cp ../dDocentHPC/configs/config.6.lcwgs .
cp ../dDocentHPC/dDocentHPC.sbatch .

# edit config.6, make sure sbatch pointing to correct bash
# make sure the correct version of the ddocent container (2.9.4) is being loaded by the sbatch file -  can comment/uncomment lines in sbatch to fix if not.

sbatch dDocentHPC.sbatch mkBAM config.6.lcwgs
```
---

</p>
</details>


<details><summary>5. (Optional) Filter the binary alignment maps</summary>
<p>

## 5. (Optional) Filter the binary alignment maps

Again, use dDocent.

```bash
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

<details><summary>10. (Optional) Extract mitochondrial genomes from lcwgs data using MitoZ.
<p>

## 10. (Optional) Extract mitochondrial genomes from lcwgs data using MitoZ.

It may be useful to extract mitochondrial sequences from lcwgs data to confirm species identity. See the [MitoZ](https://github.com/philippinespire/pire_lcwgs_data_processing/tree/main/scripts/MitoZ_wahab) folder for more information.

---

</p>
</details>
