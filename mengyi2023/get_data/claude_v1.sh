#!/bin/bash

# Replace with your actual FTP link
FTP_LINK="ftp://download.big.ac.cn/gsa/CRA006191"

# Create a directory for the downloads
mkdir -p downloads
cd downloads

# Download all files from the FTP link
wget -r -nH --cut-dirs=3 --no-parent --reject "index.html*" $FTP_LINK
