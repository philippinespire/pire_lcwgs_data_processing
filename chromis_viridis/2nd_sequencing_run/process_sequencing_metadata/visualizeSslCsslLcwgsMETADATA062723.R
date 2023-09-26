#!/usr/bin/env Rscript

#### INITIALIZE ####
#if running from command line, comment out next line

 library(rstudioapi)
 setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#### PACKAGES ####
packages_used <- 
  c("tidyverse", 
    "gridExtra",
    "janitor",
    "knitr",
    "kableExtra", "ggplot2")

# NOTE: after loading these packages, you may find that tidyverse commands are affected 
#       the solution is to add the appropriate package name before commands that break code
#       such as `dplyr::select` if `select` doesn't work correctly anymore
#       this happens when multiple packages have the same command names. 
#       The last package loaded takes precedence, and your tidyverse commands break.
#       you could load tidyverse last, but invariably, you will load a package after tidyverse
#       so it's impossible to avoid this

packages_to_install <- 
  packages_used[!packages_used %in% installed.packages()[,1]]

if (length(packages_to_install) > 0) {
  install.packages(packages_to_install, 
                   Ncpus = Sys.getenv("NUMBER_OF_PROCESSORS") - 1)
}

lapply(packages_used, 
       require, 
       character.only = TRUE)

library(gridExtra)
library(knitr)
library(kableExtra)
library(ggplot2)

#### INPUT: handle command line arguments for running on hpc ####

# defaults set to all cssl data
# if running on HPC, comment out lines 6,7 and the entirety of the next section "override defaults in RStudio"
# to run on HPC: Rscript visualizeSslCsslLcwgsMETADATA.R <optional rds infile> <optional sp code regex pattern> <optional era regex pattern> <optional site regex pattern> <optional seq run regex pattern>

#read in command line arguments
args <- commandArgs(trailingOnly = TRUE)

# handle command line arguments
if (length(args)==0) {
  # inFile = "./out/sequencing_metadata_ssl.rds"
  # inFile = "./out/sequencing_metadata_cssl.rds"
  inFile = "./out/sequencing_metadata_lcwgs.rds"
  sp_code_pattern = "Cvi"   #regex
  era_pattern = "[AC]"   #regex
  site_pattern = "Pal"   #regex
  seq_run_pattern = "2"   #regex
} else if (length(args)==1) {
  # default output file
  inFile = args[1]
  sp_code_pattern = "^.*$"   #regex
  era_pattern = "[AC]"   #regex
  site_pattern = "^.*$"   #regex
  seq_run_pattern = "^.*$"   #regex
} else if (length(args)==2) {
  # default output file
  inFile = args[1]
  sp_code_pattern = args[2]   #regex
  era_pattern = "[AC]"   #regex
  site_pattern = "^.*$"   #regex
  seq_run_pattern = "^.*$"   #regex
} else if (length(args)==3) {
  # default output file
  inFile = args[1]
  sp_code_pattern = args[2]   #regex
  era_pattern = args[3]    #regex
  site_pattern = "^.*$"   #regex
  seq_run_pattern = "^.*$"   #regex
} else if (length(args)==4) {
  # default output file
  inFile = args[1]
  sp_code_pattern = args[2]   #regex
  era_pattern = args[3]   #regex
  site_pattern = args[4]   #regex
  seq_run_pattern = "^.*$"   #regex
} else if (length(args)==5) {
  # default output file
  inFile = args[1]
  sp_code_pattern = args[2]   #regex
  era_pattern = args[3]   #regex
  site_pattern = args[4]   #regex
  seq_run_pattern = args[5]   #regex
} else if (length(args)>=6) {
  stop("Only accepts 0 to 5 arguments: </path/to/ssl|cssl|lcwgs>sequencing_metadata.rds, which is created by wrangleSslCsslLcwgsMETADATA.R, and regex filter patterns", 
       call.=FALSE)
}

#### INPUT: override defaults in RStudio ####
sp_code_pattern = "Cvi"    #regex  ".*"  "(Par|Sor)" "Sor"
era_pattern = "[AC]"   #regex
inFile="out/sequencing_metadata_lcwgs.rds"

#### Make Variables from User Input  ####
if(str_detect(inFile, "_ssl\\.")) {
  seqType = "ssl"
}  else if (str_detect(inFile, "_cssl\\.")) {
  seqType = "cssl"
} else if (str_detect(inFile, "_lcwgs\\.")) {
  seqType = "lcwgs"
}

#### Get DATA ####

data_all <- 
  read_rds(file = inFile) %>%
  filter(str_detect(sp_code,
                    !!sp_code_pattern),
         str_detect(era,
                    !!era_pattern),
         str_detect(site,
                    !!site_pattern),
         str_detect(seq_run,
                    !!seq_run_pattern)) %>%
  mutate(clmp_passed_filter = fp_passed_filter_2 / (fp_pct_surviving_2 / 100),
         filtered_fp1 = fqc_total_sequences_raw - fp_passed_filter_1,
         filtered_dups = fp_passed_filter_1 - clmp_passed_filter,
         filtered_fp2 = clmp_passed_filter - fp_passed_filter_2,
         filtered_contam = fp_passed_filter_2 - fqs_no_hits_counts,
         filtered_contam_rpr = fqs_no_hits_counts - fqc_total_sequences_rprd,
         unmapped_read_pairs = fqc_total_sequences_rprd - bam_numreads / 2,
         mapped_read_pairs = bam_numreads / 2)

# use this to evaluate whether all metadata files are present
# if they are not all present, results below can be misleading
# NAs are missing data
data_all %>% select(seq_run, individual_id, fqc_total_sequences_raw, fp_passed_filter_1, fp_pct_surviving_2, fp_passed_filter_2, fqs_no_hits_counts, fqc_total_sequences_rprd, bam_numreads) %>% view()

#### SOURCE SCRIPTS ####


#### Tables of Means ####

data_all_means <-
  data_all %>%
  dplyr::select(sp_code,
                era,
                site,
                seq_run,
                individual_id, 
                fqc_total_sequences_raw, 
                fqc_total_sequences_rprd, 
                bam_numreads,
                
                # trgt_depth_mean_per_locus,
                # trgt_cvg_mean_per_locus,
                # trgt_depthcvg_mean_per_locus,
                bam_pctpos_wcvg,
                overall_pct_mapped,
                repaired_pct_mapped,
                
                filtered_fp1, 
                filtered_dups, 
                filtered_fp2, 
                filtered_contam, 
                filtered_contam_rpr,
                unmapped_read_pairs,
                mapped_read_pairs) %>%
  pivot_longer(cols = fqc_total_sequences_raw:mapped_read_pairs,
               names_to = "metric") %>%
  dplyr::group_by(sp_code,
                  era,
                  site,
                  seq_run,
                  metric) %>%
  dplyr::summarize(mean = mean(value,
                               na.rm=TRUE),
                   sd = sd(value,
                           na.rm=TRUE)) %>%
  ungroup() %>%
  pivot_longer(cols = mean:sd,
               names_to = "statistic")


data_all_means %>%
  filter(metric == "trgt_depth_mean_per_locus" |
           metric == "trgt_cvg_mean_per_locus" |
           metric == "trgt_depthcvg_mean_per_locus",
         statistic == "mean") %>%
  
  pivot_wider(names_from = c(metric),
              values_from = value) 


data_all_means %>%
  filter(
    # metric == "trgt_depth_mean_per_locus" |
    #        metric == "trgt_cvg_mean_per_locus" |
    #        metric == "trgt_depthcvg_mean_per_locus",
         statistic == "mean") %>%
  
  pivot_wider(names_from = c(sp_code,
                             era,
                             site,
                             seq_run,
                             # statistic
                             ),
              values_from = value) %>%
  kable(format = "html") %>%
  write(file = "./out/means_table.html")

viewer("./out/means_table.html")

#### PLOT READ ATTRITION ####

data_all %>%
  # right_join(data_quant %>%
  #              select(sp_code,
  #                     era,
  #                     individual_id,
  #                     extraction_id,
  #                     seq_name,
  #                     library_plate,
  #                     library_plate_col,
  #                     library_plate_row,
  #                     library) %>%
  #              distinct(),
#            by = "individual_id") %>%
# drop_na(species) %>%

pivot_longer(cols = c("filtered_fp1",
                      "filtered_dups",
                      "filtered_fp2",
                      "filtered_contam",
                      "filtered_contam_rpr",
                      "unmapped_read_pairs",
                      "mapped_read_pairs"),
             names_to = "filtering_step",
             values_to = "num_read_pairs") %>% 
  mutate(filtering_step = factor(filtering_step,
                                 levels = c("filtered_fp1",
                                            "filtered_dups",
                                            "filtered_fp2",
                                            "filtered_contam",
                                            "filtered_contam_rpr",
                                            "unmapped_read_pairs",
                                            "mapped_read_pairs")),
         individual_id_seq_run = str_c(individual_id,
                                       seq_run,
                                       sep = "")) %>%
  select(-starts_with("fqc_"),
         -starts_with("fp_"),
         -starts_with("fqs"),
         -starts_with("too_"),
         -starts_with("nt_"),
         -starts_with("bam_"),
         -starts_with("trgt_"),
         -starts_with("filename"),
         -contains("surviving"),
         -contains("mapped"),
         -contains("depth"),
         -contains("passed"),
         -species,
         -sample) %>%  #pivot_wider(names_from = filtering_step, values_from = num_read_pairs) %>% view()
  filter(num_read_pairs >= 0)  %>% 
  ggplot(aes(x = individual_id_seq_run,
             y = num_read_pairs,
             fill = filtering_step)) +
  geom_col(position = "fill") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   vjust = 0.5,
                                   hjust = 1)) +
  theme(axis.text.x = element_blank(),
        axis.ticks.x=element_blank()) +
  labs(y = "Proportion of Read Pairs",
       x = "Library (Typically an Individual)") +
  facet_grid(. ~ sp_code + era + site + seq_run,
             scales = "free_x")
 ggsave(str_c("./out/colplot_prop_reads_removed_by_step_",
              seqType,
              ".png"),
        width = 6.5,
        height = 9,
        units = "in")

#### Repaired vs Mapped Read Length ####
data_all %>%
  ggplot(aes(x=fqc_avg_sequence_length_rprd)) +
  geom_histogram(aes(y = ..density..)) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Density Histogram of Repaired Read Length") +
  facet_wrap(. ~ sp_code + era + site + seq_run)

#output mean read lengths & Suggested -T settings for mkBAM as well as 2nd to last setting for fltrBAM
# see https://github.com/cbirdlab/dDocentHPC/blob/master/configs/config.5.cssl
data_all %>%
  group_by(sp_code,
           era,
           site,
           seq_run) %>%
  dplyr::summarize(fqc_avg_sequence_length_rprd = mean(fqc_avg_sequence_length_rprd,
                                                       na.rm = TRUE)) %>%
  mutate(mkBAM_T_setting = ceiling(25 * fqc_avg_sequence_length_rprd / 100))

# compare read lengths before and after mkBAM+fltrBAM
data_all %>%
  select(sp_code,
         era,
         site,
         seq_run,
         fqc_avg_sequence_length_rprd,
         bam_meanreadlength) %>% 
  pivot_longer(cols = c(fqc_avg_sequence_length_rprd,
                        bam_meanreadlength),
               names_to = "metric",
               values_to = "mean_read_length") %>% 
  ggplot(aes(x=mean_read_length,
             fill = metric)) +
  geom_density(alpha = 0.5,
               position = "identity") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90),
        legend.position = "bottom") +
  facet_grid(sp_code  + era + site + seq_run ~ .)



#### Depth & Coverage Figures ####

p11 <-
  data_all %>%
  ggplot(aes(x=site,
             y=trgt_depth_mean_per_locus,
             fill=era)) +
  geom_boxplot() +
  # scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = 0.5)) +
  labs(y = "Mean Read Depth for Probe Targets") +
  facet_grid(. ~ sp_code + era,
             scales = "free_x")
 ggsave("./out/boxplot_trgt_depth_mean_per_locus.png",
        width = 6.5,
       height = 9,
        units = "in")

p21 <-
  data_all %>%
  ggplot(aes(x=site,
             y=trgt_cvg_mean_per_locus,
             fill=era)) +
  geom_boxplot() +
  # scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = 0.5)) +
  labs(y = "Mean Coverage for Probe Targets") +
  facet_grid(. ~ sp_code + era,
             scales = "free_x")
 ggsave("./out/boxplot_trgt_cvg_mean_per_locus.png",
        width = 6.5,
        height = 9,
        units = "in")

p31 <-
  data_all %>%
  ggplot(aes(x=site,
             y=trgt_depthcvg_mean_per_locus,
             fill=era)) +
  geom_boxplot() +
  # scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = 0.5)) +
  labs(y = "Mean Depth of Coverage for Probe Targets") +
  facet_grid(. ~ sp_code + era,
             scales = "free_x")
 ggsave("./out/boxplot_trgt_depthcvg_mean_per_locus.png",
        width = 6.5,
        height = 9,
        units = "in")


p12 <-
  data_all %>% 
  filter(!is.na(seq_run)) %>%
   mutate(sp_code_site = str_c(sp_code,
                               site)) %>%
  ggplot(aes(x=fqc_total_sequences_raw,
             y=trgt_depth_mean_per_locus,
             color=site,
             shape = factor(seq_run))) +
  geom_point() +
  geom_smooth(se=FALSE,
              method = "lm") +
  geom_hline(yintercept = 20,
             color="grey",
             linetype = "dashed") +
  geom_vline(xintercept = 10000000,
             color="grey",
             linetype = "dashed") +
  geom_vline(xintercept = 32000000,
             color="grey",
             linetype = "dashed") +
  geom_vline(xintercept = 100000000,
             color="grey",
             linetype = "dashed") +
  scale_x_continuous(trans='log10',
                     limits = c(100000,
                                100000000)) +
  scale_y_continuous(trans='log10',
                     limits = c(NA,
                                NA)) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 0.5,
                                   vjust = 0.5)) +
  
  labs(x = "Number Raw Read Pairs",
       y = "Mean Read Depth for Probe Targets") +
  facet_grid(sp_code ~ era + seq_run)
 ggsave("./out/scatter_trgt_depth_mean_per_locus-VS-fqc_total_sequences_raw.png",
        width = 6.5,
        height = 9,
        units = "in")

p22 <-
  data_all %>% 
  filter(!is.na(seq_run)) %>%
   mutate(sp_code_site = str_c(sp_code,
                               site)) %>%
  ggplot(aes(x=fqc_total_sequences_raw,
             y=trgt_cvg_mean_per_locus,
             color=site,
             shape = factor(seq_run))) +
  geom_point() +
  geom_smooth(se=FALSE,
              method = "lm") +
  geom_hline(yintercept = 0.9,
             color="grey",
             linetype = "dashed") +
  geom_vline(xintercept = 10000000,
             color="grey",
             linetype = "dashed") +
  geom_vline(xintercept = 32000000,
             color="grey",
             linetype = "dashed") +
  geom_vline(xintercept = 100000000,
             color="grey",
             linetype = "dashed") +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(limits = c(0,
                                NA)) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 0.5,
                                   vjust = 0.5)) +
  labs(x = "Number Raw Read Pairs",
       y = "Mean Coverage for Probe Targets") +
  facet_grid(sp_code ~ era + seq_run)
 ggsave("./out/scatter_trgt_cvg_mean_per_locus-VS-fqc_total_sequences_raw.png",
        width = 6.5,
        height = 9,
        units = "in")


p32 <-
  data_all %>% 
   filter(!is.na(seq_run)) %>%
   mutate(sp_code_site = str_c(sp_code,
                               site)) %>%
  ggplot(aes(x=fqc_total_sequences_raw,
             y=trgt_depthcvg_mean_per_locus,
             color=site,
             shape = factor(seq_run))) +
  geom_point() +
  geom_smooth(se=FALSE,
              method = "lm") +
  geom_hline(yintercept = 20,
             color="grey",
             linetype = "dashed") +
  geom_vline(xintercept = 10000000,
             color="grey",
             linetype = "dashed") +
  geom_vline(xintercept = 32000000,
             color="grey",
             linetype = "dashed") +
  geom_vline(xintercept = 100000000,
             color="grey",
             linetype = "dashed") +
  scale_x_continuous(trans='log10',
                     limits = c(100000,
                                100000000)) +
  scale_y_continuous(trans='log10',
                     limits = c(1,
                                NA)) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 0.5,
                                   vjust = 0.5)) +
  labs(x = "Number Raw Read Pairs",
       y = "Mean Read Depth of Coverage for Probe Targets") +
  facet_grid(sp_code ~ era + seq_run)
 ggsave("./out/scatter_trgt_depthcvg_mean_per_locus-VS-fqc_total_sequences_raw.png",
        width = 6.5,
        height = 9,
        units = "in")

grid.arrange(p11, p12, p21, p22, p31, p32, ncol = 2)

data_all_means %>%
  filter(metric == "trgt_depth_mean_per_locus" |
           metric == "trgt_cvg_mean_per_locus" |
           metric == "trgt_depthcvg_mean_per_locus",
         statistic == "mean") %>%
  
  pivot_wider(names_from = c(metric),
              values_from = value) 

ggsave("./out/boxplot_scatter_trgt_depth_cvg_dpcvg_mean_per_locus-VS-fqc_total_sequences_raw.png",
       plot = grid.arrange(p11, p12, p21, p22, p31, p32, ncol = 2),
       width = 6.5,
       height = 9,
       units = "in")


#### Figures to Evaluate Capture Temp & Mapping Settings ####

data_all %>%
  ggplot(aes(x=site,
             y=bam_pctpos_wcvg,
             fill=era)) +
  geom_boxplot() +
  # geom_hline(yintercept = 20) +
  geom_hline(yintercept = 0.5,
             color = "grey50",
             linetype = "dashed") +
  geom_hline(yintercept = 0.75,
             color = "grey50",
             linetype = "dashed") +
  geom_hline(yintercept = 1,
             color = "grey50",
             linetype = "dashed") +
  geom_hline(yintercept = 5,
             color = "grey50",
             linetype = "dashed") +
  scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 0,
                                   hjust = 1,
                                   vjust = 0.5)) +
  labs(y = "Genome Coverage") +
  facet_grid(. ~ sp_code + era + seq_run,
             scales = "free_x")
 ggsave("./out/boxplot_bam_pctpos_wcvg.png",
        width = 6.5,
        height = 9,
        units = "in")

data_all %>%
  ggplot(aes(x=site,
             y=overall_pct_mapped,
             fill=era)) +
  geom_boxplot() +
  # scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = 0.5)) +
  labs(y = "Percent Raw Reads Mapped") +
  facet_grid(. ~ sp_code + era,
             scales = "free_x")
 ggsave("./out/boxplot_overall_pct_mapped.png",
        width = 6.5,
        height = 9,
        units = "in")

data_all %>%
  ggplot(aes(x=site,
             y=repaired_pct_mapped,
             fill=era)) +
  geom_boxplot() +
  # scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = 0.5)) +
  labs(y = "Percent Repaired Reads Mapped") +
  facet_grid(. ~ sp_code + era,
             scales = "free_x")
 ggsave("./out/boxplot_overall_pct_mapped.png",
        width = 6.5,
        height = 9,
        units = "in")

data_all %>% 
  filter(!is.na(seq_run)) %>%
   mutate(sp_code_site = str_c(sp_code,
                               site)) %>%
  ggplot(aes(x=fqc_total_sequences_raw,
             y=bam_pctpos_wcvg,
             color=site,
             shape = factor(seq_run))) +
  geom_point() +
  geom_smooth(se=FALSE,
              method = "lm") +
  geom_hline(yintercept = 10,
             color="grey",
             linetype = "dashed") +
  geom_vline(xintercept = 10000000,
             color="grey",
             linetype = "dashed") +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10',
                     limits = c(NA,
                                NA)) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 0,
                                   hjust = 0.5,
                                   vjust = 0.5)) +
  labs(x = "Number Raw Read Pairs",
       y = "Genome Coverage") +
  facet_grid(sp_code ~ era + seq_run)
 ggsave("./out/scatter_pct_pos_cvg-VS-fqc_total_sequences_raw.png",
        width = 6.5,
        height = 9,
        units = "in")


data_all %>% 
  filter(!is.na(seq_run)) %>%
   mutate(sp_code_site = str_c(sp_code,
                               site)) %>%
  ggplot(aes(x=fqc_total_sequences_raw,
             y=overall_pct_mapped,
             color=site)) +
  geom_point() +
  geom_smooth(se=FALSE,
              method = "lm") +
  geom_hline(yintercept = 10,
             color="grey",
             linetype = "dashed") +
  geom_vline(xintercept = 10000000,
             color="grey",
             linetype = "dashed") +
  scale_x_continuous(trans='log10') +
  # scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 0,
                                   hjust = 0.5,
                                   vjust = 0.5)) +
  labs(x = "Number Raw Read Pairs",
       y = "Percent Raw Reads Mapped") +
  facet_grid(sp_code ~ era + seq_run)
 ggsave("./out/scatter_overall_pct_mapped-VS-fqc_total_sequences_raw.png",
        width = 6.5,
        height = 9,
        units = "in")


data_all %>%
  filter(!is.na(seq_run)) %>%
   mutate(sp_code_site = str_c(sp_code,
                               site)) %>%
  ggplot(aes(x=fqc_total_sequences_raw,
             y=repaired_pct_mapped,
             color=site)) +
  geom_point() +
  geom_smooth(se=FALSE,
              method = "lm") +
  geom_hline(yintercept = 10,
             color="grey",
             linetype = "dashed") +
  geom_vline(xintercept = 10000000,
             color="grey",
             linetype = "dashed") +
  scale_x_continuous(trans='log10') +
  # scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 0.5,
                                   vjust = 0.5)) +
  labs(x = "Number Raw Read Pairs",
       y = "Percent Repaired Reads Mapped") +
  facet_grid(sp_code ~ era + seq_run)
 ggsave("./out/scatter_rprd_pct_mapped-VS-fqc_total_sequences_rprd.png",
        width = 6.5,
        height = 9,
        units = "in")




#### Box Plots ####

data_all %>%
  ggplot(aes(x=era,
             y=overall_pct_surviving_fqs,
             fill=era)) +
  geom_boxplot() +
  # scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = 0.5)) +
  labs(y = "Percent Read Pairs Remaining after Decontamination w FQSCRN") +
  facet_grid(. ~ sp_code + site,
             scales = "free_x")
 ggsave("./out/boxplot_overall_pct_surviving_fqs.png",
        width = 6.5,
        height = 9,
        units = "in")

data_all %>%
  filter(!is.na(seq_run)) %>%
  ggplot(aes(x=era,
             y=overall_pct_surviving_rprd,
             fill=era)) +
  geom_boxplot() +
  # scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = 0.5)) +
  labs(y = "Percent Read Pairs Remaining after FASTQ Repair") +
  facet_grid(seq_run ~ sp_code + site,
             scales = "free_x")
 ggsave("./out/boxplot_overall_pct_surviving_rprd.png",
        width = 6.5,
        height = 9,
        units = "in")




data_all %>%
  ggplot(aes(x=era,
             y=repaired_pct_mapped,
             fill=era)) +
  geom_boxplot() +
  # scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = 0.5)) +
  labs(y = "Percent Repaired Read Pairs Mapped") +
  facet_grid(. ~ sp_code + site,
             scales = "free_x")
 ggsave("./out/boxplot_repaired_pct_mapped.png",
        width = 6.5,
        height = 9,
        units = "in")


data_all %>%
  ggplot(aes(x=era,
             y=bam_numreads,
             fill=era)) +
  geom_boxplot() +
  scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = 0.5)) +
  labs(y = "Number Reads Mapped (not pairs)") +
  facet_grid(. ~ sp_code + site,
             scales = "free_x")
 ggsave("./out/boxplot_reads_mapped.png",
        width = 6.5,
        height = 9,
        units = "in")

data_all %>%
  ggplot(aes(x=era,
             y=bam_meandepth_wcvg,
             fill=era)) +
  geom_boxplot() +
  geom_hline(yintercept = 20) +
  # geom_hline(yintercept = 0.1) +
  scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = 0.5)) +
  labs(y = "Mean Mapped Depth of Coverage") +
  facet_grid(. ~ sp_code + site,
             scales = "free_x")
 ggsave("./out/boxplot_bam_meandepth_wcvg.png",
        width = 6.5,
        height = 9,
        units = "in")



#### Scatter Plots of Depth & Cvg vs RAW READS ####

data_all %>% 
  filter(sp_code == "Cvi",
          era == "[AC]"
  ) %>% 
  filter(!is.na(seq_run)) %>%
  mutate(sp_code_site = str_c(sp_code,
                              site)) %>%
  ggplot(aes(x=fqc_total_sequences_raw,
             y=bam_meandepth_wcvg,
             color=site,
             shape = factor(seq_run))) +
  geom_point() +
  geom_smooth(se=FALSE) +
  geom_hline(yintercept = 20,
             color="grey",
             linetype = "dashed") +
  geom_vline(xintercept = 10000000,
             color="grey",
             linetype = "dashed") +
  scale_x_continuous(trans='log10',
                     limits = c(100000,
                                100000000)) +
  scale_y_continuous(trans='log10',
                     limits = c(1,500)) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 0,
                                   hjust = 0.5,
                                   vjust = 0.5)) +
  labs(x = "Number Raw Read Pairs",
       y = "Mean Mapped Depth of Coverage") +
  facet_grid(. ~ era)
ggsave("./out/scatter_bam_meandepth_wcvg-VS-fqc_total_sequences_raw.png",
       width = 6.5,
       height = 9,
       units = "in")







data_all %>% 
  filter(sp_code == "Cvi",
          era == "[AC]"
  ) %>%
  filter(!is.na(seq_run)) %>%
  mutate(sp_code_site = str_c(sp_code,
                              site)) %>%
  ggplot(aes(x=fqc_total_sequences_raw,
             y=trgt_prop_loci_cvg_abv_90pct,
             color=site)) +
  geom_point() +
  geom_smooth(se=FALSE,
              method = "lm") +
  geom_hline(yintercept = 0.5,
             color="grey",
             linetype = "dashed") +
  geom_vline(xintercept = 10000000,
             color="grey",
             linetype = "dashed") +
  scale_x_continuous(trans='log10') +
  # scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 0,
                                   hjust = 0.5,
                                   vjust = 0.5)) +
  labs(x = "Number Raw Read Pairs",
       y = "Proportion of Loci w/ >90% Coverage") +
  facet_grid(sp_code ~ era + seq_run)
ggsave("./out/scatter_trgt_prop_loci_cvg_abv_90pct-VS-fqc_total_sequences_raw.png",
       width = 6.5,
       height = 9,
       units = "in")



####  Capture Success ####



#### MATRIX SCATTER ####

#### MATRIX SCATTER ####
data_all %>%
  filter(sp_code == "Cvi",
         site == "Pal") %>%
  select(fqc_total_sequences_raw:library_ng,
         -matches("_SN[1-5]"),
         -percent_in200_bp_to_650_bp,
         -dna_starting_ng,
         -dna_prepcr_est_ng) %>%
  ggpairs() 


####    ####
data_all %>%
  filter(sp_code = "Cvi") %>%
  ggplot(aes(x=era,
             y=ratio_readsrpr_readsmapped,
             fill=era)) +
  geom_boxplot() +
  scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = 0.5)) +
  labs(y = "Ratio Read Pairs Repaired:Mapped") +
  facet_grid(. ~ sp_code + site,
             scales = "free_x")


data_all %>%
  ggplot(aes(x=era,
             y=bam_numreads/1000000,
             fill=era)) +
  geom_boxplot() +
  geom_hline(yintercept = 10) +
  geom_hline(yintercept = 1) +
  geom_hline(yintercept = 0.1) +
  geom_hline(yintercept = 0.01) +
  scale_y_continuous(trans='log10') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = 0.5)) +
  labs(y = "Millions of Read Pairs Mapped Per Lib") +
  facet_grid(. ~ sp_code + site,
             scales = "free_x")





data_all %>%
  ggplot(aes(x=bam_numreads,
             y=bam_meandepth_wcvg,
             color=era,
             shape = sp_code)) +
  geom_point() +
  geom_vline(xintercept = 1000000) +
  geom_hline(yintercept = 20) +
  geom_hline(yintercept = 1) +
  scale_y_continuous(trans='log10') +
  theme_classic() +
  # theme(axis.text.x = element_text(angle = 90,
  #                                  hjust = 1,
  #                                  vjust = 0.5)) +
  # labs(y = "Mean Mapped Depth of Coverage") +
  facet_grid(genome_type ~ .)



#### Investigate ####
##Jem did not use this for the Cvi data##

data_all %>%
  # filter(str_detect(individual_id, 
  #                   "Cvi")) %>%
  ggplot(aes(x=fqs_no_hits_counts,
             y=fqc_total_sequences_rprd,
             color = era)) +
  geom_point() +
  geom_abline() +
  facet_wrap(. ~ sp_code,
             scales = "free")

data_all %>%
  filter(str_detect(individual_id, 
                     "Cvi")) %>%
  ggplot(aes(x=fqc_total_sequences_rprd * 2,
             y=bam_numreads,
             color = era)) +
  geom_point() +
  geom_abline() +
  facet_wrap(. ~ sp_code,
             scales = "free")




