#!/bin/bash
set -ueo pipefail

# activate flye-env environment
cd ~/SUPERCOMPUTING/assignments/assignment_06/
module load Flye/gcc-11.4.1/2.9.6 

OUT_DIR="./assemblies/assembly_module"

flye --nano-raw data/SRR33939694.fastq --out-dir ${OUT_DIR} --threads 6 --genome-size 50k &> "${OUT_DIR}/flye.log"

mv "${OUT_DIR}/assembly.fasta" "${OUT_DIR}/module_assembly.fasta"
mv "${OUT_DIR}/flye.log" "${OUT_DIR}/module_flye.log"
find ${OUT_DIR} -type f ! -name "module_assembly.fasta" ! -name "module_flye.log" -delete
find ${OUT_DIR} -maxdepth 1 -mindepth 1 -type d -exec rm -rf {} \;
