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


# Check if output directory exists, create if not.
if [ ! -d ${OUTDIR} ]; then
	mkdir -p ${OUTDIR}
fi

# Loop through each FASTQ file in the input directory
for fastq_file in "$INDIR"/*.fastq; do

	# Get the filename without the path
	filename=$(basename "$fastq_file")

	# Compress the FASTQ file and save it to the output directory
	gzip -c "$fastq_file" > "$OUTDIR/${filename%.fastq}.fastq.gz"
done

echo "Compression complete."










