#!/bin/bash -l
#SBATCH --job-name=runNGSLD
#SBATCH -o runNGSLD-%j.out
##SBATCH -e runNGSLD-%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

inGlfFILE=$1  #mkGLF/Sfa-ABas-CBas_all_final_fltrd.glf
numLIBS=$2      #81
numSITES=$3     #509340
posFILE=$4     #mkGLF/Sfa-ABas-CBas_all_final_fltrd.glf.pos.gz
outDIR=$5   #./ngsLD
outFilePREFIX=$6  #Sfa-ABas-CBas_all_final_fltrd.glf.ld


mkdir -p $outDIR


crun ngsLD --probs --log_scale --n_threads $SLURM_CPUS_PER_TASK --verbose 1 --geno $inGlfFILE --n_ind $numLIBS --pos $posFILE --n_sites $numSITES --out ${outDIR}/$outFilePREFIX 
