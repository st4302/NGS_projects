# NGS_projects
Projects from NGS analysis

Quality_Control_Trimming: Contains scripts for SRR download, Trim galore, Trimmomatic and Fastqc.

Trimming_Alignment_RNA-seq: Contains scripts for RNA-seq analysis. Trimming was done with trim galore. Alignment was done with BWA and BBMap. Picard was used to remoce duplicate reads. Plots were done with GVIZ in R.

RNA-seq_Alignment_Gene_Counts: Contains scripts for RNA-seq analysis. Files were trimmed with trim galore. Alignment was performed with Kalisto or TopHat2. Scatter plots and correlations of the gene counts were done in R.

Differential_expression_analysis_RNA-seq: Contains scripts for differential expression analysis of RNA-seq data with EdgeR and DESeq2.

RIP-seq_ExomePeak2: Contains scripts for RIP-seq analysis. Datasets were downloaded from SRA and trimmed with Trim Galore. Alignment to the human genome was done using STAR. m6A peak structures were observed using GVIZ. ExomePeak2 was used to identify genes producing m6A modified transcripts.

Nanopore_Variant_Calling: Re-basecalling was done using Guppy. Alignment to the reference genome was done using Minimap2. De novo assembly was performed using Canu. Assembly was polished using Racon. Variant calling was performed using Medaka.
