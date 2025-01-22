## Running ANGSD on lcwgs datasets

[ANGSD](https://www.popgen.dk/angsd/index.php/ANGSD) is a software package that can calculate genotype likelihoods from mapped lcwgs data. Along with accessory packages such as [pcangsd](https://www.popgen.dk/software/index.php/PCAngsd) and [realSFS](https://www.popgen.dk/angsd/index.php/RealSFS), ANGSD can be used to perform a number of useful analyses, including estimating population structure, genetic divergence, genetic diversity, and loci potentially under selection.

Currently, we are using scripts adapted by Kyra Fitz from the Therkildsen Lab's [GitHub](https://github.com/therkildsen-lab) to perform analyses in ANGSD. These scripts were originally used for Kyra's *Taeniamia zosterophora* [project](https://github.com/philippinespire/pire_taeniamia_zosterophora_lcwgs) and extended to selection analyses and windowed PCA in *Salarias fasciatus* [here](https://github.com/philippinespire/pire_salarias_fasciatus_lcwgs) by Brendan and Mikaela.

This code runs through conducting a selection analysis on Salarias fasciatus and is split into the following sections: 
  1) Combining sequencing runs
  2) SNP calling
  3) Generating genotype likelihoods and making a beagle.gz file
  4) Running PCANGSD: PCA and Admixture Analyses
  5) (Optional) Running PCANGSD: Selection Scan
  6) (Optional) Running winPCA to detect chromosome inversions
  7) Generating Site Allele Frequencies
  8) Calculating FST across the whole genome

## 1. Create an analysis folder and compile .bam files.

Create a folder with an appropriate name (e.g. `angsd_analysis`) within your species' lcwgs processing directory. Copy .bam files to be analyzed to this folder.

You should be using the final GenErode outputs for ANGSD analysis. For Albatross/historical samples these are the `.merged.rmdup.merged.realn.rescaled.bam` files that have been rescaled to account for historic DNA damage. For contemporary files these are the `.merged.rmdup.merged.realn.bam` files.

Ideally you have run GenErode on data across lanes from all individuals, in which case information for each individual will already be merged into one file. If you need to add information from another run or otherwise merge multiple .bam files from the same set of individual, you can use the merge scripts as described in the lcwgs_processing README. The Sfa repo also has an example of a more complicated merge (3 runs).

## 2. SNP calling

An initial SNP calling step is used to identify set of SNPs with a reasonable depth that can be assessed across the historic and contemporary samples.

First make a list of all .bam files from the historical and modern specimens.

```
ls *.bam > bam_list_all.txt
  #Puts all the .bam files as a list into a text file 
```

Generate an index for all .bam files, which will provide a supplementary index file (.bai) for each .bam file. 

```
salloc 

module load samtools

crun samtools index -M *.bam
```

Copy the snp_calling.sbatch script (https://github.com/philippinespire/pire_taeniamia_zosterophora_lcwgs/blob/main/snp_calling.sbatch) into a new .sbatch file, and adjust the script to fit your data. 
- Minimum depth filter should be 1x the number of individuals.
- Minimum individual filter should be half of the total number of individuals.
- Maximum depth filter should be 15x the number of individuals.
- Parameters that stayed the same from the original script are a map quality filter of 30, a minimum allele frequency filter of 0.001, and a SNP p-value of 10-6. 

```
vi snp_calling.sbatch
#Makes a new file called snp_calling.sbatch in the angsd_analysis folder. Paste Kyra's snp_calling.sbatch script into this file. Edits are the following: 
  #Make sure you add the full directory pathway to the .bam text file after -b, so that the server can find the file (-b /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/bam_list_all.txt).
  #After -b line, add '_fullpath' as part of the name for the bam_list.txt file (bam_list_all_fullpath.txt)
  #Make sure you change the pathway after -ref to the correct reference genome of Salarias fasciatus   (/archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/1st_sequencing_run/GenErode_Sfa_full/reference/GCF_902148845.1_fSalaFa1.1_chr1-23_rename.fna). 

sbatch snp_calling.sbatch /archive/carpenterlab/pire/[your_species_dir]/angsd_analysis/
  #Submits to the Wahab cluster, specifying the directory of the output to the 'angsd_analysis' folder.
```
## 3. Generating genotype likelihoods and making a beagle.gz file 

Genotype likelihoods will be used for all downstream analyses (PCA, admixture, estimating diversity, FST, and selection).

Use the get_beagle.sbatch file to generate a .beagle.gz file containing genotype likelihoods for the set of SNPs identified in step 2. 

```
vi get_beagle.sbatch
#Makes a new file named 'get_beagle.sbatch' in the angsd_analysis folder. Paste Kyra's get_beagle.sbatch script into this file. Edits include the following: 
  #Make sure you change the pathway after -anc to the correct reference genome of Salarias fasciatus (-anc /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/1st_sequencing_run/GenErode_Sfa_full/reference/GCF_902148845.1_fSalaFa1.1_chr1-23_rename.fna). 
  #Change the list of chromosomes file after -rf to match our output (-rf global_snp_list_depth1_15_notrans.chrs).

sbatch get_beagle.sbatch /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/

```

## 4. Running PCANGSD: 

Copy Kyra Fitz's pcangsd_pca.sbatch script (https://github.com/philippinespire/pire_taeniamia_zosterophora_lcwgs/blob/main/pcangsd_pca.sbatch) and pcangsd_admix.sbatch (https://github.com/philippinespire/pire_taeniamia_zosterophora_lcwgs/blob/main/pcangsd_admix.sbatch) into new .sbatch files, and adjust the script to fit the *Salarias fasciatus* data. We will be using the beagle.gz file *without inversions and without outliers* (angsd_depth1_15_notrans_noinv_subset.beagle.gz) from here on out, but the steps are the exact same if you use the beagle.gz file with the inversions (angsd_depth1_15_notrans.beagle.gz) or just without the inversions (angsd_depth1_15_notrans_noinv.beagle.gz).

```
vi pcangsd_pca.sbatch
#Makes a new file named 'pcangsd_pca_it500_noinv_subset.sbatch' in the angsd_analysis folder to indicate a file with 500 iterations and no inversions. Paste Kyra's pcangsd_pca.sbatch script into this file. Edits include the following:
  #Add another argument called "--it 500" to specify 500 iterations.
  #Change the output file to "--out angsd_notrans_snps_pca_it500_noinv_subset"
  #Change the input file to "--b angsd_depth1_15_notrans_noinv_subset.beagle.gz" to have the genotype likelihood file with no inversions and no outliers.

vi pcangsd_admix.sbatch
#Makes a new file named 'pcangsd_admix_it500_noinv_subset.sbatch' in the angsd_analysis folder to indicate a file with 500 iterations and no inversions. Paste Kyra's pcangsd_pca.sbatch script into this file. Edits include the following:
  #Add another argument called "--it 500" to specify 500 iterations.
  #Change the output file to "--out angsd_notrans_snps_pca_it500_noinv_subset"
  #Change the input file to "--b angsd_depth1_15_notrans_noinv_subset.beagle.gz" to have the genotype likelihood file with no inversions and no outliers.
```

Submit jobs to the Wahab cluster, specifying the directory.

```
sbatch pcangsd_pca_it500_noinv_subset.sbatch /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/

sbatch pcangsd_admix_it500_noinv_subset.sbatch /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/
```

Once the job is done, download the angsd_analysis/angsd_notrans_snps_pca_it500_noinv_subset.cov, bam_list_all_subset.txt, and angsd_admix_notrans_it500_noinv_subset.admix.2.Q files. These are needed to run the admixture.R and pca.R files. 

```
scp m1salvad@wahab.hpc.odu.edu:/archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/angsd_notrans_snps_pca_it500_noinv_subset.cov C:\Users\salva\Downloads\Sfa_angsd_analysis

scp m1salvad@wahab.hpc.odu.edu:/archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/bam_list_all_subset.txt C:\Users\salva\Downloads\Sfa_angsd_analysis

scp m1salvad@wahab.hpc.odu.edu:/archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/angsd_admix_notrans_it500_noinv_subset.admix.2.Q C:\Users\salva\Downloads\Sfa_angsd_analysis
```

Run admixture.R and pca.R files in RStudio to get two plots: 1) admixture proportions and 2) PCA for historical and contemporary individuals. Run the admixture.R plot before the pca.R files. 

--> Once you have run admixture and PCA, if you have individual outliers or evidence of inversions (a "three-stripe" pattern in the PCA) you may want to revisit step #3, removing outlier individuals and/or chromosomes containing inversions (identifiable by running separate PCAs for each chromosome). WinPCA (step #6, still in development) can also help to pinpoint inverted regions.

## 5. (Optional) Running PCANGSD for a Selection Scan

If the PCA identifies the historical and contemporary samples as two separate clusters along PC1, you can use PCANGSD to perform a selection scan.

Make a copy of the pcangsd_pca_it500_noinv_subset.sbatch and pcangsd_selection_it500_noinv_subset.sbatch. Edit the sbatch script to run the selection scan. 

```
cp pcangsd_pca_it500_noinv_subset.sbatch pcangsd_selection_it500_noinv_subset.sbatch

vi pcangsd_selection_it500_noinv_subset.sbatch
#Make sure to change the #SBATCH --job-name to "#SBATCH --job-name=pcangsd_selection" to reflect that it's for the selection scan and not for PCA.
#Make sure to change the #SBATCH --o to "SBATCH -o pcangsd_selection-%j.out."
#Add the following lines after the –out angsd_notrans_snps_selection_it500_noinv_subset: "--selection --sites_save"
```

Submit the job to the Wahab cluster, specifying the directory. 
```
sbatch pcangsd_selection_it500_noinv_subset.sbatch /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/
```
After the job runs, download the following outputs to your personal directory. 
- angsd_notrans_snps_selection_it500_noinv_subset.selection
- global_snp_list_depth1_15_notrans.regions
- angsd_notrans_snps_selection_it500_noinv_subset.sites

```
scp m1salvad@wahab.hpc.odu.edu:/archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/angsd_notrans_snps_selection_it500_noinv_subset.selection C:\Users\salva\Downloads\Sfa_angsd_analysis

scp m1salvad@wahab.hpc.odu.edu:/archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/global_snp_list_depth1_15_notrans.regions C:\Users\salva\Downloads\Sfa_angsd_analysis

scp m1salvad@wahab.hpc.odu.edu:/archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/angsd_notrans_snps_selection_it500_noinv_subset.sites C:\Users\salva\Downloads\Sfa_angsd_analysis
```

Run pcangsd_selection_plot_v2.R in RStudio to generate a Manhattan plot and look at SNPs potentially under selection. 

## 6. (Optional) Running winPCA to detect chromosome inversions (still in testing on Wahab)

Make sure to install any Python packagedependencies needed for winPCA. 
```
mamba install numpy pandas numba scikit-allel plotly
```

Run salloc. Unlike sbatch, which submits a batch job script for later execution, salloc allocates resources immediately and starts an interactive shell session within the allocation. This is useful for testing, debugging, or running commands interactively on a compute node. 

```
salloc
```
Make a list of unique chromosome names (or identifiers) from the beagle file. Save this to a file named ncbi_chromnames.
```
gunzip -c angsd_depth_1_15_notrans.beagle.gz | ‘ awk { print $1 } ‘ | cut -c 1-11 | uniq > ncbi_chromnames
#extracts unique chromosome names (or identifiers) from the beagle file by printing the first field of the file (chromosome name), the first 11 characters of that field, and prints it to ncbi_chromnames file
```

Create a new beagle.gz file with the inversions using sed command to make the format compliant with running winPCA. Make sure to use the original beagle.gz file that does include inversions (angsd_depth_1_15_notrans.beagle.gz). Instead of our chromosome names being like NC_043745.1_651, they should be listed as chr1_SNPmarker#. In Excel, paste unique chromosome names into one column, and a list of the necessary chromosome names (chr1, chr2, chr3 …) in another column. This is needed for your sed file. Copy these two columns into a new file in the command line named sedfile. 
```
vi sedfile 
#Make sure to paste your two columns

gunzip - c angsd_depth_1_15_notrans.beagle.gz  | sed -f sedfile > angsd_depth_1_15_notrans_renamed.beagle.gz
#compresses a .gz file, applies sed transformations, and creates a new .beagle file with the modifications.

gunzip -c angsd_depth1_15_notrans_renamed.beagle.gz | less
#view format of new beagle file to check that it is the same as the format used for winPCA.
```

Try running winPCA on the fourth chromosome since we know this chromosome has inversions. 
```
module load ngsTools/2024

crun.ngsTools winpca pca angsd_depth_1_15_notrans_renamed.beagle.gz chr4:1-27169852 chr4
#Chr4:27169852 is chromosome name and size
#1- is the size of the windows analysis 
```

## 7. Generating Site Allele Frequencies

Make two bam lists: one with only Albatross individuals (ABas) and one with only contemporary individuals (CBas). Use the subsetted bam list because it excludes outlier individuals. 

```
grep "CBas" bam_list_all_subset.txt > bam_list_all_subset_CBas.txt
grep "ABas" bam_list_all_subset.txt > bam_list_all_subset_ABas.txt
```

Copy Kyra Fitz's saf_beagle_maf.sbatch script (https://github.com/philippinespire/pire_taeniamia_zosterophora_lcwgs/blob/main/saf_beagle_maf.sbatch) into two new .sbatch files (saf_beagle_maf_ABas.sbatch for Albatross saf_beagle_maf_CBas.sbatch for contemporary), and adjust the script to fit the *Salarias fasciatus* data.

```
vi saf_beagle_maf_CBas.sbatch
#Make sure to change the input of the bam list to the contemporary .bam list that excludes outlier individuals to "-b -b bam_list_all_subset_CBas.txt)"
#Make sure to change the ancestral state to the reference genome of *Salarias fasciatus* since we don't know the ancestral states: "-anc /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/1st_sequencing_run/GenErode_Sfa_full/reference/GCF_902148845.1_fSalaFa1.1_chr1-23_rename.fna \"
#Make sure to change the reference genome to the reference genome of *Salarias fasciatus*: "-ref /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/1st_sequencing_run/GenErode_Sfa_full/reference/GCF_902148845.1_fSalaFa1.1_chr1-23_rename.fna \"
##Make sure to change the output to indicate contemporary sites "-out cbas_sites_notrans"
#Make sure to change the sites for the SNP list to "-sites global_snp_list_depth1_15_notrans.txt"
#Make sure to change -rf to the right chromosomes "-rf global_snp_list_depth1_15_notrans.chrs"



vi saf_beagle_maf_ABas.sbatch
#Make sure to change the input of the bam list to the Albatross .bam list that excludes outlier individuals to "-b -b bam_list_all_subset_ABas.txt)" 
#Make sure to change the ancestral state to the reference genome of *Salarias fasciatus* since we don't know the ancestral states: "-anc /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/1st_sequencing_run/GenErode_Sfa_full/reference/GCF_902148845.1_fSalaFa1.1_chr1-23_rename.fna \"
#Make sure to change the reference genome to the reference genome of *Salarias fasciatus*: "-ref /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/1st_sequencing_run/GenErode_Sfa_full/reference/GCF_902148845.1_fSalaFa1.1_chr1-23_rename.fna \"
#Make sure to change the output to indicate Albatross sites "-out abas_sites_notrans"
#Make sure to change the sites for the SNP list to "-sites global_snp_list_depth1_15_notrans.txt"
#Make sure to change -rf to the right chromosomes "-rf global_snp_list_depth1_15_notrans.chrs"
```

Submit .sbatch scripts to the Wahab cluster specifying the directory. The outputs should be the following.
For the historical population (Albatross - abas): 
- abas_sites_notrans.arg
- abas_sites_notrans.beagle.gz
- abas_sites_notrans.depthGlobal
- abas_sites_notrans.depthSample
- abas_sites_notrans.mafs.gz
- abas_sites_notrans.pos.gz
- abas_sites_notrans.saf.gz
- abas_sites_notrans.saf.idx
- abas_sites_notrans.saf.pos.gz

For the contemporary population (cbas):
- cbas_sites_notrans.arg
- cbas_sites_notrans.beagle.gz
- cbas_sites_notrans.depthGlobal
- cbas_sites_notrans.depthSample
- cbas_sites_notrans.mafs.gz
- cbas_sites_notrans.pos.gz
- cbas_sites_notrans.saf.gz
- cbas_sites_notrans.saf.idx

```
sbatch saf_beagle_maf_CBas.sbatch /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/

sbatch saf_beagle_maf_ABas.sbatch /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/
```

## 8. Calculating FST across the whole genome

Copy Kyra Fitz's fst.sbatch script (https://github.com/philippinespire/pire_taeniamia_zosterophora_lcwgs/blob/main/fst.sbatch) into a new .sbatch file (fst.sbatch) within our angsd_analysis directory, and adjust the script to fit the *Salarias fasciatus* data. It will be using .saf.idx files from Step 7's outputs.

```
vi fst.sbatch
#Make sure to first paste Kyra’s script
#Make sure to change the SAF directory into our angsd_analysis folder: SAFDIR=${1:-/archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/}
#Make sure to change population 1 to "abas_sites_notrans"
#Make sure to change population 2 to "cbas_sites_notrans"
```

Submit the job to the Wahab cluster. Since the script already specifies the directory for the output, you do not have to specify the directory when submitting the job. The output should be angsd_fst-######.out. 
```
sbatch fst.sbatch
```
