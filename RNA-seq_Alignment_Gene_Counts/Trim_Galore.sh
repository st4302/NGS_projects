#!/bin/bash
#SBATCH --job-name=SRR7240635  # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail
#SBATCH --ntasks=1 # Run on a single node
#SBATCH --mem=8gb # Job memory request
#SBATCH --time=10:00:00 # Time limit hrs:min:sec
#SBATCH --output=SRR7240635_%j.log # Standard output and error log
#SBATCH -p cpu_short # Specifies location to submit job


#Load modules
module load trimgalore/0.5.0
module load python/cpu/2.7.15-ES
module load fastqc/0.11.7


trim_galore --paired LT34_R1.fastq.gz LT34_R2.fastq.gz --fastqc --fastqc_args "-o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/trimgalore" --q 30 --gzip
trim_galore --paired LT35_R1.fastq.gz LT35_R2.fastq.gz --fastqc --fastqc_args "-o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/trimgalore" --q 30 --gzip
trim_galore --paired LT36_R1.fastq.gz LT36_R2.fastq.gz --fastqc --fastqc_args "-o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/trimgalore" --q 30 --gzip
trim_galore --paired LT46_R1.fastq.gz LT46_R2.fastq.gz --fastqc --fastqc_args "-o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/trimgalore" --q 30 --gzip
trim_galore --paired LT47_R1.fastq.gz LT47_R2.fastq.gz --fastqc --fastqc_args "-o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/trimgalore" --q 30 --gzip
trim_galore --paired LT48_R1.fastq.gz LT48_R2.fastq.gz --fastqc --fastqc_args "-o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/trimgalore" --q 30 --gzip



