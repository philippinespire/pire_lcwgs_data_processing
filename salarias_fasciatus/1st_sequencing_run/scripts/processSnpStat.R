#### INITIALIZE ####
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)
library(janitor)
library(magrittr)

#### USER DEFINED VARIABLES ####
inFILE="../mkBGL/mkBGL.snpStat.gz"
inFILE="../mkBGL/test03.100k.snpStat"
numInd=81
minInd=41
maxDP=numInd*5
sb_pval=0.5

#### WRANGLE SNP STATS ####
data_snp <-
  read_tsv(inFILE) %>%
  clean_names() %>%
  rename(chrom = chromo,
         pos = position) %>%
  separate(major_minor_major_minor,
           into = c("pos_major", 
                    "pos_minor",
                    "neg_major",
                    "neg_minor"),
           convert = TRUE,
           sep = " ") %>%
  separate(sb1_sb2_sb3,
           into = c("strand_bias_1", 
                    "strand_bias_2",
                    "strand_bias_3"),
           convert = TRUE,
           sep = ":") %>%
  separate(hwe_lrt_hwe_pval,
           into = c("hwe_lrt", 
                    "hwe_pval"),
           convert = TRUE,
           sep = ":") %>%
  separate(base_q_z_base_q_pval,
           into = c("base_qual_z", 
                    "base_qual_pval"),
           convert = TRUE,
           sep = ":") %>%
  separate(map_q_z_map_q_pval,
           into = c("map_qual_z", 
                    "map_qual_pval"),
           convert = TRUE,
           sep = ":") %>%
  separate(edge_z_edge_pval,
           into = c("edge_z", 
                    "edge_pval"),
           convert = TRUE,
           sep = ":") %>%
  mutate(chrom_pos = str_c(chrom,
                           pos,
                           sep = "_"),
         pos_minor_prop = pos_minor / (pos_major+pos_minor),
         neg_minor_prop = neg_minor / (neg_major+pos_minor)) %>%
  select(chrom,
         pos,
         chrom_pos,
         starts_with("pos_"),
         starts_with("neg_"),
         everything()) 

data_snp <-
  data_snp %>%
  separate(major_het_minor_het_major_het_minor_het_n_het,
           into = c("pos_major_het", 
                    "pos_minor_het",
                    "neg_major_het",
                    "neg_minor_het",
                    "n_het"),
           convert = TRUE,
           sep = " ") %>%
  separate(het_stat_het_stat_pval,
           into = c("het_stat", 
                    "het_stat_pval"),
           convert = TRUE,
           sep = ":") %>%
  mutate(pos_allele_balance = pos_minor_het / (pos_minor_het + pos_major_het),
         neg_allele_balance = neg_minor_het / (neg_minor_het + neg_major_het),
         allele_balance = (pos_minor_het + neg_minor_het) / (pos_minor_het + pos_major_het + neg_minor_het + neg_major_het),
         rough_est_het = (pos_minor_het + pos_major_het + neg_minor_het + neg_major_het)/(pos_minor + pos_major + neg_minor + neg_major))


pos_minor_prop_max = max(data_snp$pos_minor_prop,
                          na.rm = TRUE)

#### VISUALIZE SNP STATS ####
# pdf(str_c(inFile,
#           ".pdf",
#           sep=""))
  data_snp %>%
    ggplot(aes(x=pos_minor+pos_major)) +
    geom_histogram(bins = 101,
                   fill = "white",
                   color = "grey") +
    geom_vline(xintercept = minInd,
               linetype = "dashed",
               color = "red3") +
    geom_vline(xintercept = maxDP,
               linetype = "dashed",
               color = "red3") +
    geom_text(aes(y = 0.5,
                  x = minInd,
                  label = "-minInd * -setMinDepthInd"), 
              vjust = "inward", 
              hjust = "outward") +
    geom_text(aes(y = 0.5,
                  x = maxDP,
                  label = "-setMaxDepth"), 
              vjust = "inward", 
              hjust = "outward") +
    scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Positive Strand Read Counts",
         subtitle = "Use to help determine -minInd, -setMinDepthInd, -setMaxDepth\nNote: axes log10 scaled") 
  
  data_snp %>%
    ggplot(aes(x=neg_minor+neg_major)) +
    geom_histogram(bins = 101,
                   fill = "white",
                   color = "grey") +
    geom_vline(xintercept = minInd,
               linetype = "dashed",
               color = "red3") +
    geom_vline(xintercept = maxDP,
               linetype = "dashed",
               color = "red3") +
    geom_text(aes(y = 0,
                  x = minInd,
                  label = "-minInd * -setMinDepthInd"), 
              vjust = "outward", 
              hjust = "outward") +
    geom_text(aes(y = 0,
                  x = maxDP,
                  label = "-setMaxDepth"), 
              vjust = "outward", 
              hjust = "outward") +
    
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Negative Strand Read Counts",
         subtitle = "Use to help determine -minInd, -setMinDepthInd, -setMaxDepth\nNote: only x axis log10 scaled") 
  
  data_snp %>%
    ggplot(aes(x=pos_minor_prop)) +
    geom_histogram(bins = 101,
                   fill = "white",
                   color = "grey") +
    geom_vline(xintercept = 1 / (numInd*2),
               linetype = "dashed",
               color = "red3") +
    geom_text(aes(y = 0.5,
                  x = 1 / (numInd*2),
                  label = "-minMaf"), 
              vjust = "inward", 
              hjust = "outward") +
    scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Positive Strand Minor AF",
         subtitle = "Use to set -minMaf\nThreshold displayed = 1 Minor Allele in numInd diploids\nPeak is indicative of resolution based on combination of sample size and number of reads per sample\nIf peak is at Threshold, there is little to no missing data across all sites and the meanDP > 2 reads") 
  
  data_snp %>%
    ggplot(aes(x=neg_minor_prop)) +
    geom_histogram(bins = 101,
                   fill = "white",
                   color = "grey") +
    geom_vline(xintercept = 1 / (numInd*2),
               linetype = "dashed",
               color = "red3") +
    geom_text(aes(y = 0,
                  x = 1 / (numInd*2),
                  label = "-minMaf"), 
              vjust = "outward", 
              hjust = "outward") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Negative Strand Minor AF",
         subtitle = "Use to set -minMaf\nThreshold displayed = 1 Minor Allele in numInd diploids\nPeak is indicative of resolution based on combination of sample size and number of reads per sample\nIf peak is at Threshold, there is little to no missing data across all sites and the meanDP > 2 reads\Note: yaxis not log10") 
  
  data_snp %>%
    ggplot(aes(x=as.numeric(strand_bias_1))) +
    geom_histogram() +
    scale_y_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Strand Bias 1") 
  
  data_snp %>%
    ggplot(aes(x=strand_bias_2)) +
    geom_histogram() +
    scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Strand Bias 2") 
  
  data_snp %>%
    ggplot(aes(x=strand_bias_3)) +
    geom_histogram(fill = "white",
                   color = "grey") +
    geom_vline(xintercept = sb_pval,
               linetype = "dashed",
               color = "red3") +
    geom_text(aes(y = 0,
                  x = sb_pval,
                  label = "-sb_pval"), 
              vjust = "outward", 
              hjust = "inward") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Strand Bias 3",
         subtitle = "Use to set -sb_pval, lower is more permissive, higher is more restrictive\n strand bias is when there is disagreement between read1 and read2 in the state of a site") 
  
  data_snp %>%
    ggplot(aes(x=hwe_pval)) +
    geom_histogram() +
    geom_vline(xintercept = 0.1,
               linetype = "dashed",
               color = "red3") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "HWE P Value",
         subtitle = "Above Threshold = In HWE") 
  
  data_snp %>%
    ggplot(aes(x=base_qual_pval)) +
    geom_histogram() +
    geom_vline(xintercept = 0.9,
               linetype = "dashed",
               color = "red3") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Base Quality P Value") 
  
  data_snp %>%
    ggplot(aes(x=map_qual_pval)) +
    geom_histogram() +
    geom_vline(xintercept = 0.5,
               linetype = "dashed",
               color = "red3") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Mapping Quality P Value") 
  
  data_snp %>%
    ggplot(aes(x=edge_pval)) +
    geom_histogram() +
    geom_vline(xintercept = 0.1,
               linetype = "dashed",
               color = "red3") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Edge P Value") 
  
  data_snp %>%
    ggplot(aes(x=het_stat_pval)) +
    geom_histogram() +
    geom_vline(xintercept = 0.1,
               linetype = "dashed",
               color = "red3") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Het Stat P Value") 
  
    ##!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # these require het bias filter to be set when bgl file was made
    data_snp %>%
    ggplot(aes(x=het_stat_pval)) +
    geom_histogram() +
    geom_vline(xintercept = 0.1,
               linetype = "dashed",
               color = "red3") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Het Stat P Value")

    data_snp %>%
    ggplot(aes(x=pos_allele_balance)) +
    geom_histogram() +
    geom_vline(xintercept = 0.375,
               linetype = "dashed",
               color = "red3") +
    geom_vline(xintercept = 0.675,
               linetype = "dashed",
               color = "red3") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Pos Allele Balance")

    data_snp %>%
    ggplot(aes(x=neg_allele_balance)) +
    geom_histogram() +
    geom_vline(xintercept = 0.375,
               linetype = "dashed",
               color = "red3") +
    geom_vline(xintercept = 0.675,
               linetype = "dashed",
               color = "red3") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Neg Allele Balance")

  
    data_snp %>%
    ggplot(aes(x=allele_balance)) +
    geom_histogram() +
    geom_vline(xintercept = 0.375,
               linetype = "dashed",
               color = "red3") +
    geom_vline(xintercept = 0.675,
               linetype = "dashed",
               color = "red3") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Mean Allele Balance")

  
 
    data_snp %>%
    ggplot(aes(y=rough_est_het,
               x=allele_balance)) +
    geom_point() +
    geom_vline(xintercept = 0.375,
               linetype = "dashed",
               color = "red3") +
    geom_vline(xintercept = 0.675,
               linetype = "dashed",
               color = "red3") +
    geom_hline(yintercept = 0.5,
               linetype = "dashed",
               color = "red3") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Rough Estimate of Heterozygosty vs Mean Allele Balance")

  
# dev.off()
