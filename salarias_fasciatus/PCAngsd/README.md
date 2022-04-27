

example script: runPCANGSD.sbatch

```bash
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
#pcangsd="../../downloads/pcangsd/pcangsd/pcangsd.py"
#input and output beagle
input="./beagle_Bos_v2.beagle.gz"
outdir="./out_PCAgsd"

mkdir $outdir

#running
#python $$pcangsd -b $input 
crun python pcangsd.py -b $input \
	-threads 40 \
	-out $outdir \
	--selection \
  -pcadapt \
	--maf_save

```
