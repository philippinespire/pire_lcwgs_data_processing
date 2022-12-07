#!/bin/bash 

#script to get error distributions from sequence data and mitochondrial genomes extracted from lcwgs


SPDIR=$1		#species directory. example= /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
FQDIR=$2		#directory with reads. example= fq_fp1_clmp_fp2_fqscrn_rprd

FQPATTERN=*_clmp.fp2_repr.R1.fq.gz

SCRIPTPATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

all_samples=($all_samples)

sbatch --array=0-$((${#all_samples[@]}-1))%${nodes} $SCRIPTPATH/bbmap_mitoerror_lcwgs.sbatch ${SPDIR} ${FQDIR}
