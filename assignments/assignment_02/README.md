# Valentina Rozo, DUE: 02/12/2026, Assignment 02

## Descriptions of the assignment tasks and directory structure AND All commands used (local and HPC - specify which), in order

### Task 2:

I first navigated to `~/SUPERCOMPUTING/assignments/assignment_2/data/`, where instead of doing the ftp commands which weren't working (I explain why at the bottom), I used the following curl commands:

`curl -O https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz`
`curl -O https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.gff.gz`

### Task 3.1:

Once I connected to my host environment (my credentials) using SFTP following the directions using filezilla, I navigated to my data folder in both my local and remote site and dragged both .gz files from my local to the remote site.

### Task 3.2:

Since the owner (me) is the only one with reading and writing permissions on this file on the HPC, I did the following to change it to readable for the group (i.e. the instructor and everyone else in the group).

I navigated to `~/SUPERCOMPUTING/assignments/assignment_2/data/` within bora and I had the files, I completed the following within the data directory I was currently in:

`chmod -R g+r GCF_000005845.2_ASM584v2_genomic.gff.gz`
`chmod -R g+r GCF_000005845.2_ASM584v2_genomic.fna.gz`

This will change the permissions for each of these files to: -rw-r----- so people in the DATA440 group can read it.

### Task 4:

Once in my data folder on both my local and remote machines, I used the following commands to get the md5sum hashes to ensure there wasn't corruption when transfering them from my local to my HPC via filezilla. After close inspection, I noticed they MATCHED and the contents of the data are identical.

`md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz`
`md5sum GCF_000005845.2_ASM584v2_genomic.gff.gz`

#### bora Output:
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz

#### Local Output:
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz

### Task 5:

On my local AND remote (HPC) machine I did the following:

`nano ~/.bashrc`

And added the following to it at the very bottom:
`alias u='cd ..;clear;pwd;ls -alFh'`
`alias d='cd -;clear;pwd;ls -alFh'`
`alias ll='ls -alFh'`

`^O Enter ^X`

`source ~/.bashrc`

`u`

`d`

`ll`

#### Aliases Added:
- u: moves to the parent directory of where the user was (cd ..), clears the screen (clear), prints the working directory (pwd), and lists all files including hidden ones (.) in human readable & long format (ls -alFh).
- d: moves to the old/previous working directory of where the user was (cd -), clears the screen (clear), prints this current working directory (pwd), and lists all files including hidden ones (.) in human readable & long format (ls -alFh)
- ll: lists all files including hidden ones (.) in human readable & long format (ls -alFh).

I was having issues with my local machine (mac) which wouldn't support `--group-directories-first` (ls: unrecognized option `--group-directories-first'), so I just removed it from my aliases which ended up functioning. I did some research on the Unix & Linux Stack Exchange website and found that this would just list files & directories with directories being first (or at the top) in each alias' output. But when I tried it in bora, it worked, so I was able to see it in action. Lastly, I'm not sure what the 'F' in 'ls -alFh' is, but I assume it might be 'F' for formatting? I couldn't find anything online about it.

## A reflection (4–5 sentences) on what worked, what was hard, and what you'd change
Upon reflection, I had trouble adding a .gitignore file (to avoid pushing data to github as we learned in class)to my assignment_02 data directory and push/pulling it to/from github. I encountered a few merge conflicts because I made a .gitignore on both, but I ended up deleting the .gitignore file I made on my HPC account (after I made one on my local machine) so I could pull the .gitignore file I pushed from my local computer to github. I also had trouble using the ftp command, so I ended up just using `curl -O <file path link>` to get the files in task 2. I did try to use the ftp command by installing ftp (using "brew install inetutils"), but I was having trouble listing the files when calling ftp with the url even while using "passive" mode (which is why I cite my attempt at ftp commands in Task 2). Fortunately, I did have success using filezilla to download my files without corruption, as shown with the matched MD5 hashes. I thought I learned a lot in this assignment, so I wouldn't change anything.