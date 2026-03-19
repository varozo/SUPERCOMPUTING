#!/bin/bash
set -ueo pipefail

# activate flye-env environment
cd ~/SUPERCOMPUTING/assignments/assignment_06/
export PATH=$PATH:~/programs/Flye/bin

OUT_DIR="./assemblies/assembly_local"

flye --nano-raw data/SRR33939694.fastq --out-dir ${OUT_DIR} --threads 6 --genome-size 50k &> "${OUT_DIR}/flye.log"

mv "${OUT_DIR}/assembly.fasta" "${OUT_DIR}/local_assembly.fasta"
mv "${OUT_DIR}/flye.log" "${OUT_DIR}/local_flye.log"
find ${OUT_DIR} -type f ! -name "local_assembly.fasta" ! -name "local_flye.log" -delete
find ${OUT_DIR} -maxdepth 1 -mindepth 1 -type d -exec rm -rf {} \;
