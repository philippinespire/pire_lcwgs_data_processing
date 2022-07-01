#### Initialize ####
rm(list = ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)
library(janitor)
library(vegan)
library(qqplotr)


#### User Variables ####

plot_theme <- theme_classic() +
  theme(panel.background = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_line(colour = 'grey', size=0.25, linetype="dotted"),
        axis.text = element_text(colour = 'black', size = 12),
        plot.caption = element_text(colour = 'black', size = 7, face = 'italic', hjust = 0.5),
        plot.title = element_text(colour = 'black', size = 11, face = 'bold'),
        plot.subtitle = element_text(colour = 'black', size = 7),
        legend.text = element_text(colour = 'black', size = 16),
        legend.title = element_text(colour = 'black', size = 20),
        axis.title = element_text(colour = 'black', size = 24),
        strip.text = element_text(colour = 'black', size = 20))

#### Tibbles ####

decode_a <- read_tsv("../fltrBAM/bamNames.txt",
                   col_names = "decode") %>%
  separate(decode, sep = "/", into = c("temp", "decode2")) %>%
  separate(decode2, into = c("sfa", "number"), sep = "_") %>%
  select(!starts_with("temp")) %>%
  unite("ID_a", everything(), sep = "_") %>%
  mutate(a = seq(1:81))

decode_b <- decode_a %>%
  rename_with(~ gsub("a", "b", .x, fixed = TRUE))
  
ngsRelate <- read_tsv("../ngsRelate/out_ngsRelate") %>%
  clean_names() %>%
  mutate(a = a+1,
         b = b+1) %>%
  full_join(decode_a) %>%
  full_join(decode_b) %>%
  mutate(era_a = case_when(str_detect(ID_a, "ABas") ~ "Historical",
                           str_detect(ID_a, "CBas") ~ "Contemporary"),
         era_b = case_when(str_detect(ID_b, "ABas") ~ "Historical",
                           str_detect(ID_b, "CBas") ~ "Contemporary")) %>%
  unite("era_comparison", c(era_a, era_b), sep = "-", remove = FALSE) %>%
  drop_na() %>% 
  mutate(era_comparison = factor(era_comparison, levels = c("Historical-Historical", 
                                                            "Historical-Contemporary", 
                                                            "Contemporary-Contemporary")),
         era_a = factor(era_a, levels = c("Historical", "Contemporary")),
         era_b = factor(era_b, levels = c("Historical", "Contemporary")))

IB_coeff <- ngsRelate %>% 
  mutate(name = a,
         F = fa) %>%
  select(name, F, era_comparison) %>%
  full_join(ngsRelate %>%
              mutate(name = b,
                     F = fb) %>%
              select(name, F, era_comparison)) %>%
  mutate(era = case_when(name <= 32 ~ "Historical",
                         name > 32 ~ "Contemporary")) %>%
  left_join(decode_a, by = c("name" ="a")) %>%
  mutate(era = factor(era, levels = c("Historical", "Contemporary")))

#ngsLD <- read_tsv("../ngsLD/out_ngsLD")

#### Relatedness ####

(Relatedness_Histogram <- ngsRelate %>%
   ggplot(aes(x = rab, fill = era_comparison)) +
   geom_histogram(bins = 15) +
   facet_grid(~era_comparison, scales = "free_y") + 
   labs(fill = "Pairwise Era\nComparison") +
   xlab("Pairwise Relatedness") + 
   ylab("Counts") + 
   plot_theme +
   theme(legend.position = "bottom",
         strip.text = element_text(colour = 'black', size = 16)))

ggsave(plot = Relatedness_Histogram,
       filename = "../plots/ATBC_Relatedness_Histogrm.png", 
       units = "in", 
       height = 4, 
       width = 12.5)

(Relatedness_Boxplot <- ngsRelate %>%
    ggplot(aes(y = rab, x = era_comparison, fill = era_comparison)) +
    geom_boxplot() + 
    xlab("Pairwise Era Comparison") +
    ylab("Pairwise Relatedness") +
    plot_theme +
    theme(legend.position = "none"))

ngsRelate %>% 
  ggplot(aes(sample=rab)) +
  stat_qq_band()+
  stat_qq_line()+
  stat_qq_point()

ngsRelate %>%
  group_by(era_comparison) %>%
  summarise(count = n(),
            mean = mean(rab, na.rm = TRUE),
            sd = sd(rab, na.rm = TRUE),
            median = median(rab, na.rm = TRUE),
            IQR = IQR(rab, na.rm = TRUE))

kruskal.test(rab ~ era_comparison, data = ngsRelate)

pairwise.wilcox.test(p.adjust.method = "BH",
                     x = ngsRelate$rab,
                     g = ngsRelate$era_comparison)

#### F ####

IB_coeff %>%
  ggplot(aes(x = F, fill = era_comparison)) +
  geom_histogram(bins = 50) +
  facet_wrap(~era_comparison) +
  labs(fill = "Pairwise\nEra Comparison") +
  xlab("F (Inbreeding Coefficient)") + 
  ylab("Counts") + 
  plot_theme

IB_coeff %>%
  ggplot(aes(y = F, 
             x = era_comparison, 
             fill = era_comparison)) +
  geom_boxplot() +
  labs(fill = "Pairwise\nEra Comparison") +
  ylab("F (Inbreeding Coefficient)") + 
  xlab("Pairwise Era Comparison") + 
  plot_theme +
  theme(legend.position = "none")


IB_coeff %>%
  ggplot(aes(y = F, 
             x = name,
             group = name,
             fill = era)) +
  geom_boxplot() +
  labs(fill = "Pairwise\nEra Comparison") +
  ylab("F (Inbreeding Coefficient)") + 
  xlab("Pairwise Era Comparison") + 
  plot_theme +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

### Era U-Test ###

(F_Boxplot <- IB_coeff %>%
  ggplot(aes(y = F, 
             x = era, 
             fill = era)) +
  geom_boxplot() +
  labs(fill = "Pairwise\nEra Comparison") +
  ylab("F (Inbreeding Coefficient)") + 
  xlab("Era") + 
  plot_theme +
  theme(legend.position = "none",
        axis.text = element_text(colour = 'black', size = 18)))

ggsave(plot = F_Boxplot,
       filename = "../plots/ATBC_F_Boxplot.png",
       units = "in",
       height = 7,
       width = 7)

IB_coeff %>% 
  ggplot(aes(sample=F)) +
  stat_qq_band()+
  stat_qq_line()+
  stat_qq_point()

IB_coeff %>%
  group_by(era) %>%
  summarise(count = n(),
            mean = mean(F, na.rm = TRUE),
            sd = sd(F, na.rm = TRUE),
            median = median(F, na.rm = TRUE),
            IQR = IQR(F, na.rm = TRUE))

wilcox.test(F~era,
            data = IB_coeff)

#### Theta Plots ####

(theta_heatmap <- ngsRelate %>%
   ggplot(aes(x = a, y = b, fill = theta)) + 
   geom_tile() +
   geom_vline(xintercept = 32.5, color = "white", linetype = "dashed") +
   geom_hline(yintercept = 32.5, color = "white", linetype = "dashed") +
   labs(fill = "\U03B8") +
   ylab("j") + 
   xlab("i") + 
   plot_theme + 
   theme(axis.text = element_text(colour = 'black', size = 18)))

ggsave(plot = theta_heatmap,
       filename = "../plots/ATBC_theta_heatmap.png",
       units = "in",
       height = 7,
       width = 7)


#### R0, R1, King ####

(r1r0 <- ngsRelate %>%
   ggplot(aes(x = r1, y = r0, color = era_a)) +
   geom_point() +
   xlab("") +
   ylab("R0") +
   labs(color = "Era") +
   plot_theme +
   theme(axis.text = element_text(colour = 'black', size = 18)))

ggsave(plot = r1r0,
       filename = "../plots/ATBC_r1r0_era.png",
       units = "in",
       height = 3.5,
       width = 7)

(r1king <- ngsRelate %>%
  ggplot(aes(x = r1, y = king, color = era_a)) +
  geom_point() +
  xlab("R1") +
  ylab("King") +
  labs(color = "Era") +
  plot_theme + 
  theme(axis.text = element_text(colour = 'black', size = 18)))

ggsave(plot = r1king,
       filename = "../plots/ATBC_r1king_era.png",
       units = "in",
       height = 3.5,
       width = 7)

# ngsRelate %>%
#   ggplot(aes(x = r0, y = king, color = era_a)) +
#   geom_point() +
#   xlab("R0") +
#   ylab("King") +
#   labs(color = "Era") +
#   plot_theme

ngsRelate %>%
  ggplot(aes(x = r1, y = r0, color = era_comparison)) +
  geom_point() +
  facet_grid(~era_comparison) +
  xlab("R1") +
  ylab("R0") +
  labs(color = "Pairwise\nEra Comparison") +
  plot_theme

ngsRelate %>%
  ggplot(aes(x = r1, y = king, color = era_comparison)) +
  geom_point() +
  facet_grid(~era_comparison) +
  xlab("R1") +
  ylab("King") +
  labs(color = "Pairwise\nEra Comparison") +
  plot_theme

# ngsRelate %>%
#   ggplot(aes(x = r0, y = king, color = era_comparison)) +
#   geom_point() +
#   facet_grid(~era_comparison) +
#   xlab("R0") +
#   ylab("King") +
#   labs(color = "Pairwise\nEra Comparison") +
#   plot_theme
  

#### Plot PCANGSD ####

library(RcppCNPy)

## User Defined Variables ## 
popMap = "../fltrBAM/popmap_sfa.tsv"
covFile = "../PCAngsd_selection/Sfa-ABas-CBas_all_final_PCAngsd_selection_maptest_minMaf0.05.cov" #WG
covFile = "../PCAngsd_selection/CHR01_PCAngsd_selection_maptest_minMaf0.05.cov" #CHR01
covFile = "../PCAngsd_selection/CHR04_PCAngsd_selection_maptest_minMaf0.05.cov" #CHR04


## READ IN PCA DATA ##
C <- as.matrix(read.table(covFile))
e <- eigen(C)

data_pca <-
  read_tsv(popMap,
           col_names = TRUE) %>%
  bind_cols(as_tibble(e$vectors)) %>%
  rename_with(.cols = starts_with("V"),
              .fn = ~str_replace(.,
                                 "^V",
                                 "PC"))

data_pca_2 <-
  as_tibble(e$values) %>%
  # arrange(desc(value)) %>%
  mutate(pct_variance_explained = 100 * value/sum(value),
         principle_component = row_number())




## VISUALIZE PCA ##
data_pca %>%
  mutate(era = case_when(POP == "Sfa-ABas" ~ "Historical",
                         POP == "Sfa-CBas" ~ "Contemporary")) %>%
  ggplot(aes(x=PC1,
             y=PC2,
             color=era)) +
  geom_point(size=3) +
  theme_classic() +
  labs(x = str_c("PC1 (",
                 data_pca_2$pct_variance_explained %>%
                   head(1) %>%
                   round(2),
                 "%)"),
       y = str_c("PC2 (",
                 data_pca_2$pct_variance_explained %>%
                   head(2) %>%
                   tail(1) %>%
                   round(2),
                 "%)"),
       color = "Era") +
  theme(axis.text = element_text(colour = 'black', size = 18),
        legend.text = element_text(colour = 'black', size = 16),
        legend.title = element_text(colour = 'black', size = 20),
        axis.title = element_text(colour = 'black', size = 24),
        legend.position = "bottom")


ggsave("../plots/ATBC_WG_PCA_noelip.png", units = "in", height = 4, width = 6)
#ggsave("../plots/ATBC_CHR01_PCA_noelip.png", units = "in", height = 4, width = 6)
#ggsave("../plots/ATBC_CHR04_PCA_noelip.png", units = "in", height = 4, width = 6)


#### Bam Stats stuff ####

indir_fastqc = "../Multi_FASTQC/multiqc_report_fq.gz_data/"
indir_readstats = "../BAM_metrics/"

FILE1 = "multiqc_general_stats.txt"
FILE2 = "multiqc_fastqc.txt"

source("../../../rroberts_thesis/wrangling_data_ssl/read_data_ssl.R")

data_fastqc <- read_tsv(paste(indir_fastqc, FILE1, sep = "")) %>%
  inner_join(read_tsv(paste(indir_fastqc, FILE2, sep = ""))) %>%
  clean_names() %>%
  filter(!str_detect(sample, 'Undet')) %>%
  filter(str_detect(sample,
                    "_1$"))

data_mapped_read_stats <- 
  read_bam_reads(indir_readstats) %>%
  mutate(sample = str_replace(filename,
                              "_clmp\\.fp2.*$",
                              "_1"),
         # change numreads to new var name when this breaks
         num_seqs_mapped = num_mapped_reads / 2)


data_all <-
  data_fastqc %>%
  left_join(data_mapped_read_stats,
            by = c("sample")) %>%
  mutate(prop_seqs_mapped = num_seqs_mapped / total_sequences,
         prop_seqs_unmapped = 1 - prop_seqs_mapped,
         era = case_when(str_detect(sample,
                                    "\\-A") ~ "Historical",
                         str_detect(sample,
                                    "\\-C") ~ "Contemporary",
                         TRUE ~ NA_character_),
         era = factor(era, levels = c("Historical", "Contemporary")))

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
             y=prop_seqs_mapped,
             fill = era)) +
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
       color = "era") +
  theme(legend.position = "none",
        axis.text = element_text(colour = 'black', size = 14),
        axis.title = element_text(colour = 'black', size = 16))

ggsave("../plots/ATCB_prop_seqs_mapped_Sfa.png", units = "in", height = 4, width = 6)



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
       color = "Era") +
  theme(legend.position = "none",
        axis.text = element_text(colour = 'black', size = 14),
        axis.title = element_text(colour = 'black', size = 16))

ggsave("../plots/ATBC_pct_cov_meandepth_Sfa.png", units = "in", height = 4, width = 6)
