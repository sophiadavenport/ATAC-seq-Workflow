# ATAC-seq-Workflow
## Methods

ATAC-seq samples corresponding to the X and Y human samples were downloaded from publicly available data on GEO [1]. FastQC v0.12.1 [2] was used to perform initial quality control on all samples with default parameters. MultiQC v1.21 [3] was performed with default parameters to aggregate the fastQC outputs. Trimming of adapter sequences was done using Trimmomatic v0.32 [4] with a sliding window of 4:15 and removing 3 bases at the start/end if below quality threshold.

Reads were aligned to Gencode's human reference genome release 45 (hg38) [5] using BowTie2-build v2.5.3 with default parameters and BowTie2-align v2.5.3 [6] with a maximum fragment length of 2000. Samtools-view v1.19 [7] was used to remove alignments to the mitochondrial chromosome. The deepTools suite alignmentSieve v [8] was used to shift reads to correct for the Tn5 nick repair bias. Post-alignment quality control analysis was performed using ATACseqQC from the BioConductor package v3.18 [9] with default parameters. 

Peak calling using MACS3 callpeaks v3.0.1 [10] with default parameters. BedTools intersect v2.31.0 [11] was used to find overlapping peaks between the sample replicates using a threshold of 0.9 and then was used to remove blacklisted regions. Homer annotatePeaks v [12] was used with the human reference genome (hg38) to annotate peaks. To identify motifs, Homer findMotifsGenome v [11] was used with default parameters. Gene set enrichment analysis was performed using DAVID [13] with default parameters.

## Sources 

1. https://www.ncbi.nlm.nih.gov/geo/
2. FastQC:  A Quality Control Tool for High Throughput Sequence Data [Online]. Andrews, S. (2010). http://www.bioinformatics.babraham.ac.uk/projects/fastqc/
3. MultiQC: Summarize analysis results for multiple tools and samples in a single report. Philip Ewels, Måns Magnusson, Sverker Lundin and Max Käller. Bioinformatics (2016). 10.1093/bioinformatics/btw354 PMID: 27312411
4. Trimmomatic: Bolger, A.M., Lohse, M., & Usadel, B. (2014). Trimmomatic: A flexible trimmer for Illumina Sequence Data.
5. https://www.gencodegenes.org/human/
6. Langmead B, Salzberg S. Fast gapped-read alignment with Bowtie 2. Nature Methods. 2012, 9:357-359.
7. Heng Li, Bob Handsaker, Alec Wysoker, Tim Fennell, Jue Ruan, Nils Homer, Gabor Marth, Goncalo Abecasis, Richard Durbin, 1000 Genome Project Data Processing Subgroup, The Sequence Alignment/Map format and SAMtools, Bioinformatics, Volume 25, Issue 16, August 2009, Pages 2078–2079, https://doi.org/10.1093/bioinformatics/btp352
8. Ramírez, Fidel, Devon P. Ryan, Björn Grüning, Vivek Bhardwaj, Fabian Kilpert, Andreas S. Richter, Steffen Heyne, Friederike Dündar, and Thomas Manke. deepTools2: A next Generation Web Server for Deep-Sequencing Data Analysis. Nucleic Acids Research (2016). doi:10.1093/nar/gkw257.
9. “ATACseqQC: a Bioconductor package for post-alignment quality assessment of ATAC-seq data.” Ou J, Liu H, Yu J, Kelliher MA, Castilla LH, Lawson ND, Zhu LJ (2018). BMC Genomics, 19(1), 169. ISSN 1471-2164, doi:10.1186/s12864-018-4559-3, https://doi.org/10.1186/s12864-018-4559-3.
10. Zhang, Y., Liu, T., Meyer, C.A. et al. Model-based Analysis of ChIP-Seq (MACS). Genome Biol 9, R137 (2008). https://doi.org/10.1186/gb-2008-9-9-r137
11. Heinz S, Benner C, Spann N, Bertolino E et al. Simple Combinations of Lineage-Determining Transcription Factors Prime cis-Regulatory Elements Required for Macrophage and B Cell Identities. Mol Cell 2010 May 28;38(4):576-589. PMID: 20513432
12. Quinlan, A. R., & Hall, I. M. (2010). BEDTools: a flexible suite of utilities for comparing genomic features. Bioinformatics (Oxford, England), 26(6), 841–842. https://doi.org/10.1093/bioinformatics/btq033
13. https://david.ncifcrf.gov/
