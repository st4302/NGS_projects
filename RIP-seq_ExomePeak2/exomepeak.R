### https://bioconductor.org/packages/release/bioc/html/exomePeak2.html
### https://bioconductor.org/packages/release/bioc/vignettes/exomePeak2/inst/doc/Vignette_V_0.99.html



library("exomePeak2")

setwd("/gpfs/scratch/tianos01/applied_seq/assignment6/STAR")

#cd /gpfs/scratch/tianos01/applied_seq/assignment6/STAR

gtf<-"/gpfs/scratch/tianos01/Homo_sapiens/UCSC/hg38/Annotation/Genes.gencode/genes.gtf"

iCTRL1 <- "SRR7992458Aligned.sortedByCoord.out.bam"
iCTRL2 <- "SRR7992461Aligned.sortedByCoord.out.bam"
iCTRL3 <- "SRR7992460Aligned.sortedByCoord.out.bam"
iDS1 <- "SRR7992450Aligned.sortedByCoord.out.bam"
iDS2 <- "SRR7992457Aligned.sortedByCoord.out.bam"
iDS3 <- "SRR7992456Aligned.sortedByCoord.out.bam"
mCTRL1 <- "SRR7992455Aligned.sortedByCoord.out.bam"
mCTRL2 <- "SRR7992454Aligned.sortedByCoord.out.bam"
mCTRL3 <- "SRR7992459Aligned.sortedByCoord.out.bam"
mDS1 <- "SRR7992453Aligned.sortedByCoord.out.bam"
mDS2 <- "SRR7992452Aligned.sortedByCoord.out.bam"
mDS3 <- "SRR7992451Aligned.sortedByCoord.out.bam"

bam_ip <- c(mCTRL1,mCTRL2,mCTRL3) 
bam_input <- c(iCTRL1,iCTRL2,iCTRL3)
bam_treated_ip <- c(mDS1,mDS2,mDS3)
bam_treated_input <- c(iDS1,iDS2,iDS3)

simple1 <- exomePeak2(bam_ip = mCTRL1, bam_input = iCTRL1, gff_dir = gtf, paired_end = FALSE, library_type = "1st_strand", save_plot_name = "outputsimple1-plots", save_dir = "outputsimple1-results" )

comparison <- exomePeak2(bam_ip = bam_ip, bam_input = bam_input, bam_treated_ip = bam_treated_ip, bam_treated_input = bam_treated_input, gff_dir = gtf, paired_end = FALSE, library_type = "1st_strand", save_plot_name = "outputcomp-plots", save_dir = "outputcomp-results" )

simple5 <- exomePeak2(bam_ip = mCTRL2, bam_input = iCTRL2, gff_dir = gtf, paired_end = FALSE, library_type = "1st_strand", save_plot_name = "outputsimple5-plots", save_dir = "outputsimple5-results" )

simple6 <- exomePeak2(bam_ip = mCTRL3, bam_input = iCTRL3, gff_dir = gtf, paired_end = FALSE, library_type = "1st_strand", save_plot_name = "outputsimple6-plots", save_dir = "outputsimple6-results" )

simple7 <- exomePeak2(bam_ip = mDS1, bam_input = iDS1, gff_dir = gtf, paired_end = FALSE, library_type = "1st_strand", save_plot_name = "outputsimple7-plots", save_dir = "outputsimple7-results" )

simple8 <- exomePeak2(bam_ip = mDS2, bam_input = iDS2, gff_dir = gtf, paired_end = FALSE, library_type = "1st_strand", save_plot_name = "outputsimple8-plots", save_dir = "outputsimple8-results" )

simple9 <- exomePeak2(bam_ip = mDS3, bam_input = iDS3, gff_dir = gtf, paired_end = FALSE, library_type = "1st_strand", save_plot_name = "outputsimple9-plots", save_dir = "outputsimple9-results" )


#simple2 <- exomePeak2(bam_ip = bam_ip, bam_input = bam_input, bam_treated_ip = mDS1, bam_treated_input = iDS1, gff_dir = gtf, paired_end = FALSE, library_type = "1st_strand", save_plot_name = "outputsimple2-plots", save_dir = "outputsimple2-results" )

#simple3 <- exomePeak2(bam_ip = bam_ip, bam_input = bam_input, bam_treated_ip = mDS2, bam_treated_input = iDS2, gff_dir = gtf, paired_end = FALSE, library_type = "1st_strand", save_plot_name = "outputsimple3-plots", save_dir = "outputsimple3-results" )

#simple4 <- exomePeak2(bam_ip = bam_ip, bam_input = bam_input, bam_treated_ip = mDS3, bam_treated_input = iDS3, gff_dir = gtf, paired_end = FALSE, library_type = "1st_strand", save_plot_name = "outputsimple4-plots", save_dir = "outputsimple4-results" )