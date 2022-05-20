#### INITIALIZE ####

#if in rstudio, run the next line, if not, don't run the next line
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(RcppCNPy) # Numpy library for R
library(tidyverse)

#### USER DEFINED VARIABLES ####
npyFile = "PCAngsd_selection/out_PCAngsd_selection_maptest_minMaf0.05.selection.npy"
npyFile = "PCAngsd_selection/out_PCAngsd_selection_minMaf0.05_e32.selection.npy"
sitesFile = "mkBGL/Sfa-ABas-CBas_all-GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen_clmp_fp2_repr_fltrd_rnmd.sites"
popMap = "fltrBAM/popmap_sfa.tsv"
covFile = "PCAngsd_selection/test05_fltrd_maptest_minMaf0.3.cov"
covFile = "PCAngsd_selection/out_PCAngsd_selection_minMaf0.05_e32.cov"

#### function for QQplot and other stuff from pcangsd tutorial ####
qqchi<-function(x,...){
  lambda <- round(median(x)/qchisq(0.5,
                                   1),
                  2)
  qqplot(qchisq((1:length(x)-0.5)/(length(x)), 
                1),
         x,
         ylab="Observed",
         xlab="Expected",...);abline(0,
                                     1,
                                     col=2,
                                     lwd=2)
  legend("topleft",
         paste("lambda=",
               lambda))
}

### read in selection statistics (chi2 distributed)
selection_stats <- 
  npyLoad(npyFile)

## make QQ plot to QC the test statistics
qqchi(selection_stats)

#### use tidyverse from here forward to read in additional data and visualize selection data ####
# convert test statistic to p-value
pval <- 
  1 - pchisq(selection_stats,
             1) %>% 
  as_tibble() %>%
  dplyr::rename(pval = V1)

# visualize pvals
pval %>%
  ggplot(aes(x=pval)) +
  geom_histogram(bins = 101)

## read positions 
sites <- 
  read_tsv(sitesFile,
           col_names = FALSE) %>%
  dplyr::rename(chrom = X1,
                pos = X2) %>%
  mutate(chrom_pos = str_c(chrom,
                           pos,
                           sep = "_"))
data_selection <- 
  bind_cols(sites,
            pval) %>%
  mutate(neglog10_pval = -log10(pval))

rm(sites, pval, selection_stats)

data_selection %>%
  ggplot(aes(x=neglog10_pval)) +
  geom_histogram(bins = 101)

## make Manhattan plot
data_selection %>%
  head(1000) %>%
  ggplot(aes(x=chrom_pos,
             y=-log10(pval))) +
  geom_point()
  
plot(-log10(data_selection$pval),
     # col=data_selection$chrom,
     xlab="Chromosomes",
     main="Manhattan plot")

sel## zoom into region
w <- range(which(pval<1e-7)) + c(-100,100)
keep<-w[1]:w[2]
plot(p$pos[keep],-log10(pval[keep]),col=p$chr[keep],xlab="HG38 Position chr2")

## see the position of the most significant SNP
p$pos[which.max(selection_stats)]

#### READ IN PCA DATA ####
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

#### SCREE PLOT ####
# https://en.wikipedia.org/wiki/Scree_plot
# use this as a way of evaluating the validity of the number of principle components used by PCAngsd
# You can find the number of principle components used in the `*.out` file
# by default, PCAngsd uses the MAP test https://www.nature.com/articles/hdy201126
# you can also specify the number of principle components with the -e option in PCAngsd
# it should be noted that PCAngsd uses a covariance matrix of eigen values in the MAP test that we don't have access to (eq 3 in https://academic.oup.com/genetics/article/210/2/719/5931101?login=true)
# so here, we use the final covariance matrix of eigenvalues as a proxy

data_pca_2 %>%
  ggplot(aes(x=principle_component,
             y=pct_variance_explained)) +
  geom_point() +
  geom_line() +
  labs(title = "Scree Plot")


#### VISUALIZE PCA ####
data_pca %>%
  ggplot(aes(x=PC1,
             y=PC2,
             color=POP)) +
  geom_point(size=3) +
  stat_ellipse() +
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
                 "%)"))

# pdf("PCAngsd_selection_pc3v1.pdf")
# ggsave("./PCAngsd_selection_pc2v1.png", units = "in", height = 4, width = 6)

data_pca %>%
  ggplot(aes(x=PC1,
             y=PC3,
             color=POP)) +
  geom_point(size=3) +
  stat_ellipse() +
  theme_classic() +
  labs(x = str_c("PC1 (",
                 data_pca_2$pct_variance_explained %>%
                   head(1) %>%
                   round(2),
                 "%)"),
       y = str_c("PC3 (",
                 data_pca_2$pct_variance_explained %>%
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
  stat_ellipse() +
  theme_classic() +
  labs(x = str_c("PC2 (",
                 data_pca_2$pct_variance_explained %>%
                   head(2) %>%
                   tail(1) %>%
                   round(2),
                 "%)"),
       y = str_c("PC3 (",
                 data_pca_2$pct_variance_explained %>%
                   head(3) %>%
                   tail(1) %>%
                   round(2),
                 "%)"))

# pdf("PCAngsd_selection_pc3v2.pdf")
# ggsave("./PCAngsd_selection_pc3v2.png", units = "in", height = 4, width = 6)


# dev.off()
## close R