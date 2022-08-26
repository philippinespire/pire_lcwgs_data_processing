# SNeP 
## A tool to determine trends in recent effective population size trajectories using genome-wide SNP data.

---

Before getting started, view these Helpful Links (highly recommended):
[SNeP Source Code](https://sourceforge.net/projects/snepnetrends/)
[SNeP Manual](https://sourceforge.net/projects/snepnetrends/files/SNeP_Manual1.1.pdf/download)
[SNeP Manuscript](https://www.frontiersin.org/articles/10.3389/fgene.2015.00109/full) 

---

Note:

SNeP paper discusses the r2 measure of LD, where r2 is the square of the correlation coefficient in allelic states at the two loci. In ngsLD, the first column of LD data (termed "pearson correlation between expected genotypes") is this r2 measure and should be used as the LD input to SNeP.

SNeP paper also emphasizes that methodology used to estimate r2 will affect it's Ne inferences

---

# SETTINGS

* `-threads` defaults to one, so make sure you change this 

* `-maxsnps` defaults to 100000 per chromosome.  We are not in danger of exceeding this, but good to remember.

## Recombination

* `-recrate` defaults to 1e-8.  The recombination rate is used to calibrate the distance between loci (the bins) and generations. We will want to obtain the most accurate and relevant recombination rate possible for the species

* there are several recombination rate modifiers that one might want to investigate

---
## Time and Time Bins

* `-mindist` and `-maxdist` will control the number of generations inferred. They default to 50,000 and 4,000,000.  This is why you obtained the generations  you did

* `-binwidth` controls the number of generations between Ne estimates and defaults to 50,000.  Units here are bp, not time.

* `-numBINS` is the number of time points at which to estimate Ne and defaults to 30

* `-expB` refers to the exponent x in eqs 6 in the SNeP pub and 2 in the SNeP manual and defaults to 3.
  * "When x equals 1, the distribution of distances between the bins is linear and each bin has the same distance range. For larger values of x the distribution of distances changes allowing a larger range on the last bins and a smaller range on the first bins. Varying this parameter allows the user to have a sufficient number of pairwise comparisons to contribute to the final Ne estimate for each bin." 

* `itemsTH` the minimum number of LD values (1 per pair of snps)  for a bin to be included in the final Ne estimates, defaults to 500

* `-minr2` and `-maxr2` the min and max LD (r2) to use in estimates of Ne, defaults are 0 and 1

---

## Other Important Settings

* `-maf` minimum allele frequency cutoff defaults to 0.05.  The paper says this value can have an impact on results.  I don't think it can affect us here because we don't give SNeP any information on allele frequencies, however, we do a maf filter when we make the glf file from scratch (_noSites).  We could reasonably expect different results from LD values obtained from the different GLF scripts.  Hopefully not, but if we do, this could be one of the reasons why.  
  * Realize that depending on how many individuals there are, the maf filter value may need to change.  maf = 0.05 means 1/20.  if we have 32 individuals, then 4/64 and higher are kept and <=3/64 are tossed.  Versus 82 individuals where 9/164 are kept and <=8/164 are tossed.  Given that we set minind to 20, that's 40 alleles, 2/40 is the cutoff to keep or toss a locus. I think a good rule of thumb is that if the number of snps shoots up for a population filtered independently vs the whole data set, then maf should probably be raised.  Even better would be to go through the filter evaluation script in R for each data set that is produced by being filtered from scratch, rather than using a list of preapproved snps.


* we can tell snep which chromosomes to use.  it might be useful to run it for each chromosome in each era
`-chr`

---

#Usage:
Input LD file must have the following tab delimited header:
`CHR dist(bp) r2`

1. Chromosome in which the SNP pair resides.
2. Distance between the SNPs in base pairs.
3. Linkage disequilibrium value.





---

Other Notes:

Limitations on Ne estimates with respect to time (c = recombination rate):
"As already suggested by other authors, the reliability of the quantitative estimates obtained with this method must be taken with caution, especially for Ne values related to the most recent and the oldest generations (Corbin et al., 2012) because for recent generations, large values of c are involved, not fitting the theoretical implications that Hayes proposed to estimate a variable Ne over time (Hayes et al., 2003). Estimates for the oldest generations might also be unreliable as coalescent theory shows that no SNP can be reliably sampled after 4Ne generations in the past (Corbin et al., 2012). Further, Ne estimates, and especially those related to generations further in the past, are strongly affected by data manipulation factors, such as the choice of MAF and alpha values. Additionally, the binning strategy applied can interfere with the general precision of the method, for example where an insufficient number of pairwise comparisons are used to populate each bin."

Binning:
binning refers to which snps should be compared with which other SNPs in terms of LD. the bins are defined by the distance between SNPs. This is a way of estimating LD for different "times" in the past. larger distances = more recent generations; smaller distances = more distant generations
