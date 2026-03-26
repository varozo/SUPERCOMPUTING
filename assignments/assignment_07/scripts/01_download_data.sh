#!/bin/bash
set -ueo pipefail

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda create -n dog_pipeline -y -c bioconda ncbi-datasets-cli
conda activate dog_pipeline
datasets download genome taxon "Canis familiaris" --reference --filename dog.zip

# Add sratoolkit and datasets to PATH
export PATH=~/SUPERCOMPUTING/programs/sratoolkit.3.3.0-ubuntu64/bin:$PATH
export PATH=~/SUPERCOMPUTING/programs/datasets:$PATH

# Directories
mkdir -p data/raw data/clean data/dog_reference

# Metadata file
METADATA="./data/SraRunTable_one.csv"

# Download SRR reads
# SRR accessions selected from SRA (Shotgun metagenome, Illumina, 10-20 accessions)
for SRR in $(awk -F',' 'NR>1 {print $1}' "$METADATA"); do
    if [ -f "data/raw/${SRR}_1.fastq" ]; then
        echo "$SRR already downloaded, skipping."
        continue
    fi
    echo "Downloading $SRR..."
    fasterq-dump "$SRR" \
        --split-files \
        -O data/raw \
        --temp data/raw \
        -e 8
done

# Download Canis familiaris reference genome
if [ ! -f data/dog_reference/dog_reference.zip ]; then
    datasets download genome taxon "Canis lupus familiaris" --reference --filename data/dog_reference/dog.zip
fi

# Extract reference genome
#unzip -o data/dog_reference/dog_reference.zip -d data/dog_reference
#rm -f data/dog_reference/dog_reference.zip
unzip -o ~/SUPERCOMPUTING/assignments/assignment_07/data/dog_reference/dog.zip -d ~/SUPERCOMPUTING/assignments/assignment_07/data/dog_reference
rm -f ~/SUPERCOMPUTING/assignments/assignment_07/data/dog_reference/dog.zip

cd ~/SUPERCOMPUTING/assignments/assignment_07/
rm dog.zip
