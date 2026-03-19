#!/bin/bash

cd ~/SUPERCOMPUTING/assignments/assignment_06

# run each script in order

# download data
./scripts/01_download_data.sh
# build local Flye
./scripts/02_flye_2.9.6_manual_build.sh
# build Flye conda environment and yml file
./scripts/02_flye_2.9.6_conda_install.sh
# placeholder for module environment
# run Flye three times (one for each different environment)
./scripts/03_run_flye_conda.sh
./scripts/03_run_flye_module.sh
./scripts/03_run_flye_local.sh

# PRINT RESULTS: run code from task 7 to print the results to stdout
echo "Conda Flye Log"
tail -n 10 assemblies/assembly_conda/conda_flye.log
echo " "

echo "Module Flye Log"
tail -n 10 assemblies/assembly_module/module_flye.log
echo " "

echo "Local Flye Log"
tail -n 10 assemblies/assembly_local/local_flye.log
echo " "
