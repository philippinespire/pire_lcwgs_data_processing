#!/bin/bash

#SBATCH --job-name=checkFQ
#SBATCH -o log-checkFQ-%j.out
#SBATCH -p main
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --exclusive

echo -e "############  checkFQ.sh  ############\nThis script checks the size as well as the\>

# This scripts assumes that the tamucc_files.txt exits in the same directory as fq.gz files
# Normal fq.gz files would have the following format: Blocked GNU Zip Format (BGZF; gzip com>
# Alternative formats do not necessarily cause problems but they should be checked

# Directory with .fq.gz files
FQGZDIR=$1

#Move to working dir
cd $FQGZDIR

# Check the file format of each .fastq
echo  -e "\nChecking fastq format in files"
ls *fastq | parallel --no-notice -kj40 file {} > file_types.txt

mkdir -p fastq_fileCheck

# Checking that files have proper FASTQ format (4 lines per sequence, where the 3rd is a "+")
echo -e "\nChecking if files have proper FASTQ format (4 lines per sequence, where the 3rd i>

ls *fastq | sed 's/\.fastq//' | parallel --no-notice -kj40 "zcat {}.fastq | paste - - - - | >

# Iterate through each file in the directory
for file in fastq_fileCheck/*third_column.txt; do
    # Check if the file is a regular file and not a directory
    if [ -f "$file" ]; then
        line_count=$(wc -l < "$file")
        BASE=$(echo $file | sed -e 's/.*\///' -e 's/\.third_column\.txt//')
        if [ $line_count -gt 1 ]; then
                echo "File with one or more reads WITHOUT proper fastq format: $BASE.fastq"
                echo "$BASE.fastq" >> files_w_bad_fastq_format.txt
        elif [ $line_count -eq 1 ]; then
            echo "File with proper fastq format: $BASE.fastq"
            echo "No issues detected. All files seem to have proper fastq format" > files_w_>
        else
            echo "Empty file: $BASE.fastq"
        fi
    fi
done

