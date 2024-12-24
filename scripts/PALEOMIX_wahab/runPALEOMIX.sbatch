#!/bin/bash -l

#SBATCH --job-name=PALEOMIX
#SBATCH -o PALEOMIX-%j.out
#SBATCH -p main
#SBATCH -c 40
#SBATCH --exclusive

module load container_env paleomix

export SINGULARITY_BIND=/home/e1garcia

crun.paleomix paleomix bam run makefile.yaml
