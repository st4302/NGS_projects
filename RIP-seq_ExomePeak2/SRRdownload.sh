#!/bin/bash
#SBATCH --job-name=downloadSRR # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail
#SBATCH --ntasks=1 # Run on a single node
#SBATCH --mem=8gb # Job memory request
#SBATCH --time=02:00:00 # Time limit hrs:min:sec
#SBATCH --output=SRR_%j.log # Standard output and error log
#SBATCH -p cpu_short # Specifies location to submit job


module load sratoolkit/2.9.1
module load fastqc/0.11.7 # load module

# Run fastq-dump to download specified file from the SRA
fastq-dump ${1} --gzip -O /gpfs/scratch/tianos01/applied_seq/assignment6/ --origfmt
#Run fastqc
fastqc -o /gpfs/scratch/tianos01/applied_seq/assignment6/ /gpfs/scratch/tianos01/applied_seq/assignment6/${1}.fastq.gz 

