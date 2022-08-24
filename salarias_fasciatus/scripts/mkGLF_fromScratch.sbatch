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
outDIR=./mkGLF_fromScratch
outFilePREFIX=$2
bamPATTERN=$3
minInd=$4
minMaf=0.05

TODO='-doGlf 3 -doMajorMinor 1 -doMaf 1 -doPost 2'
FILTERS='-minMaf 0.05'

#test04 from mkBGL.sbatch
TODO='-doGlf 3 -doMajorMinor 1 -doMaf 1 -doSnpStat 1 -doHWE 1 -doGeno 3 -doPost 2 -doCounts 1 -doDepth 1 -doQsDist 1 -doEBD 1 '
#test06 from mkBGL.sbatch
FILTERS="-uniqueOnly 1 -rmTriallelic 0.1 -SNP_pval 1e-6 -minMapQ 50 -minQ 30 -minHWEpval 0.2 -maxHetFreq 0.5 -hetbias_pval 0.5 -sb_pval 0.5 -edge_pval 0.5 -mapQ_pval 0.5 -qscore_pval 0.9 -minInd $minInd -minMaf $minMaf "

inDIR=$(echo $inDIR | sed "s/\/$//" )
bamFileNAME=$(echo $bamPATTERN | sed 's/\*//g')
bamFileNAME=$(echo bamNames_${bamFileNAME}.txt)

ls $inDIR/$bamPATTERN > ${inDIR}/$bamFileNAME
mkdir $outDIR

module load container_env ngsTools

#wait
crun angsd -GL 1 \
  $TODO \
  $FILTERS \
  -out ${outDIR}/$outFilePREFIX \
  -bam ${inDIR}/$bamFileNAME \
  -nThreads 40
