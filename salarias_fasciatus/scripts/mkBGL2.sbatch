#!/bin/bash -l
#SBATCH --job-name=mkBGL
#SBATCH -o mkBGL-%j.out
#SBATCH -e mkBGL.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env bwa-mem2
export SINGULARITY_BIND=/home/e1garcia

inDIR=$1
REF=$2
outDIR=./mkBGL
outFilePREFIX=$3

REFbgz=$(echo $REF | sed 's/\.gz$/\.bgz/' )

TODO='-doMajorMinor 1 -doMaf 1 -doSnpStat 1 -doPost 2 -doGlf 2 -doSaf 1 -doHWE 1 -doGeno'
TODO='-doGlf 2 -doMajorMinor 1 -doMaf 1 -doSnpStat 1 -doHWE 1'
INPUT='-uniqueOnly 1 '
#from sang, probably from misha matz
FILTERS='-uniqueOnly 1 -rmTriallelic 0.1 -minMapQ 30 -minQ 30 -minHWEpval 0.05 -maxHetFreq 0.5 -hetbias_pval 1e-5 -minInd 30 -minMaf 0.0062'
#stripped down
FILTERS='-uniqueOnly 1 -minMapQ 30 -minQ 20 -minInd 30 -minMaf 0.0062'

inDIR=$(echo $inDIR | sed "s/\/$//" )

ls $inDIR/*fltrd.bam > bamNames.txt 

[ ! -f $REF.fai ] && crun gunzip -c $REF | crun bgzip -@ 40 -c > $REFbgz && REF=$REFbgz && crun samtools faidx $REF 

module load container_env ngsTools

crun angsd -GL 1 \
  $TODO \
  $FILTERS \
  -out ${outDIR}/$outFilePREFIX \
  -bam bamNames.txt \
  -nThreads 40 
