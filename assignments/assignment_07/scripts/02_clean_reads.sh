#!/bin/bash
set -ueo pipefail

# Directories
BASE=~/SUPERCOMPUTING/assignments/assignment_07
RAW_DIR="$BASE/data/raw"
CLEAN_DIR="$BASE/data/clean"
mkdir -p "$CLEAN_DIR"

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

# Create the environment only once
conda create -n dog_pipeline_fastp -y -c bioconda -c conda-forge fastp

# Activate it
conda activate dog_pipeline_fastp

# Load fastp if using a module
#module load fastp

# Loop over all forward reads (_1.fastq) in raw directory
for R1 in "$RAW_DIR"/*_1.fastq; do
    # Build the reverse read filename by replacing _1.fastq with _2.fastq
    R2="${R1/_1.fastq/_2.fastq}"
    # Extract just the sample name (basename without _1.fastq)
    SAMPLE=$(basename "$R1" "_1.fastq")
    # Output files
    OUT1="$CLEAN_DIR/${SAMPLE}_1.fastq"
    OUT2="$CLEAN_DIR/${SAMPLE}_2.fastq"
    echo "Processing sample $SAMPLE ..."
    fastp -i "$R1" -I "$R2" -o "$OUT1" -O "$OUT2" --thread 8 --detect_adapter_for_pe --qualified_quality_phred 20 --length_required 50 --html "$CLEAN_DIR/${SAMPLE}_fastp_report.html" --json "$CLEAN_DIR/${SAMPLE}_fastp_report.json"
done
