#!/bin/bash
set -euo pipefail

# download data
./scripts/01_download_data.sh

# set data directory
DATA_DIR="$HOME/SUPERCOMPUTING/assignments/assignment_05/data/raw"

# run a for loop, running ./scripts/02_run_fastp.sh in each raw file

for FWD in ${DATA_DIR}/*_R1_*.fastq.gz
do
./scripts/02_run_fastp.sh "$FWD"
done
