#!/bin/bash

export SINGULARITY_BIND=/home/e1garcia

nodes=$4

BAMPATTERN=*.rescaled.bam
INDIR=$1
OUTDIR=$2
REF=$3

SCRIPTPATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

all_samples=$(ls ${INDIR}/${BAMPATTERN} | sed -e 's/\.rescaled.bam//' -e 's/.*\///g')
all_samples=($all_samples)

sbatch --array=0-$((${#all_samples[@]}-1))%${nodes} $SCRIPTPATH/calcsfs_rescaled_noTrans_array.sbatch "${INDIR}" ${OUTDIR} ${REF}
