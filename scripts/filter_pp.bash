#!/bin/bash 

#script to filter BAM files for proper pairs + remove duplicates
#for use on existing .bam files

#SPDIR=/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run
#INDIR=mkBAM/
#OUTDIR=fltrBAM_pp
#THREADS=40

SPDIR=$1
INDIR=$2
OUTDIR=$3
THREADS=40

BAMPATTERN=*_clmp.fp2_repr_fltrd.bam

SCRIPTPATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

all_samples=$(ls ./mkBAM/$BAMPATTERN | sed -e 's/_clmp.fp2_repr_fltrd\.bam//' -e 's/.*\///g')
all_samples=($all_samples)

sbatch --array=0-$((${#all_samples[@]}-1))%${nodes} $SCRIPTPATH/filter_pp.sbatch ${SPDIR} ${INDIR} ${OUTDIR} ${THREADS}
