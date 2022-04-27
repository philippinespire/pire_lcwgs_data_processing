#!/bin/bash -l
#SBATCH --job-name=mkBGL
#SBATCH -o mkBGL-%j.out
#SBATCH -e mkBGL.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env ngsTools
module load container_env bwa-mem2
export SINGULARITY_BIND=/home/e1garcia

inDIR=$1
REF=$2
outDIR=mkBGL

REFbgz=$(echo $REF | sed 's/\.gz$/\.bgz/' )
TODO='-doMajorMinor 1 -doMaf 1 -dosnpstat 1 -doPost 2'
FILTERS='-uniqueOnly 1 -skipTriallelic 1 -minMapQ 30 -minQ 30 -doHWE 1 -maxHetFreq 0.5 -hetbias_pval 1e-5 -minInd 30 -minMaf 0.0062'

inDIR=$(echo $inDIR | sed "s/\/$//" )

ls $inDIR/*fltrd.bam > bamNames.txt 
mkdir $outDIR

[ ! -f $REF.fai ] && crun gunzip -c $REF | crun bgzip -c > $REFbgz && REF=$REFbgz && crun samtools faidx $REF 

crun angsd -GL 1 \
  $TODO \
  $FILTERS \
  -doGlf 2 \
  -doSaf 1 \
  -doMajorMinor 1 \
  -doMaf 1 \
  -doPost 1 \
  -anc $REF \
  -ref $REF \
  -out $outDIR \
  -bam bamNames.txt \
  -nThreads 40 
