
#!/bin/bash
#SBATCH --job-name=Kallisto # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=st4302@nyu.edu# Where to send mail
#SBATCH --ntasks=4 # Run on a single CPU
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=20:00:00 # Time limit hrs:min:sec
#SBATCH --output=SRR7240635_%j.log # Standard output and error log
#SBATCH -p cpu_short

module load kallisto/0.44.0

### Indexing
#kallisto index -i /gpfs/data/courses/bminga3004/Practicum5/HomoSapiens /gpfs/data/courses/bminga3004/Practicum5/Homo_sapiens.GRCh38.all.cds.ncrna.fa


kallisto quant -i /gpfs/data/courses/bminga3004/Practicum5/HomoSapiens -o /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT${SLURM_ARRAY_TASK_ID} -b 100 --bias /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/Kallisto/LT${SLURM_ARRAY_TASK_ID}_R1.fastq.gz /gpfs/scratch/tianos01/applied_seq/Practicum5/Practicum5/Assignment/LT${SLURM_ARRAY_TASK_ID}_R2.fastq.gz

