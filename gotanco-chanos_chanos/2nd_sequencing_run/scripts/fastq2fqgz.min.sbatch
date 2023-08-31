#!/bin/bash

# This script will compress the output of fastq_screen, from *.fastq to *.fq.gz

#SBATCH --job-name=fq2gz
#SBATCH --exclusive
#SBATCH -c 40
#SBATCH --partition=main

#Input directory
INDIR=$1

#Output directory
OUTDIR=$2


export SINGULARITY_BIND=/home/e1garcia



for f in "$INDIR/"*.fastq; do 
	echo "pigz -c $f > $OUTDIR/$(basename $f).gz"
	pigz -c "$f" > "$OUTDIR/$(basename $f).gz"

	sleep 30

	rm "$f"    # uncomment this if you want remove the original unzipped file
done













