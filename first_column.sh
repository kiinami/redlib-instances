#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input.csv output.txt"
    exit 1
fi

input_file="$1"
output_file="$2"

# Extract the first column, process it, and write to the output file
cut -d',' -f1 "$input_file" | sed 's#http://##g; s#https://##g; s#^#||#; s#$#^#' > "$output_file"

echo "First column extracted and processed to $output_file"
