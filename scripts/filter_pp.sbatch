#!/bin/bash
#SBATCH --job-name=fltr_pp
#SBATCH -o fltr_pp-%j.out
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load samtools
export SINGULARITY_BIND=/home/e1garcia

INDIR=$1
OUTDIR=$2
THREADS=40

BAMPATTERN=*_clmp.fp2_repr_fltrd.bam

all_samples=$(ls ./mkBAM/$BAMPATTERN | sed -e 's/_clmp.fp2_repr_fltrd\.bam//' -e 's/.*\///g')
all_samples=($all_samples)

mkdir -p $OUTDIR

samtools view -f 0x2 -b ${INDIR}/mkBAM/${sample_name}_clmp.fp2_repr_fltrd.bam  > ${OUDIR}/mkBAM/${sample_name}.filt.bam
samtools fixmate -m ${OUDIR}/mkBAM/${sample_name}.filt.bam ${OUDIR}/mkBAM/${sample_name}.fixmate.bam
samtools sort -o ${OUDIR}/mkBAM/${sample_name}.positionsort.bam ${OUDIR}/mkBAM/${sample_name}.fixmate.bam
samtools markdup -r ${OUDIR}/mkBAM/${sample_name}.positionsort.bam ${OUDIR}/mkBAM/${sample_name}.rmdup.bam
samtools index ${OUDIR}/mkBAM/${sample_name}.rmdup.bam
