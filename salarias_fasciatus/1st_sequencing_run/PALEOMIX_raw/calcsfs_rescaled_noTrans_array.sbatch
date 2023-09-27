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

BAMPATTERN=*.rescaled.bam

all_samples=$(ls ${INDIR}/${BAMPATTERN} | sed -e 's/\.rescaled.bam//' -e 's/.*\///g')
all_samples=($all_samples)

all_paths=($INDIR)

sample_name=${all_samples[${SLURM_ARRAY_TASK_ID}]}
echo ${sample_name}

crun angsd -i ${all_paths[${SLURM_ARRAY_TASK_ID}]}/${sample_name}.rescaled.bam -anc ${REF} -dosaf 1 -gl 1 -noTrans 1 -out ${sample_name}_rescaled

crun realSFS ${sample_name}_rescaled.saf.idx > ${sample_name}.ml
