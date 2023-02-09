#!/bin/bash -l
#SBATCH --job-name=fltrBGL
#SBATCH -o fltrBGL-%j.out
#SBATCH -e fltrBGL-%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

bglFile=$1
sitesFile=$2
faiFile=$3
outFilePREFIX=$(echo $bglFile | sed 's/\.beagle\.gz/_fltrd/')

#inDIR=$(echo $inDIR | sed "s/\/$//" )

crun angsd sites index $sitesFile

crun angsd -beagle $bglFile \
  -sites ${sitesFile} \
  -fai $faiFile \
  -out $outFilePREFIX \
  -nThreads 40 
