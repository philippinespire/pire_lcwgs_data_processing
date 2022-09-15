# ngsLD
## a program that estimates pairwise linkage disequilibrium (LD) taking the uncertainty of genotype's assignation into account. It does so by avoiding genotype calling and using genotype likelihoods or posterior probabilities.

---

# Convert ngsLD out to SNeP input

bash code snippets

```
for i in $(ls Sfa*CHR??.beagle.ld); do
cat <(echo -e "CHR\tdist (bp)\tr2") \
<(cat $i | tr ":" "\t" | cut -f1,9-10 | grep -v 'nan') > \
$i.snep_in
done
```

# Subsample LD Output Files for Linkage decay figs

bash code snippets

```
# supposed to be faster, but only a proportion of all lines can be specified
perl -ne 'print if (rand() < .0001)' Sfa-CBas_only_final_fltrd_CHR01.beagle.ld > Sfa-CBas_only_final_fltrd_CHR01_0.01pct.beagle.ld

# a little slower, but should return about 10000 lines every time
awk -v n="$(wc -l Sfa-CBas_only_final_fltrd_CHR01.beagle.ld)" -v p=10000 'BEGIN {srand()} rand() * n-- < p {p--; print}' Sfa-CBas_only_final_fltrd_CHR01.beagle.ld > Sfa-CBas_only_final_fltrd_CHR01_10000.beagle.ld

# do alot of files
for i in $(ls Sfa-[AC]Bas_only_final_fltrd_maf0*.beagle.ld ); do
ldFile=$(echo $i | sed "s/\.ld//")
grep -v "nan" $ldFile.ld > $ldFile.noNaN.ld
awk -v n="$(wc -l $ldFile.noNaN.ld)" -v p=10000 'BEGIN {srand()} rand() * n-- < p {p--; print}' $ldFile.noNaN.ld > $ldFile.noNaN.10000.ld
done
```

---

# Visualize Linkage Decay

r code 

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

### a. plotting Linkage Blocks using script `LD_blocks.sh` and R.

Linkage Disequilibrium blocks are sometimes referred to as haplotype blocks, and they refer to regions in an organims genome that show little evidence of historical genetic recombination (containing only a small number of distinct haplotypes.)

We started by modifying & running the `LD_blocks.sh` script from [/fgvieira/ngsLD/](https://github.com/fgvieira/ngsLD/blob/master/scripts/LD_blocks.sh)

Before the script will run, you'll need to run the following code:
```bash
Done on USER@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/ngsLD
salloc #move to a compute node
enable_lmod
module load container_env ngsTools
crun R
```

Note: if you run into the issue of R not loading, try using the long form of the crun command to send your command to the intended container. In this case, you'd use `crun.ngsTools R`. 


Once in R:

```R
install.packages("gtools")
install.packages("reshape2")
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("snpStats")
Install.packages(“LDheatmap”)
```

Exit R

We found that running it this way `cat Sfa-CBas_only_final_fltrd_maf0.05_CHR04.beagle.ld | bash ../scripts/LD_blocks.sh CHR04 5000 200000` , as shown in the [/fgvieira/ngsLD/](https://github.com/fgvieira/ngsLD/blob/master/scripts/LD_blocks.sh) guide, led to no SNPs being found. Instead of piping the data in, we edited the script to call it in at the command line. This was the code that we ran:

Note: Check that your script is running properly by checking the tmp file being output during the analysis. Use this code `ls -l /tmp/*LD_blocks` while in the ngsLD dir and look at file size. 

```bash
Done on USER@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/ngsLD
#you should still be on a compute node, if not, salloc
bash
export SINGULARITY_BIND=/home/e1garcia
crun bash ../scripts/LD_blocks.sh CHR04 0 100000000 Sfa-CBas_only_final_fltrd_maf0.05_CHR04.beagle.ld #we opened up the range to maximize snps captured, may change
ls -l /tmp/*blocks #to check files
```

Now, another (faster) way to do this was cooked up by Dr. Bird. Instead of running the R stuff with the bash stuff, just run the following code and then 
crun R and run the Rscript lines line by line. (path to tmp file needed to read in data to R on the hpc).

```bash
#CHR04 - Contemp.
cat <(echo -e "snp1\tsnp2\tdist\tr2p\tD\tDp\tr2") <(cut -f 1,4,7-11 Sfa-CBas_only_final_fltrd_maf0.05_CHR04.beagle.ld) > /tmp/chr04.LD_blocks
#CHR01 - Contemp.
cat <(echo -e "snp1\tsnp2\tdist\tr2p\tD\tDp\tr2") <(cut -f 1,4,7-11 Sfa-CBas_only_final_fltrd_maf0.05_CHR01.beagle.ld) > /tmp/chr01.LD_blocks
#CHR04 - Alb.
cat <(echo -e "snp1\tsnp2\tdist\tr2p\tD\tDp\tr2") <(cut -f 1,4,7-11 Sfa-ABas_only_final_fltrd_maf0.05_CHR04.beagle.ld) > /tmp/Alb_chr04.LD_blocks
#CHR01 - Alb.
cat <(echo -e "snp1\tsnp2\tdist\tr2p\tD\tDp\tr2") <(cut -f 1,4,7-11 Sfa-ABas_only_final_fltrd_maf0.05_CHR01.beagle.ld) > /tmp/Alb_chr01.LD_blocks
```

Note: use the `screen` command before your code to run the job offline.
