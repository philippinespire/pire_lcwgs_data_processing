#### INITIALIZE ####

#if in rstudio, run the next line, if not, don't run the next line
#setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(RcppCNPy) # Numpy library for R
library(tidyverse)

#### USER DEFINED VARIABLES ####
npyFile = "PCAngsd_selection/out_PCAngsd_selection.selection.npy"
sitesFile = "Sfa-ABas-CBas_all-GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen_clmp_fp2_repr_fltrd_rnmd.sites"

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

#### use tidyverse from here forward to read in additional data and visualize ####
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
  
plot(-log10(pval),
     col=p$chr,
     xlab="Chromosomes",
     main="Manhattan plot")

## zoom into region
w <- range(which(pval<1e-7)) + c(-100,100)
keep<-w[1]:w[2]
plot(p$pos[keep],-log10(pval[keep]),col=p$chr[keep],xlab="HG38 Position chr2")

## see the position of the most significant SNP
p$pos[which.max(selection_stats)]