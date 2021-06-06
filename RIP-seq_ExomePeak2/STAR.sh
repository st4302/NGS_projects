#!/bin/bash
#SBATCH --job-name=star # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail
#SBATCH --ntasks=4 # Run on a single CPU
#SBATCH --mem=64gb # Job memory request
#SBATCH --time=24:00:00 # Time limit hrs:min:sec
#SBATCH --output=index_%j.log # Standard output and error log
#SBATCH -p cpu_short # Specifies location to submit job

#Load modules
module load star/2.7.7a

STAR --runThreadN 8 --runMode genomeGenerate --genomeDir /gpfs/scratch/tianos01/applied_seq/assignment6/genomeDir --genomeFastaFiles /gpfs/scratch/tianos01/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta/genome.fa --sjdbGTFfile /gpfs/scratch/tianos01/Homo_sapiens/UCSC/hg38/Annotation/Genes.gencode/genes.gtf --sjdbOverhang 99

STAR --genomeDir /gpfs/scratch/tianos01/applied_seq/assignment6/genomeDir --runThreadN 8 --readFilesIn SRR7992450_trimmed.fq.gz --readFilesCommand zcat --outFileNamePrefix /gpfs/scratch/tianos01/applied_seq/assignment6/STAR/SRR7992450 --outSAMtype BAM --outSAMunmapped Within --outSAMattributes Standard