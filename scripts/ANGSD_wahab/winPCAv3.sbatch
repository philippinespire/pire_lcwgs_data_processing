#!/bin/bash
#
#SBATCH --job-name=WinPCA
#SBATCH --cpus-per-task=1
#SBATCH --output=WinPCA_Sfa.%j.out
#SBATCH --array 1-22

#Loading modules and variables
module load ngsTools/2024

CHROM=$(awk -v var=$SLURM_ARRAY_TASK_ID 'NR==var' salarias.chrom_sizes.tsv  | cut -f1)
SIZE=$(awk -v var=$SLURM_ARRAY_TASK_ID 'NR==var' salarias.chrom_sizes.tsv  | cut -f2)
crun.ngsTools winpca pca angsd_depth1_15_notrans_subset_renamed.beagle.gz ${CHROM}:1-${SIZE} ${CHROM} -v GL
