#!/bin/bash

# Check if filenames.txt file exists
if [[ ! -f filenames.txt ]]; then
  echo "Error: filenames.txt file not found!"
  exit 1
fi

# Read each line from the filenames.txt file and use wget to download
while IFS= read -r url; do
  # Trim whitespace and any trailing characters
  trimmed_url=$(echo "$url" | tr -d '\r' | xargs)
  
  echo "Downloading $trimmed_url ..."
  
  # Check if the URL is not empty before downloading
  if [[ -n "$trimmed_url" ]]; then
    wget "$trimmed_url"
  else
    echo "Skipping empty URL."
  fi
done < filenames.txt

echo "Download completed."
