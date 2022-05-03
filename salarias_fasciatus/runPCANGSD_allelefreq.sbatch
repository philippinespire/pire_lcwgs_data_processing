#!/bin/bash -l
#SBATCH --job-name=PCAngsd
#SBATCH -o PCAngsd-%j.out
#SBATCH -e PCAngsd.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

input=$1  # "../mkBGL/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen_clmp_fp2_repr_fltrd.beagle.gz"
outdir=$2  #"./out_PCAngsd"

echo "outdir=$2"

mkdir -p $outdir

crun pcangsd --beagle $input \
        --threads 40 \
        --out $outdir 
