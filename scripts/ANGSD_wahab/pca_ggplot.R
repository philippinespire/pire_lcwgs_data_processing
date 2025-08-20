## PCA from covariance matrix (PCANGSD output) ##
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#### User Defined Variables ####
covfile_path <- "angsd_notrans_snps_pca.cov"
bamfile_path <- "bam_list_all.txt"
historical_bam_pattern <- "^OchA"   # regex pattern that specifies the Historical bam files
all_bam_pattern <- "^Och[AC]"       # regex pattern that specifies the all bam files

suppressPackageStartupMessages({
  library(tidyverse)
})

# Read covariance and bam list
C <- as.matrix(read.table(covfile_path, header = FALSE))
samps <- readLines(bamfile_path)
samps <- basename(samps)

# Checks
stopifnot(nrow(C) == ncol(C))
stopifnot(nrow(C) == length(samps))

# Build labels
era <- 
  ifelse(
    grepl(historical_bam_pattern, samps), 
    "Historical", 
    "Contemporary"
    )
loc <- sub(str_c(all_bam_pattern,"([A-Za-z]+).*"), "\\1", samps)

# Eigen-decomposition
eig <- eigen(C, symmetric = TRUE)
vals <- eig$values
vecs <- eig$vectors
varPC <- 100 * vals / sum(vals)

# Score table
scores <- as.data.frame(vecs)
colnames(scores) <- paste0("PC", seq_len(ncol(scores)))
scores <- scores |>
  mutate(Sample = samps, Era = era, Location = loc) |>
  relocate(Sample, Era, Location)

# Quick plot: PC1 vs PC2 (you can change to PC3/PC4 by editing 1/2 below)
x_axis <- 1; y_axis <- 2
ggplot(scores, aes(x = .data[[paste0("PC", x_axis)]],
                   y = .data[[paste0("PC", y_axis)]],
                   color = Era, shape = Location)) +
  geom_point(size = 3, alpha = 0.7) +
  scale_color_manual(values = c("Contemporary" = "#00BFC4", "Historical" = "#F8766D")) +
  theme_classic() +
  xlab(sprintf("PC%d (%.2f%%)", x_axis, varPC[x_axis])) +
  ylab(sprintf("PC%d (%.2f%%)", y_axis, varPC[y_axis]))

# ggsave(
#   str_c(
#     covfile_path,
#     ".PC",
#     x_axis,
#     ".PC",
#     y_axis,
#     ".png"
#   )
# )

x_axis <- 1; y_axis <- 2
ggplot(scores, aes(x = .data[[paste0("PC", x_axis)]],
                   y = .data[[paste0("PC", y_axis)]],
                   color = Era, shape = Location)) +
  geom_point(size = 3, alpha = 0.7) +
  scale_color_manual(values = c("Contemporary" = "#00BFC4", "Historical" = "#F8766D")) +
  theme_classic() +
  xlab(sprintf("PC%d (%.2f%%)", x_axis, varPC[x_axis])) +
  ylab(sprintf("PC%d (%.2f%%)", y_axis, varPC[y_axis])) + 
  coord_cartesian(xlim = c(-0.01, NA))
# 
# ggsave(
#   str_c(
#     covfile_path,
#     ".PC",
#     x_axis,
#     ".PC",
#     y_axis,
#     ".zoomin",
#     ".png"
#   )
# )

x_axis <- 3; y_axis <- 4
ggplot(scores, aes(x = .data[[paste0("PC", x_axis)]],
                   y = .data[[paste0("PC", y_axis)]],
                   color = Era, shape = Location)) +
  geom_point(size = 3, alpha = 0.7) +
  scale_color_manual(values = c("Contemporary" = "#00BFC4", "Historical" = "#F8766D")) +
  theme_classic() +
  xlab(sprintf("PC%d (%.2f%%)", x_axis, varPC[x_axis])) +
  ylab(sprintf("PC%d (%.2f%%)", y_axis, varPC[y_axis]))
# 
# ggsave(
#   str_c(
#     covfile_path,
#     ".PC",
#     x_axis,
#     ".PC",
#     y_axis,
#     ".png"
#   )
# )

x_axis <- 5; y_axis <- 6
ggplot(scores, aes(x = .data[[paste0("PC", x_axis)]],
                   y = .data[[paste0("PC", y_axis)]],
                   color = Era, shape = Location)) +
  geom_point(size = 3, alpha = 0.7) +
  scale_color_manual(values = c("Contemporary" = "#00BFC4", "Historical" = "#F8766D")) +
  theme_classic() +
  xlab(sprintf("PC%d (%.2f%%)", x_axis, varPC[x_axis])) +
  ylab(sprintf("PC%d (%.2f%%)", y_axis, varPC[y_axis]))

# ggsave(
#   str_c(
#     covfile_path,
#     ".PC",
#     x_axis,
#     ".PC",
#     y_axis,
#     ".png"
#   )
# )
