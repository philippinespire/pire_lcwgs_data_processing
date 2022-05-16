#!/bin/bash -l
#SBATCH --job-name=PCAngsd
#SBATCH -o PCAngsd_MAP-%j.out
##SBATCH -e PCAngsd.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

inBEAGLE=$1  # ./mkBGL/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen_clmp_fp2_repr_fltrd.beagle.gz
outDIR=$2  #./PCAngsd_selection
outFilePREFIX=$3  #out_PCAngsd_selection_maptest
minMaf=$4    #0.05

outFilePREFIX=${outFilePREFIX}_minMaf${minMaf}

mkdir -p $outDIR

crun pcangsd --beagle $inBEAGLE \
        --threads 40 \
        --out $outDIR/$outFilePREFIX \
	--minMaf $minMaf \
	--selection \
	--sites_save
