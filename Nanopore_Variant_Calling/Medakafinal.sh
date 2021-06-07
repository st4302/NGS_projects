#!/bin/bash
#SBATCH --job-name=medaka # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail
#SBATCH --ntasks=1 # Run on a single CPU
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=10:00:00 # Time limit hrs:min:sec
#SBATCH --output=medaka%j.log # Standard output and error log
#SBATCH -p cpu_short

module load medaka/1.1.3

medaka_consensus -i /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/guppyaligned.fastq -d racon4.fasta -o medaka -t 14 -m r941_min_high_g360

medaka tools consensus2vcf consensus.fasta racon4.fasta #Approach 1

medaka_haploid_variant /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/guppyaligned.fastq /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/outdir/racon4.fasta --model r941_min_high_g360 #Approach 3

medaka_variant -i consensus2vcf.bam -f /gpfs/scratch/rv692/ASI/Assignment7/R/racon4.fasta -m r941_min_high_g360 #Approach 2