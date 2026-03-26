#!/bin/bash
#SBATCH --job-name=assignment_07_pipeline
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=24:00:00
#SBATCH --mem=32G
#SBATCH --mail-type=FAIL,BEGIN,END
#SBATCH --mail-user=varozo@wm.edu               # change this!
#SBATCH -o ~/SUPERCOMPUTING/assignments/assignment_07/assignment_7_%j.out # change this!
#SBATCH -e ~/SUPERCOMPUTING/assignments/assignment_07/assignment_7_%j.err # change this!

# Load modules & conda
module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

# Activate environment for datasets, sra-tools, fastp, bbmap
conda activate dog_pipeline

# Optional: make sure tools are in PATH
export PATH=~/SUPERCOMPUTING/programs/sratoolkit.3.3.0-ubuntu64/bin:$PATH
export PATH=~/SUPERCOMPUTING/programs/bbmap:$PATH

# Directories

cd ~/SUPERCOMPUTING/assignments/assignment_07/

./scripts/01_download_data.sh
./scripts/02_clean_reads.sh
./scripts/03_map_reads.sh
