#!/bin/bash -l

#SBATCH --job-name=bbmap_mitoerror_lcwgs
#SBATCH -o bbmap_mitoerror_lcwgs-%j.out 
#SBATCH --mem 2000 #most runs should be under 1 GB but we'll add a buffer
#SBATCH -p main 
#SBATCH -n 1 #each chromosome will be processed on a single core (-n 1)  
#SBATCH -N 1 #on one machine (-N 1)  
#SBATCH --cpus-per-task=40 

enable_lmod
module load container_env pire_genome_assembly
export SINGULARITY_BIND=/home/e1garcia

SPDIR=$1
FQDIR=$2

FQPATTERN=*_clmp.fp2_repr.R1.fq.gz

all_samples=$(ls $SPDIR/$FQDIR/$FQPATTERN | sed -e 's/_clmp.fp2_repr.R1.fq.gz//' -e 's/.*\///g')
all_samples=($all_samples)

sample_name=${all_samples[${SLURM_ARRAY_TASK_ID}]}
echo ${sample_name}

cd ${SPDIR}/mt_error

crun bbmap.sh ref=${SPDIR}/mterror/${sample_name}_clmp.fp2_repr_fltrd.bam_mtseq.fa in1=${SPDIR}/${FQDIR}/${sample_name}_clmp.fp2_repr.R1.fq.gz  in1=${SPDIR}/${FQDIR}/${sample_name}_clmp.fp2_repr.R2.fq.gz out=${SPDIR}/mterror/${sample_name}_mapped.sam mhist=${SPDIR}/mterror/${sample_name}_mhist.txt ehist=${SPDIR}/mterror/${sample_name}_ehist.txt indelhist=${SPDIR}/mterror/${sample_name}_indelhist.txt
