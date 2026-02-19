# Valentina Rozo – February 19, 2026 – Assignment #3

## All commands used (first commands are to set up the rest of the commands, assuming the same file structure in SUPERCOMPUTING):
- `cd ~/SUPERCOMPUTING/assignments/assignment_03/data`
- `wget https://gzahn.github.io/data/GCF_000001735.4_TAIR10.1_genomic.fna.gz`
- `gunzip GCF_000001735.4_TAIR10.1_genomic.fna.gz`
- `FILE='GCF_000001735.4_TAIR10.1_genomic.fna'`
- `head -c 70 new.txt`

### Problems 1-10
- `grep -c "^>" $FILE`
- `grep -v "^>" $FILE | tr -d '\n' | wc -c`
- `wc -l $FILE`
- `grep "mitochondrion" $FILE | wc -l`
- `grep "chromosome" $FILE | wc -l`
- `grep -v "^>" $FILE | head -n 1 | wc -c`
  `grep -v "^>" $FILE | head -n 2 | tail -n 1 | wc -c`
  `grep -v "^>" $FILE | head -n 3 | tail -n 1 | wc -c`
- `grep -v "^>" $FILE | head -n 5 | tail -n 1 | wc -c`
- `grep -v "^>" $FILE | grep "AAAAAAAAAAAAAAAA" | wc -l`
- `grep "^>" $FILE | sort | head -n 1`
- `paste <(grep "^>" $FILE) <(grep -v "^>" $FILE)`

## Task 5: Reflection
When approaching this assignment, I decided to use my notes from class as well as the Lesson 3 document in the Google Drive to help me form my commands, which proved to be a bit difficult around question 6, where I needed to use the head & tail calls together since I didn't want to sum up the first three lines, instead individially getting their character totals. I was really frustrated with using head & tail together at first because I was using them separately at the beginning, getting much larger numbers than what was asked. I was also frustrated with using `wc -c` because it would always include new line characters, so for problem 2, I needed to keep that in mind, so I used `tr -d '\n'` within the pipeline to ensure those new line characters were deleted and not included in the total. I also want to mention that the assignment doesn't ask for any extra files, so for the last command question, I knew I needed to print the results in the terminal – I want to be clear that if that weren't the case, I would redirect the result of that command to a new file so I don't get overwhelmed by the large output on my screen. I learned that the `head -c 70 <file>` command is very helpful to see what needs to be used as a determinant for choosing what to use to select only specific lines, like `grep "^>"` which only chooses lines that start with >, while `grep -v "^>"` chooses lines that DONT start with > (proving to be especially useful because for most of the work, I only wanted to look into the sequences without the header). Overall, through this assignment, I understood that the commands we learned about in class are more powerful together and can help us when working on computationally intensive work that would be best if we didn't do these searches by hand.
These kinds of skills are essential in computational work because it allows for efficiency, or for anyone to download lots and lots of data that takes a lot of memory and discover what is going on within the file without it being overwhelming, at least that's what I noticed in my experience. I also think these skills are essential because we want to prioritize reproducibility, so ideally, the commands would be able to work for different people with different files they might want to do computational work on. 
In the future, if I decided to automate it, I know writing a shell script with all of the commands I used and some appropriately formatted outputs would be a good way to approach it, but I'm curious about the other ways to do it (like maybe when a new file enters the data folder it automatically outputs something like character count per line in another file in a seperate folder).