#!/bin/bash

# Use this script if you used an NCBI reference genome for ANGSD
# Define input and output file names
input_file="ncbi_chromnames"
output_file="sedfile"

# Use awk to format the input file into sed substitution commands
awk '{print "s/" $0 "/chr" NR "/g"}' "$input_file" > "$output_file"

echo "Output saved to $output_file"
