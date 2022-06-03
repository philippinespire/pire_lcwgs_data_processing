#!/bin/bash -l
#SBATCH --job-name=runNGSRELATE
#SBATCH -o runNGSRELATE-%j.out
##SBATCH -e runNGSRELATE-%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

inBEAGLE=$1  #Sfa-ABas-CBas_all_final.beagle.gz
inFreqFILE=$2  #Sfa-ABas-CBas_all_final_freqs
outDIR=$3  #./ngsRelate
outFilePREFIX=$4  #out_NgsRelate

mkdir -p $outDIR

crun ngsrelate --g $inBEAGLE \
	--f $inFreqFILE \
	--n 81 \
	--O $outDIR/$outFilePREFIX
