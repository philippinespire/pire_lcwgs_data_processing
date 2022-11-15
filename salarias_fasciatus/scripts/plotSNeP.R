rm(list = ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)
library(janitor)
library(qqplotr)


SNeP <- read_tsv("../SNeP/Sfa-ABas-CBas_all_final_fltrd_SNeP.NeAll")


SNeP %>% ggplot(aes(x=GenAgo,
                    y=Ne))+
  geom_point(size=2) +
  geom_smooth(color="Orange", method="lm") +
  theme_classic() +
  xlab("Generations Ago") +
  ylab("Effective Population Size (Ne)")


ggsave(filename = "../plots/SNeP_Results.png", 
       units = "in", 
       height = 4, 
       width = 6)
