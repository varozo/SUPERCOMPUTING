#!/bin/bash

# downloads the data file
wget https://gzahn.github.io/data/fastq_examples.tar

# extracts all the contents -> x = extract; f = file
tar -xf fastq_examples.tar 

# puts all the fastq files into ./data/raw/
mv *.fastq* ~/SUPERCOMPUTING/assignments/assignment_05/data/raw/

# cleans up the fastq_examples.tar file
rm fastq_examples.tar
