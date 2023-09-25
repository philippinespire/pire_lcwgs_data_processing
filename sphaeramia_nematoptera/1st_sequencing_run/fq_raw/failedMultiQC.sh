#!/bin/bash -l

#SBATCH --job-name=failedMulti_fastqc
#SBATCH -o Multi_fastqc-%j.out
#SBATCH -p main
#SBATCH -c 32

############# Multi_FASTQC.sh ###################
## runs failed FASTQC and MultiQC reports in parallel ##
##   contact: Jem Baldisimo, jbald004@odu.edu  ##
##  ceb updated this 2023-06-02                ##
#################################################

## Requirements: parallel, fastqc, and multiqc in current session 
## To execute, type in the command line (do include quotes):
# sbatch Multi_FASTQC.sh "<extension of files to be processed in quotations>" "<full path to directory with the files to be processed>" "<filename of the specific file to process>"

#### Details

# Multi_FASTQC.sh is a simple sbatch script that runs FASTQC and MultiQC reports in parallel with a single command 
# Results will be directed to a newly created sub-directory called Multi_FASTQC 
# For FASQC options use <fasqc --help> or visit  https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
# For MultiQC options use <multiqc --help> or visit  https://multiqc.info/

## Script Usage:
# 1.- Set the above slurm settings (#SBATCH) according to your system 
# 2.- Load parallel, fastqc and multiqc according to your system. Example:

enable_lmod
module load parallel
module load container_env multiqc
module load container_env fastqc
export SINGULARITY_BIND=/home/e1garcia

# 3.- Execute the script
# In the command line, type "sbatch", the name of the script <Multi_FASTQC.sh>, the suffix identifying the files to be analyzed in quotations, the full path to the directory containing the files to be processed, and the filename of the specific file to process.
# Example: <sbatch failedMulti_FASTQC.sh ".fq.gz" "home/e1garcia/shotgun_pire/pire_lcwgs_processing/sphaeramia_nematoptera/fq_raw/" "failedfile.fq.gz">

# Alternately, the suffix can be replaced by any regex expression that correctly identifies the files to be processed.
# If such regex does not occur at the end of file names, you'll need to remove the wild card " * " in the first fastqc statement in line 50

# Multi_FASTQC.sh has been tested in "fq", "fq.gz" and "bam" files.

#inDIR=$(echo $1 | sed 's/\\/$//')
inDIR=$1
REPORTNAME=$2
PATTERN=$3
FILENAME=$4

# run fastqc for the specific file
crun fastqc "${inDIR}/${FILENAME}"

# move fastqc files to a temporary directory
mkdir -p /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/1st_sequencing_run/fq_raw/temp_fastqc
mv "${inDIR}/*fastqc.html" /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/1st_sequencing_run/fq_raw/temp_fastqc/
mv "${inDIR}/*fastqc.zip" /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/1st_sequencing_run/fq_raw/temp_fastqc/

# run multiqc with specific report and subdirectory names
crun multiqc -v -p -ip -f --data-dir --data-format tsv --cl-config "max_table_rows: 3000" --filename $REPORTNAME --outdir $inDIR $inDIR

# move fastqc files to the multi_fastqc directory
mv temp_fastqc/* "${inDIR}/Multi_FASTQC/"

# move fastqc files to new subdirectory
mv *out /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/1st_sequencing_run/logs/

