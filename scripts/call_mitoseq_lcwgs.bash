#!/bin/bash 

#script to call mitochondrial sequence, based on aligned sequences and a refrence mitochondrial genome


SPDIR=$1		#species directory. example= /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
REFLOC=$2	#reference that files were aligned to. example= refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fna.gz
MTSEQ=$3		#name of mitochondrial scaffold in reference. example= NC_004412.1

BAMPATTERN=*_clmp.fp2_repr_fltrd.bam

SCRIPTPATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

all_samples=$(ls $SPDIR/mkBAM/$BAMPATTERN | sed -e 's/_clmp.fp2_repr_fltrd\.bam//' -e 's/.*\///g')
all_samples=($all_samples)

sbatch --array=0-$((${#all_samples[@]}-1))%${nodes} $SCRIPTPATH/call_mitoseq_lcwgs.sbatch ${SPDIR} ${REFLOC} ${MTSEQ}
