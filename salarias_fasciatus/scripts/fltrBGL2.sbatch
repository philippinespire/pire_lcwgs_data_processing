#!/bin/bash -l

#SBATCH --job-name=fltrBGL
#SBATCH -o fltrBGL-%j.out
#SBATCH -e fltrBGL-%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load parallel
#module load container_env bwa-mem2
#module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

bglFile=$1
sitesFile=$2
outFile=$(echo $bglFile | sed 's/\.beagle\.gz/_fltrd\.beagle/')

# comm <(gunzip $bglFile) $sitesFile | gzip > ${outFile}.gz

cat $sitesFile | tr -s " " "_" > ${sitesFile}.txt

# serial
#cat <(zcat $bglFile | head -n1) <(zcat $bglFile | grep -w -f ${sitesFile}.txt) | gzip > ${outFile}.gz

# parallel
cat <(zcat $bglFile | head -n1) <(zcat $bglFile | parallel --pipe -N 50000 "grep -w -f $sitesFile.txt ") | gzip > ${outFile}.gz

rm  ${sitesFile}.txt
