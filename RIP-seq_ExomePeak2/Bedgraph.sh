#!/bin/bash
#SBATCH --job-name=star # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail
#SBATCH --ntasks=4 # Run on a single CPU
#SBATCH --mem=64gb # Job memory request
#SBATCH --time=24:00:00 # Time limit hrs:min:sec
#SBATCH --output=index_%j.log # Standard output and error log
#SBATCH -p cpu_short # Specifies location to submit job

module load samtools/1.9

samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992450Aligned.sortedByCoord.out.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992450Aligned.sortedByCoord.out.bedgraph
samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992451Aligned.sortedByCoord.out.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992451Aligned.sortedByCoord.out.bedgraph
samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992452Aligned.sortedByCoord.out.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992452Aligned.sortedByCoord.out.bedgraph
samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992453Aligned.sortedByCoord.out.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992453Aligned.sortedByCoord.out.bedgraph
samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992454Aligned.sortedByCoord.out.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992454Aligned.sortedByCoord.out.bedgraph
samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992455Aligned.sortedByCoord.out.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992455Aligned.sortedByCoord.out.bedgraph
samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992456Aligned.sortedByCoord.out.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992456Aligned.sortedByCoord.out.bedgraph
samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992457Aligned.sortedByCoord.out.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992457Aligned.sortedByCoord.out.bedgraph
samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992458Aligned.sortedByCoord.out.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992458Aligned.sortedByCoord.out.bedgraph
samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992459Aligned.sortedByCoord.out.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992459Aligned.sortedByCoord.out.bedgraph
samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992460Aligned.sortedByCoord.out.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992460Aligned.sortedByCoord.out.bedgraph
samtools view -b /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992461Aligned.sortedByCoord.out.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992461Aligned.sortedByCoord.out.bedgraph