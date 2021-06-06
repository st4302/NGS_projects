#!/bin/bash
#SBATCH --job-name=634  # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail
#SBATCH --ntasks=1 # Run on a single node
#SBATCH --mem=8gb # Job memory request
#SBATCH --time=02:00:00 # Time limit hrs:min:sec
#SBATCH --output=fastqctrimmo502_%j.log # Standard output and error log
#SBATCH -p cpu_short # Specifies location to submit job



module load fastqc/0.11.7 # load module

#Run fastqc
fastqc -o /gpfs/scratch/tianos01/applied_seq/assignment1_NGS/trim_min /gpfs/scratch/tianos01/applied_seq/assignment1_NGS/SRR1523657_trimmomaticmin_1P /gpfs/scratch/tianos01/applied_seq/assignment1_NGS/SRR1523657_trimmomaticmin_2P

SRR1523657_