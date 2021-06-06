#!/bin/bash
#SBATCH --job-name=17V12256 # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail     
#SBATCH --ntasks=1 # Run on a single nodes        
#SBATCH --time=10:00:00 # Time limit hrs:min:sec
#SBATCH --output=SRR7240635_%j.log # Standard output and error log                                                                                                                            
#SBATCH --mem=16gb # Job memory request                                                                                                                                                         
#SBATCH -p cpu_short    

module load python/cpu/2.7.15-ES
module load samtools/1.9


samtools sort -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT34/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT34/accepted_hits.bam
samtools index /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT34/accepted_hits.sorted.bam
samtools sort -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT35/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT35/accepted_hits.bam
samtools index /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT35/accepted_hits.sorted.bam
samtools sort -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT36/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT36/accepted_hits.bam
samtools index /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT36/accepted_hits.sorted.bam
samtools sort -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT46/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT46/accepted_hits.bam
samtools index /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT46/accepted_hits.sorted.bam
samtools sort -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT47/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT47/accepted_hits.bam
samtools index /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT47/accepted_hits.sorted.bam
samtools sort -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT48/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT48/accepted_hits.bam
samtools index /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT48/accepted_hits.sorted.bam

