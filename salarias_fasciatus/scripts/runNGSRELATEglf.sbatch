#!/bin/bash -l
#SBATCH --job-name=runNGSRELATE
#SBATCH -o runNGSRELATE-%j.out
##SBATCH -e runNGSRELATE-%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

inGlfFILE=$1  #mkGLF/Sfa-ABas-CBas_all_final_fltrd.glf.gz
inMafsFILE=$2  #mkBGL/Sfa-ABas-CBas_all_final_fltrd.mafs.gz
numLIBS=$3      #81 
outDIR=$4   #./ngsRelate
outFilePREFIX=$5  #out_ngsRelate

freqFILE=$(echo $inMafsFILE | sed -e "s/\.mafs\.gz/\.freq/" )

zcat $inMafsFILE | cut -f5 | sed 1d > $freqFILE

mkdir -p $outDIR


crun ngsRelate -g $inGlfFILE -f $freqFILE -n $numLIBS -O $outDIR/$outFilePREFIX

rm $freqFILE
