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


---

## 4. Map your reads to your reference genome

```bash
#sbatch mkBAMwgs.sbatch InFilePattern RefGenomeFile OutDir
sbatch mkBAMwgs.sbatch ./fq_fp1_clmp_fp2b_fqscrn_rprd/*R1.fq.gz ./GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz ./mkBAM
```

---

## 5. Filter the binary alignment maps


---
