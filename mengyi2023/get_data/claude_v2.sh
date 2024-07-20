#!/bin/bash

# Replace with your actual FTP link
FTP_LINK="ftp://download.big.ac.cn/gsa/CRA006191"

# Create a directory for the downloads
mkdir -p data
cd data

# LFTP command
lftp -c "
open $FTP_LINK
set ssl:verify-certificate no
set net:timeout 10
set net:max-retries 3
set net:reconnect-interval-base 5
set net:reconnect-interval-multiplier 1
set mirror:parallel-transfer-count 5
mirror --verbose \
       --parallel=5 \
       --use-pget-n=5 \
       --only-newer \
       --ignore-time \
       -I '*.fastq.gz' -I '*.fq.gz' -I '*.sra' \
       --transfer-all
exit"

echo "Download complete!"
