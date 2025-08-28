## Running ANGSD on lcwgs datasets

[ANGSD](https://www.popgen.dk/angsd/index.php/ANGSD) is a software package that can calculate genotype likelihoods from mapped lcwgs data. Along with accessory packages such as [pcangsd](https://www.popgen.dk/software/index.php/PCAngsd) and [realSFS](https://www.popgen.dk/angsd/index.php/RealSFS), ANGSD can be used to perform a number of useful analyses, including estimating population structure, genetic divergence, genetic diversity, and loci potentially under selection.

Currently, we are using scripts adapted by Kyra Fitz from the Therkildsen Lab's [GitHub](https://github.com/therkildsen-lab) to perform analyses in ANGSD. These scripts were originally used for Kyra's *Taeniamia zosterophora* [project](https://github.com/philippinespire/pire_taeniamia_zosterophora_lcwgs) and extended to selection analyses and windowed PCA in *Salarias fasciatus* [here](https://github.com/philippinespire/pire_salarias_fasciatus_lcwgs) by Brendan and Mikaela. Some scripts were also adapted by Jem from analyzing *Sphaeramia nematoptera, Dascyllus aruanus, Pseudanthias squamipinnis, Parupeneus barberinus*, and *Pomacentrus brachialis* as some species may have 1 or 3 sites.

Outline of ANGSD pipeline and potential analyses: 
  0) Create an analysis folder and compile .bam files
  1) SNP calling
  2) Generating genotype likelihoods and making a beagle.gz file
  3) Running PCANGSD: PCA and Admixture Analyses
      3a) (Optional) Running PCANGSD: Selection Scan
      3b) (Optional) Running winPCA to detect chromosome inversions
  4) Generating Site Allele Frequencies
  5) Calculating FST across the whole genome
  6) Generate site frequency spectra for each site/era
  7) Calculate per-site thetas
  8) Calculate neutrality test statistics
  9) Estimating Effective Population Size (Ne)
  10) Genetic Diversity (Pi, theta, Tajima's D)
  11) Selection scan for neutral SNPS

Draft ANGSD pipeline roadmap (needs to be updated)
![PIREANGSD03202025](https://github.com/user-attachments/assets/dea17456-78be-403b-9219-0ded9ac50056)

<details><summary> 0. Create an analysis folder and compile .bam files</summary>
<p>
  
## 0. Create an analysis folder and compile .bam files

Create a folder with an appropriate name (e.g. `angsd_analysis`) within your species' lcwgs processing directory. Copy .bam files to be analyzed to this folder.

```
cd <your species folder>
  #navigate to your species folder & make the folder angsd_analysis
mkdir angsd_analysis
```

You should be using the final GenErode outputs for ANGSD analysis. For Albatross/historical samples these are the `.merged.rmdup.merged.realn.rescaled.bam` files that have been rescaled to account for historic DNA damage. For contemporary files these are the `.merged.rmdup.merged.realn.bam` files.

You may use the cp command or parallel module (faster as it copies 40 files at a time) to copy the *bam files

```
cd <your angsd_analysis folder>
  #navigates to your angsd_analysis folder
salloc -c 40

# use soft links with absolute paths to save space
ln -s <absolute path to historical mapping files from GenErode>/*rescaled.bam .
ln -s <absolute path to contemporary mapping files from GenErode>/*realn.bam .

# example for the soft link creation
# ln -s /archive/carpenterlab/pire/pire_ostorhinchus_chrysopomus_lcwgs/GenErode_Och_20k/results/historical/mapping/reference.denovoSSL.Och.20k/*rescaled.bam .
# ln -s /archive/carpenterlab/pire/pire_ostorhinchus_chrysopomus_lcwgs/GenErode_Och_20k/results/modern/mapping/reference.denovoSSL.Och.20k/*realn.bam .

# old instructions to copy bam files, don't follow, goto next step
ls <path to historical mapping files from GenErode> | parallel --no-notice -kj 40 cp {} .
  #copies the *.merged.rmdup.merged.realn.rescaled.bam files from GenErode results, historical mapping to your angsd_analysis folder
  #parallel is automatically loaded on Wahab but if the previous line doesn't go through, type module load parallel after salloc
ls <path to contemporary mapping files from GenErode> | parallel --no-notice -kj 40 cp {} .
  #copies the *.merged.rmdup.merged.realn.bam files from GenErode results, contemporary mapping to your angsd_analysis folder
```

Ideally you have run GenErode on data across lanes from all individuals, in which case information for each individual will already be merged into one file. If you need to add information from another run or otherwise merge multiple .bam files from the same set of individual, you can use the merge scripts as described in the lcwgs_processing README. 

```
#Merge .bam files
# note you may have to edit paths in some of these scripts

bash runmerge_2runs_GenErode_array_modern.bash /archive/carpenterlab/pire/{your_species_directory} {3-letter_species_prefix}
bash runmerge_2runs_GenErode_array_historical_rescaled.bash /archive/carpenterlab/pire/{your_species_directory} {3-letter_species_prefix}

#Copy unmerged files for runs 1 and 2.

sbatch copyunmerged_modern.sbatch
sbatch copyunmerged_historical_rescaled.sbatch

```

The *Salarias fasciatus* repo also has an example of a more complicated merge (3 runs).

</p>
</details>

<details><summary>1. SNP calling </summary>
<p>

## 1. SNP calling

An initial SNP calling step is used to identify set of SNPs with a reasonable depth that can be assessed across the historic and contemporary samples.

First make a list of all .bam files from the historical and modern specimens.

```bash
ls *.bam > bam_list_all.txt
  #Puts all the .bam files as a list into a text file 
```

Generate an index for all .bam files, which will provide a supplementary index file (.bai) for each .bam file. 

```bash
salloc -c 40

module load samtools

# screen runs the command in a new terminal and continues until it finishes.
# https://www.geeksforgeeks.org/linux-unix/screen-command-in-linux-with-examples/
# to get out of the screen terminal, type `ctrl-a` first, then the `d` key
# use chatgpt to learn how to track progress
screen crun samtools index -M -@40 *.bam
```

Add an absolute path for each .bam file for the bam_list_all.txt to the snp_calling.sbatch script so that the server can find the .bam files when running the job later down the line. 

```bash
# run from your `angsd_analysis` dir
find <absolute path to your species>/angsd_analysis/*.bam > bam_list_all_fullpath.txt
  #Searches for all .bam files in the specified directory and write full paths to the file bam_list_all_fullpath.txt
```

Copy the snp_calling.sbatch script (https://github.com/philippinespire/pire_taeniamia_zosterophora_lcwgs/blob/main/snp_calling.sbatch) into a new .sbatch file, and adjust the script to fit your data. 

```bash
# calculate the values to populate the snp_calling.sbatch script
bash
N=$(wc -l < bam_list_all_fullpath.txt)
minInd=$(( (N+1)/2 ))     # ceil(N/2)
minDepth=$N               # 1x individuals
maxDepth=$(( 15 * N ))    # 15x individuals
printf "N=%d  minInd=%d  minDepth=%d  maxDepth=%d\n" "$N" "$minInd" "$minDepth" "$maxDepth"
```

- update the paths to the `bam_list_all.txt` and reference genome `../GenErode_*_20k/reference/reference.*.20k.fasta`
- Minimum depth filter should be 1x the number of individuals. If there's 1 bam per individual, then `ls *bam | wc -l`
- Maximum depth filter should be 15x the number of individuals.
- Minimum individual filter should be half of the total number of individuals.
- Parameters that stayed the same from the original script are a map quality filter of 30, a minimum allele frequency filter of 0.001, and a SNP p-value of 1e-6. 

```bash
cd <your angsd_analysis species folder>
cp <pathway to lcwgs scripts directory>/snp_calling.sbatch .
  #copies the snp_calling.sbatch file in to your 
vi snp_calling.sbatch
  #Makes a new file called snp_calling.sbatch in the angsd_analysis folder. Paste Kyra's snp_calling.sbatch script into this file. Edits are the following: 
  #Add the full directory pathway to the bam_list_all_fullpath.txt after -b, so that the server can find the file (e.g. -b /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/bam_list_all_fullpath.txt)
  #Make sure you change the pathway after -ref to the correct reference genome for your species (e.g. /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/1st_sequencing_run/GenErode_Sfa_full/reference/GCF_902148845.1_fSalaFa1.1_chr1-23_rename.fna)
```

check that the values are updated correctly

```bash
# values should be this (assumes you ran the commands to populate these vars above)
printf "N=%d  minInd=%d  minDepth=%d  maxDepth=%d\n" "$N" "$minInd" "$minDepth" "$maxDepth"

# in the snp_calling.sbatch
grep -E '(^|\s)-(b|ref|minInd|setMinDepth|setMaxDepth|minMapQ|minMaf|SNP_pval)\b' snp_calling.sbatch
```

Run your script

```bash
sbatch snp_calling.sbatch /archive/carpenterlab/pire/<your_species_dir>/angsd_analysis/
  #Submits to the Wahab cluster, specifying the directory of the output to the 'angsd_analysis' folder.
```

when done, check output for errors

```bash
grep -E "error|warn|fail|not found|skipping" -i angsd_snp-*.out || echo "No obvious warnings"
```

</p>
</details>

<details><summary>2. Generating genotype likelihoods and making a beagle.gz file</summary>
<p>
  
## 2. Generating genotype likelihoods and making a beagle.gz file 

Genotype likelihoods will be used for all downstream analyses (PCA, admixture, estimating diversity, FST, and selection).

Use the get_beagle.sbatch file to generate a .beagle.gz file containing genotype likelihoods for the set of SNPs identified in step 2.  

```bash
vi get_beagle.sbatch
#Makes a new file named 'get_beagle.sbatch' in the angsd_analysis folder. Paste Kyra's get_beagle.sbatch script into this file. Edits include the following: 
  #Make sure you change the pathway after -anc to the correct reference genome - for Salarias fasciatus, this would be (-anc /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/1st_sequencing_run/GenErode_Sfa_full/reference/GCF_902148845.1_fSalaFa1.1_chr1-23_rename.fna). 

sbatch get_beagle.sbatch /archive/carpenterlab/pire/{species_dir}/angsd_analysis/
```

when done, check output for errors

```bash
grep -E "error|warn|fail|not found|skipping" -i angsd_beagle-*.out || echo "No obvious warnings"
```

You will want to get genotype likelihoods for all individuals and all chromosomes / scaffolds in order to run your first iteration of PCANGSD. After examining PCANGSD outputs, you may see evidence of (1) outlier individuals or (2) inversions in the PCA output. (1) will appear as particular Albatross or contemporary individuals that do not cluster with their respective era and/or site in the PCA plot, while (2) will be indicated by a "three-stripe" pattern in the PCA (i.e. individuals in the PCA generally do not cluster by their era or site, but rather show a pattern of three vertical or horizontal stripes).

For case (1), you can create a new `get_beagle_subset.sbatch` file and a `bam_list_subset.txt` file and re-run the get_beagle step.

```
cp bam_list.txt bam_list_subset.txt
# Remove the bam files for the outlier individuals from bam_list_subset.txt

cp get_beagle.sbatch get_beagle_subset.sbatch
# change -b to bam_list_subset.txt
# change -out suffix to *_subset.beagle.gz 

sbatch get_beagle_subset.sbatch /archive/carpenterlab/pire/{species_dir}/angsd_analysis/
```

For case (2), if you do not know which chromosomes or scaffolds contain inversions, you can run step 6 (WinPCA) to identify these. Once the inversions are identified, you can create a new `get_beagle_noinv.sbatch` file and a `global_snp_list_depth1_15_notrans_noinv.chrs` file and re-run the get_beagle step.

```
cp global_snp_list_depth1_15_notrans.chrs global_snp_list_depth1_15_notrans_noinv.chrs
# Remove the chromosomes/scaffolds containing inversions from global_snp_list_depth1_15_notrans_noinv.chrs

cp get_beagle.sbatch get_beagle_noinv.sbatch
# change -rf to global_snp_list_depth1_15_notrans_noinv.chrs
# change -out suffix to *_noinv.beagle.gz 

sbatch get_beagle_noinv.sbatch /archive/carpenterlab/pire/{species_dir}/angsd_analysis/
```

And if you have both inversions and outliers you can combine the two steps above.

</p>
</details>

<details><summary>3. Running PCANGSD </summary>
<p>
## 3. Running PCANGSD: 

Copy Kyra Fitz's pcangsd_pca.sbatch script (https://github.com/philippinespire/pire_taeniamia_zosterophora_lcwgs/blob/main/pcangsd_pca.sbatch) and pcangsd_admix.sbatch (https://github.com/philippinespire/pire_taeniamia_zosterophora_lcwgs/blob/main/pcangsd_admix.sbatch) into new .sbatch files, and adjust the script to fit your paths and filenames.

```
vi pcangsd_pca.sbatch
#Makes a new file named 'pcangsd_pca_it500_noinv_subset.sbatch' in the angsd_analysis folder to indicate a file with 500 iterations and no inversions. Paste Kyra's pcangsd_pca.sbatch script into this file. Edits include the following:
  #Add another argument called "--it 500" to specify 500 iterations.
  #Change the output file to "--out angsd_notrans_snps_pca_it500_noinv_subset"
  #Change the input file to "-b angsd_depth1_15_notrans_noinv_subset.beagle.gz" to have the genotype likelihood file with no inversions and no outliers.

vi pcangsd_admix.sbatch
#Makes a new file named 'pcangsd_admix_it500_noinv_subset.sbatch' in the angsd_analysis folder to indicate a file with 500 iterations and no inversions. Paste Kyra's pcangsd_pca.sbatch script into this file. Edits include the following:
  #Add another argument called "--it 500" to specify 500 iterations.
  #Change the output file to "--out angsd_notrans_snps_pca_it500_noinv_subset"
  #Change the input file to "-b angsd_depth1_15_notrans_noinv_subset.beagle.gz" to have the genotype likelihood file with no inversions and no outliers.
```

Submit jobs to the Wahab cluster, specifying the directory.

```
sbatch pcangsd_pca_it500_noinv_subset.sbatch /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/

sbatch pcangsd_admix_it500_noinv_subset.sbatch /archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/
```

Check the output files (pcangsd_pca-*.out) - you may see the message "PCAngsd did not converge!". You can try to increase the number of iterations being run by adding an '--it 500', though in our experience with Sfa we still got this message with 500 iterations (even though the RMSE convergence statistic seemed to reach a minimum at the default of 100 and did not really improve with more iterations). Even if the allele frequency estimation step does not converge, in our experience the admixture step will converge.

Once the job is done, download the outputs: angsd_analysis/angsd_snps_pca.cov, bam_list.txt, and angsd_admix.2.Q files. These are needed to run the admixture.R and pca.R files. 

you can run Rstudio on Wahab using [OnDemand](https://ondemand.wahab.hpc.odu.edu/)

Run admixture.R and pca.R files in RStudio to get two plots: 1) admixture proportions and 2) PCA for historical and contemporary individuals. Run the admixture.R plot before the pca.R files. 

--> Once you have run admixture and PCA, if you have individual outliers or evidence of inversions (a "three-stripe" pattern in the PCA) you may want to revisit step #3, removing outlier individuals and/or chromosomes containing inversions (identifiable by running separate PCAs for each chromosome). WinPCA (step #6, still in development) can also help to pinpoint inverted regions.
</p>
</details>

<details><summary>3a. (Optional) Running PCANGSD for a Selection Scan</summary>
<p>

## 3a. (Optional) Running PCANGSD for a Selection Scan

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
After the job runs, download the following outputs to your personal directory (examples for Sfa shown here) or you can run Rstudio on Wahab using [OnDemand](https://ondemand.wahab.hpc.odu.edu/). 
- angsd_notrans_snps_selection_it500_noinv_subset.selection
- global_snp_list_depth1_15_notrans.regions
- angsd_notrans_snps_selection_it500_noinv_subset.sites

Run pcangsd_selection_plot_v2.R in RStudio to generate a Manhattan plot and look at SNPs potentially under selection. 

</p>
</details>

<details><summary>3b. (Optional) Running winPCA to detect chromosome inversions (in testing mode on Wahab)</summary>
<p>
  
## 3b. (Optional) Running winPCA to detect chromosome inversions (in testing mode on Wahab)

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

To run iteratively over all chromosomes in parallel, you can use the `winPCAv3.sbatch` script. The script will need a .tsv file with two columns (chromosome name and chromosome length) and your beagle.gz file, ideally with outlier individuals already removed. Adjust the #SBATCH --array argument to reflect the number of chromosomes in your reference (1-n) and run from your angsd_analysis directory

```
sbatch winPCAv3.sbatch
```

</p>
</details>


<details><summary>4. Generating Site Allele Frequencies</summary>
<p>
  
## 4. Generating Site Allele Frequencies

Make two bam lists: one with only Albatross individuals (AXxx) and one with only contemporary individuals (CXxx). Use the subsetted bam list because it excludes outlier individuals. 

Make a bamlist file for the historical and contemp libraries as well as each of the populations by copying the [`make_bamlists.R`](make_bamlists.R) script to your `angsd_analysis` dir then open it in [Wahab Ondemand](https://ondemand.wahab.hpc.odu.edu/)

You will need to update the User Defined Variables in the `make_bamlists.R` script to match your bam file nameing.  The variables below are for `/archive/carpenterlab/pire/pire_ostorhinchus_chrysopomus_lcwgs/angsd_analysis`

```R
#### User Defined Variables ####

qfile_path   <- "angsd_admix_notrans.admix.2.Q"
bamlist_path <- "bam_list_all.txt"
historical_pattern <- "^OchA"    # regex that selects all historical libraries
contemp_pattern <- "^OchC"       # regex that selects all contemp libraries
all_pattern <- "^Och[AC]"        # regex that selects all libraries
```

Run the script and it will create the bam list files.  If you are having trouble, you can use the bash code below to create bam list files.  Note that you have to repalce the "CBas" and "ABas" with regex that selects the libraries you want to put into a group

```
#only run this if you couldn't get the make_bamlists.R script to work
grep "CBas" bam_list_all_subset.txt > bam_list_CBas.txt
grep "ABas" bam_list_all_subset.txt > bam_list_ABas.txt
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
</p>
</details>

<details><summary>5. Calculating FST across the whole genome</summary>
<p>
  
## 5. Calculating FST across the whole genome

Copy Kyra Fitz's fst.sbatch script (https://github.com/philippinespire/pire_taeniamia_zosterophora_lcwgs/blob/main/fst.sbatch) into a new .sbatch file (fst.sbatch) within our angsd_analysis directory, and adjust the script to fit the *Salarias fasciatus* data. It will be using .saf.idx files from Step 4's outputs.

```
vi fst.sbatch
#Make sure to first paste Kyra’s script
#Make sure to change the SAF directory into our angsd_analysis folder: SAFDIR=${1:-/archive/carpenterlab/pire/pire_salarias_fasciatus_lcwgs/angsd_analysis/}
#Make sure to change population 1 to "historical_sites_notrans"
#Make sure to change population 2 to "contemp_sites_notrans"
```

Submit the job to the Wahab cluster. Since the script already specifies the directory for the output, you do not have to specify the directory when submitting the job. The output should be angsd_fst-######.out. 
```
sbatch fst.sbatch
```

Interpreting results: the last line of the SLURM `*.out` file should look something like this

```
        -> FST.Unweight[nObs:2801580]:0.062338 Fst.Weight:0.095324
```

There were 2801580 SNPs.  The unweighted FST is 0.062 (average FST across all SNPs) and the weighted is 0.095 (sum of *S*ubpop var component / sum of *T*otal variance). _When in doubt, you should report the weighted FST._ 

Windowed Fst can be calculated in ANGSD based on the output of fst.sbatch wusing the fst_window.sbatch script. Currently the script uses a window size of 50kbp and a step size of 10kbp, though this can be adjusted (however note that this will reduce the number of SNPs per window and potentially increase the "noise" of Fst estimates.

```
sbatch fst_window.sbatch
```

If you have more than 2 population samples to compare, then 

1. If you have not already, make a bamlist file for each of the populations using the  [`make_bamlists.R`](make_bamlists.R) script (copy to your analysis dir if you haven't already). [Wahab Ondemand](https://ondemand.wahab.hpc.odu.edu/)
2. If you have not already, repeat the rest of step 4 above for each population
3. If you have not already, repeat step 5 above for each pairwise population comparison using [`fst2.sbatch`](fst2.sbatch) (copy to your `angsd_analysis` dir) as follows:

```bash
# replace pop1_sites_notrans and pop2_sites_notrans with the names used for your *.saf* files
sbatch fst2.sbatch pop1_sites_notrans pop2_sites_notrans
```

4. Query all global PW FST:

```bash
grep . *average_fst.txt
```

Sliding Window PW FST can be run as follows for each pair of pops with [`fst2.sbatch`](fst2_window.sbatch) (copy to your `angsd_analysis` dir)

```bash
# replace pop1_sites_notrans and pop2_sites_notrans with the names used for your *.saf* files
sbatch fst2_window.sbatch pop1_sites_notrans pop2_sites_notrans
```

Finally, you will be interested in comparing the groups (k) from your admixture analysis if they are not the same as the comparisons you have done already.  The [`make_bamlists.R`](make_bamlists.R) script reads in the admixture analysis results to aid you in creating bamlists.  You need to uncomment the user defined variables and modify them for your species and libraries.  These were for `/archive/carpenterlab/pire/pire_ostorhinchus_chrysopomus_lcwgs/angsd_analysis`.

```r
# Vars for parsing population group affiliation from admixure model
Uncomment these var and the commented code below and customize for your species.
historical_p1_out <- "bam_list_p1_historical.txt"
historical_p2_out <- "bam_list_p2_historical.txt"
contemp_p2_out <- "bam_list_p2_contemp.txt"
assign_thresh <- 0.9
```

You will also need to uncomment the code at the end of the [`make_bamlists.R`](make_bamlists.R) script.  This code makes bam lists for historical pop 1, historical pop2, and contemporary pop2.  You may have more or different groupings that you want to compare and will have to modify the code provided.

After that, run steps 4 and 5 to obtain saf and fst

</p>
</details>

<details><summary> 6. Generate site frequency spectra for each site or era </summary>
<p>

## 6. Generate site frequency spectra for each site/era

Copy the sfs.sbatch file into your angsd_analysis directory & run it for each population. Each era is considered 1 population. Therefore, if you have 1 site with Albatross & Contemporary individuals, there are 2 populations. For *Sphaeramia nematoptera* for example, since there were 3 sites with an Albatross-Contemporary match, there was a total of 6 populations and the sfs.sbatch file was edited 6 times & ran for each population.

```
nano sfs.sbatch
#changes were made to change the file names for the *saf.idx file & the resulting *.sfs file for every population
crun.angsd realSFS <population specific saf idx file>.saf.idx -P 8 -fold 1 > <enter similar filename for output file>.sfs
#for example, when sfs.sbatch was ran for S. nematoptera Albatross individuals from Romblon, the script had:
crun.angsd realSFS arom_sites_notrans_nooutliers.saf.idx -P 8 -fold 1 > arom_notrans_nooutliers.sfs
```

Each time the sfs.batch was run, the following command was executed:
```
#sbatch script outputdir
sbatch sfs.sbatch /archive/carpenterlab/pire/pire_sphaeramia_nematoptera_lcwgs/angsd_analysis/
```

</p>
</details>

<details><summary> 7. Calculate per-site thetas
</summary>
<p>
  
## 7. Calculate per-site thetas

Copied the saf2theta.sbatch file into the angsd_analysis directory & run it for each of the populations. Thus, for 1 site, you'll run twice since Albatross is 1 population & Contemporary is another. 

```
nano saf2theta.sbatch
#changes were made to change the file names for the *saf.idx file, the *.sfs file, and the outcome for every population
#crun.angsd realSFS saf2theta <site>.saf.idx -sfs <site>.sfs -fold 1 -P 8 -outname <site>
#for example, when saf2theta.sbatch was ran for Contemporary Tawi-tawi, the script was was edited as follows:
crun.angsd realSFS saf2theta ctaw_sites_notrans.saf.idx -sfs ctaw_notrans.sfs -fold 1 -P 8 -outname ctaw_notrans
```

The saf2theta.sbatch script was ran as such:
```
#sbatch script outputdir
sbatch saf2theta.sbatch /archive/carpenterlab/pire/pire_<species>_lcwgs/angsd_analysis/
```

</p>
</details>

<details><summary>8. Neutrality test statistics using the do_stat command</summary>
<p>

## 8. Neutrality test statistics using the do_stat command

Copied the thetastat.sbatch file into the angsd_analysis directory & ran it for each of the populations. The thetastat.sbatch file was edited for each population.

```
nano thetastat.sbatch
#the *thetas.idx file was changed
#crun.angsd thetaStat do_stat <site>.thetas.idx
#for example, for Albatross Biri, the following line was changed:
crun.angsd thetaStat do_stat abir_notrans.thetas.idx
```

The thetastat.sbatch script was run:
```
#sbatch script outputdir
sbatch thetastat.sbatch /archive/carpenterlab/pire/pire_sphaeramia_nematoptera_lcwgs/angsd_analysis/
```

</p>
</details>

<details><summary>9. Estimating effective population size (Ne) using Ne_estimation.R and Ne_estimation_neutral.R </summary>
<p>
  
## 9. Estimating effective population size (Ne) using Ne_estimation.R and Ne_estimation_neutral.R

The *.mafs.gz outputs from Step 4: SAF (saf_beagle_maf.sbatch) will be used for this step.

A revised code developed from Jorde & Ryman 2007 and the NeEstimator manual v.2.1 was used.

Ne_estimation_3sites.R was used to generate Ne estimates for the adapted CMH and adapted Chi-squared selection scan tests.


Neutral SNPs can be filtered out (Step 11) & the Ne_estimation_neutral.R can be used.

</p>
</details>

<details><summary>10. Analyzing changes in genetic diversity: Watterson's theta, nucleotide diversity (pi), and Tajima's D using the geneticdiversity.R and geneticdiversity_neutral.R scripts.</summary>
<p>

## 10. Analyzing changes in genetic diversity: Watterson's theta, nucleotide diversity (pi), and Tajima's D using the geneticdiversity.R and geneticdiversity_neutral.R scripts.

The geneticdiversity.R script can be used for species with only 1 site & 2 populations: Albatross & Contemporary. The geneticdiversity_Sne.R script was created specifically for *Sphaeramia nematoptera* with 6 populations. 

The *.thetas.idx.pestPG outputs from calculating per site Theta (Step 7) were used. Watterson's theta and nucleotide diversity were originally plotted against sequencing depth (mean depth per individual) to evaluate any depth based correlations that may be biasing results. This analysis identified that genetic diversity was sensitive to sequencing depth below 3x or above 6x (based on Fitz et al.). Thus, analysis on genetic diversity metrics to the xxx contigs with 3-6x depth. The following statistical analyses for all three metrics were run on this 3-6x depth range (xxx SNPs).

Because the script requires SAF beagle file with all sites together (with a *.pos.gz file extension), you need to return to the SAF step (Step 4) to make that. Refer to step 4 for this.

</p>
</details>

<details><summary>11. Selection scan to get a list of neutral SNPs</summary>
<p>

## 11. Selection scan to get a list of neutral SNPs
The selection.R script can be used to get a list of neutral SNPs for species with only 1 location. The selection_3sites.R script was created specifically for *Sphaeramia nematoptera* with 6 populations at 3 sites.

For the case of *Sphaeramia nematoptera*, the number of chromosomes changed after filtering. Therefore, a new chromosome list had to be created too. The selection_3sites.R script provides code for that. A new index must be created for the new neutral snp list and it is executed through the the index_snplist.sbatch script. Make sure to execute this after you create your neutral snp list.

```
sbatch index_snplist.sbatch
```

