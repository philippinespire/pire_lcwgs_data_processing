## Running ATLAS to recalibrate base quality using postmortem damge and GERP scores

Once GERP scores are obtained from GenErode, ATLAS can be used to recalibrate base quality scores and calculate individual genetic diversity and genotype likelihoods.

Recommended to first run the 'recal_theta' script to calculate postmortem damage, recalibrate base quality, and estimate individual genetic diversity.

Run norecal_theta to calculate genetic diversity without correcting for errors as a comparison.

Run recal_QC scripts to conduct quality control on the recalibration.

Run the glf scripts to calculate likelihoods with recalibration.

Pairwise genetic distances for PCA can be estimated in ATLAS, but this seems to take a long time (5 pairs/day for Salarias = > 1 year!!).

Probably faster to calculate major/minor frequencies and construct BEAGLE files for use in [PC]ANGSD.