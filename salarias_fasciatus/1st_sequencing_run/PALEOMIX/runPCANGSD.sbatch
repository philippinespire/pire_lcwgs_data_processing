#!/bin/bash -l
#SBATCH --job-name=PCAngsd
#SBATCH -o PCAngsd-%j.out
#SBATCH -e PCAngsd.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

#Soft
#input and output beagle
input=$1  # "Sfa_PALEO_genolike.beagle.gz"
outdir=$2  # "out_PCAngsd"

mkdir -p $outdir

#running
#python $$pcangsd -b $input 
crun pcangsd -b $input \
	--threads 40 \
	--out $outdir \
	--admix \
	--maf_save
