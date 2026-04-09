# Overview

The repository containing the trimming pipelines can be found [here](https://github.com/mariannedehasque/nf-pipelines). 
The repository currently consists of two [Nextflow](https://docs.seqera.io/nextflow/?__hstc=247481240.5e236d06d40f5c07b684bebe05a3bff7.1775773721928.1775773721928.1775773721928.1&__hssc=247481240.1.1775773721928&__hsfp=1dbfca35ae9c86ca845864df4d857622) pipelines:
- nf-trim-merged-unmerged
- nf-angsd-diversity
These pipelines are still actively being developed.

# Installation

## GitHub repository

To install a template of the repository use the following command:

```bash
git clone https://github.com/mariannedehasque/nf-pipelines
```

This will install the following directories:

```
nf-pipelines/
├── README.md
├── docs/
├── environments/
├── nf-angsd-diversity/
└── nf-trim-merged-unmerged/

```
## Conda

The nextflow pipelines will install custom packages through conda. For this to work on WAHAB HPC, the installation of a personal conda installation is necessary. Installation instruction for miniconda (my personal favorite) and how to use it can be found [here](https://www.anaconda.com/docs/getting-started/miniconda/main).

# Running the pipelines

The pipelines are ran in the following order:
1. nf-trim-merged-unmerged
2. nf-angsd-diversity
   
Detailed instructions on how to run the pipelines are given in the respective directories.
