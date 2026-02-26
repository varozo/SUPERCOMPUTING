#!/bin/bash
set -ueo pipefail

file=$1

# total number of sequences
total_seqs=$(seqtk comp "$file" | wc -l | cut -f1 -d " ")

# total number of nucleotides
total_nucs=$(seqtk comp "$file" | awk '{sum += $2} END {print sum}')

echo "File: $file" # for more than one file

echo "Total Number of Sequences: $total_seqs"
echo "Total Number of Nucleotides: $total_nucs"
echo "Table of Sequence Names and Lengths:"

# outputs all of the table
seqtk comp "$file" | awk '{print $1 "\t" $2}'
