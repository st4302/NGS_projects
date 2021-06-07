#!/bin/bash
#SBATCH --job-name=canu  # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail
#SBATCH --ntasks=1 # Run on a single CPU
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=10:00:00 # Time limit hrs:min:sec
#SBATCH --output=canu_%j.log # Standard output and error log
#SBATCH -p cpu_short

module load canu/2.2


canu -p guppycanu -d outdir genomeSize=0.007m  gridOptionsJobName=Canu_denovo.assembly "gridOptions=--time 6:00:00“ -nanopore-raw guppyaligned.fastq


