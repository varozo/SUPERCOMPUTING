#!/bin/bash

# deleted the ?/download=1 because it looked incorrect

cd ~/SUPERCOMPUTING/assignments/assignment_06/data

wget 'https://zenodo.org/records/15730819/files/SRR33939694.fastq.gz?download=1'
mv 'SRR33939694.fastq.gz?download=1' SRR33939694.fastq.gz
gunzip SRR33939694.fastq.gz
