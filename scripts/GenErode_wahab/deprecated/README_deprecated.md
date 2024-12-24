## Running GenErode on Wahab

[GenErode](https://github.com/NBISweden/GenErode/) is a pipeline for quantifying genetic erosion using temporal genomic samples.

It can estimate changes in genome-wide heterozygosity and deleterious variants as well as identify runs of homozygosity (inbreeding).

It can also do some auxiliary tasks that will be useful for PIRE such as estimate post-mortem damage (using MapDamage), identify contamination by mapping to a mitochondrial reference panel, and calculate GERP scores using a set of outgroup genomes and a dated phylogenetic tree.

A road map for using GenErode on Wahab is included below.

### Set up your analysis folder

Make a copy of the template folder, renaming it according to your species name.

```
cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/GenErode_templatedir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/<speciesname>/GenErode_<speciesname>
```

You can make a README.md file to track your work within this directory.

Make directories within this directory to hold your config file, historical, modern, and reference genome. If you are going to be calculating GERP scores or mapping to a mitochondrial reference panel make folders for those files too.

```
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/<speciesname>/GenErode_<speciesname>/config
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/<speciesname>/GenErode_<speciesname>/historical
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/<speciesname>/GenErode_<speciesname>/modern
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/<speciesname>/GenErode_<speciesname>/reference
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/<speciesname>/GenErode_<speciesname>/gerp_outgroups
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/<speciesname>/GenErode_<speciesname>/mitochondria
```

All sequencing data and reference genomes have to be within the main analysis directory. Copy those to the appropriate subdirectories.

There are mitochondrial genomes for some potentially common contaminants (human, mouse, etc.) in the 'data' folder within the template. You can add those to the 'mitochondria' folder if you like, but we will also be adding mitochondrial references from our PIRE species to see if we have cross-contamination. 

### Edit the config files

Template config files are located in `home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/config`.

Currently these are the files used to conduct the white rhino reference test run.

Edit the config.yaml files to reflect the analyses you want to conduct in GenErode.

Edit the `*historical_samples.txt` and `*modern_samples.txt` files to reflect your sample information.

### Run the pipeline

Copy `home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/GenErode_Wahab/run_GenErode.sbatch` to your analysis folder.

Move to this folder and run with `sbatch run_GenErode.sbatch`.

Easy!!
