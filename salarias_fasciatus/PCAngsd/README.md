example script: mkBGL.sbatch

```bash
#!/bin/bash -l
#SBATCH --job-name=mkBGL
#SBATCH -o mkBGL-%j.out
#SBATCH -e mkBGL.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

inDIR=$1
REF=$2
outDIR=mkBGL

TODO='-doMajorMinor 1 -doMaf 1 -dosnpstat 1 -doPost 2'
FILTERS='-uniqueOnly 1 -skipTriallelic 1 -minMapQ 30 -minQ 30 -doHWE 1 -maxHetFreq 0.5 -hetbias_pval 1e-5 -minInd 30 -minMaf 0.0062'

inDIR=$(echo $inDIR | sed "s/\/$//" )

ls $inDIR/*fltrd.bam > bamNames.txt 
mkdir $outDIR

crun angsd -GL 1 \
  $TODO \
  $FILTERS \
  -doGlf 2 \
  -doSaf 1 \
  -doMajorMinor 1 \
  -doMaf 1 \
  -doPost 1 \
  -anc $REF \
  -ref $REF \
  -out ./$outDIR/$outDIR 
  -bam bamNames.txt 
  -nThreads 40 
```


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
