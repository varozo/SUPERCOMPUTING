# Valentina Rozo, Assignment 6, 03/19/2026

## Task 1:

- Copy the assignment structure or make sure you have the following by using the `mkdir` command:
    - assignment_06 is the parent directory where you run ./pipeline.sh
    - assignment_06/scripts
    - assignment_06/data
    - assignment_06/assemblies
    - assignment_06/assemblies/assembly_conda
    - assignment_06/assemblies/assembly_local
    - assignment_06/assemblies/assembly_module

## Task 2:

- I at first deleted the (?/download=1) because it looked incorrect, but I later just modified it because I believe that was wrong to do.
- Make sure to do this to make this and EVERYOTHER .sh file executable: `chmod +x ~/SUPERCOMPUTING/assignments/assignment_06/scripts/01_download_data.sh`
- `nano 01_download_data.sh` -> make it executable through: `chmod +x 01_download_data.sh`

## Task 3: 

- Builds in programs directory, but this script is in assignment_06/scripts
- NOTE: check out the latest update!
- `nano flye_2.9.6_manual_build.sh` -> make it executable through: `chmod +x flye_2.9.6_manual_build.sh`
- Add its location to path (temporary): `export PATH=$PATH:~/programs/Flye/bin`

## Task 4:

- `nano flye_2.9.6_conda_install.sh` -> make it executable through: `chmod +x flye_2.9.6_conda_install.sh`
- I had a few issues with the mamba environment creation, so I used the internet after consulting the hint on the assignment instructions (there ended up being more to add for the mamba statement, but I tried a few)!
    - `mamba create -n flye-env -y` vs `mamba create -n flye-env -y -c bioconda -c conda-forge flye` vs `mamba create -n flye-env -y flye -c bioconda -c conda-forge`

## Task 5:

- I struggled in this part a bit, especially since I am not familiar with genome data numerical values, but I did a lot of looking up!

## Task 6:

- I created the remaining scripts with names according to the image in the instructions using `nano`
- For 6a, I ended up trying out my find commands apart from the script at first for convinience, and I needed to refamiliarize myself with the way to delete all directories except the parent one (proved to be a little more difficult than adding a * like we discussed in class).
    - `find -maxdepth 1 -mindepth 1 -type d -exec rm -rf {} \;`
- For 6b, I needed to see where my Flye was so I used the command, `module avail flye` to get the output, `Flye/gcc-11.4.1/2.9.6`. Users should note that the output will probably be different per user.
- For 6c, I just needed to add `export PATH=$PATH:~/programs/Flye/bin` as a replacement for the other 03 scripts.
- They all took around 4 minutes which is a lot longer than 1 but my laptop has been slow recently so I didn’t think much of it.

## Task 7:

- To get the last 10 lines of all logs:
    - `tail -n 10 assemblies/` as the root and find each log within each of the three method directories.
- I noticed the numbers were the exact same, but used `cat` to see that there were subtle differences within their histograms, but that is to be expected I believe.

## Task 8:

- `nano pipeline.sh` -> make it executable through: `chmod +x pipeline.sh`
- I commented the steps I needed to get through and followed with inserting ./file for each step.
- I also took the step to `nano .gitignore` in the assignment_06 directory and placed the data directory so as not to upload the file to Github.

## Task 9:

- I removed all the content filled files from each directory (data and output files) and reran it all, which took around 15 minutes, without any prompting or inturruption. I then decided to triple check so I `rm -rf SUPERCOMPUTING` and recloned my github repository to ensure a clean environment, trying to simulate grading.

## Task 10:

### What I did and where the files are:
- Before most of the steps, I tried them outside of a script to see if they work since it was easy to go back and forth instead of staying in thee scripts directory.
- assignment_06/scripts
    - 01_download_data.sh downloads the data and opens it within the data folder
    - 02_flye_2.9.6_conda_install.sh goes with 03_run_flye_conda.sh and installs conda, activates it, and deactivates it to prepare it for its run script
    - 02_flye_2.9.6_manual_build.sh goes with 03_run_flye_local.sh and manually builds Flye manually via Github, adding the location of where it downloads to the path within its run script
    - Since the module method is relying on the HPC admins, there is only one file, 03_run_flye_module.sh

### Future user:
- Ensure you have the following directory set up
    - assignment_06 is the parent directory where you run ./pipeline.sh
    - assignment_06/scripts
    - assignment_06/data
    - assignment_06/assemblies
    - assignment_06/assemblies/assembly_conda
    - assignment_06/assemblies/assembly_local
    - assignment_06/assemblies/assembly_module
- When creating a script if starting from scratch, always use the command `chmod +x <file>`
- To use conda environment:
    - Do this one time
        - `module load miniforge3`
        - `source $(conda info --base)/etc/profile.d/conda.sh`
    - Then just this
        - `conda activate flye-env`
        - `flye -v`
        - `conda deactivate` when done

### Reflection:
- In this assignment, I mainly had to overcome navigating when to use conda vs mamba when creating my conda Flye environment. I struggled a lot with the find statements in order to clean up the outputs of each 03 script as well, but I ultimately was able to find help online. I also struggled with the data file since it didn’t end in .gz. After trying two different options, I noticed one file was larger than the other so I decided to use the steps for the larger file.
- Overall, I learned the multiple ways (and their tradeoffs) to navigate creating and using environment to help me add tools specific to what I need. I also learned how to use Flye to “clean” the genome data, which was also a big of a struggle (navigating what to put for my Flye arguments).
- When I outputted the last 10 lines of each log file for each method, I noticed the outputs were the same, so I decided to cat the entire log outputs, which showed minor differences. But regarding the methods themselves, I thought that the conda method is the most intuitive for me since I apprieciated how I can add anything under my conda environment and its the most reproducible of the three. For example, I cant download  ‘tree’ package because I don’t have permission to, but I can use it if I download it in the environment. The only downside is remembering the commands to activate the environment since we aren’t downloading Flye like in the module load method.
- I only didnt completely fabor the local build method since we have to manually change the version each time we choose to run it, but I made sure to add a note in the README. But apart from that, it only needed one line (add path) in its script to run so it has a fairly simple implementation.
- My least favorite method was the module load method. though it also only requires one line compared to the multiple for building the conda environment, this method relies on the HPC admins, where to aquire where it is, I needed to run `module avail flye` seperately to get it, which hinders reproducibility if its activation line is different per user. Another downside is that its limited to what the HPC admins have available (again, I wasnt able to directly download ‘tree’ on my HPC).
- I would most likely go with the conda activate method for my next project since based on my notes from class, it has the potential for managing complex workflows and prioritizes reproducibility, even though it is slower to install and requires two scripts to implement cleanly.
