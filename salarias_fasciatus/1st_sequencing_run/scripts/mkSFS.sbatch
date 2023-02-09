#!/bin/bash -l
#SBATCH --job-name=mkSFS
#SBATCH -o mkSFS-%j.out
#SBATCH -e mkSFS-%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env bwa-mem2
export SINGULARITY_BIND=/home/e1garcia

inDIR=$1
#REF=$2
outDIR=./mkSFS
outFilePREFIX=$2

#REFbgz=$(echo $REF | sed 's/\.gz$/\.bgz/' )

TODO='-doSaf 1  -doGlf 2 -doMajorMinor 1 -doMaf 1 -doSnpStat 1 -doHWE 1 -doGeno 3 -doPost 2 -doCounts 1 -doDepth 1 -doQsDist 1 -doEBD 1 '

#test05
FILTERS='-uniqueOnly 1 -rmTriallelic 0.1 -SNP_pval 1e-5 -minMapQ 50 -minQ 30 -minHWEpval 0.1 -maxHetFreq 0.5 -hetbias_pval 0.05 -sb_pval 0.5 -edge_pval 0.1 -mapQ_pval 0.1 -qscore_pval 0.5 -minInd 41 -setMaxDepth 405 -minMaf 0.0062 '
#test06
FILTERS='-uniqueOnly 1 -rmTriallelic 0.1 -SNP_pval 1e-6 -minMapQ 50 -minQ 30 -minHWEpval 0.2 -maxHetFreq 0.5 -hetbias_pval 0.5 -sb_pval 0.5 -edge_pval 0.5 -mapQ_pval 0.5 -qscore_pval 0.9 -minInd 41 -minMaf 0.0062 '
inDIR=$(echo $inDIR | sed "s/\/$//" )

ls $inDIR/*fltrd.bam > ${inDIR}/bamNames.txt 

#[ ! -f $REF.fai ] && crun gunzip -c $REF | crun bgzip -@ 40 -c > $REFbgz && REF=$REFbgz && crun samtools faidx $REF 

module load container_env ngsTools

crun angsd -GL 1 \
  $TODO \
  $FILTERS \
  -out ${outDIR}/$outFilePREFIX \
  -bam ${inDIR}/bamNames.txt \
  -nThreads 40 
