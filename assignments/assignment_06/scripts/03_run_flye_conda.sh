#!/bin/bash
set -ueo pipefail

# activate flye-env environment
cd ~/SUPERCOMPUTING/assignments/assignment_06/
module load miniforge3
source $(conda info --base)/etc/profile.d/conda.sh
conda activate flye-env

OUT_DIR="./assemblies/assembly_conda"

flye --nano-raw data/SRR33939694.fastq --out-dir ${OUT_DIR} --threads 6 --genome-size 50k &> "${OUT_DIR}/flye.log"

mv "${OUT_DIR}/assembly.fasta" "${OUT_DIR}/conda_assembly.fasta"
mv "${OUT_DIR}/flye.log" "${OUT_DIR}/conda_flye.log"
find ${OUT_DIR} -type f ! -name "conda_assembly.fasta" ! -name "conda_flye.log" -delete
find ${OUT_DIR} -maxdepth 1 -mindepth 1 -type d -exec rm -rf {} \;

conda deactivate
