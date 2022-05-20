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
           sep = ":") 

pos_minor_prop_max = max(data_snp$pos_minor_prop,
                          na.rm = TRUE)

#### VISUALIZE SNP STATS ####
# pdf(str_c(inFile,
#           ".pdf",
#           sep=""))
  data_snp %>%
    ggplot(aes(x=pos_minor+pos_major)) +
    geom_histogram(bins = 101) +
    geom_vline(xintercept = minInd,
               linetype = "dashed",
               color = "red3") +
    geom_vline(xintercept = maxDP,
               linetype = "dashed",
               color = "red3") +
    scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Positive Strand Read Counts",
         subtitle = "Threshold = minInd (min 1 read per ind)") 
  
  data_snp %>%
    ggplot(aes(x=neg_minor+neg_major)) +
    geom_histogram(bins = 101) +
    geom_vline(xintercept = minInd,
               linetype = "dashed",
               color = "red3") +
    geom_vline(xintercept = maxDP,
               linetype = "dashed",
               color = "red3") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Negative Strand Read Counts",
         subtitle = "Lower Threshold = minInd (min 1 read per ind)") 
  
  data_snp %>%
    ggplot(aes(x=pos_minor_prop)) +
    geom_histogram(bins = 101) +
    geom_vline(xintercept = 1 / (numInd*2),
               linetype = "dashed",
               color = "red3") +
    scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Positive Strand Minor AF",
         subtitle = "Threshold = 1 Minor Allele") 
  
  data_snp %>%
    ggplot(aes(x=neg_minor_prop)) +
    geom_histogram(bins = 101) +
    geom_vline(xintercept = 1 / (numInd*2),
               linetype = "dashed",
               color = "red3") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Negative Strand Minor AF",
         subtitle = "Threshold = 1 Minor Allele") 
  
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
    geom_histogram() +
    geom_vline(xintercept = 0.5,
               linetype = "dashed",
               color = "red3") +
    # scale_y_continuous(trans='log10') +
    scale_x_continuous(trans='log10') +
    theme_classic() +
    labs(title = "Strand Bias 3") 
  
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
# dev.off()
