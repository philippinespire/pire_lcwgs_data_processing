#!/bin/bash -l
#SBATCH --job-name=runSNeP
#SBATCH -o runSNeP-%j.out
##SBATCH -e runSNeP-%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env snep/1.11
export SINGULARITY_BIND=/home/e1garcia

inLDfile=$1 #Sfa-ABas-CBas_all_final_fltrd.glf.ld
outPREFIX=$2 #Sfa-ABas-CBas_all_final_fltrd_SNeP

crun snep -distld $inLDfile -out $outPREFIX 
