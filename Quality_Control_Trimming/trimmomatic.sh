#!/bin/bash
#SBATCH --job-name=trimmomatic # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu# Where to send mail
#SBATCH --ntasks=1 # Run on a single node
#SBATCH --mem=12gb # Job memory request
#SBATCH --time=12:00:00 # Time limit hrs:min:sec
#SBATCH --output=trimmomatic502%j.log # Standard output and error log
#SBATCH -p cpu_short # Specifies location to submit job


module load trimmomatic/0.36

java -jar /gpfs/share/apps/trimmomatic/0.36/trimmomatic-0.36.jar PE -phred33 /gpfs/scratch/tianos01/applied_seq/assignment1_NGS/SRR7109502_1.fastq.gz /gpfs/scratch/tianos01/applied_seq/assignment1_NGS/SRR7109502_2.fastq.gz -baseout SRR7240634_trimmomatic1_30 ILLUMINACLIP:contaminant_list.fasta:2:30:10:2:keepBothReads SLIDINGWINDOW:4:30

