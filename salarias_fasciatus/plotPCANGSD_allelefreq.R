setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)

#open R
pop<-read.table("fltrBAM/popmap_sfa.tsv",
                header = TRUE)
C <- as.matrix(read.table("PCAngsd_allelefreq/out_PCAngsd_allelefreq.cov"))
e <- eigen(C)

data_pca <-
  read_tsv("fltrBAM/popmap_sfa.tsv",
           col_names = TRUE) %>%
  bind_cols(as_tibble(e$vectors)) %>%
  rename_with(.cols = starts_with("V"),
              .fn = ~str_replace(.,
                                 "^V",
                                 "PC"))

data_pca_2 <-
  as_tibble(e$values) %>%
  mutate(pct_variation = 100 * value/sum(value))


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

# pdf("PCAngsd_allelefreq1.pdf")

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

# pdf("PCAngsd_allelefreq2.pdf")

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

 # pdf("PCAngsd_allelefreq3.pdf")

data_pca %>%
  ggplot(aes(y=value)) +
  geom_col()

# dev.off()
## close R