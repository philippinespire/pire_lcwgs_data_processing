# ngsLD
## a program that estimates pairwise linkage disequilibrium (LD) taking the uncertainty of genotype's assignation into account. It does so by avoiding genotype calling and using genotype likelihoods or posterior probabilities.

---

# Convert ngsLD out to SNeP input
```
for i in $(ls Sfa*CHR??.beagle.ld); do
cat <(echo -e "CHR\tdist (bp)\tr2") \
<(cat $i | tr ":" "\t" | cut -f1,9-10 | grep -v 'nan') > \
$i.snep_in
done
```

# Subsample LD Output Files for Linkage decay figs

```
# supposed to be faster, but only a proportion of all lines can be specified
perl -ne 'print if (rand() < .0001)' Sfa-CBas_only_final_fltrd_CHR01.beagle.ld > Sfa-CBas_only_final_fltrd_CHR01_0.01pct.beagle.ld

# a little slower, but should return about 10000 lines every time
awk -v n="$(wc -l Sfa-CBas_only_final_fltrd_CHR01.beagle.ld)" -v p=10000 'BEGIN {srand()} rand() * n-- < p {p--; print}' Sfa-CBas_only_final_fltrd_CHR01.beagle.ld > Sfa-CBas_only_final_fltrd_CHR01_10000.beagle.ld
```

---

# Visualize Linkage Decay

```r
#### INITIALIZATION ####
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)


#### USER DEFINED VARIABLES ####
InFilePath1 = "Sfa-CBas_only_final_fltrd_CHR01_minMaf0.1.beagle.ld"
InFilePath1 = "Sfa-CBas_only_final_fltrd_CHR01_0.01pct.beagle.ld"
InFilePath1 = "Sfa-CBas_only_final_fltrd_CHR01_0.001pct.beagle.ld"

#### WRANGLE DATA ####
data <-
  read_tsv(InFilePath1,
           col_names = FALSE) %>%
  rename(distance_bp = X7,
         r2_pearson = X8,
         D = X9,
         D_prime = X10,
         r2 = X11) %>%
  pivot_longer(cols = r2_pearson:r2,
               names_to = "metric")

#### VISUALIZE RESULTS ####

data %>%
  ggplot(aes(x=distance_bp,
             y=value,
             color = metric)) +
  geom_point() +
  geom_smooth(color="black") +
  facet_wrap(.~metric,
             scales = "free_y")
```

