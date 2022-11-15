#### LIBRARIES ####

library(grid)
library(gridExtra)
library(tidyverse)
library(magrittr)
library(lubridate)
library(readxl)
library(janitor)
library(purrr)
library(furrr)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#### User defined variables ####
indir_fastqc = "./salarias_fasciatus/Multi_FASTQC/multiqc_report_fq.gz_data/"
indir_readstats = "./salarias_fasciatus/BAM_metrics/"

source("../rroberts_thesis/wrangling_data_ssl/read_data_ssl.R")

plot_theme <- theme_classic() +
  theme(panel.background = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_line(colour = 'grey', size=0.25, linetype="dotted"),
        axis.text = element_text(colour = 'black', size = 10),
        plot.caption = element_text(colour = 'black', size = 7, face = 'italic', hjust = 0.5),
        plot.title = element_text(colour = 'black', size = 11, face = 'bold'),
        plot.subtitle = element_text(colour = 'black', size = 7),
        legend.text = element_text(colour = 'black', size = 10),
        legend.title = element_text(colour = 'black', size = 10))


#### read in data ####
data_fastqc <- 
  read_multiqc_fastqc(indir_fastqc) %>%
  filter(str_detect(sample,
                    "_1$"))
  
data_mapped_read_stats <- 
  read_bam_reads(indir_readstats) %>%
  mutate(sample = str_replace(filename,
                              "_clmp\\.fp2.*$",
                              "_1"),
         # change numreads to new var name when this breaks
         num_seqs_mapped = numreads / 2)

#### Join datasets ####
data_all <-
  data_fastqc %>%
  left_join(data_mapped_read_stats,
            by = c("sample")) %>%
  mutate(prop_seqs_mapped = num_seqs_mapped / total_sequences,
         prop_seqs_unmapped = 1 - prop_seqs_mapped,
         era = case_when(str_detect(sample,
                                    "\\-A") ~ "Albatross",
                         str_detect(sample,
                                    "\\-C") ~ "Contemporary",
                         TRUE ~ NA_character_))

remove(data_fastqc,
       data_mapped_read_stats)


## Poisson Dist ##
pois_prediction <- 
  tibble(seq(1,81)) %>%
  rename(dp_mean = `seq(1, 81)`) %>%
  mutate(pct_pos_w_cvg = (1- dpois(0,
                                   dp_mean))*100)

pois_prediction %>%
  ggplot(aes(x=dp_mean,
             y=pct_pos_w_cvg)) +
  geom_line(size = 3,
            linetype = "dashed") +
  geom_smooth(span = 1,
              se=FALSE)


#### VISUALIZE ####
data_all %>%
  ggplot(aes(x=era,
             y=prop_seqs_mapped)) +
  geom_boxplot() +
  stat_summary(
    aes(label = round(stat(y), 1)),
    geom = "text", 
    fun = function(y) { o <- boxplot.stats(y)$out; if(length(o) == 0) NA else o },
    hjust = -1) +
  plot_theme +
  labs(y = "Proportion Sequences Mapped",
       x = "Era",
       #title = "Title",
       color = "era")

ggsave("./plots/prop_seqs_mapped_Sfa.png", units = "in", height = 4, width = 6)



data_all %>%
  ggplot(aes(y=pctpos_wcvg,
             x=meandepth,
             color = era)) +
  geom_point() +
  geom_smooth() +
  geom_line(data = pois_prediction,
            aes(x=dp_mean,
                y=pct_pos_w_cvg),
            size = 1,
            linetype = "dashed",
            color = "grey") +
  xlim(0,3) +
  ylim(0,100) +
  plot_theme +
  labs(y = "Percent Positons with Coverage",
       x = "Mean Depth",
       #title = "Title",
       color = "Era")

ggsave("./plots/pct_cov_meandepth_Sfa.png", units = "in", height = 4, width = 6)
