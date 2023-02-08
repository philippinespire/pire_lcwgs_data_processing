#!/bin/bash
#SBATCH --job-name=fltr_pp
#SBATCH -o fltr_pp-%j.out
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load samtools
export SINGULARITY_BIND=/home/e1garcia

SPDIR=$1
INDIR=$2
OUTDIR=$3
THREADS=40

cd $SPDIR

BAMPATTERN=*_clmp.fp2_repr_fltrd.bam

all_samples=$(ls ./mkBAM/$BAMPATTERN | sed -e 's/_clmp.fp2_repr_fltrd\.bam//' -e 's/.*\///g')
all_samples=($all_samples)

sample_name=${all_samples[${SLURM_ARRAY_TASK_ID}]}
echo ${sample_name}

mkdir -p $OUTDIR

samtools view -f 0x2 -b ${INDIR}/${sample_name}_clmp.fp2_repr_fltrd.bam  > ${OUDIR}/${sample_name}.filt.bam
samtools fixmate -m ${OUDIR}/${sample_name}.filt.bam ${OUDIR}/${sample_name}.fixmate.bam
samtools sort -o ${OUDIR}/${sample_name}.positionsort.bam ${OUDIR}/${sample_name}.fixmate.bam
samtools markdup -r ${OUDIR}/${sample_name}.positionsort.bam ${OUDIR}/${sample_name}.rmdup.bam
samtools index ${OUDIR}/${sample_name}.rmdup.bam

rm ${OUDIR}/${sample_name}.filt.bam
rm ${OUDIR}/${sample_name}.fixmate.bam
rm ${OUDIR}/${sample_name}.positionsort.bam
