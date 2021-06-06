#!/bin/bash
#SBATCH --job-name=picard56 # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu # Where to send mail
#SBATCH --ntasks=1 # Run on a single nodes
#SBATCH --mem=16gb # Job memory request
#SBATCH --time=4:00:00 # Time limit hrs:min:sec
#SBATCH --output=/gpfs/scratch/tianos01/jobreports/picard256_%j.log # Standard output and error log
#SBATCH -p cpu_short



module load picard-tools/2.18.20

touch /gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/VZV/dupsv.txt

java -jar /gpfs/share/apps/picard/2.18.11/libs/picard.jar MarkDuplicates INPUT=/gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/mapping.sorted.bam OUTPUT=/gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/VZV/mapping.nodups.sorted.bam METRICS_FILE=/gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/VZV/dupsv.txt REMOVE_DUPLICATES=TRUE TMP_DIR=/gpfs/scratch/tianos01/applied_seq/assignment2/17V12256_bbmap/tmpAS=true VALIDATION_STRINGENCY=LENIENT
                                                                                                                                             ~                                                                                                                                                                                               ~                                                                                                                                     
