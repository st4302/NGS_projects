#!/bin/bash
#SBATCH --job-name=fastqc  # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail
#SBATCH --ntasks=1 # Run on a single node
#SBATCH --mem=8gb # Job memory request
#SBATCH --time=02:00:00 # Time limit hrs:min:sec
#SBATCH --output=fastqctrimmo_%j.log # Standard output and error log
#SBATCH -p cpu_short # Specifies location to submit job



module load fastqc/0.11.7 # load module

#Run fastqc
fastqc -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/output_fastqc /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT34_R1.fastq.gz /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT34_R2.fastq.gz
fastqc -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/output_fastqc /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT35_R1.fastq.gz /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT35_R2.fastq.gz
fastqc -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/output_fastqc /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT36_R1.fastq.gz /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT36_R2.fastq.gz
fastqc -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/output_fastqc /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT46_R1.fastq.gz /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT46_R2.fastq.gz
fastqc -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/output_fastqc /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT47_R1.fastq.gz /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT47_R2.fastq.gz
fastqc -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/output_fastqc /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT48_R1.fastq.gz /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT48_R2.fastq.gz


