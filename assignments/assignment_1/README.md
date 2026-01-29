Task 2. Document your work
Inside your `README.md` file, keep an exact ordered list of commands used to create your project structure. I should be able to run the contents of `README.md` line-by-line and get your exact project structure, including all placeholder files. Your README.md file should also include explanations, notes, etc.

git clone https://github.com/varozo/SUPERCOMPUTING `using my personal link from github, I cloned the repository to my local machine's home directory`

cd SUPERCOMPUTING `enter the SUPERCOMPUTING folder on my home directory in my local machine`

mkdir assignments `create the folder for assignments, (mkdir means make directory)`

cd assignments/ `enter the ./assignments/ folder to create ./assignments/assignment_1`

mkdir assignment_1 `create assignment_1 folder inside assignments folder`

cd assignment_1/ `enter assignment_1 folder`

`the following 6 lines create all of the folders given to us in the template to refer to`
mkdir data
mkdir scripts
mkdir results
mkdir docs
mkdir config
mkdir logs

`go into the /data folder and create the two subdirectories`
cd data
mkdir raw
mkdir clean

cd .. `go back to the assignment_1 folder that housed the data folder`

`create the assignment_1_essay.md and README.md markdown file (touch is to create a new & empty file if it doesnt already exist)`
touch assignment_1_essay.md
touch README.md

`create all placeholder files inside each subdirectory`
touch data/raw/example_raw.txt
touch data/clean/example_clean.txt
touch scripts/script.sh
touch results/results_placeholder.txt
touch docs/docs_placeholder.md
touch config/config_placeholder.yaml `I know about yaml file types because of kubernetes cluster and docker we were given a rundown on in geoLab`
touch logs/logfile.log

`since this is all on my virtual directory, I then add, commit, push to the github repo so both are the updated repo with the assignments folder and its contents (just assignment_1 for now)`
cd .. `go to assignments folder`
git add . `add all file changes to this commit to push to the repo`
git commit -m 'Draft' `name this commit as whatever you wish, I am labelling it Draft because I am revising my work after and will continue making changes to both README.md and assignment_1_essay until I finish but everything will remain the same above all the git commands`
git push `push to the repo in github`