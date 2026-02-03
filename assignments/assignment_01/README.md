1. git clone https://github.com/varozo/SUPERCOMPUTING
2. cd SUPERCOMPUTING
3. mkdir assignments
4. cd assignments/
5. mkdir assignment_1
6. cd assignment_1/
7. mkdir data
8. mkdir scripts
9. mkdir results
10. mkdir docs
11. mkdir config
12. mkdir logs
13. cd data
14. mkdir raw
15. mkdir clean
16. cd ..
17. touch assignment_1_essay.md
18. touch README.md
19. touch data/raw/example_raw.txt
20. touch data/clean/example_clean.txt
21. touch scripts/script.sh
22. touch results/results_placeholder.txt
23. touch docs/docs_placeholder.md
24. touch config/config_placeholder.yaml
25. touch logs/logfile.log
26. cd ..
27. git add .
28. git commit -m 'Draft'
29. git push

*Explanations, notes, etc:*

`git clone https://github.com/varozo/SUPERCOMPUTING` using my personal link from github, I cloned the repository to my local machine's home directory

`cd SUPERCOMPUTING` enter the SUPERCOMPUTING folder on my home directory in my local machine
`mkdir assignments` create the folder for assignments, (mkdir means make directory)
`cd assignments/` enter the ./assignments/ folder to create ./assignments/assignment_1
`mkdir assignment_1` create assignment_1 folder inside assignments folder
`cd assignment_1/` enter assignment_1 folder

the following 6 lines create all of the folders given to us in the template to refer to
`mkdir data`
`mkdir scripts`
`mkdir results`
`mkdir docs`
`mkdir config`
`mkdir logs`

go into the /data folder and create the two subdirectories
`cd data`
`mkdir raw`
`mkdir clean`

go back to the assignment_1 folder that housed the data folder ('..' means go back to the parent directory)
`cd ..`

create the assignment_1_essay.md and README.md markdown file ('touch' is to create a new & empty file if it doesnt already exist)
`touch assignment_1_essay.md`
`touch README.md`

create all placeholder files inside each subdirectory using relative paths
`touch data/raw/example_raw.txt`
`touch data/clean/example_clean.txt`
`touch scripts/script.sh`
`touch results/results_placeholder.txt`
`touch docs/docs_placeholder.md`
`touch config/config_placeholder.yaml`
`touch logs/logfile.log`

since this is all on my virtual directory, I then add, commit, push to the github repo so both are the updated repo with the assignments folder and its contents (just assignment_1 for now)
`cd ..` go to assignments folder
`git add .` add all (.) file changes to this commit to push to the repo
`git commit -m 'Draft'` I am labelling this commit as 'Draft' because I am revising my work after and will continue making changes to both README.md and assignment_1_essay until I finish but everything will remain the same above all the git commands
`git push` push to the repo in github