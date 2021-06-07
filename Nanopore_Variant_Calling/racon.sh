#!/bin/bash
#SBATCH --job-name=canu  # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail
#SBATCH --ntasks=1 # Run on a single CPU
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=10:00:00 # Time limit hrs:min:sec
#SBATCH --output=canu_%j.log # Standard output and error log
#SBATCH -p cpu_short

module load minimap2/2.15
module load racon/1.4.17


minimap2 -x map-ont -t 8 guppycanu.contigs.fasta /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/guppyaligned.fastq > mapping.1.paf
racon -m 8 -x -6 -g -8 -w 500 -t 14 /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/guppyaligned.fastq mapping.1.paf guppycanu.contigs.fasta> racon1.fasta
minimap2 -x map-ont -t 8 racon1.fasta /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/guppyaligned.fastq > mapping.2.paf
racon -m 8 -x -6 -g -8 -w 500 -t 14 /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/guppyaligned.fastq mapping.2.paf racon1.fasta> racon2.fasta
minimap2 -x map-ont -t 8 racon2.fasta /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/guppyaligned.fastq > mapping.3.paf
racon -m 8 -x -6 -g -8 -w 500 -t 14 /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/guppyaligned.fastq mapping.3.paf racon2.fasta> racon3.fasta
minimap2 -x map-ont -t 8 racon3.fasta /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/guppyaligned.fastq > mapping.4.paf
racon -m 8 -x -6 -g -8 -w 500 -t 14 /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/guppyaligned.fastq mapping.4.paf racon3.fasta> racon4.fasta

guppycanu.contigs.fasta

medaka_variant -i /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/outdir/medaka/consensus2vcf.bam -f /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/outdir/racon4.fasta -m r941_min_high_g360
