library(BiocManager)
library(ATACseqQC)

args <- commandArgs(trailing=TRUE)

bamfile <- args[1]
out <- args[2]
bamfile.labels <- gsub('_sorted.bam', "", basename(bamfile))

jpeg(file.path(out, paste0(bamfile.labels, ".fragmentSizeDistribution.jpeg")))
fragSize <- fragSizeDist(bamfile, bamfile.labels)
dev.off()