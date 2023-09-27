#!/bin/bash -l

#SBATCH --job-name=calcsfs
#SBATCH -o calcsfs-%j.out 
#SBATCH -p main 
#SBATCH -n 1  
#SBATCH -N 1  
#SBATCH --cpus-per-task=40 

enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

INDIR=$1
OUTDIR=$2
REF=$3

mkdir -p ${OUTDIR}

cd ${OUTDIR}

BAMPATTERN=*.bam

all_samples=$(ls ${INDIR}/${BAMPATTERN} | sed -e 's/\.bam//' -e 's/.*\///g')
all_samples=($all_samples)

sample_name=${all_samples[${SLURM_ARRAY_TASK_ID}]}
echo ${sample_name}

crun angsd -i ${INDIR}/${sample_name}.bam -anc ${REF} -noTrans 1 -dosaf 1 -gl 1 -out ${sample_name}_rescaled_noTrans

crun realSFS ${sample_name}_rescaled_noTrans.saf.idx > ${sample_name}_noTrans.ml
