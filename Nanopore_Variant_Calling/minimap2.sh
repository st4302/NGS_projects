#!/bin/bash
#SBATCH --job-name=astro_minimap2  # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail
#SBATCH --ntasks=1 # Run on a single CPU
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=10:00:00 # Time limit hrs:min:sec
#SBATCH --output=astro_minimap2_%j.log # Standard output and error log
#SBATCH -p cpu_short


module load minimap2/2.15
module load samtools/1.9
#module load bedtools/2.27.1



minimap2 -ax map-ont -L -t 8 /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstVirOut.fasta  /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/allguppy.fastq > /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/allguppy2.sam
samtools sort -o allguppy2.bam allguppy2.sam
samtools index allguppy2.bam

samtools view -b /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/allguppy2.bam | genomeCoverageBed -ibam stdin -d > /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/allguppy.bed


samtools bam2fq allguppy2.bam > guppyaligned.fastq


#minimap2 -ax splice -uf -k14 -L --secondary=no /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstVirOut.fasta /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/allguppy.fastq > /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/allguppy.sam








