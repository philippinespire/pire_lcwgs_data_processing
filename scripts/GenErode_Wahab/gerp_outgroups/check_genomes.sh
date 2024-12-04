#!/bin/bash

# File containing the list of URLs
FILENAME_LIST="abu_filenames.txt"

# Check if the file exists
if [[ ! -f "$FILENAME_LIST" ]]; then
  echo "Error: $FILENAME_LIST not found!"
  exit 1
fi

# Initialize counters
total_files=0
missing_files=0

# Read each URL from abu_filenames.txt
while IFS= read -r url; do
  # Extract the filename from the URL (everything after the last '/')
  filename=$(basename "$url")
  
  # Trim any leading or trailing whitespace, newline, or carriage return characters
  filename=$(echo "$filename" | tr -d '\r' | xargs)
  
  # Increment the total files counter
  total_files=$((total_files + 1))
  
  # Check if the file exists in the current directory
  if [[ -f "$filename" ]]; then
    echo "Found: $filename"
  else
    echo "Missing: $filename"
    missing_files=$((missing_files + 1))
  fi
done < "$FILENAME_LIST"

# Summary
echo "Total files listed: $total_files"
echo "Missing files: $missing_files"
