
#!/bin/bash
#SBATCH --job-name=guppy
#SBATCH --output=guppy_%j.out
#SBATCH --time=12:00:00
#SBATCH --ntasks=1
#SBATCH --mem=64GB
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=st4302@nyu.edu 
#SBATCH -p gpu8_short
#SBATCH --gres=gpu:1

module load guppy/3.6.0 

guppy_basecaller -i /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086 -s /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/output2 --flowcell FLO-MIN107 --kit SQK-PCS109 -r -x auto


cat /gpfs/scratch/tianos01/applied_seq/Assignment7/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/output2/*.fastq > allguppy.fastq



