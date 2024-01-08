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

For a chromosome scale genome, rename the chromosomes in the FASTA files to be intuitive (chr01, chr01, ...) while retaining the accession number

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

or copy from the location where it was constructed.  We make several genomes and choose the best to make probes from for cssl and to map against.  If probes have been made for this species then we probably want to use that genome.  You can look in the probes repo to see which genome was used, then copy it from the `pire_ssl_data_processing` repo.

```bash
# in house ssl genomes are in the 
cp locationofrefgenome .
```

---

</p>
</details>


<details><summary>4. Map your reads to your reference genome</summary>
<p>

## 4. Map your reads to your reference genome

this will take the fq.gz files you specify and map them to the reference genome that you specify

```bash
#sbatch mkBAMwgs.sbatch InFilePattern RefGenomeFile OutDir
sbatch ./scripts/mkBAMlcwgs.sbatch "./fq_fp1_clmp_fp2b_fqscrn_rprd/*.fq.gz" ./GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz ./mkBAM
```

---

</p>
</details>


<details><summary>5. Filter the binary alignment maps</summary>
<p>

## 5. Filter the binary alignment maps

The fltrBAM script will remove unmapped reads, secondary and supplementary alignments, reads with mapping q <=30

```bash
#sbatch fltrBAMwgs.sbatch DirWithBamFiles
sbatch ../scripts/fltrBAMwgs.sbatch mkBAM
```

---

</p>
</details>


<details><summary>6. Summarize Read Mapping Performance</summary>
<p>

## 6. Summarize Read Mapping Performance

coming soon!

```bash

```

---

</p>
</details>


<details><summary>7. Make a Beagle File with Angsd</summary>
<p>

## 7. Make a Beagle File with Angsd

```bash

---

</p>
</details>


<details><summary>8. Use PCAngsd to Visualize Your Data</summary>
<p>

## 8. Use PCAngsd to Visualize Your Data

[see notes on using angsd and related program on ODU hpcs](angsd_on_wahab_turing.md)

Coming soon!

```bash

```

---

</p>
</details>

---
