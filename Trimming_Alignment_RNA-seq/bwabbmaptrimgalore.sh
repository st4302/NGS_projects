#!/bin/bash
#SBATCH --job-name=17V12256 # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail                                                                                                                                         #SBATCH --ntasks=1 # Run on a single nodes
#SBATCH --mem=16gb # Job memory request                                                                                                                                                         #SBATCH --time=4:00:00 # Time limit hrs:min:sec
#SBATCH --output=/gpfs/scratch/tianos01/jobreports/17V12256_%j.log # Standard output and error log
#SBATCH -p cpu_short                                                                                                                                                                                                                                                                                                                                                                            module load trimgalore/0.5.0
module load python/cpu/2.7.15-ES
module load bbmap/38.25
module load samtools/1.9
module load bedtools/2.27.1
module load bwa/0.7.17

#while read i;
#do
#echo $i                                                                                                                                                                                        



trim_galore --paired --length 30 --q 30 -o /gpfs/scratch/tianos01/applied_seq/assignment2/ /gpfs/data/courses/bminga3004/Practicum3/17V12256_R1.fastq.gz /gpfs/data/courses/bminga3004/Practicum3/17V12256_R2.fastq.gz

### BBMAP

bbmap.sh ref=/gpfs/data/courses/bminga3004/Practicum3/dumas.fasta pairedonly=t in=/gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_R1_val_1.fq.gz in2=/gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_R2_val_2.fq.gz out=/gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/mapping.sam nodisk ambiguous=random sam=1.3

samtools view -bS -o /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/mapping.bam /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/mapping.sam

samtools sort -o /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/mapping.sorted.bam /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/mapping.bam

samtools index /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/mapping.sorted.bam

samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/mapping.sorted.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/17V12256.bedgraph


### BWA

### build index - note you only need to do this once!

cp /gpfs/data/courses/bminga3004/Practicum3/dumas.fasta /gpfs/scratch/tianos01/applied_seq/assignment2/dumas.fasta
bwa index -a is /gpfs/scratch/tianos01/applied_seq/assignment2/dumas.fasta

### align data
mkdir /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bwa

bwa aln /gpfs/scratch/tianos01/applied_seq/assignment2/dumas.fasta /gpfs/data/courses/bminga3004/Practicum3/17V12256_R1_val_1.fq.gz > /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_R1.sai
bwa aln /gpfs/scratch/tianos01/applied_seq/assignment2/dumas.fasta /gpfs/data/courses/bminga3004/Practicum3/17V12256_R2_val_2.fq.gz > /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_R2.sai

bwa sampe /gpfs/scratch/tianos01/applied_seq/assignment2/dumas.fasta /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_R1.sai /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_R2.sai /gpfs/data/courses/bminga3004/Practicum3/17V12256_R1_val_1.fq.gz /gpfs/data/courses/bminga3004/Practicum3/17V12256_R2_val_2.fq.gz > /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bwa/mapping.sam


samtools view -bS -o /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bwa/mapping.bam /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bwa/mapping.sam

samtools sort -o /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bwa/mapping.sorted.bam /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bwa/mapping.bam

samtools index /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bwa/mapping.sorted.bam

samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bwa/mapping.sorted.bam | genomeCoverageBed -ibam stdin -bg -split > /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bwa/17V12256.bedgraph

                                                                          