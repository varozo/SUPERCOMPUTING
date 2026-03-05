#!/bin/bash

# add directory containing fastp to PATH
#PATH=$PATH:/sciclone/home/varozo/SUPERCOMPUTING/programs

FWD_IN=$1
REV_IN=${FWD_IN/_R1_/_R2_}

# output paths?
FWD_OUT=${FWD_IN/.fastq.gz/.trimmed.fastq.gz}
REV_OUT=${REV_IN/.fastq.gz/.trimmed.fastq.gz}
JSON_OUT="$HOME/SUPERCOMPUTING/assignments/assignment_05/log/fastp.json"
HTML_OUT="$HOME/SUPERCOMPUTING/assignments/assignment_05/log/fastp.html"

fastp --in1 $FWD_IN --in2 $REV_IN --out1 ${FWD_OUT/raw/trimmed} --out2 ${REV_OUT/raw/trimmed} --json $JSON_OUT --html $HTML_OUT
