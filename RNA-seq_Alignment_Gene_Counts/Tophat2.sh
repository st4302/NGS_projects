#!/bin/bash
#SBATCH --job-name=tophat # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail
#SBATCH --ntasks=4 # Run on a single CPU
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=24:00:00 # Time limit hrs:min:sec
#SBATCH --output=SRR7240635_%j.log # Standard output and error log
#SBATCH -p cpu_short # Specifies location to submit job

#Load modules
module load python/cpu/2.7.15
module load samtools/1.9
module load bowtie2/2.3.1
module load tophat/2.1.1

tophat2 -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT${SLURM_ARRAY_TASK_ID} -G /gpfs/scratch/tianos01/Homo_sapiens/UCSC/hg38/Annotation/Genes/genome.gtf -p 8 --library-type fr-firststrand /gpfs/scratch/tianos01/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT${SLURM_ARRAY_TASK_ID}_R1_val_1.fq.gz /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT${SLURM_ARRAY_TASK_ID}_R2_val_2.fq.gz
