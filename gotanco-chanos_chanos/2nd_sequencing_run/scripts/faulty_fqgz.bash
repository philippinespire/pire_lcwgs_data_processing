#!/bin/bash

# This is an extension of EGarcia's `chechFQ.sh`. This copies all the files WITHOUTH the proper fq.gz format and print the list on a text file. I can then use the text file to extract files from tamucc.

# Specify the pattern you want to match
PATTERN="WITHOUT"

# Input file (source file)
INFILE=$1

# Output file (destination file)
OUTFILE="faulty_fqgz.txt"

# Extract lines matching the pattern and save them to the output file
grep "$PATTERN" "$INFILE" | cut -d ":" -f 2- > "$OUTFILE"



