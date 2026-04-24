# Overview

The repository containing the trimming pipelines can be found [here](https://github.com/mariannedehasque/nf-pipelines). 
The repository currently consists of two [Nextflow](https://docs.seqera.io/nextflow/?__hstc=247481240.5e236d06d40f5c07b684bebe05a3bff7.1775773721928.1775773721928.1775773721928.1&__hssc=247481240.1.1775773721928&__hsfp=1dbfca35ae9c86ca845864df4d857622) pipelines:
- nf-trim-merged-unmerged
- nf-angsd-diversity
  
> **Note:** These pipelines are currently under active development.

## Quick Start
1.  **Clone the repo:** `git clone https://github.com/mariannedehasque/nf-pipelines.git`
2.  **Verify Environment:** Ensure you have a personal Miniconda installation.
3.  **Calculate Read Length:** Run the `samtools` command provided below to prepare your variables.
4.  **Execute:** Run the pipelines in order (`nf-trim-merged-unmerged` then `nf-angsd-diversity`).

## Installation

### GitHub repository

To install a template of the repository use the following command:

```bash

git clone https://github.com/mariannedehasque/nf-pipelines.git

```

This will install the following directories:

```
nf-pipelines/
├── nf-trim-merged-unmerged/  # Step 1: Trimming
├── nf-angsd-diversity/       # Step 2: Analysis
├── environments/             # Conda environment files
├── docs/                     # Additional documentation
└── README.md

```
### Conda

The pipelines manage dependencies via Conda. On the WAHAB HPC, you must use a personal Miniconda installation. Installation instruction for miniconda (my personal favorite) and how to use it can be found [here](https://www.anaconda.com/docs/getting-started/miniconda/main).

**Important** You must be in the *bash* shell to activate conda environments installed with miniconda. If you are in a different shell, switch by typing:

```bash
bash
```

## Before running the pipelines

To calculate the average readlength for bamfiles, the following scripts can be used on the WAHAB cluster:

```bash
# Define the samtools image path
# Alternatively, you can also load samtools as a module and adjust the command below
samtools_image=$docker/biocontainers-samtools:v1.9-4-deb_cv1.sif 

# Run calculation
singularity exec $samtools_image samtools view -h -q 25 -L $BED $INPUT_BAM	| grep -v '@' | awk '{print length($10)}'|  awk '{ total += $1; count++ } END { print total/count }' > $DIR/results/${NAME}.Q25.avRL.txt
```

Variable definitions:
| Variable | Description | Example Value |
| :--- | :--- | :--- |
| **DIR** | Path to directory containing BAMs | `/archive/carpenterlab/pire/marianne/pire_taeniamia_zosterophora_annotation/Generode_20k/results/historical/mapping/reference.denovoSSL.Tzo20k` |
| **NAME** | Sample identifier | `ABol001` |
| **INPUT_BAM** | Name of the source BAM file | `ABol001.merged.rmdup.merged.realn.bam` |
| **BED** | Regions to include (e.g., repeatmasked) | `/archive/carpenterlab/pire/marianne/pire_taeniamia_zosterophora_annotation/Generode_20k/reference/reference.denovoSSL.Tzo20k.repma.bed` |

>Setup Tip: Ensure your output directory ($DIR/results/) exists before running the command, otherwise the redirect will fail.

## Running the pipelines

The workflows are designed to be run sequentially. Click the links below for detailed instructions in each sub-directory:
1. [nf-trim-merged-unmerged]([./nf-trim-merged-unmerged/README.md](https://github.com/mariannedehasque/nf-pipelines/blob/main/nf-trim-merged-unmerged/readme.md)): Initial trimming of merged/unmerged reads
2. [nf-angsd-diversity]([./nf-angsd-diversity/README.md](https://github.com/mariannedehasque/nf-pipelines/blob/main/nf-angsd-diversity/readme.md)): Downstream diversity analysis
   
