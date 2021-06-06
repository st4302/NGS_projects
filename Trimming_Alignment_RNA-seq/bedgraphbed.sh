#!/bin/bash
#SBATCH --job-name=bedgraph # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail
#SBATCH --ntasks=1 # Run on a single nodes
#SBATCH --mem=16gb # Job memory request
#SBATCH --time=4:00:00 # Time limit hrs:min:sec
#SBATCH --output=/gpfs/scratch/tianos01/jobreports/bedgraph_%j.log # Standard output and error log
#SBATCH -p cpu_short

module load bedtools/2.27.1
module load samtools/1.9


samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/mapping.sorted.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap.bedgraph

samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bwa/mapping.sorted.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bwa.bedgraph

# generate bed (bed6 format) files at which the coverage is calculated at every position along the genome

samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/mapping.sorted.bam | genomeCoverageBed -ibam stdin -d > /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap.bed

samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bwa/mapping.sorted.bam | genomeCoverageBed -ibam stdin -d > /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bwa.bed

paste -d "\t" /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap.bed /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bwa.bed > /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_joined.bed

~                                                                                                                                                                                               ~                                                                                                                                                                                               ~                                                                                                          