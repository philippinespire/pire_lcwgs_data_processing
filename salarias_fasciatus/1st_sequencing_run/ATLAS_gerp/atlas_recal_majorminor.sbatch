#!/bin/bash -l

#SBATCH --job-name=ATLAS_recal_majorMinor
#SBATCH -o ATLAS_recal_majorMinor-%j.out 
#SBATCH -p main 
#SBATCH -n 1  
#SBATCH -N 1  
#SBATCH --cpus-per-task=40 

#infer major and minor alleles, output genotype likelihoods
# sbatch atlas_recal_majorMinor.sbatch /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/ATLAS_gerp

enable_lmod
module load bwa
module load samtools
module load container_env atlas
export SINGULARITY_BIND=/home/e1garcia

OUTDIR=$1

cd ${OUTDIR}/GLF

all_glf=$(ls ${OUTDIR}/GLF/*glf.gz)
all_glf_cslist=$(echo $all_glf | sed 's/ /,/g')
 

crun atlas task=majorMinor glf=${all_glf_cslist}
