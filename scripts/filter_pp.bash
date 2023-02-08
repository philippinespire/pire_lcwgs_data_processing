#!/bin/bash 

#script to filter BAM files for proper pairs + remove duplicates
#for use on existing .bam files

#INDIR=./mkBAM/
#OUTDIR=./fltrBAM_pp
#THREADS=40

INDIR=$1
OUTDIR=$2
THREADS=40

BAMPATTERN=*_clmp.fp2_repr_fltrd.bam

SCRIPTPATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

all_samples=$(ls ./mkBAM/$BAMPATTERN | sed -e 's/_clmp.fp2_repr_fltrd\.bam//' -e 's/.*\///g')
all_samples=($all_samples)

sbatch --array=0-$((${#all_samples[@]}-1))%${nodes} $SCRIPTPATH/filter_pp.sbatch ${INDIR} ${OUTDIR} ${THREADS}
