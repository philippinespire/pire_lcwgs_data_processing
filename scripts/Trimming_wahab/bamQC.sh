#!/bin/bash -le
#SBATCH --job-name=bamqc
#SBATCH -o bamqc-%A_%a.out
#SBATCH --cpus-per-task=4
#SBATCH --array=1-33%15

```
This script will generate flagstat, qualimap, coverage, and average read length statistics for bam files.
It will run as an array job.

To run the script, prepare a SAMPLES_FILE containing the name of all samples, with each sample on a new line.
Then adjust the slurm script and all variables to the right files and directories:

DIR: directory with bam files
SAMPLES_FILE: file containing all samplenames
BED: bedfile containing regions for which to calculate coverage and average readlength.
SBATCH --array: adjust for number of samples (e.g. 1-50 if you have 50 samples).
```

module load container_env

#####################################################################
docker=/cm/shared/containers/docker
qualimap_image=$docker/quay.io-biocontainers-qualimap:2.2.2d--1.sif
samtools_image=$docker/biocontainers-samtools:v1.9-4-deb_cv1.sif 
#####################################################################

DIR=/archive/carpenterlab/pire/marianne/pire_pba_dinosaur/data_processing

SAMPLES_FILE=$DIR/scripts/inputfiles/bamfiles.txt
INPUT_BAM=$(sed -n "${SLURM_ARRAY_TASK_ID}p" $SAMPLES_FILE)
FILE=$(basename $INPUT_BAM)
NAME=$(echo $FILE | cut -d "." -f1)

echo $NAME

date

BED=$DIR/data/reference/reference.denovoSSL.Pba.20k.repma.bed

# Flagstats
echo "Running flagstat..."
singularity exec $samtools_image samtools flagstat $INPUT_BAM > $DIR/results/$NAME.flagstat.txt

# Qualimap
echo "Running Qualimap..."
singularity exec $qualimap_image qualimap bamqc -bam $INPUT_BAM --java-mem-size=30G -nt 4 -outdir $DIR/results/$NAME.qualimap -outformat html
# Depth
echo "Calculating depth..."

singularity exec $samtools_image samtools depth -a -Q 30 -q 25 $INPUT_BAM > $DIR/results/${NAME}.Q25.bam.dp
awk '{{sum+=$3}} END {{ print sum/NR }}' $DIR/results/${NAME}.Q25.bam.dp > $DIR/results/${NAME}.Q25.bam.dpstats.txt

rm $DIR/results/${NAME}.Q25.bam.dp

# Average read length
echo "Calculating average read length..."

singularity exec $samtools_image samtools view -h -q 25 -L $BED $INPUT_BAM	| grep -v '@' | awk '{print length($10)}'|  awk '{ total += $1; count++ } END { print total/count }' > $DIR/results/${NAME}.Q25.avRL.txt


