#!/bin/bash -l

#SBATCH --job-name=fltrBGL
#SBATCH -o fltrBGL-%j.out
#SBATCH -e fltrBGL-%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
#module load parallel
#module load container_env bwa-mem2
#module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

bglFile=$1
mafsFile=$2
sitesFile=$3

outBglFile=$(echo $bglFile | sed 's/\.beagle\.gz/_fltrd\.beagle/')
outMafsFile=$(echo $mafsFile | sed 's/\.mafs\.gz/_fltrd\.mafs/')

# comm <(gunzip $bglFile) $sitesFile | gzip > ${outFile}.gz

cat $sitesFile | tr -s " " "_" > ${sitesFile}.txt
cat $sitesFile | tr -s " " "\t" > ${sitesFile}.tsv

cat <(zcat $bglFile | head -n1) <(zcat $bglFile | awk 'NR==FNR{a[$1]=$1OFS$2;next}{$1=a[$1];print}' OFS='\t' $sitesFile.txt - | grep -Pv "^\t") | gzip > ${outBglFile}.gz
cat <(zcat $mafsFile | head -n1) <(zcat $mafsFile | awk 'NR==FNR{a[$1,$2]=$1OFS$2;next}{$1=a[$1,$2];print}' OFS='\t' $sitesFile.tsv - | grep -Pv "^\t") | gzip > ${outMafsFile}.gz

rm  ${sitesFile}.t[xs][tv]
