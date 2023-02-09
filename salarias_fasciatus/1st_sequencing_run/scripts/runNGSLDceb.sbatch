#!/bin/bash -l
#SBATCH --job-name=runNGSLD
#SBATCH -o runNGSLD-%j.out
##SBATCH -e runNGSLD-%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia


inFILE=$1  #mkGLF/Sfa-ABas-CBas_all_final_fltrd.glf #mkBGL/CHR01...CHR02.....beagle
numLIBS=$2      #81 #32 #49
numSITES=$3     #509340
posFILE=$4     #mkGLF/Sfa-ABas-CBas_all_final_fltrd.glf.pos.gz #compatible w bgl naming: Sfa-ABas-CBas_all_final_fltrd_rnmd.glf.pos.gz
outDIR=$5   #./ngsLD
outFilePREFIX=$6  #Sfa-ABas-CBas_all_final_fltrd.glf.ld
minMaf=$7 # 0.1 0.2 0.3

mkdir -p $outDIR

#add --log_scale flag if using glf input 

crun ngsLD \
	--probs \
	--n_threads $SLURM_CPUS_PER_TASK \
	--max_kb_dist 0 \
	--verbose 1 \
	--geno $inFILE \
	--n_ind $numLIBS \
	--pos $posFILE \
	--n_sites $numSITES \
	--out ${outDIR}/$outFilePREFIX \
	--min_maf $minMaf \
	--rnd_sample
