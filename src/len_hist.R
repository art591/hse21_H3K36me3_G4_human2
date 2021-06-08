
source('lib.R')

###

#NAME <- 'H3K36me3_SK-N-SH.ENCFF040UTU.hg19'
#NAME <- 'H3K36me3_SK-N-SH.ENCFF040UTU.hg38'
#NAME <- 'H3K36me3_SK-N-SH.ENCFF815MPJ.hg19'
#NAME <- 'H3K36me3_SK-N-SH.ENCFF815MPJ.hg38'
NAME <- 'H3K36me3_SK-N-SH.intersect_with_G4.bed'

###

bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
#colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start
bed_df %>%
  arrange(-len) %>%
  head
  


ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)
