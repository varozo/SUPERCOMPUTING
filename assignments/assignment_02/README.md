Valentina Rozo, DUE: 02/12/2026, Assignment 02


## Descriptions of the assignment tasks and directory structure AND All commands used (local and HPC - specify which), in order

### Task 3.1:

Once I connected to my host environment (my credentials) using SFTP following the directions, I navigated to my data folder in both my local and remote site and dragged both .gz files from my local to the remote site.

### Task 3.2:

Since the owner (me) is the only one with reading and writing permissions on this file, I did the following to change it to readable for the group (i.e. the instructor and everyone else in the group).

Navigate to ~/SUPERCOMPUTING/assignments/assignment_2/data/ within bora and once you have the files, complete the following within the data directory you are currently in:

chmod -R g+r GCF_000005845.2_ASM584v2_genomic.gff.gz
chmod -R g+r GCF_000005845.2_ASM584v2_genomic.fna.gz

This will change the permissions for each of these files to: -rw-r----- so people in the DATA440 group can read it.

### Task 4:

Once in my data folder on both my local and remote machines, I used the following commands to get the md5sum hashes to ensure there wasn't corruption when transfering them from my local to my HPC via filezilla. After close inspection, I noticed they matched and the contents of the data are identical!

md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz
md5sum GCF_000005845.2_ASM584v2_genomic.gff.gz

#### bora:
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz

#### local:
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz

### Task 5:

On my local AND remote (HPC) machine I did the following:

nano ~/.bashrc

(Add the following to it at the very bottom:
alias u='cd ..;clear;pwd;ls -alFh'
alias d='cd -;clear;pwd;ls -alFh'
alias ll='ls -alFh'
)

^O Enter ^X

source ~/.bashrc

u

d

ll

#### Aliases Added:
- u: moves to the parent directory of where the user was (cd ..), clears the screen (clear), prints the working directory (pwd), and lists all files including hidden ones (.) in human readable format (ls -alFh).
- d: moves to the old/previous working directory of where the user was (cd -), clears the screen (clear), prints this current working directory (pwd), and lists all files including hidden ones (.) in human readable format (ls -alFh)
- ll: lists all files including hidden ones (.) in human readable format (ls -alFh).

I was having issues with my mac which wouldn't support --group-directories-first (ls: unrecognized option `--group-directories-first'), so I just removed it from my aliases which ended up functioning. I did some research on the Unix & Linux Stack Exchange website and found that this would just list files & directories with directories being first (or at the top). I wanted to show I was able to do this part of the assignment, showing my reasoning with it.

## A reflection (4–5 sentences) on what worked, what was hard, and what you'd change
Upon reflection, I had trouble adding a .gitignore file to my assignment_02 data directory and push/pulling it to/from git hub. I encountered a few merge conflicts, but I ended up deleting the .gitignore file I made on my HPC account (after I made one on my local machine) so I could pull the .gitignore file I pushed from my local computer. I also had trouble using the ftp command, so I ended up just using "curl -O https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz" and "curl -O https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.gff.gz" to get the files in task 2. I did try to use the ftp command by installing ftp (using "brew install inetutils"), but I was having trouble listing the files when calling ftp with the url even while using "passive" mode. But I did have success using filezilla to download my files without corruption, as shown with the matched MD5 hashes. I thought I learned a lot in this assignment, so I wouldn't change anything.