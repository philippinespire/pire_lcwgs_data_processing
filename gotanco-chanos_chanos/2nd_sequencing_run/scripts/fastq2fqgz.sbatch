#!/bin/bash

# This script will compress the output of fastq_screen, from *.fastq to *.fq.gz

#SBATCH --job-name=fq2gz
#SBATCH --exclusive
#SBATCH -c 32
#SBATCH --partition=main

#Input directory
INDIR=$1

#Output directory
OUTDIR=$2

#No. of parallel jobs
NUM_JOBS=$3

export SINGULARITY_BIND=/home/e1garcia


find "$INDIR" -name '*.fastq' | \
	parallel -j "$3" --no-notice "gzip {} && mv {}.gz $OUTDIR"













