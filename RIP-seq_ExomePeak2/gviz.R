library(data.table)
library(Gviz)
library(GenomicFeatures)
library(Gviz)
library(biomaRt)
library(BSgenome.Hsapiens.UCSC.hg38)
library(TxDb.Hsapiens.UCSC.hg38.knownGene)
library(org.Hs.eg.db)


##

hg38 <- useMart("ensembl", "hsapiens_gene_ensembl")

### making a sequence track


### READ IN GENE MODELS ###
gtrack<-GenomeAxisTrack(col="black") ##Adds genome axis

mDS1 <- fread("SRR7992453Aligned.sortedByCoord.out.bedgraph", col.names = c('chromosome', 'start', 'end', 'value'))
mDS2 <- fread("SRR7992452Aligned.sortedByCoord.out.bedgraph", col.names = c('chromosome', 'start', 'end', 'value'))
mDS3 <- fread("SRR7992451Aligned.sortedByCoord.out.bedgraph", col.names = c('chromosome', 'start', 'end', 'value'))
iDS1 <- fread("SRR7992450Aligned.sortedByCoord.out.bedgraph", col.names = c('chromosome', 'start', 'end', 'value'))
iDS2 <- fread("SRR7992457Aligned.sortedByCoord.out.bedgraph", col.names = c('chromosome', 'start', 'end', 'value'))
iDS3 <- fread("SRR7992456Aligned.sortedByCoord.out.bedgraph", col.names = c('chromosome', 'start', 'end', 'value'))


# Specifiy the range to plot
thechr <- "chr9"
st = 21000000 
en = 21150000

mDS1 <- mDS1[chromosome == thechr]
mDS1 <- DataTrack(
  range = mDS1,
  type = "a",
  genome = 'hg38',
  name = "mDS1",
  ylim=c(0,45)
)

mDS2 <- mDS2[chromosome == thechr]
mDS2 <- DataTrack(
  range = mDS2,
  type = "a",
  genome = 'hg38',
  name = "mDS2",
  ylim=c(0,45)
)

mDS3 <- mDS3[chromosome == thechr]
mDS3 <- DataTrack(
  range = mDS3,
  type = "a",
  genome = 'hg38',
  name = "mDS3",
  ylim=c(0,45)
)

iDS1 <- iDS1[chromosome == thechr]
iDS1 <- DataTrack(
  range = iDS1,
  type = "a",
  genome = 'hg38',
  name = "iDS1",
  ylim=c(0,45)
)

iDS2 <- iDS2[chromosome == thechr]
iDS2 <- DataTrack(
  range = iDS2,
  type = "a",
  genome = 'hg38',
  name = "iDS2",
  ylim=c(0,45)
)

iDS3 <- iDS3[chromosome == thechr]
iDS3 <- DataTrack(
  range = iDS3,
  type = "a",
  genome = 'hg38',
  name = "iDS3",
  ylim=c(0,45)
)





itrack <- IdeogramTrack(
  genome = "hg38", chromosome = thechr
)
#gtrack <- GenomeAxisTrack()


### Read in UCSC genes and track 
ucscGenes <- UcscTrack(genome = "hg38", table="ncbiRefSeq", track = 'NCBI RefSeq', trackType="GeneRegionTrack",
                       chromosome=thechr, rstarts = "exonStarts", rends = "exonEnds",
                       gene = "name", symbol = 'name', transcript = "name",
                       strand = "strand", stacking = 'pack', showID = T, geneSymbol = T)

z <- ranges(ucscGenes)
mcols(z)$symbol <- mapIds(org.Hs.eg.db, gsub("\\.[1-9]$", "", mcols(z)$symbol), "SYMBOL","REFSEQ")
ucscGenes2 <- ucscGenes
ranges(ucscGenes2) <- z


### GENERATE PLOT ###

plotTracks(list(itrack, gtrack, mDS1, mDS2, mDS3, iDS1, iDS2, iDS3, ucscGenes2), collapseTranscripts = "meta", transcriptAnnotation = "symbol", from = st, to = en, cex.title=1, cex.axis=1, title.width=1.2, collapse = FALSE)



