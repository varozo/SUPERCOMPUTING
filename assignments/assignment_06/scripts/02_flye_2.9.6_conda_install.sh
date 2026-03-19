#!/bin/bash
set -ueo pipefail

cd ~/SUPERCOMPUTING/assignments/assignment_06/
touch flye-env.yml

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

# mamba create -n flye-env -y
# mamba create -n flye-env -y -c bioconda -c conda-forge flye
mamba create -n flye-env -y flye -c bioconda -c conda-forge

conda activate flye-env

flye -v

conda env export --no-builds > flye-env.yml

# clean up
conda deactivate
