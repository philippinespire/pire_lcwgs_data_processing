#!/bin/bash -l
#SBATCH --job-name=mkGLF
#SBATCH -o mkGLF-%j.out
#SBATCH -e mkGLF-%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env bwa-mem2
export SINGULARITY_BIND=/home/e1garcia

inDIR=$1
sitesFILE=$2
outDIR=./mkGLF
outFilePREFIX=$3


TODO='-doGlf 3 -doMajorMinor 1 -doMaf 1 -doPost 2'
FILTERS='-minMaf 0.05'

inDIR=$(echo $inDIR | sed "s/\/$//" )

ls $inDIR/*fltrd.bam > ${inDIR}/bamNames.txt


module load container_env ngsTools

crun angsd sites index $sitesFILE
wait
crun angsd -GL 1 \
  $TODO \
  $FILTERS \
  -out ${outDIR}/$outFilePREFIX \
  -bam ${inDIR}/bamNames.txt \
  -nThreads 40 \
  -sites $sitesFILE
