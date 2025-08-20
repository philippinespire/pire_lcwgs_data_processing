##PCAngsd Admixture Results##

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#### User Defined Variables ####

qfile_path   <- "angsd_admix_notrans.admix.2.Q"
bamlist_path <- "bam_list_all.txt"
qfilek3_path <- "angsd_admix_notrans_k3.admix.3.Q"

#### Packages ####
library(tidyverse)

#### #####

# Read Q and bam list


wrangle_data <-
  function(
    qfile_path,
    bamlist_path
    ){
    Q <- as.matrix(read.table(qfile_path, header = FALSE))
    samps <- readLines(bamlist_path)
    samps <- basename(samps)
    
    # Basic sanity check
    stopifnot(nrow(Q) == length(samps))
    
    # Build grouping labels from sample IDs
    # Assumes Historical start with "OchA", Contemporary with "OchC"
    era <- ifelse(grepl("^OchA", samps), "Historical", "Contemporary")
    
    # Optional: extract a location tag like Bur/Cat/Tum/Can
    loc <- sub("^Och[AC]([A-Za-z]+).*", "\\1", samps)
    
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

data_admix <- wrangle_data(qfile_path, bamlist_path)
data_admix_k3 <- wrangle_data(qfilek3_path, bamlist_path)

ggplot(data_admix, aes(x = Sample, y = Prop, fill = Cluster)) +
  geom_bar(stat = "identity", width = 1) +
  facet_grid(~ era + location, scales = "free_x", space = "free_x") +
  theme_classic() + theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    panel.spacing = unit(0.3, "lines")
  ) +
  ylab("Admixture proportion") + xlab(NULL)

ggsave(
  str_c(
    qfile_path,
    ".png"
  )
)

ggplot(data_admix_k3, aes(x = Sample, y = Prop, fill = Cluster)) +
  geom_bar(stat = "identity", width = 1) +
  facet_grid(~ era + location, scales = "free_x", space = "free_x") +
  theme_classic() + theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    panel.spacing = unit(0.3, "lines")
  ) +
  ylab("Admixture proportion") + xlab(NULL)

ggsave(
  str_c(
    qfilek3_path,
    ".png"
  )
)
