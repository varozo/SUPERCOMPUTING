# Valentina Rozo, Assignment 5, March 5th
## Task 1

- From my assignment_05 folder
- `mkdir scripts`
- `mkdir log`
- `mkdir data`
- `mkdir data/raw`
- `mkdir data/trimmed`

## Task 2

- Download all files & more, execute from my data directory at first

- `nano 01_download_data.sh`
- `chmod +x pipeline.sh`

## Task 3

- In programs directory in hpc account, download fastp

`cd ~/programs/`
`wget http://opengene.org/fastp/fastp`
`chmod a+x ./fastp`

- NOTE: put this in the bottom of the .bashrc file:
- `export PATH=$PATH:/sciclone/home/varozo/SUPERCOMPUTING/programs`

## Task 4

- `nano 02_run__fastp.sh`
- `chmod +x 02_run_fastp.sh`

## Task 5

- nano pipeline.sh
- chmod +x pipeline.sh

- Looked at class notes for lesson 5 to guide me -> i was running into an issue where i was getting an error message that "—out1 and —out 2 wher : ERROR: read1 output (--out1) and read2 output (--out2) should be different". So in my for loop, I just made sure to only do the R1 files.

-  Add to the 02 script to direct the html & json files to the log output directory location

## Task 6

- I made a note to check whether my output is expected (I didnt use that many extra fastq commands)

## Task 7
- How to run the pipeline? Ensure you are in the assignment_05 directory and that you have a data directory. Run: ./pipeline.sh. This pipeline will add, extract the fastq.gz files, store them in /data/raw while deleting them from the download location, store the trimmed files in /data/trimmed, and store the log files (fastp.html and fastp.json) in the /log/ directory. It’s important to note that for every additional script I created, I needed to make it executable, so I typed chmod +x FILE to solve it.
    - Also make sure you download the needed fastp program:
        - `cd ~/programs/`
        - `wget http://opengene.org/fastp/fastp`
        - `chmod a+x ./fastp`
    - And put this at the bottom of your .bashrc file:
        - `export PATH=$PATH:/sciclone/home/varozo/SUPERCOMPUTING/programs`
- If you only want to run the fastp script on one file and edit its changes, nano into 02_run_fastp.sh and add additional arguements. Run this on any one file from the assignment_05 directory by typing the command: ./scripts/02_run_fastp.sh ./data/raw/FILE.fastq.gz.
- Reflection:
    - In this assignment, I also had a difficult time in creating the 02 script, until I learned that since we include two in’s we need two out’s and that would end in declaring REV_OUT and an —out2 in the same format as the other variables. I additionally faced a couple of challenges surrounding making the for loop after I had a running part 02 script for any one file. I would get an error saying “read1 output (--out1) and read2 output (--out2) should be different”, which I solved by looking back at my lesson 5 notes and maded sure that I iterated through all `*_R1_*.fastq.gz` files.
    - I also learned how to redirect the output location of my log files to the /log/ folder which was never explicitly stated in the directions, but I figured I needed to do since we created that directory in the first place.
    - I understand that we split the task into two scripts then call each one with a pipeline so that it is easy for other people to understand. If I get an error, it also makes it easy to denote where that error is so I don’t have to look through a long script. I also think it’s useful to have seperate scripts within the pipeline so other people know they can run each part individually to test or change the output. As we learned in class, this method could cause a problem with ownership complexities and dependancies on files, where we weren’t able to access a variable under the pipeline until it was linked between scripts or explicitly stated.