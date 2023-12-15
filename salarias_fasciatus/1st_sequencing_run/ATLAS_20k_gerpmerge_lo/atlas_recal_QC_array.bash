#!/bin/bash

# this script sends several jobs each to their own compute node using an array, which limits the number of nodes used at one time

BAMDIR=$1
OUTDIR=$2

BAMPATTERN=*merged.rmdup.merged.realn.bam

all_samples=$(ls $BAMDIR/$BAMPATTERN | sed -e 's/\.merged\.rmdup\.merged\.realn\.bam//' -e 's/.*\///g')
all_samples=($all_samples)

all_samples=( $(ls $BAMDIR/$BAMPATTERN) )

JOBID=$(sbatch --array=0-$((${#all_samples[@]}-1))%20 \
       --output=atlas_nogerp.%A.%a.out \
       --partition main \
       -t 96:00:00 \
       /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/ATLAS_20k_gerpmerge_lo/atlas_recal_QC_array.sbatch ${BAMDIR} ${OUTDIR})
