#!/bin/bash

### Path to your accession list
accession_list="accession_list.txt"

### Function to process each accession
process_accession() {

local accession=$1
echo -e "\n${accession}\n"

# Download the SRA file
prefetch $accession

# Convert SRA to FASTQ
fastq-dump --split-3 --gzip $accession

# Optionally, delete the SRA file to save space
rm -rf ./$accession
}

export -f process_accession

## Run the process_accession function in parallel for each accession
parallel -j 4 process_accession ::: $(cat $accession_list)

