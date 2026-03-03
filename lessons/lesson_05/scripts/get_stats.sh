#!/bin/bash

# take files as input
echo $SHARED_DIR

# run seqkit stats on them all
# HARD CODED -> ONLY CAN BE RUN UNDER LESSON_05: seqkit stats ./data/*.fastq > stats.tsv
# consider that seqkit might not be installed in their environment
#seqkit stats ${SHARED_DIR}/lesson_05/data/*.fastq > ./output/stats.tsv
# output files are where you are when you run this

# export results

