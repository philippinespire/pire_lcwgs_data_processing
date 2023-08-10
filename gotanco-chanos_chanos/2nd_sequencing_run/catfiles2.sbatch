#!/bin/bash -l

#SBATCH --job-name=cat-fqgz
#SBATCH -o cat-fqgz-%j.out
#SBATCH --time=00:00:00
#SBATCH --cpus-per-task=40

# Specify the directory containing the input files
input_directory=$1

# Specify the output directory
output_directory=$2

# Read 1 or 2
read_number=$3

enable_lmod
module load parallel

export SINGULARITY_BIND=/home/e1garcia

mkdir -p $output_directory

find "$input_directory" -name '*.fq.gz' | \
        sed -e 's/.*\///g' | \
        cut -d "_" -f 1 | \
        uniq | \
        parallel -kj 40 --no-notice "cat $input_directory/{}*L[0-9]*_$3.fq.gz > $output_directory/{}_LX_$3.fq.gz"
