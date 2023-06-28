#!/usr/bin/env Rscript

#### INITIALIZE ####
#if running from command line, comment out next line
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#### PACKAGES ####
packages_used <- 
  c("tidyverse", 
    "magrittr",
    "janitor",
    "purrr")

# NOTE: after loading these packages, you may find that tidyverse commands are affected 
#       the solution is to add the appropriate package name before commands that break code
#       such as `dplyr::select` if `select` doesn't work correctly anymore
#       this happens when multiple packages have the same command names. 
#       The last package loaded takes precidence, and your tidyverse commands break.
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

#library(tidyverse)
#library(janitor)
#library(magrittr)
##library(devtools)
#library(purrr)

#### USER DEFINED VARIABLES ####
args <- commandArgs(trailingOnly = TRUE)

if (length(args)==0) {
  # inDir = "../pire_ssl_data_processing"
  # inDir = "../pire_cssl_data_processing"
  inDir = "../pire_lcwgs_data_processing"
  readMultiqcPath = "../read_multiqc/read_multiqc.R" # in a different repo https://github.com/cbirdlab/read_multiqc
} else if (length(args)==1) {
  # default output file
  inDir = args[1]
} else if (length(args)==2) {
  inDir = args[1]
  readMultiqcPath = args[2] 
} else if (length(args)>=3) {
  stop("Only accepts 0 to 2 arguments: </path/to/>pire_<ssl|cssl|lcwgs>_data_processing </path/to/>read_multiqc/read_multiqc.R", 
       call.=FALSE)
}

wrangleDecodePath = "wrangleDECODE.R"
wrangleFastqcPath = "wrangleFASTQC.R"
wrangleFastqcPathRpr = "wrangleFASTQC1.R"
wrangleFastpPath = "wrangleFASTP.R"
wrangleFqscrnPath = "wrangleFQSCRN.R"
wrangleDpCvgBamPath = "wrangleDpCvgBAM.R"
wrangleDpCvgTrgtPath = "wrangleDpCvgBAM_ProbeTargets.R"

if(str_detect(inDir, "_ssl_")) {
  seqType = "ssl"
}  else if (str_detect(inDir, "_cssl_")) {
  seqType = "cssl"
} else if (str_detect(inDir, "_lcwgs_")) {
  seqType = "lcwgs"
}

outFile = str_c("./out/sequencing_metadata_",
                seqType,
                ".rds") #visualizeSslCsslLcwgsMETADATA.R depends on this path and name
#dir.create(path = "./out")                #.gitignore will prevent the out dir from being pushed



#### SOURCE SCRIPTS ####
# get read_multiqc.R, instructions: https://github.com/cbirdlab/read_multiqc
# source_url("https://raw.githubusercontent.com/cbirdlab/read_multiqc/main/read_multiqc.R")
source(readMultiqcPath)
source(wrangleDecodePath)
source(wrangleFastqcPath)
source(wrangleFastqcPathRpr)
source(wrangleFastpPath)
source(wrangleFqscrnPath)
source(wrangleDpCvgBamPath)
source(wrangleDpCvgTrgtPath)

#### READ IN METADATA ####
data_fastqc_raw <-
  wrangleFastqc(inDir = inDir,
                fastqcFltr1 = "Multi_FASTQC",  #Multi_FASTQC.sh did save into this dir, but somebody changed it
                fastqcFltr2 = "raw",  #Multi_FASTQC.sh should be run on dir with raw in name
                fastqcFltrOut1 = "repair",
                fastqcFltrOut2 = "rprd",
                fastqcFltrOut3 = "clmp")

data_fastp1 <-
  wrangleFastp(inDir = inDir,
               fastpFltr = "1st_fastp_")

data_fastp2 <-
  wrangleFastp(inDir = inDir,
               fastpFltr = "2nd_fastp_")

data_fqscrn <-
  wrangleFqscrn(inDir = inDir,
                fqscrnFile = "multiqc_fastq_screen.txt",
                fqscrnFltrOut = "repaired")

data_fastqc_rprd <-
  wrangleFastqc1(inDir = inDir,
                 fastqcFltr1 = "repair",
                 fastqcFltr2 = "rprd",
                 fastqcFltrOut1 = "zzzzzzzzzzzzzzzz",
                 fastqcFltrOut2 = "zzzzzzzzzzzzzzzzz")

data_dpcvgbam <- 
  wrangleDpCvgBam(inDir = inDir,
                  dpCvgFltr1 = "coverage_genome",
                  dpCvgFltr2 = "bam_processing",
                  dpCvgFltr3 = "coverageMappedReads",
                  dpCvgFltrOut1 = "zzzzzzzzzz",
                  dpCvgFltrOut2 = "zzzzzzzzzzz")

if(seqType == "cssl"){
  data_dpcvgbam_trgts <- 
    wrangleDpCvgBamPrbTrgts(inDir = inDir,
                            dpCvgFltr1 = "out_bait",
                            dpCvgFltr2 = "bam_processing",
                            dpCvgFltr3 = "coverageMappedReads",
                            dpCvgFltrOut1 = "readme",
                            dpCvgFltrOut2 = "zzzzzzzzzzz")
}

#### COMBINE DATA ####
data_all <-
  data_fastqc_raw %>%
  full_join(data_fastp1,
            by = c("species",
                   "seq_type",
                   "seq_run",
                   "sample", 
                   "individual_id", 
                   "sp_code", 
                   "era", 
                   "site")) %>% 
  select(-matches("snippy_variant_total")) %>%
  full_join(data_fastp2,
            by = c("species",
                   "seq_type",
                   "seq_run",
                   "sample", 
                   "individual_id", 
                   "sp_code", 
                   "era", 
                   "site")) %>% 
  rename_with(.cols = contains("."),
              .fn = ~case_when(str_detect(., 
                                          "\\.x") ~ str_replace(., 
                                                                "\\.x", 
                                                                "_1"),
                               str_detect(., 
                                          "\\.y") ~ str_replace(., 
                                                                "\\.y", 
                                                                "_2"))) %>% 
  full_join(data_fqscrn %>%
              select(-matches("^nt_")),
            by = c("species",
                   "seq_type",
                   "seq_run",
                   "sample",
                   "individual_id", 
                   "sp_code", 
                   "era", 
                   "site")) %>% 
  
  # filter(sp_code == "Sde" & seq_run == 1) %>% select(species,

  full_join(data_fastqc_rprd %>%
              rename(fqc_sample_rprd = sample),
            by = c("species",
                   "seq_type",
                   "seq_run",
                   # "sample",
                   "individual_id", 
                   "sp_code", 
                   "era", 
                   "site")) %>% 
  # rename(sample = sample.x,
  #        fqc_sample_rprd = sample.y) %>%
  rename_with(.cols = contains("."),
              .fn = ~case_when(str_detect(., 
                                          "\\.x") ~ str_replace(., 
                                                                "\\.x", 
                                                                "_raw"),
                               str_detect(., 
                                          "\\.y") ~ str_replace(., 
                                                                "\\.y", 
                                                                "_rprd"))) %>%

  full_join(data_dpcvgbam %>%
              rename(bam_sample = sample,
                     bam_filename = filename),
            by = c("species",
                   "seq_type",
                   "seq_run",
                   # "sample",
                   "individual_id", 
                   "sp_code", 
                   "era", 
                   "site")) %>%
  # rename(sample = sample.x,
  #        bam_sample = sample.y) %>%
  # mutate(fqs_no_hits_counts = case_when(is.na(fqs_no_hits_counts) ~ 0,
  #                                       TRUE ~ fqs_no_hits_counts),
  #        fqc_total_sequences_rprd = case_when(is.na(fqc_total_sequences_rprd) ~ 0,
  #                                       TRUE ~ fqc_total_sequences_rprd),
  #        bam_numreads = case_when(is.na(bam_numreads) ~ 0,
  #                                       TRUE ~ bam_numreads)) %>%
  mutate(genome_type = case_when(sp_code == "Aen" | 
                                   sp_code == "Gmi" |
                                   sp_code == "Leq" |
                                   sp_code == "Sde" ~ "rad",
                                 sp_code == "Sfa" ~ "chrom_scale",
                                 TRUE ~ "ssl"),
         overall_pct_surviving_fqs = 100 * fqs_no_hits_counts / fqc_total_sequences_raw,
         overall_pct_surviving_rprd = 100 * fqc_total_sequences_rprd / fqc_total_sequences_raw,
         overall_pct_mapped = 100 * bam_numreads / (2 * fqc_total_sequences_raw), # I think both R1 and R2 are counted in bam_numreads
         repaired_pct_mapped = 100 * bam_numreads / (2 * fqc_total_sequences_rprd),
         ratio_readsrpr_readsmapped = fqc_total_sequences_rprd / bam_numreads) %>%
  select(-matches("^nt_[cp]"),
         -starts_with("snippy"))


if(seqType == "cssl"){
  data_all <-
    data_all %>%
    full_join(data_dpcvgbam_trgts %>%
                rename(trgt_sample = sample,
                       trgt_filedir = filedir,
                       trgt_filename = filename),
              by = c("species",
                     "seq_type",
                     "seq_run",
                     # "sample",
                     "individual_id", 
                     "sp_code", 
                     "era", 
                     "site"))
    # rename(sample = sample.x,
    #        trgt_sample = sample.y) %>%
    
}
  


#### TROUBLESHOOT ####

data_fastqc_raw %>% 
  distinct(seq_run, sp_code, era, site, .keep_all = TRUE) %>% 
  select(sample, individual_id, sp_code, era, site, seq_run) %>%
  write_tsv(str_c("./out/data_fastqc_raw_",
                  seqType,
                  ".tsv"))

data_fastp1 %>% 
  distinct(seq_run, sp_code, era, site, .keep_all = TRUE) %>% 
  select(sample, individual_id, sp_code, era, site, seq_run) %>% 
  write_tsv(str_c("./out/data_fastp1_",
            seqType,
            ".tsv"))

data_fastp2 %>% 
  distinct(seq_run, sp_code, era, site, .keep_all = TRUE) %>% 
  select(sample, individual_id, sp_code, era, site, seq_run) %>% 
  write_tsv(str_c("./out/data_fastp2_",
            seqType,
            ".tsv"))

data_fqscrn %>% 
  distinct(seq_run,
           sp_code, 
           era, 
           site, 
           .keep_all = TRUE) %>% 
  select(sample, 
         individual_id, 
         sp_code, 
         era, 
         site,
         seq_run) %>% 
  write_tsv(str_c("./out/data_fqscrn_",
            seqType,
            ".tsv"))

data_fastqc_rprd %>% 
  distinct(seq_run,sp_code, era, site, .keep_all = TRUE) %>% 
  select(sample, individual_id, sp_code, era, site, seq_run) %>% 
  write_tsv(str_c("./out/data_fastqc_rprd_",
            seqType,
            ".tsv"))

data_dpcvgbam %>% 
  distinct(seq_run,sp_code, era, site, .keep_all = TRUE) %>% 
  select(sample, individual_id, sp_code, era, site, seq_run,) %>% 
  write_tsv(str_c("./out/data_dpcvgbam_",
            seqType,
            ".tsv"))

data_dpcvgbam %>% 
  distinct(seq_run,sp_code, era, site, .keep_all = TRUE) %>% 
  select(sample, individual_id, sp_code, era, site, seq_run,) %>% 
  write_tsv(str_c("./out/data_dpcvgbam_",
            seqType,
            ".tsv"))




#### WRITE METADATA ####
data_all %>%
  write_rds(file = outFile,
            compress = "gz")

