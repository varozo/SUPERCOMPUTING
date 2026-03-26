#!/bin/bash
set -ueo pipefail

BASE=~/SUPERCOMPUTING/assignments/assignment_07
CLEAN_DIR="$BASE/data/clean"
REF_DIR="$BASE/data/dog_reference/ncbi_dataset/data/GCF_011100685.1"  # adjust to your folder
OUT_DIR="$BASE/output"
mkdir -p "$OUT_DIR"

BBMAP_DIR=~/SUPERCOMPUTING/programs/bbmap
export PATH="$BBMAP_DIR:$PATH"

# check if bbmap.sh is available
if ! command -v bbmap.sh &> /dev/null; then
    echo "ERROR: bbmap.sh not found in PATH"
    exit 1
fi

# Grab the first genomic FASTA file in the reference folder
DOG_REF=$(ls "$REF_DIR"/*_genomic.fna | head -n 1)
if [ ! -f "$DOG_REF" ]; then
    echo "ERROR: Dog reference FASTA not found in $REF_DIR"
    exit 1
fi

for FWD in "$CLEAN_DIR"/*_1.clean.fastq; do
    REV="${FWD/_1.clean.fastq/_2.fastq}"
    SAMPLE=$(basename "$FWD" _1.fastq)
    SAM_OUT="$OUT_DIR/${SAMPLE}.sam"
    BAM_OUT="$OUT_DIR/${SAMPLE}_dog-matches.bam"

    bbmap.sh in1="$FWD" in2="$REV" ref="$DOG_REF" out="$SAM_OUT" nodisk=t ambiguous=best minid=0.95 threads=8 Xmx=16g

    samtools view -b -F 4 "$SAM_OUT" > "$BAM_OUT"
done
