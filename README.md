# pire_lcwgs_data_processing

---

## 1. Setting up

make a directory for this project, it should have the species name and lcwgs

```bash
mkdir species_genus_lcwgs
cd species_genus_lcwgs
```

then transfer the raw fq.gz files into your directory

```bash
rsync locationWhereFilesAre fq_raw
```

---

## 2. Complete fq.gz preprocessing

goto the [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing) repo and complete the steps then return here

---

## 3. Get your reference genome

Either download from ncbi (example is given for Salarias fasciatus):

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

or copy from the location where it was constructed

```bash
cp locationofrefgenome .
```

---

## 4. Map your reads to your reference genome

this will take the fq.gz files you specify and map them to the reference genome that you specify

```bash
#sbatch mkBAMwgs.sbatch InFilePattern RefGenomeFile OutDir
sbatch mkBAMwgs.sbatch "./fq_fp1_clmp_fp2b_fqscrn_rprd/*.fq.gz" ./GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz ./mkBAM
```

---

## 5. Filter the binary alignment maps

The fltrBAM script will remove unmapped reads, secondary and supplementary alignments, reads with mapping q <=30

```bash
#sbatch fltrBAMwgs.sbatch DirWithBamFiles
sbatch fltrBAMwgs.sbatch ./mkBAM
```
---

## 6. Summarize Read Mapping Performance

coming soon!

---

## 7. PCAngsd

Coming soon!

---
