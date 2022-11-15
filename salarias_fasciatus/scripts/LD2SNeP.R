rm(list = ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#### LIBRARIES ####

library(tidyverse)
library(janitor)

#### Read in Data ####

SNeP <- read_tsv("../ngsLD/Sfa-ABas-CBas_all_final_fltrd.glf.ld",
                 col_names = c("tmp", "dist(bp)", "r2")) %>%
  select(1, 7, 8) %>%
  separate(tmp, into = c("CHR", "tmp2"), sep = ":") %>%
  mutate(CHR = case_when(CHR == "NC_043745.1" ~ "1",
                         CHR == "NC_043746.1" ~ "2",
                         CHR == "NC_043747.1" ~ "3",
                         CHR == "NC_043748.1" ~ "4",
                         CHR == "NC_043749.1" ~ "5",
                         CHR == "NC_043750.1" ~ "6",
                         CHR == "NC_043751.1" ~ "7",
                         CHR == "NC_043752.1" ~ "8",
                         CHR == "NC_043753.1" ~ "9",
                         CHR == "NC_043754.1" ~ "10",
                         CHR == "NC_043755.1" ~ "11",
                         CHR == "NC_043756.1" ~ "12",
                         CHR == "NC_043757.1" ~ "13",
                         CHR == "NC_043758.1" ~ "14",
                         CHR == "NC_043759.1" ~ "15",
                         CHR == "NC_043760.1" ~ "16",
                         CHR == "NC_043761.1" ~ "17",
                         CHR == "NC_043762.1" ~ "18",
                         CHR == "NC_043763.1" ~ "19",
                         CHR == "NC_043764.1" ~ "20",
                         CHR == "NC_043765.1" ~ "22",
                         CHR == "NC_043766.1" ~ "23",
                         TRUE ~ "ERROR")) %>%
  select(-tmp2)

SNeP %>% write_tsv("SNeP_infile.tsv")