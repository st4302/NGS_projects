#!/bin/bash
#SBATCH --job-name=Kallisto # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu# Where to send mail
#SBATCH --ntasks=4 # Run on a single CPU
#SBATCH --mem=16gb # Job memory request
#SBATCH --time=20:00:00 # Time limit hrs:min:sec
#SBATCH --output=SRR7240635_%j.log # Standard output and error log
#SBATCH -p cpu_short

module load subread

featureCounts -M -s2 -p -B -T4 -a  /gpfs/scratch/tianos01/Homo_sapiens/UCSC/hg38/Annotation/Genes.gencode/genes.gtf -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/featurecounts.txt /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT34/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT35/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT36/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT46/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT47/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT48/accepted_hits.sorted.bam


#For Optimization

featureCounts -M -s2 -p  -O -T4 -a  /gpfs/scratch/tianos01/Homo_sapiens/UCSC/hg38/Annotation/Genes.gencode/genes.gtf -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/featurecountsf.txt /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT34/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT35/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT36/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT46/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT47/accepted_hits.sorted.bam /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT48/accepted_hits.sorted.bam

