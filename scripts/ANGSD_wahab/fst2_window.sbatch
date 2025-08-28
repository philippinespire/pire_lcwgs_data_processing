#!/bin/bash -l

#SBATCH --job-name=angsd_fst_window
#SBATCH -o angsd_fst_window-%j.out 
#SBATCH -p main 
#SBATCH -n 1  
#SBATCH -N 1  
#SBATCH --cpus-per-task=32 

enable_lmod
module load container_env angsd
export SINGULARITY_BIND=/home/e1garcia


## This script is used to get pairwise windowed Fst estimates from angsd for each population / group pair

POP1=${1:-abas_sites_notrans}
POP2=${2:-cbas_sites_notrans}
THREADS=${3:-8} # Number of parallel threads to use, default value is 8.
SAFDIR=${4:-.} 
EXTRA_ARG=${5:-''} # Extra arguments for the SFS estimation step, default value is ''


cd $SAFDIR

 # Estimating average Fst in angsd
 crun.angsd realSFS fst stats2 $POP1'_'$POP2'.alpha_beta.fst.idx' -win 50000 -step 10000 > $POP1'_'$POP2'.window_fst.txt' 
