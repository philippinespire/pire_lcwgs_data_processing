#!/bin/bash -l

#SBATCH --job-name=ATLAS_recal_distance
#SBATCH -o ATLAS_recal_distance-%j.out 
#SBATCH -p main 
#SBATCH -n 1  
#SBATCH -N 1  
#SBATCH --cpus-per-task=40 

enable_lmod
module load bwa
module load samtools
module load container_env atlas
export SINGULARITY_BIND=/home/e1garcia

OUTDIR=$1

cd ${OUTDIR}/GLF

all_glf=$(ls ${OUTDIR}/GLF)
all_glf_cslist=$(echo $all_glf | sed 's/ /,/g')
 

crun atlas task=geneticDist glf=${all_glf_cslist} distType=euclidian
