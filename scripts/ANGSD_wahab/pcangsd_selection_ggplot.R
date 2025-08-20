# ────────────────────────────────────────────────────────────────────────────────
# PCangsd selection scan: tidyverse/ggplot2 pipeline (big-data friendly)
# ────────────────────────────────────────────────────────────────────────────────
# Requirements: vroom, tidyverse, ggplot2, scales
# Optional (for parallel map/read tweaks later): furrr, future
# ────────────────────────────────────────────────────────────────────────────────

# If running inside RStudio and you like: setwd to the script dir
if (requireNamespace("rstudioapi", quietly = TRUE)) {
  try({
    this_path <- rstudioapi::getActiveDocumentContext()$path
    if (!is.null(this_path) && nzchar(this_path)) setwd(dirname(this_path))
  }, silent = TRUE)
}

# ----------------------- USER-CONFIGURABLE VARIABLES ----------------------------
# Paths (relative to the script or absolute). Keep these generic for any species.
selection_file   <- "angsd_notrans_snps_selection_it500.selection"
regions_file     <- "global_snp_list_depth1_15_notrans.regions"
sites_file       <- "angsd_notrans_snps_selection_it500.sites"

# Species- / project-specific knobs
output_prefix    <- "pcangsd_selection_it500"   # used for output files/plots
exclude_chroms   <- c(                          # set to character(0) to keep all
  # "NC_043748.1", "NC_043749.1", "NC_043750.1", "NC_043755.1", "NC_043758.1"
)

# Plotting + performance
plot_sample_n    <- NA      # downsample for plotting; set NA to plot all (slower)
point_size       <- 0.3
alpha_points     <- 0.8

# Significance thresholds
alpha_bonf       <- 0.05        # Bonferroni alpha
alpha_fdr        <- 0.05        # BH FDR q-level

# Reproducibility
set.seed(123)

# ----------------------------- LIBRARIES ----------------------------------------
suppressPackageStartupMessages({
  library(tidyverse)
  library(vroom)      # very fast readers for large flat files
  # library(ggplot2)
  library(scales)
})

# --------------------------- DATA LOADING (FAST) --------------------------------
# pcangsd ".selection" is typically a single numeric column (χ² with 1 df).
sel <- vroom::vroom(
  selection_file,
  delim = "\t", 
  col_names = FALSE, col_types = list(col_double()),
  progress = TRUE
) %>%
  rename(stat = X1) %>%
  mutate(row_id = row_number())

# SNP coordinates; usually "<chrom>:<pos>" in the first column
locs <- vroom::vroom(
  regions_file,
  delim = "\t", 
  col_names = FALSE, col_types = list(col_character()),
  progress = TRUE
) %>%
  rename(coord = X1) %>%
  mutate(row_id = row_number()) %>%
  tidyr::separate(coord, into = c("chr", "pos"), sep = ":", remove = TRUE, convert = TRUE)

# Site keep/drop mask; typically a 0/1 vector aligned to the same order
sites <- vroom::vroom(
  sites_file,
  delim = "\t", 
  col_names = FALSE, col_types = list(col_integer()),
  progress = TRUE
) %>%
  rename(keep = X1) %>%
  mutate(row_id = row_number())

# ------------------------------- JOIN & FILTER ----------------------------------
# Join by row index to preserve ordering and 1:1 alignment
df <- sel %>%
  inner_join(locs, by = "row_id") %>%
  inner_join(sites, by = "row_id") %>%
  # keep only sites flagged 1
  filter(keep == 1L) %>%
  # optional: drop chromosomes (e.g., inversions, unplaced, etc.)
  filter(!(chr %in% exclude_chroms)) %>%

# -------------------------- STATS → P-VALUES & LAMBDA ---------------------------
# p-values from χ²(1) test statistics
# df <- df %>%
  mutate(
    pval = pchisq(stat, df = 1, lower.tail = FALSE),
    logp = -log10(pval),
    chr = factor(as.character(chr))
  )

n_snps <- nrow(df)

# Genomic inflation factor (λ) using medians
lambda <- median(df$stat, na.rm = TRUE) / qchisq(0.5, df = 1)

# Multiple testing thresholds
bonf_p  <- alpha_bonf / n_snps
bonf_y  <- -log10(bonf_p)
df <- df %>%
  mutate(
    pval_bonf_sig = pval < bonf_p,
    pval_fdr      = p.adjust(pval, method = "BH"),
    pval_fdr_sig  = pval_fdr < alpha_fdr,
    color_key = if_else(pval_fdr_sig, "sig", as.character(chr))
  )



# ------------------------------- MANHATTAN PLOT ---------------------------------
# Build cumulative base for "chromosome-wise" x positions
chr_order <- df %>%
  count(chr, name = "n") %>%
  arrange(chr) %>%
  mutate(chr_index = row_number()) %>%
  mutate(base = lag(cumsum(n), default = 0))

df <- df %>%
  left_join(chr_order %>% select(chr, base, chr_index), by = "chr") %>%
  arrange(chr_index, pos) %>%
  mutate(x = base + row_number())

# Downsample for plotting (speeds up rendering tremendously on huge datasets)
df_plot <- if (!is.na(plot_sample_n) && plot_sample_n < nrow(df)) {
  df %>% slice_sample(n = plot_sample_n)
} else {
  df
}

# Chromosome centers for x-axis labels
chr_labels <- df %>%
  group_by(chr) %>%
  summarise(x_center = median(x), .groups = "drop") %>%
  arrange(chr)

# Alternating color map for chromosomes

# Greys for chromosomes
chr_levels <- levels(df$chr)
base_cols  <- rep(c("grey20", "grey70"), length.out = length(chr_levels))
names(base_cols) <- chr_levels

# Add red for significant points
palette_cols <- c(base_cols, sig = "#D62728")

# Manhattan
p_manhattan <- ggplot(df_plot, aes(x = x, y = logp)) +
  geom_point(aes(color = chr),
             size = point_size, alpha = alpha_points,
             show.legend = FALSE) +
  scale_color_manual(values = base_cols, guide = "none") +
  # overlay BH-FDR sig in red
  geom_point(data = df_plot %>% filter(pval_fdr_sig),
             color = "#D62728", size = point_size + 1, alpha = 1) +
  geom_hline(yintercept = bonf_y, linetype = "dashed") +
  scale_x_continuous(
    breaks = chr_labels$x_center,
    labels = chr_labels$chr,
    expand = expansion(mult = c(0.01, 0.01))
  ) +
  labs(
    title = "Manhattan plot (PCangsd selection scan)",
    subtitle = paste0(
      "n = ", scales::comma(n_snps),
      " | Bonferroni (dashed line) @ ", alpha_bonf, " (y = ", signif(bonf_y, 3), ")",
      " | BH FDR (red) q = ", alpha_fdr,
      " | λ = ", signif(lambda, 3)
    ),
    x = "Chromosome",
    y = expression(-log[10](p))
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  )
p_manhattan

ggsave(paste0(output_prefix, "_manhattan.png"), p_manhattan, width = 12, height = 6, dpi = 200)




# ------------------------------- QQ PLOT (GG) -----------------------------------
# Expected χ²(1) quantiles; use ppoints for better tails
n <- nrow(df)
exp_chi <- qchisq(ppoints(n), df = 1)

qq_df <- tibble(
  expected = sort(exp_chi),
  observed = sort(df$stat)
)

p_qq <- ggplot(qq_df, aes(x = expected, y = observed)) +
  geom_point(size = 0.3, alpha = 0.6) +
  geom_abline(slope = 1, intercept = 0, color = "red") +
  annotate("text", x = Inf, y = -Inf, label = paste0("λ = ", signif(lambda, 3)),
           hjust = 1.1, vjust = -0.8) +
  labs(
    title = "QQ plot of selection χ² statistics",
    x = "Expected χ²(1)",
    y = "Observed χ²(1)"
  ) +
  theme_minimal(base_size = 12)
p_qq

ggsave(paste0(output_prefix, "_qq.png"), p_qq, width = 6, height = 6, dpi = 200)

# ------------------------------ OUTPUT TABLES -----------------------------------
# Full results (compress with gz if very large)
out_tbl <- df %>%
  select(chr, pos, stat, pval, logp, pval_fdr, pval_bonf_sig, pval_fdr_sig)

# probably too big for github to track
# vroom::vroom_write(out_tbl, paste0(output_prefix, "_results.tsv.gz"), delim = "\t")

sig_tbl <- out_tbl %>%
  filter(pval_bonf_sig | pval_fdr_sig) %>%
  arrange(pval)

vroom::vroom_write(sig_tbl, paste0(output_prefix, "_significant.tsv"), delim = "\t")

message("Done. Files written with prefix: ", output_prefix)
message("  - Manhattan:   ", output_prefix, "_manhattan.png")
message("  - QQ plot:     ", output_prefix, "_qq.png")
message("  - Results TSV: ", output_prefix, "_results.tsv")
message("  - Sig TSV:     ", output_prefix, "_significant.tsv")
    
