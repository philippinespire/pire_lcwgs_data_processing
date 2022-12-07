#!/bin/bash -l

#SBATCH --job-name=call_mitoseq_lcwgs
#SBATCH -o call_mitoseq_lcwgs-%j.out 
#SBATCH --mem 2000 #most runs should be under 1 GB but we'll add a buffer
#SBATCH -p main 
#SBATCH -n 1 #each chromosome will be processed on a single core (-n 1)  
#SBATCH -N 1 #on one machine (-N 1)  
#SBATCH --cpus-per-task=40 

enable_lmod 

module load container_env ddocent

export SINGULARITY_BIND=/home/e1garcia

SPDIR=$1
REFLOC=$2
MTSEQ=$3

BAMPATTERN=*_clmp.fp2_repr_fltrd.bam

all_samples=$(ls ${SPDIR}/mkBAM/${BAMPATTERN} | sed -e 's/_clmp.fp2_repr.R1\.fq\.gz//' -e 's/.*\///g')
all_samples=($all_samples)

sample_name=${all_samples[${SLURM_ARRAY_TASK_ID}]}
echo ${sample_name}

mkdir -p ${SPDIR}/mt_error/
mkdir -p ${SPDIR}/mt_error/joblog

cd ${SPDIR}/mt_error/

crun samtools mpileup -C50 -r ${MTSEQ} -uf ${SPDIR}/${REFLOC} ${SPDIR}/mkBAM/${sample_name}_clmp.fp2_repr_fltrd.bam | crun bcftools call --ploidy 1 -c - | crun vcfutils.pl vcf2fq -d 10 > ${SPDIR}/mt_error/${sample_name}_mtseq.fq

mv call_mitoseq_lcwgs-%j.out  ${SPDIR}/mt_error/joblog
