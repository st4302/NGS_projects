#!/bin/bash
#SBATCH --job-name=downloadSRR # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail
#SBATCH --ntasks=1 # Run on a single node
#SBATCH --mem=8gb # Job memory request
#SBATCH --time=12:00:00 # Time limit hrs:min:sec
#SBATCH --output=trim%j.log # Standard output and error log
#SBATCH -p cpu_short # Specifies location to submit job



FNAME=$1

#Load modules
module load trimgalore/0.5.0
module load python/cpu/2.7.15-ES
module load fastqc/0.11.7 # load module

trim_galore ${FNAME}.fastq.gz --fastqc --fastqc_args "-o /gpfs/scratch/tianos01/applied_seq/assignment6" --q 30 --gzip


