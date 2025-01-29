#!/bin/bash

#SBATCH --job-name=his_merge_bam
#SBATCH -o historical_merge-%j.out
#SBATCH -e historical_merge-%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

# Module Load
enable_lmod
module load container_env samtools/1.19

# This script merges multiple HISTORICAL *.merged.rmdup.merged.realn.bam files of the same sample into one *.merged.rmdup.merged.realn.bam file. 
# This script was made to merge multiple *.merged.rmdup.merged.realn.bam files generated from independent GenErode runs on the 1st and 2nd sequencing run. 
# The input and output file names will be identical, so it's important to set a new output filepath. 

# USER-DEFINED VARIABLES
# Path to the historical results *.merged.rmdup.merged.realn.bam files in the GenErode directory for the 1st sequencing run
path_1st_seq_run="/path/to/1st_sequencing_run"

# Path to the historical results *.merged.rmdup.merged.realn.bam files in the GenErode directory for the 2nd sequencing run
path_2nd_seq_run="/path/to/2nd_sequencing_run"

# Path to the output directory for the merged *.merged.rmdup.merged.realn.bam files
output_path="/path/to/output_merged_files"

# Generate sample names dynamically based on overlapping files
samples_in_first=($(find "$path_1st_seq_run" -maxdepth 1 -type f -name '*.merged.rmdup.merged.realn.bam' -printf '%f\n' | cut -c 1-10 | sort))
samples_in_second=($(find "$path_2nd_seq_run" -maxdepth 1 -type f -name '*.merged.rmdup.merged.realn.bam' -printf '%f\n' | cut -c 1-10 | sort))

# Overlapping sample names
sample_names=($(comm -12 <(printf "%s\n" "${samples_in_first[@]}") <(printf "%s\n" "${samples_in_second[@]}")))

# Detect files present only in the first sequencing run
missing_in_second=($(comm -23 <(printf "%s\n" "${samples_in_first[@]}") <(printf "%s\n" "${samples_in_second[@]}")))

# Detect files present only in the second sequencing run
missing_in_first=($(comm -13 <(printf "%s\n" "${samples_in_first[@]}") <(printf "%s\n" "${samples_in_second[@]}")))

# Log missing files
if [ ${#missing_in_second[@]} -gt 0 ]; then
    echo "The following samples are in the first sequencing run but not in the second:"
    printf "%s\n" "${missing_in_second[@]}"
else
    echo "No samples are missing in the second sequencing run."
fi

if [ ${#missing_in_first[@]} -gt 0 ]; then
    echo "The following samples are in the second sequencing run but not in the first:"
    printf "%s\n" "${missing_in_first[@]}"
else
    echo "No samples are missing in the first sequencing run."
fi

# Create output directory if it doesn't exist
mkdir -p "$output_path"

# Loop through each sample
for sample in "${sample_names[@]}"; do
    # Define input files
    bam_file_run1="${path_1st_seq_run}/${sample}.merged.rmdup.merged.realn.bam"
    bam_file_run2="${path_2nd_seq_run}/${sample}.merged.rmdup.merged.realn.bam"

    # Define output file
    merged_bam="${output_path}/${sample}.merged.rmdup.merged.realn.bam"

    # Merge BAM files
    echo "Merging BAM files for sample: $sample"
    crun.samtools samtools merge -f "$merged_bam" "$bam_file_run1" "$bam_file_run2"

	# Error check
	if [ $? -ne 0 ]; then
		echo "Error merging BAM files for sample: $sample" >&2
		exit 1
	fi

    # Index the merged BAM file
    echo "Indexing merged BAM file for sample: $sample"
    crun.samtools samtools index "$merged_bam"
done

# Confirm completion
echo "Merging and indexing completed for all samples!"
