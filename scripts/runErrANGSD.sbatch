#!/bin/bash -l
#SBATCH --job-name=Error
#SBATCH -o Error-%j.out
#SBATCH -e Error.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia


input=$1 #bamfile list .txt
outDIR=$2 #output directory ./out_Err

mkdir -p $outDIR

crun angsd -bam $input \
	-doCounts 1 \
	-out $outDIR \
	-doError 1 \
	-doMajorMinor 2\
	-nThreads 40 \
	-minSites 1000

