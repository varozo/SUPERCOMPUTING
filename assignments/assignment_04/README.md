# Valentina Rozo, Assignment 4, 02/26/2027

## Task 1
- Already done

## Task 2
- In programs directory:
brew install gh
wget https://github.com/cli/cli/releases/download/v2.74.2/gh_2.74.2_linux_amd64.tar.gz
tar -xzvf gh_2.74.2_linux_amd64.tar.gz 
rm gh_2.74.2_linux_amd64.tar.gz 

## Task 3
nano install_gh.sh
- Copy and paste all above terminal commands in here

## Task 4
export PATH=$PATH:/sciclone/home/varozo/programs

## Task 5
- Already done

## Task 6
- Install seqtk using the introduction section of the github repo that was provided
- Make sure you’re still in the programs directory
git clone https://github.com/lh3/seqtk.git;
cd seqtk; make

- Attach path to $PATH
pwd
echo "export PATH=$PATH:/sciclone/home/varozo/programs/seqtk" >> ~/.bashrc

## Task 7
- Look at github repo
- How many TTTAGGG in sequences:
seqtk telo -m TTTAGGG ~/SUPERCOMPUTING/assignments/assignment_03/data/GCF_000001735.4_TAIR10.1_genomic.fna > telo.bed 2> telo.count
head telo.count

## Task 8
- Navigate to SUPERCOMPUTING assignment 4:
cd ..
cd ..
cd SUPERCOMPUTING/
cd assignments/assignment_04
nano summarize_fasta.sh
- Add code to script & add executable permissions & run it on assignment 3 .fna data
chmod +x summarize_fasta.sh 
./summarize_fasta.sh ~/SUPERCOMPUTING/assignments/assignment_03/data/GCF_000001735.4_TAIR10.1_genomic.fna

## Task 9
mkdir data
cd data/

- Navigate to https://ftp.ncbi.nlm.nih.gov/genbank/ on your browser
- Get 3 files and put in data directory & unzip
wget https://ftp.ncbi.nlm.nih.gov/genbank/gbbct112.seq.gz
wget https://ftp.ncbi.nlm.nih.gov/genbank/gbbct116.seq.gz
wget https://ftp.ncbi.nlm.nih.gov/genbank/gbbct167.seq.gz
gunzip gbbct112.seq.gz
gunzip gbbct116.seq.gz 
gunzip gbbct167.seq.gz 

- From the github instructions README, learned how to convert to fasta (fa)
seqtk seq -a gbbct112.seq > gbbct112.fa
seqtk seq -a gbbct116.seq > gbbct116.fa
seqtk seq -a gbbct167.seq > gbbct167.fa
cd ..

for file in data/*.fa; do ./summarize_fasta.sh "$file"; done

- Create a .gitignore in assignment04 and add data/ to it
nano .gitignore

- git add, commit, push to repo

## Task 10:
### Reflection
For assignment 4, I worked in my home’s programs directory (not within SUPERCOMPUTING) and cloned the seqtk repo inside, so I could use it in my actual assignment_04. I then started working in that directory where I created the summarize_fasta.sh, created my script, and added executable permissions on it so I could call it on my assignment_03 data. I then downloaded the three sequence files, unzipped them, converted them, and ran a for loop on all three (on the command line) to get the summaries for each sequence. Lastly, I created a .gitignore file so my data wouldn’t be uploaded to my GitHub repo, or I wouldn't face issues. I added/, committed/pushed, and finished up my reflection. So I worked in my home’s program directory, which now also contains the seqtk repo, install_gh.sh (with unpacking commands for the tarball file that was also added), and in assignment_04 (contains a .gitignore, summarize_fasta.sh, and a data directory with three sequence fasta files).

During this lab, I had to navigate using seqtk commands and learn how to “get” certain values I needed from the files. I also ran into a challenge when I needed to download my three fasta files, and they were in a different extension name, so I needed to convert them. But I took a look at the seqtk README on its GitHub, and I think I got it. I was also confused about whether I should’ve downloaded only one sequence at a time since the GenBank only had single sequences, as I came to realize after the program ran. I learned in this assignment, in working on Task 7, that seqtk has a built-in command that allows you to search from anywhere in the HPC for a specific .fna file and count the number of times a specific pattern occurs (using telo). I also learned this week how to run scripts from anywhere in the hpc and how to complete for loops on the terminal in the proper syntax (with semicolons). $PATH is an environment variable and is a list of directories the shell looks through when typing a command on the terminal. It can be used to run programs from various locations without typing the full path, as we used in this lab on assignment_03’s data file in Task 7. It can also be used to extend what directories the shell looks through by adding a colon and adding it to the .bashrc to ensure it isn’t temporary. In a broader view, using $PATH can also be used to combat installation and version inconsistencies that might arise when creating a replicable deliverable.