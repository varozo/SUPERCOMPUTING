#!/bin/bash
FWD_IN=$1
REV_IN=${FWD_IN/_R1_/_R2_}

# output paths?
FWD_OUT=${FWD_IN/.fastq.gz/.trimmed.fastq.gz}

fastp --in1 $FWD_IN --in2 $REV_IN --out1 ${FWD_OUT/raw/trimmed}
