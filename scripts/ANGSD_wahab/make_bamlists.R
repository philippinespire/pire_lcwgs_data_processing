
##Make Bamlists##

# this script will create a bamlist for all historical, all contemp, and each site x era combination in your data

# this was made for `/archive/carpenterlab/pire/pire_ostorhinchus_chrysopomus_lcwgs/angsd_analysis`
# so you can consult that dir
# there are user defined variables below that you can modify, you should not need to modify the code for
# all historical, all contemp, and each site x era.

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#### User Defined Variables ####

qfile_path   <- "angsd_admix_notrans.admix.2.Q"
bamlist_path <- "bam_list_all.txt"
historical_pattern <- "^OchA"    # regex that selects all historical libraries
contemp_pattern <- "^OchC"       # regex that selects all contemp libraries
all_pattern <- "^Och[AC]"        # regex that selects all libraries

# Vars for parsing population group affiliation from admixure model
# Uncomment these var and the commented code below and customize for your species.
# historical_p1_out <- "bam_list_p1_historical.txt"
# historical_p2_out <- "bam_list_p2_historical.txt"
# contemp_p2_out <- "bam_list_p2_contemp.txt"
#assign_thresh <- 0.9

#### Packages ####
suppressPackageStartupMessages({
  library(tidyverse)
})

#### # Read Q and bam list #####

wrangle_data <-
  function(
    qfile_path,
    bamlist_path,
    historical_pattern,
    all_pattern
  ){
    Q <- as.matrix(read.table(qfile_path, header = FALSE))
    samps <- readLines(bamlist_path)
    samps <- basename(samps)

    # Basic sanity check
    stopifnot(nrow(Q) == length(samps))

    # Build grouping labels from sample IDs
    # Assumes Historical start with "OchA", Contemporary with "OchC"
    era <- ifelse(grepl(historical_pattern, samps), "Historical", "Contemporary")

    # Optional: extract a location tag like Bur/Cat/Tum/Can
    loc <- sub(str_c(all_pattern,"([A-Za-z]+).*"), "\\1", samps)

    meta.data <- data.frame(loc = era)  # pophelper expects a d

    df <- as.data.frame(Q)
    colnames(df) <- paste0("K", seq_len(ncol(df)))
    df$Sample <- samps
    df$era  <- era
    df$location <- loc
    long <- df |>
      pivot_longer(starts_with("K"), names_to = "Cluster", values_to = "Prop") |>
      mutate(era = factor(era, levels= c("Historical", "Contemporary")))

    return(long)
  }

#### bam list for historical and contemp ####

# output historical from all pops
  data_admix %>%
    filter(Cluster == "K1") %>%
    filter(era == "A") %>%
    pull(Sample) %>%
    write_lines(str_c("bam_list_historical.txt"))

# output contemp from all pops
  data_admix %>%
    filter(Cluster == "K1") %>%
    filter(era == "C") %>%
    pull(Sample) %>%
    write_lines(str_c("bam_list_contemp.txt"))

#### bam_list for each pop sample ####
data_admix <-
  wrangle_data(qfile_path, bamlist_path,historical_pattern,
               all_pattern) %>%
  mutate(
    era = recode_factor(era, "Historical" = "A", "Contemporary" = "C"),
    pop_sample = str_c(as.character(era),location)
  )

sites <-
  data_admix  %>%
  pull(pop_sample) %>%
  unique()

#write one bam list for each pop sample
for(i in sites){
  data_admix %>%
    filter(Cluster == "K1") %>%
    filter(pop_sample == i) %>%
    pull(Sample) %>%
    write_lines(str_c("bam_list_", i, ".txt"))
}



#### bam list for pop2 historical and contemp ####
#data_admix_pop2 <-
#  wrangle_data(qfile_path, bamlist_path,historical_pattern,
#               all_pattern) %>%
#  filter(Cluster == "K2") %>%
#  filter(Prop > assign_thresh)

# output historical from pop 2
#data_admix_pop2 %>%
#  filter(str_detect(Sample, historical_pattern)) %>%
#  pull(Sample) %>%
#  write_lines(historical_p2_out)

# output contemp from pop 2
#data_admix_pop2 %>%
#  filter(str_detect(Sample, contemp_pattern)) %>%
#  pull(Sample) %>%
#  write_lines(contemp_p2_out)

#### bam list for pop 1 historical ####

#data_admix_historical <-
#  wrangle_data(qfile_path, bamlist_path,historical_pattern,
#               all_pattern) %>%
#  filter(era == "Historical")

# output historical from pop 1
#data_admix_historical %>%
#  filter(Cluster == "K1") %>%
#  filter(Prop > assign_thresh) %>%
#  pull(Sample) %>%
#  write_lines(historical_p1_out)

