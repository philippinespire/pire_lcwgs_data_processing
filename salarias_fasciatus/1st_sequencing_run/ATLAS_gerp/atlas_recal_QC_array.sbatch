#!/bin/bash -l

#SBATCH --job-name=ATLAS_recal_QC
#SBATCH -o ATLAS_recal_QC-%j.out 
#SBATCH -p main 
#SBATCH -n 1  
#SBATCH -N 1  
#SBATCH --cpus-per-task=40 

enable_lmod
module load bwa
module load samtools
module load container_env atlas
export SINGULARITY_BIND=/home/e1garcia

BAMDIR=$1
OUTDIR=$2

BAMPATTERN=*merged.rmdup.merged.realn.bam

all_samples=$(ls $BAMDIR/$BAMPATTERN | sed -e 's/\.merged\.rmdup\.merged\.realn\.bam//' -e 's/.*\///g')
all_samples=($all_samples)

sample_name=${all_samples[${SLURM_ARRAY_TASK_ID}]}
echo ${sample_name}

cd ${OUTDIR}

crun atlas task=thetaQC bam=${sample_name}.merged.rmdup.merged.realn.bam prob=1,0.5,0.25,0.1 recal=${sample_name}.merged.rmdup.merged.realn_recalibrationEM.txt pmdFile=${sample_name}.merged.rmdup.merged.realn_PMD_input_Empiric.txt

crun atlas task=qualityTransformation bam=${sample_name}.merged.rmdup.merged.realn.bam recal=${sample_name}.merged.rmdup.merged.realn_recalibrationEM.txt pmdFile=${sample_name}.merged.rmdup.merged.realn_PMD_input_Empiric.txt
