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

For chromosome-scale genomes taken from GenBank, it is a good idea to remove any scaffolds representing the mitochondrial genome first (if any are identified as such– unlikely).

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
cp /home/e1garcia/shotgun_PIRE/REUs/2022_REU/PSMC/scripts/removesmalls.pl .

#for ssl in-house:
perl removesmalls.pl 20000 <filename of ssl assembly> > reference.denovoSSL.<speciescode>.20k.fasta

#for ncbi:
perl removesmalls.pl 20000 <filename of ncbi genome> > reference.genbank.<speciescode>.20k.fasta
```

Now, make sure it worked. Check the length of the filtered assembly, which tells you the number of scaffolds left after filtering, and compare it to the pre-filtered genome:
```
# filtered:
cat reference.genbank.<speciescode>.20k.fasta | grep "^>" | wc -l
2841

# original:
cat reference.genbank.<speciescode>.fasta | grep "^>" | wc -l
69922
```

---

</p>
</details>


<details><summary>4. (optional) Map your reads to your reference genome</summary>
<p>

## 4. (optional) Mapping your reads to your reference genome with dDocent.

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
[hpc-0356@wahab-01 mkBAM_ddocent]$ nano config.6.lcwgs

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
[hpc-0356@wahab-01 mkBAM_ddocent]$ nano dDocentHPC.sbatch

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


<details><summary>5. (optional) Filter the binary alignment maps</summary>
<p>

## 5. (optional) Filter the binary alignment maps

Again, use dDocent.

```
bash
sbatch dDocentHPC.sbatch fltrBAM config.6.lcwgs
```

---

</p>
</details>


<details><summary>6. (optional) Summarize Read Mapping Performance</summary>
<p>

## 6. (optional) Summarize Read Mapping Performance / Merge Runs

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

<details><summary>10. (Optional) Extract mitochondrial genomes from lcwgs data using MitoZ.</summary>
<p>

## 10. (Optional) Extract mitochondrial genomes from lcwgs data using MitoZ.

It may be useful to extract mitochondrial sequences from lcwgs data to confirm species identity. See the [MitoZ](https://github.com/philippinespire/pire_lcwgs_data_processing/tree/main/scripts/MitoZ_wahab) folder for more information.

---

</p>
</details>
