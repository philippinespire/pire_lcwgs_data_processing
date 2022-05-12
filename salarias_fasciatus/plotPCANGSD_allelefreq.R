#### INITIALIZE ####

#if in rstudio, run the next line, if not, don't run the next line
#setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)

#### USER DEFINED VARIABLES ####
popMap = "fltrBAM/popmap_sfa.tsv"
covFile = "PCAngsd_allelefreq/out_PCAngsd_allelefreq.cov"

#### READ IN DATA ####
#open R
pop<-read.table(popMap,
                header = TRUE)
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
  mutate(pct_variation = 100 * value/sum(value))

#### VISUALIZE PCA ####

data_pca %>%
  ggplot(aes(x=PC1,
             y=PC2,
             color=POP)) +
  geom_point(size=3) +
  theme_classic() +
  labs(x = str_c("PC1 (",
                 data_pca_2$pct_variation %>%
                   head(1) %>%
                   round(2),
                 "%)"),
       y = str_c("PC2 (",
                 data_pca_2$pct_variation %>%
                   head(2) %>%
                   tail(1) %>%
                   round(2),
                 "%)"))

# pdf("PCAngsd_selection_pc3v1.pdf")
# ggsave("./PCAngsd_selection_pc2v1.png", units = "in", height = 4, width = 6)

data_pca %>%
  ggplot(aes(x=PC1,
             y=PC3,
             color=POP)) +
  geom_point(size=3) +
  theme_classic() +
  labs(x = str_c("PC1 (",
                 data_pca_2$pct_variation %>%
                   head(1) %>%
                   round(2),
                 "%)"),
       y = str_c("PC3 (",
                 data_pca_2$pct_variation %>%
                   head(3) %>%
                   tail(1) %>%
                   round(2),
                 "%)"))

# pdf("PCAngsd_selection_pc3v1.pdf")
# ggsave("./PCAngsd_selection_pc3v1.png", units = "in", height = 4, width = 6)

data_pca %>%
  ggplot(aes(x=PC2,
             y=PC3,
             color=POP)) +
  geom_point(size=3) +
  theme_classic() +
  labs(x = str_c("PC2 (",
                 data_pca_2$pct_variation %>%
                   head(2) %>%
                   tail(1) %>%
                   round(2),
                 "%)"),
       y = str_c("PC3 (",
                 data_pca_2$pct_variation %>%
                   head(3) %>%
                   tail(1) %>%
                   round(2),
                 "%)"))

# pdf("PCAngsd_selection_pc3v2.pdf")
# ggsave("./PCAngsd_selection_pc3v2.png", units = "in", height = 4, width = 6)


# dev.off()
## close R