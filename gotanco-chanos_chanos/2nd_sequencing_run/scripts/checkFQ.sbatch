#!/bin/bash

#SBATCH --job-name=checkFQ
#SBATCH -o log-checkFQ-%j.out
#SBATCH -p main
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --exclusive

echo -e "############  checkFQ.sh  ############\nThis script checks the size as well as the\nzip and fastq formats in your .fq.gz files.\nFiles with\npotentially problematic size, zip\nor fastq formats will be printed in the log\n and respectively saved to:\n\nfiles_wDiff_sizes.txt\nfiles_w_alternative_zip_format.txt\nfiles_w_bad_fastq_format.txt\n\nYou might want to try to redownload\nthese .fq.gz files and/or check for\nissues with the formats\n######################################\n\n"

# This scripts assumes that the tamucc_files.txt exits in the same directory as fq.gz files
# Normal fq.gz files would have the following format: Blocked GNU Zip Format (BGZF; gzip compatible), block length xxxxxx
# Alternative formats do not necessarily cause problems but they should be checked

# Directory with .fq.gz files
FQGZDIR=$1

#Move to working dir
cd $FQGZDIR

# Check the file format of each .fq.gz
echo  -e "\nChekcing zip format in files"
ls *fastq.gz | parallel --no-notice -kj40 file {} > file_types.txt

# Print files without Blocked GNU Zip Format
echo -e "Checking if any fastq.gz file has another format other than <Blocked GNU Zip Format>.\nIf all downloaded files have the format: Blocked GNU Zip Format, files_w_alternative_zip_format.txt will be empty\n\n"

mkdir -p fqgz_fileCheck
echo "Files with an alternative zip format:"
cat file_types.txt | grep -v 'Blocked GNU Zip Format'
cat file_types.txt | grep -v 'Blocked GNU Zip Format'> files_w_alternative_zip_format.txt
mv file_types.txt fqgz_fileCheck

# Checking that files have proper FASTQ format (4 lines per sequence, where the 3rd is a "+")
echo -e "\nChecking if files have proper FASTQ format (4 lines per sequence, where the 3rd is a +)\nResults will be printed in the log and in  files_w_bad_fastq_format.txt\n"

ls *fastq.gz | sed 's/\.fastq\.gz//' | parallel --no-notice -kj40 "zcat {}.fastq.gz | paste - - - - | cut -f3 | sort | uniq -c > fqgz_fileCheck/{}.third_column.txt"

# Iterate through each file in the directory
for file in fqgz_fileCheck/*third_column.txt; do
    # Check if the file is a regular file and not a directory
    if [ -f "$file" ]; then
        line_count=$(wc -l < "$file")
	BASE=$(echo $file | sed -e 's/.*\///' -e 's/\.third_column\.txt//')
        if [ $line_count -gt 1 ]; then
		echo "File with one or more reads WITHOUT proper fastq format: $BASE.fastq.gz"
		echo "$BASE.fastq.gz" >> files_w_bad_fastq_format.txt
        elif [ $line_count -eq 1 ]; then
            echo "File with proper fastq format: $BASE.fastq.gz"
	    echo "No issues detected. All files seem to have proper fastq format" > files_w_bad_fastq_format.txt
        else
            echo "Empty file: $BASE.fastq.gz"
        fi
    fi
done

