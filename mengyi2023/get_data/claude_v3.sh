#!/bin/bash

# Replace with your actual FTP link
FTP_LINK="ftp://download.big.ac.cn/gsa/CRA006191"

# Create a directory for the downloads
mkdir -p data
cd data

lftp -c "
open $FTP_LINK
set ssl:verify-certificate no
set net:timeout 10
set net:max-retries 10
set net:reconnect-interval-base 5
set net:reconnect-interval-multiplier 2
set net:connection-limit 3
set cmd:move-background yes
set xfer:rate-period 30
set mirror:parallel-transfer-count 1
set pget:default-n 1
set net:limit-rate 500k
mirror --verbose \
       --parallel=1 \
       --use-pget-n=1 \
       --only-newer \
       --ignore-time \
       -I '*.fastq.gz' -I '*.fq.gz' -I '*.sra' \
       --transfer-all
exit"

echo "Download complete!"

