library(data.table)
library(Gviz)
library(GenomicFeatures)
#setwd("D:/Dropbox/Bioinformatics Teaching/2020 - Applied Sequencing Informatics/Practicum 3 - Aligning and visualizing short & long read data/")

myChr = "dumas.fasta"

myStart = 1
myEnd = 125000

### READ IN GENE MODELS ###
gtrack<-GenomeAxisTrack(col="black") ##Adds genome axis

modelsPos<-makeTxDbFromGFF("VZV-Dumas-Forward-2.0.gff3")
rtrackFor <- GeneRegionTrack(modelsPos, genome = "VZV", chromosome = "dumas.fasta", name = "Gene Model", col="black", fill="light blue", stacking="squish", shape="smallArrow", background.title = "transparent", options(ucscChromosomeNames=FALSE)) #squish #dense

modelsRev<-makeTxDbFromGFF("VZV-Dumas-Reverse-2.0.gff3")
rtrackRev <- GeneRegionTrack(modelsRev, genome = "VZV", chromosome = "dumas.fasta", name = "Gene Model", col="black", fill="light blue", stacking="squish", shape="smallArrow", background.title = "transparent", options(ucscChromosomeNames=FALSE)) #squish #dense

### BEDGRAPH DATA
file1 <- fread('./17V12256_bbmappic.bedgraph', col.names = c('chromosome', 'start', 'end', 'value'))
file2 <- fread('./17V12256_bwapic.bedgraph', col.names = c('chromosome', 'start', 'end', 'value'))

file3 <- fread('./17V12257_bbmappic.bedgraph', col.names = c('chromosome', 'start', 'end', 'value'))
file4 <- fread('./17V12257_bwapic.bedgraph', col.names = c('chromosome', 'start', 'end', 'value'))

file5 <- fread('./17V12258_bbmappic.bedgraph', col.names = c('chromosome', 'start', 'end', 'value'))
file6 <- fread('./17V12258_bwapic.bedgraph', col.names = c('chromosome', 'start', 'end', 'value'))

file1<-file1[file1$start>myStart]
file1<-file1[file1$end<myEnd,]
max1<-max(file1$value)


file2<-file2[file2$start>myStart]
file2<-file2[file2$end<myEnd,]
max2<-max(file2$value)

file3<-file3[file3$start>myStart]
file3<-file3[file3$end<myEnd,]
max3<-max(file3$value)


file4<-file4[file4$start>myStart]
file4<-file4[file4$end<myEnd,]
max4<-max(file4$value)

file5<-file5[file5$start>myStart]
file5<-file5[file5$end<myEnd,]
max5<-max(file5$value)

file6<-file6[file6$start>myStart]
file6<-file6[file6$end<myEnd,]
max6<-max(file6$value)

dataTrack1 <- DataTrack(range = file1, type = "a", chromosome=myChr, genome = 'VZV', fill = "gold1", col = "gold1", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(0,max1))
dataTrack2 <- DataTrack(range = file2, type = "a", chromosome=myChr, genome = 'VZV', fill = "deeppink2", col = "deeppink2", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(0,max2))
dataTrack3 <- DataTrack(range = file3, type = "a", chromosome=myChr, genome = 'VZV', fill = "red", col = "red", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(0,max3))
dataTrack4 <- DataTrack(range = file4, type = "a", chromosome=myChr, genome = 'VZV', fill = "blue", col = "blue", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(0,max4))
dataTrack5 <- DataTrack(range = file5, type = "a", chromosome=myChr, genome = 'VZV', fill = "purple", col = "purple", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(0,max5))
dataTrack6 <- DataTrack(range = file6, type = "a", chromosome=myChr, genome = 'VZV', fill = "green", col = "green", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(0,max6))

### GENERATE PLOT ###

plotTracks(list(dataTrack1,  dataTrack2,  dataTrack3,  dataTrack4,  dataTrack5,  dataTrack6, rtrackFor, gtrack, rtrackRev), from = myStart, to = myEnd, sizes=c(0.24,0.24,0.24,0.24, 0.24,0.24, 0.24,0.24,0.24), type="hist", col.histogram=NA, cex.title=1, cex.axis=0.5, title.width=1.2, collapse=FALSE)



