
# *Chanos chanos* lcwgs
### Laurel Weeks and Kevin Labrador
#

## 1. Pre-processing

This follows the instructions from [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing/blob/main/README.md).

<details>
	<summary>1. Download data</summary>

Data copied from `gotanco_chanos-chanos/2nd_sequencing_run_depracated/fq_raw` and `gotanco_chanos-chanos/3rd_sequencing_run_depracated/fq_raw`   LW 2023-07-09
Test lane data copied from `https://grid.ftp.tamucc.edu/genomics/20230425_Gotanco-lcwgs-testlane/Lane1/` KL 2023-08-07

```
mkdir fq_raw_test-lane
cd ./fq_raw_test-lane
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/gridDownloader.sh . https://gridftp.tamucc.edu/genomics/20230425_Gotanco-lcwgs-testlane/Lane1/
```

Check if files were downloaded correctly.

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkFQ.sh fq_raw_test-lane

```

Some files did not download correctly. Download them again using rsync.

```
# Retrieve the files that have bad fastq format. 
# Wrote the faulty_fqgz.bash to collect the faulty files from checkFQ.sh outfile. 

# Create a directory for stragglers
mkdir fq_raw_test-lane_stragglers

# rsync the files from tamu-cc to ./fq_raw_test-lane_stragglers; change permission afterwards using
cd fq_raw_test-lane_stragglers
chmod 770 *

# Check file format if using checkFQ.sh
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkFQ.sh fq_raw_test-lane_stragglers
## All files now have the correct format.

# Move the files from the straggler directory to the fq_raw_test-lane directory.
mv fq_raw_test-lane_stragglers/* fq_raw_test-lane/

# Just to make sure, do another file check on fq_raw_test-lane
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkFQ.sh fq_raw_test-lane
## Everything looks good now! I can delete the straggler directory.
```

Add the fq_raw_test-lane/*fq.gz files to fq_raw
```
mv fq_raw_test-lane/*fq.gz fq_raw/
```

</details>


<details>
	<summary>1.5 Concatenate the files</summary>
Created a script to concatenate Lanes 2 and 3 into 1 file for each sample run. `catfiles.sbatch`. Successfully concatenated files; new files went into `fq_raw_cat`. LW 2023-07-09

Concatenated the test lane along with Lanes 2 and 3. Output to a different directory for now. KL 2023-08-09
I had to modify the catfiles script so that it will recognize the unique entries of the sample ID and not the library ID from the sequencing facility.
```
sbatch ./catfiles2.sbatch fq_raw fq_raw_cat2 1
sbatch ./catfiles2.sbatch fq_raw fq_raw_cat2 2

# Just to make sure, do another file check on fq_raw_cat2
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkFQ.sh fq_raw_cat2

```

The concatenated files were problematic. Ater several trial and error, I decided to partition the full dataset into subfolders and run catfiles2.sbatch on each.
```
mkdir fq_raw_GotA
mv fq_raw/GotPopA* fq_raw_GotA
sbatch ./catfiles2.sbatch fq_raw_GotA fq_raw_GotA_cat 1
sbatch ./catfiles2.sbatch fq_raw_GotA fq_raw_GotA_cat 2

mkdir fq_raw_GotB
mv fq_raw/GotPopB* fq_raw_GotB
sbatch ./catfiles2.sbatch fq_raw_GotB fq_raw_GotB_cat 1
sbatch ./catfiles2.sbatch fq_raw_GotB fq_raw_GotB_cat 2


mkdir fq_raw_GotC
mv fq_raw/GotPopC* fq_raw_GotC
sbatch ./catfiles2.sbatch fq_raw_GotC fq_raw_GotC_cat 1
sbatch ./catfiles2.sbatch fq_raw_GotC fq_raw_GotC_cat 2

mkdir fq_raw_GotW
mv fq_raw/GotPopW* fq_raw_GotW
sbatch ./catfiles2.sbatch fq_raw_GotW fq_raw_GotW_cat 1
sbatch ./catfiles2.sbatch fq_raw_GotW fq_raw_GotW_cat 2

# Run checkFQ.sh on each cat files.
## All files look good. Move the files back to their original directories (i.e. fq_raw and fq_raw_cat2)
```

All files are now in order. Proceed to next step.
</details>

<details>
	<summary>2. Proofread the decode files</summary>
Decode file does not match the PIRE naming scheme to be able to successfully run scripts down the line, created a new decode file, `Gotanco-Sequencing-DecodeFile.tsv`. 

300 forward reads, 300 reverse reads in both the decode file and in `fq_raw_cat`. LW 2023-07-10

Copy the decode file from fq_raw_cat to fq_raw_cat2. KL 2023-08-10

</details>

<details>
	<summary>3. Edit the decode file</summary>

N/A, created a new file.

</details>


<details>
	<summary>4. Make a copy of the fq_raw files</summary>

N/A

</details>

<details>
	<summary>5. Perform a renaming dry run</summary>

Dry run unsuccessful, renaming does not remove the characters between the sample name and `.fq.gz`. Copied `renameFQGZ.bash` to the gotanco directory and edited the script so that it works with the initial unconvential naming.

After editing, the dry run was successful. LW 2023-07-10

Edited the renameFQGZ.bash script to accommodate the new naming convention for combined lanes. KL 2023-08-10
Perform a renaming dry run using the decode file. KL 2023-08-10

```
salloc 
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run/fq_raw_cat2
bash ../renameFQGZ_2.bash Gotanco-Sequencing-DecodeFile.tsv
```
Seems to have worked!

</details>

<details>
	<summary>6. Rename the files for real</summary>
Successfully renamed the files with the edited script. LW 2023-07-10

Renamed the files. KL 2023-08-10
```
salloc
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_c>
bash ../renameFQGZ_2.bash Gotanco-Sequencing-DecodeFile.tsv rename

```

</details>

<details>
	<summary>7. Check the quality of your data</summary>

Started `MultiQC`, still running, and still running as of the morning, for 20 hours now. Canceled job. LW 2023-07-11

<details><summary>Expand for MultiQC Output.</summary>

```bash
Insert output here.
```
</p>
</details>

Started `MultiQC`. KL 2023-08-10
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw_cat2" "fqc_raw_report"  "fq.gz"

```
- Job stuck. Rerun. KL 2023-08-11

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw_cat2" "fqc_raw_report"  "fq.gz"

```
- JobID: 2096122
- Job still stuck after 1 d 15 h. Terminate run. KL 2023-08-13

</details>

<details>
	<summary>8. First trim</summary>

Started the first trim yesterday, finished as of this morning, still have 300 forward and 300 reverse reads in `fq_fp1`. LW 2023-07-11

Do first trim on fq_raw_cat2. KL 2023-08-10
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw_cat2 fq_fp1
```
- jobID: 2092663
- job finished successfully

80 files did not return the correct fq.gz format after trimming. Redo. KL 2023-08-13

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run

# Make a straggler directory and move all faulty files for processing.
mkdir fq_raw_cat2_straggler fq_fp1_straggler
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw_cat2_straggler fq_fp1_straggler

```

Updated MultiQC table.

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter

Sample Name	% Duplication	GC content	% PF	% Adapter
Cch-CAL_001-5H-lcwgs-1-2	20.8%	41.6%	97.7%	4.6%
Cch-CAL_003-3G-lcwgs-1-2	16.0%	41.7%	97.5%	9.6%
Cch-CAL_004-7E-lcwgs-1-2	15.5%	41.6%	97.6%	8.5%
Cch-CAL_005-10E-lcwgs-1-2	15.2%	41.5%	97.4%	8.4%
Cch-CAL_006-10A-lcwgs-1-2	14.4%	41.9%	97.4%	10.8%
Cch-CAL_008-3B-lcwgs-1-2	2.9%	41.6%	96.5%	7.3%
Cch-CAL_009-3A-lcwgs-1-2	19.1%	41.8%	97.5%	3.2%
Cch-CAL_011-4D-lcwgs-1-2	12.7%	41.8%	97.2%	15.2%
Cch-CAL_012-1F-lcwgs-1-2	17.1%	41.3%	97.8%	12.8%
Cch-CAL_013-5C-lcwgs-1-2	15.5%	41.9%	97.6%	7.3%
Cch-CAL_014-12A-lcwgs-1-2	15.0%	41.8%	97.4%	10.1%
Cch-CAL_015-2D-lcwgs-1-2	14.1%	41.4%	97.3%	17.0%
Cch-CAL_016-12C-lcwgs-1-2	15.4%	41.6%	97.6%	6.7%
Cch-CAL_017-4B-lcwgs-1-2	15.2%	41.9%	97.6%	6.4%
Cch-CAL_018-11G-lcwgs-1-2	15.5%	41.6%	97.4%	6.1%
Cch-CAL_019-2A-lcwgs-1-2	24.0%	41.5%	97.7%	1.9%
Cch-CAL_021-1E-lcwgs-1-2	14.5%	42.1%	97.3%	10.8%
Cch-CAL_022-2H-lcwgs-1-2	15.3%	41.7%	97.5%	10.5%
Cch-CAL_023-9B-lcwgs-1-2	15.4%	41.5%	97.6%	10.2%
Cch-CAL_024-8A-lcwgs-1-2	14.8%	41.4%	97.5%	8.4%
Cch-CAL_025-9F-lcwgs-1-2	15.7%	41.7%	97.6%	11.2%
Cch-CAL_026-2C-lcwgs-1-2	12.5%	41.3%	97.4%	24.9%
Cch-CAL_027-2E-lcwgs-1-2	15.0%	41.4%	97.2%	14.6%
Cch-CAL_028-1H-lcwgs-1-2	17.5%	41.4%	97.6%	5.9%
Cch-CAL_029-3B-lcwgs-1-2	10.1%	41.6%	96.8%	25.5%
Cch-CAL_030-9D-lcwgs-1-2	16.3%	41.4%	97.8%	25.4%
Cch-CAL_031-12F-lcwgs-1-2	16.1%	41.7%	97.7%	13.7%
Cch-CAL_034-11A-lcwgs-1-2	15.6%	41.7%	97.5%	5.7%
Cch-CAL_036-3D-lcwgs-1-2	16.4%	41.8%	97.2%	9.3%
Cch-CAL_038-11A-lcwgs-1-2	16.0%	41.7%	97.6%	10.7%
Cch-CAL_039-12A-lcwgs-1-2	16.3%	41.9%	97.6%	7.3%
Cch-CAL_040-6D-lcwgs-1-2	15.3%	41.5%	97.5%	4.6%
Cch-CAL_041-12H-lcwgs-1-2	15.4%	41.5%	97.6%	5.4%
Cch-CAL_042-9C-lcwgs-1-2	14.4%	41.6%	97.6%	12.4%
Cch-CAL_043-2F-lcwgs-1-2	15.5%	41.6%	97.7%	10.0%
Cch-CAL_044-1E-lcwgs-1-2	14.9%	41.5%	97.6%	25.4%
Cch-CAL_045-11D-lcwgs-1-2	16.3%	41.8%	97.5%	6.1%
Cch-CAL_046-8C-lcwgs-1-2	13.2%	41.7%	97.4%	18.8%
Cch-CAL_049-4F-lcwgs-1-2	14.3%	41.5%	97.6%	17.7%
Cch-CAL_050-11B-lcwgs-1-2	12.2%	41.6%	97.4%	13.2%
Cch-CAS_001-10B-lcwgs-1-2	17.5%	41.6%	97.5%	5.7%
Cch-CAS_002-7D-lcwgs-1-2	15.2%	41.6%	97.5%	9.2%
Cch-CAS_004-12H-lcwgs-1-2	16.4%	41.9%	97.6%	6.2%
Cch-CAS_005-8H-lcwgs-1-2	14.7%	41.9%	97.6%	11.7%
Cch-CAS_006-5A-lcwgs-1-2	38.0%	42.0%	97.7%	1.3%
Cch-CAS_007-7G-lcwgs-1-2	14.7%	41.6%	97.7%	10.1%
Cch-CAS_008-6E-lcwgs-1-2	17.0%	41.9%	97.7%	4.0%
Cch-CAS_009-5C-lcwgs-1-2	15.6%	41.4%	97.6%	9.8%
Cch-CAS_010-7B-lcwgs-1-2	15.8%	41.5%	97.6%	10.9%
Cch-CAS_011-8D-lcwgs-1-2	14.7%	41.6%	97.5%	12.7%
Cch-CAS_012-10H-lcwgs-1-2	12.6%	41.6%	97.3%	10.2%
Cch-CAS_013-11A-lcwgs-1-2	19.9%	41.7%	97.5%	2.7%
Cch-CAS_014-6A-lcwgs-1-2	15.4%	41.5%	97.5%	12.2%
Cch-CAS_015-10F-lcwgs-1-2	11.4%	41.5%	97.2%	13.5%
Cch-CAS_016-6C-lcwgs-1-2	16.6%	41.5%	97.6%	4.2%
Cch-CAS_017-11H-lcwgs-1-2	16.0%	41.8%	97.6%	7.4%
Cch-CAS_018-12D-lcwgs-1-2	14.3%	41.6%	97.5%	11.5%
Cch-CAS_019-5B-lcwgs-1-2	15.2%	41.6%	97.4%	12.2%
Cch-CAS_021-6E-lcwgs-1-2	14.9%	41.7%	97.5%	7.5%
Cch-CAS_022-8G-lcwgs-1-2	15.1%	41.6%	97.5%	8.0%
Cch-CAS_023-10G-lcwgs-1-2	7.4%	41.8%	96.5%	33.1%
Cch-CAS_024-11G-lcwgs-1-2	16.2%	41.4%	97.6%	7.0%
Cch-CAS_025-1C-lcwgs-1-2	14.8%	41.9%	97.4%	11.1%
Cch-CAS_026-10E-lcwgs-1-2	15.1%	41.6%	97.5%	11.0%
Cch-CAS_027-7B-lcwgs-1-2	14.6%	41.6%	97.7%	15.6%
Cch-CAS_029-8G-lcwgs-1-2	15.5%	41.5%	97.3%	7.5%
Cch-CAS_030-7D-lcwgs-1-2	15.6%	41.6%	97.5%	6.2%
Cch-CAS_031-9D-lcwgs-1-2	15.5%	41.7%	97.6%	6.2%
Cch-CAS_032-11C-lcwgs-1-2	16.6%	41.5%	97.7%	5.7%
Cch-CAS_033-10D-lcwgs-1-2	14.2%	41.5%	97.4%	6.3%
Cch-CAS_034-6H-lcwgs-1-2	14.8%	41.8%	97.0%	5.9%
Cch-CAS_035-6B-lcwgs-1-2	13.8%	41.4%	97.6%	23.9%
Cch-CAS_037-11B-lcwgs-1-2	14.8%	41.6%	97.5%	9.4%
Cch-CAS_038-1D-lcwgs-1-2	14.0%	41.7%	97.4%	17.2%
Cch-CAS_039-11C-lcwgs-1-2	15.3%	41.6%	97.6%	7.4%
Cch-CAS_041-10C-lcwgs-1-2	10.7%	41.2%	97.2%	15.1%
Cch-CAS_042-4A-lcwgs-1-2	17.4%	42.1%	97.6%	3.3%
Cch-CAS_043-10D-lcwgs-1-2	12.3%	41.5%	97.2%	12.2%
Cch-CAS_044-2E-lcwgs-1-2	13.9%	41.5%	97.4%	16.6%
Cch-CAS_045-11D-lcwgs-1-2	16.5%	41.4%	97.6%	6.7%
Cch-CAS_046-10F-lcwgs-1-2	14.8%	41.9%	97.5%	12.4%
Cch-CAS_047-8G-lcwgs-1-2	15.2%	41.8%	97.5%	7.2%
Cch-CAS_048-8D-lcwgs-1-2	15.5%	41.6%	97.6%	10.4%
Cch-CAS_049-3E-lcwgs-1-2	7.4%	41.8%	96.8%	31.9%
Cch-CAS_050-8E-lcwgs-1-2	14.4%	41.8%	97.5%	12.3%
Cch-CBL_001-3C-lcwgs-1-2	16.1%	41.6%	97.5%	8.1%
Cch-CBL_002-4C-lcwgs-1-2	28.2%	41.6%	97.7%	2.4%
Cch-CBL_003-1H-lcwgs-1-2	15.2%	41.7%	97.5%	9.9%
Cch-CBL_004-5H-lcwgs-1-2	29.9%	41.8%	97.6%	4.2%
Cch-CBL_005-4C-lcwgs-1-2	14.7%	41.6%	97.3%	12.7%
Cch-CBL_006-12D-lcwgs-1-2	14.9%	42.0%	97.1%	8.8%
Cch-CBL_007-7C-lcwgs-1-2	15.4%	41.6%	97.6%	9.5%
Cch-CBL_008-1G-lcwgs-1-2	12.3%	41.6%	97.1%	15.6%
Cch-CBL_009-9A-lcwgs-1-2	22.4%	41.5%	97.6%	2.3%
Cch-CBL_010-7H-lcwgs-1-2	15.6%	41.6%	97.5%	7.5%
Cch-CBL_011-8B-lcwgs-1-2	13.3%	41.4%	97.3%	9.7%
Cch-CBL_012-8C-lcwgs-1-2	3.7%	41.6%	96.8%	6.6%
Cch-CBL_013-10D-lcwgs-1-2	13.4%	41.5%	97.4%	12.8%
Cch-CBL_014-7F-lcwgs-1-2	18.3%	41.5%	97.5%	3.6%
Cch-CBL_015-10C-lcwgs-1-2	14.7%	41.5%	97.5%	8.4%
Cch-CBL_016-6E-lcwgs-1-2	14.8%	41.4%	97.7%	11.5%
Cch-CBL_017-12C-lcwgs-1-2	15.5%	41.7%	97.5%	14.1%
Cch-CBL_018-11D-lcwgs-1-2	15.8%	41.6%	97.5%	11.6%
Cch-CBL_019-6H-lcwgs-1-2	13.7%	41.8%	97.6%	17.7%
Cch-CBL_020-5E-lcwgs-1-2	14.9%	41.7%	97.5%	15.6%
Cch-CBL_021-6F-lcwgs-1-2	15.0%	41.4%	97.7%	16.6%
Cch-CBL_022-6A-lcwgs-1-2	27.2%	41.7%	97.6%	1.6%
Cch-CBL_023-10A-lcwgs-1-2	31.3%	41.6%	97.7%	1.6%
Cch-CBL_025-12F-lcwgs-1-2	15.2%	41.5%	97.6%	13.5%
Cch-CBL_026-12G-lcwgs-1-2	15.6%	41.5%	97.5%	11.7%
Cch-CBL_028-11G-lcwgs-1-2	16.2%	42.0%	97.5%	5.9%
Cch-CBL_033-11E-lcwgs-1-2	11.7%	41.8%	97.3%	20.2%
Cch-CBL_034-2F-lcwgs-1-2	16.1%	41.4%	97.5%	9.7%
Cch-CBL_035-3A-lcwgs-1-2	2.3%	41.6%	96.6%	6.8%
Cch-CBL_037-4D-lcwgs-1-2	15.2%	41.9%	97.6%	8.7%
Cch-CBL_038-9G-lcwgs-1-2	15.2%	41.7%	97.5%	8.5%
Cch-CBL_039-9A-lcwgs-1-2	16.3%	40.8%	97.7%	15.1%
Cch-CBL_040-1G-lcwgs-1-2	14.6%	41.8%	97.4%	9.1%
Cch-CBL_041-8B-lcwgs-1-2	15.2%	41.8%	97.5%	5.9%
Cch-CBL_042-7A-lcwgs-1-2	37.8%	41.8%	97.7%	1.5%
Cch-CBL_043-9E-lcwgs-1-2	14.5%	41.6%	97.5%	15.5%
Cch-CBL_044-1A-lcwgs-1-2	15.7%	41.5%	97.2%	6.5%
Cch-CBL_045-9H-lcwgs-1-2	15.4%	41.7%	97.7%	8.7%
Cch-CBL_046-12D-lcwgs-1-2	14.7%	41.6%	97.4%	13.4%
Cch-CBL_047-4A-lcwgs-1-2	14.7%	41.6%	97.4%	8.0%
Cch-CBS_001-5F-lcwgs-1-2	15.7%	41.7%	97.4%	9.0%
Cch-CBS_002-11F-lcwgs-1-2	32.8%	41.8%	97.6%	3.6%
Cch-CBS_003-6G-lcwgs-1-2	19.8%	41.6%	97.6%	3.5%
Cch-CBS_004-8F-lcwgs-1-2	15.6%	41.8%	97.5%	7.3%
Cch-CBS_005-12A-lcwgs-1-2	16.3%	41.8%	97.5%	10.6%
Cch-CBS_007-5C-lcwgs-1-2	14.9%	41.7%	97.5%	12.0%
Cch-CBS_008-5E-lcwgs-1-2	14.6%	41.7%	97.5%	10.3%
Cch-CBS_009-2C-lcwgs-1-2	15.1%	41.7%	97.3%	13.0%
Cch-CBS_010-11F-lcwgs-1-2	16.7%	41.6%	97.5%	8.0%
Cch-CBS_011-1F-lcwgs-1-2	16.1%	41.9%	97.4%	5.3%
Cch-CBS_012-2H-lcwgs-1-2	15.3%	41.4%	97.2%	12.2%
Cch-CBS_014-2B-lcwgs-1-2	15.3%	41.6%	97.4%	12.1%
Cch-CBS_016-10A-lcwgs-1-2	12.8%	41.5%	97.2%	16.8%
Cch-CBS_017-1F-lcwgs-1-2	12.4%	41.6%	97.3%	18.8%
Cch-CBS_018-8C-lcwgs-1-2	14.7%	41.6%	97.6%	9.9%
Cch-CBS_020-9C-lcwgs-1-2	2.2%	41.6%	96.8%	7.6%
Cch-CBS_022-4F-lcwgs-1-2	15.2%	41.5%	97.4%	9.1%
Cch-CBS_023-3A-lcwgs-1-2	37.9%	41.8%	97.7%	1.8%
Cch-CBS_024-3E-lcwgs-1-2	25.3%	41.4%	97.0%	4.9%
Cch-CBS_025-7E-lcwgs-1-2	14.6%	41.4%	97.8%	17.4%
Cch-CBS_026-5E-lcwgs-1-2	13.2%	41.7%	97.6%	15.5%
Cch-CBS_027-4D-lcwgs-1-2	10.2%	41.6%	97.2%	22.8%
Cch-CBS_028-9D-lcwgs-1-2	15.6%	41.7%	97.6%	9.0%
Cch-CBS_029-4H-lcwgs-1-2	15.0%	41.8%	97.1%	8.7%
Cch-CBS_030-3C-lcwgs-1-2	4.3%	41.6%	96.7%	7.4%
Cch-CBS_031-4A-lcwgs-1-2	21.9%	41.6%	97.7%	2.1%
Cch-CBS_032-12E-lcwgs-1-2	15.7%	41.5%	97.7%	9.7%
Cch-CBS_033-5D-lcwgs-1-2	14.3%	42.1%	97.3%	14.0%
Cch-CBS_037-2B-lcwgs-1-2	13.7%	41.7%	97.1%	13.2%
Cch-CBS_038-7E-lcwgs-1-2	15.8%	41.8%	97.7%	7.1%
Cch-CBS_039-6G-lcwgs-1-2	16.7%	41.5%	97.5%	3.2%
Cch-CBS_040-9C-lcwgs-1-2	16.2%	41.3%	97.7%	16.8%
Cch-CBS_041-6A-lcwgs-1-2	15.3%	41.9%	97.6%	5.6%
Cch-CBS_043-4G-lcwgs-1-2	12.3%	41.5%	97.4%	21.9%
Cch-CBS_044-8F-lcwgs-1-2	15.9%	42.0%	97.7%	7.9%
Cch-CBS_045-6C-lcwgs-1-2	16.0%	41.8%	97.6%	4.7%
Cch-CBS_046-8D-lcwgs-1-2	16.0%	42.1%	97.6%	5.4%
Cch-CBS_047-10F-lcwgs-1-2	15.1%	41.6%	97.2%	10.5%
Cch-CBS_048-10H-lcwgs-1-2	12.3%	41.9%	97.2%	16.8%
Cch-CBS_049-10C-lcwgs-1-2	14.9%	41.9%	97.4%	7.0%
Cch-CBS_050-4G-lcwgs-1-2	14.2%	41.9%	97.5%	9.9%
Cch-CCL_001-3E-lcwgs-1-2	16.3%	42.0%	97.4%	7.8%
Cch-CCL_011-3H-lcwgs-1-2	3.1%	41.6%	96.4%	6.9%
Cch-CCS_001-6D-lcwgs-1-2	16.0%	41.7%	97.5%	8.4%
Cch-CCS_002-4H-lcwgs-1-2	15.7%	41.7%	97.6%	8.5%
Cch-CCS_003-2C-lcwgs-1-2	16.6%	41.8%	97.5%	5.9%
Cch-CCS_004-11H-lcwgs-1-2	15.6%	41.7%	97.5%	8.1%
Cch-CCS_006-1B-lcwgs-1-2	14.5%	41.9%	97.2%	13.1%
Cch-CCS_008-9E-lcwgs-1-2	17.1%	41.3%	97.8%	13.3%
Cch-CCS_011-7F-lcwgs-1-2	14.9%	41.6%	97.8%	15.1%
Cch-CCS_012-9G-lcwgs-1-2	15.2%	41.7%	97.6%	7.8%
Cch-CCS_013-12B-lcwgs-1-2	15.7%	41.7%	97.6%	11.2%
Cch-CCS_014-9G-lcwgs-1-2	16.8%	41.4%	97.6%	10.9%
Cch-CCS_015-3F-lcwgs-1-2	16.8%	42.2%	97.0%	11.4%
Cch-CCS_016-5D-lcwgs-1-2	15.2%	41.6%	97.4%	9.7%
Cch-CCS_018-5F-lcwgs-1-2	16.1%	41.6%	97.4%	7.2%
Cch-CCS_019-12F-lcwgs-1-2	15.7%	41.6%	97.6%	7.8%
Cch-CCS_021-9F-lcwgs-1-2	17.1%	41.6%	97.7%	15.1%
Cch-CCS_023-10A-lcwgs-1-2	13.2%	41.6%	97.3%	8.5%
Cch-CCS_024-9B-lcwgs-1-2	15.2%	41.7%	97.6%	9.2%
Cch-CCS_025-6F-lcwgs-1-2	16.4%	41.7%	97.7%	6.4%
Cch-CCS_026-9E-lcwgs-1-2	15.7%	41.9%	97.6%	7.1%
Cch-CCS_028-3C-lcwgs-1-2	16.1%	42.0%	97.4%	8.5%
Cch-CCS_029-3F-lcwgs-1-2	16.8%	41.6%	97.6%	9.3%
Cch-CCS_030-4C-lcwgs-1-2	17.6%	42.1%	97.6%	2.9%
Cch-CCS_032-9A-lcwgs-1-2	16.1%	41.8%	97.5%	5.3%
Cch-CCS_033-4E-lcwgs-1-2	15.0%	41.8%	97.4%	14.1%
Cch-CCS_034-11E-lcwgs-1-2	16.9%	41.5%	97.6%	6.8%
Cch-CCS_035-2D-lcwgs-1-2	12.4%	41.4%	97.3%	27.7%
Cch-CCS_037-2B-lcwgs-1-2	12.9%	41.6%	97.1%	18.6%
Cch-CCS_038-3B-lcwgs-1-2	16.9%	41.7%	97.2%	4.9%
Cch-CCS_039-12B-lcwgs-1-2	14.3%	41.4%	97.5%	9.7%
Cch-CCS_040-1D-lcwgs-1-2	15.9%	41.8%	97.4%	5.7%
Cch-CCS_041-7H-lcwgs-1-2	15.1%	41.7%	97.7%	11.9%
Cch-CCS_042-12H-lcwgs-1-2	14.7%	41.4%	97.6%	8.4%
Cch-CCS_043-12C-lcwgs-1-2	15.7%	41.7%	97.5%	10.4%
Cch-CCS_044-12B-lcwgs-1-2	15.3%	41.7%	97.6%	9.8%
Cch-CCS_045-5A-lcwgs-1-2	16.1%	41.8%	97.5%	5.7%
Cch-CCS_046-4B-lcwgs-1-2	14.9%	41.7%	97.3%	11.3%
Cch-CCS_047-4F-lcwgs-1-2	15.3%	41.9%	97.5%	8.0%
Cch-CCS_048-3D-lcwgs-1-2	2.7%	41.6%	96.8%	7.3%
Cch-CCS_049-1H-lcwgs-1-2	15.6%	41.6%	97.4%	5.2%
Cch-CCS_050-1C-lcwgs-1-2	15.0%	41.6%	97.5%	11.1%
Cch-CWAL_002-9F-lcwgs-1-2	15.8%	41.8%	97.4%	7.6%
Cch-CWAL_019-2A-lcwgs-1-2	14.9%	41.8%	97.3%	11.0%
Cch-CWAL_025-5G-lcwgs-1-2	15.7%	41.8%	97.5%	9.3%
Cch-CWAL_066-5B-lcwgs-1-2	14.4%	41.6%	97.5%	17.9%
Cch-CWAL_094-1B-lcwgs-1-2	14.8%	41.7%	97.4%	16.8%
Cch-CWAL_136-4G-lcwgs-1-2	15.2%	41.8%	97.4%	9.3%
Cch-CWAL_182-7C-lcwgs-1-2	15.6%	41.9%	97.7%	5.8%
Cch-CWAL_188-10B-lcwgs-1-2	14.3%	41.6%	97.4%	10.7%
Cch-CWAL_228-5B-lcwgs-1-2	15.1%	42.0%	97.4%	7.8%
Cch-CWAL_230-8H-lcwgs-1-2	15.8%	41.7%	97.4%	7.2%
Cch-CWAS_049-12E-lcwgs-1-2	15.2%	42.0%	97.6%	12.2%
Cch-CWAS_057-7G-lcwgs-1-2	15.1%	42.1%	97.6%	7.5%
Cch-CWAS_104-2D-lcwgs-1-2	14.4%	41.9%	97.4%	14.6%
Cch-CWAS_268-1A-lcwgs-1-2	15.1%	42.2%	97.4%	9.1%
Cch-CWAS_296-3D-lcwgs-1-2	14.1%	42.0%	97.3%	15.7%
Cch-CWBL_003-4E-lcwgs-1-2	14.0%	42.2%	97.3%	11.8%
Cch-CWBL_010-10H-lcwgs-1-2	14.2%	41.8%	97.3%	13.4%
Cch-CWBL_044-11B-lcwgs-1-2	12.6%	42.0%	97.3%	16.7%
Cch-CWBL_100-5A-lcwgs-1-2	9.3%	41.8%	97.0%	22.1%
Cch-CWBL_106-12G-lcwgs-1-2	14.8%	41.9%	97.3%	15.2%
Cch-CWBL_156-1A-lcwgs-1-2	16.3%	41.5%	97.6%	14.5%
Cch-CWBL_172-1E-lcwgs-1-2	12.6%	41.8%	97.2%	22.1%
Cch-CWBL_204-3H-lcwgs-1-2	16.4%	42.0%	97.3%	8.9%
Cch-CWBL_217-2A-lcwgs-1-2	15.6%	41.9%	97.5%	9.9%
Cch-CWBL_231-1A-lcwgs-1-2	30.7%	42.2%	97.5%	2.3%
Cch-CWBS_016-4E-lcwgs-1-2	14.5%	41.6%	97.7%	16.8%
Cch-CWBS_053-11F-lcwgs-1-2	15.7%	42.2%	97.5%	10.1%
Cch-CWBS_121-10G-lcwgs-1-2	13.5%	42.0%	97.4%	11.8%
Cch-CWBS_124-7H-lcwgs-1-2	13.5%	42.0%	97.4%	10.7%
Cch-CWBS_152-11A-lcwgs-1-2	14.0%	42.0%	97.4%	8.9%
Cch-CWBS_161-7D-lcwgs-1-2	14.9%	41.6%	97.7%	14.3%
Cch-CWBS_234-8F-lcwgs-1-2	15.6%	42.0%	97.5%	11.5%
Cch-CWBS_252-1G-lcwgs-1-2	16.1%	41.4%	97.7%	10.5%
Cch-CWBS_290-4B-lcwgs-1-2	13.4%	41.9%	97.4%	20.0%
Cch-CWCL_009-9B-lcwgs-1-2	15.8%	41.8%	97.6%	9.6%
Cch-CWCL_016-12A-lcwgs-1-2	14.7%	41.7%	97.5%	12.0%
Cch-CWCL_020-7A-lcwgs-1-2	15.5%	41.8%	97.6%	6.0%
Cch-CWCL_024-4H-lcwgs-1-2	14.0%	41.6%	97.5%	14.0%
Cch-CWCL_026-5F-lcwgs-1-2	16.4%	41.8%	97.7%	8.9%
Cch-CWCL_029-3F-lcwgs-1-2	4.4%	41.6%	96.6%	6.3%
Cch-CWCL_036-7G-lcwgs-1-2	15.5%	41.5%	97.6%	5.8%
Cch-CWCL_046-9H-lcwgs-1-2	16.9%	41.6%	97.6%	10.2%
Cch-CWCL_047-5H-lcwgs-1-2	15.6%	41.7%	97.4%	7.4%
Cch-CWCL_048-3G-lcwgs-1-2	14.2%	41.4%	97.5%	18.1%
Cch-CWCL_050-6A-lcwgs-1-2	15.6%	41.5%	97.5%	4.7%
Cch-CWCL_059-9H-lcwgs-1-2	15.0%	41.8%	97.4%	8.3%
Cch-CWCL_070-11H-lcwgs-1-2	16.2%	41.7%	97.4%	6.6%
Cch-CWCL_090-2E-lcwgs-1-2	16.5%	41.5%	97.6%	11.2%
Cch-CWCL_094-11E-lcwgs-1-2	15.1%	41.9%	97.6%	11.4%
Cch-CWCL_101-8A-lcwgs-1-2	15.2%	41.7%	97.5%	12.5%
Cch-CWCL_112-7A-lcwgs-1-2	15.6%	41.6%	97.7%	10.7%
Cch-CWCL_116-5G-lcwgs-1-2	14.5%	42.0%	97.3%	9.9%
Cch-CWCL_122-8A-lcwgs-1-2	20.4%	41.6%	97.5%	2.3%
Cch-CWCL_123-6B-lcwgs-1-2	17.0%	41.5%	97.6%	4.2%
Cch-CWCL_127-6F-lcwgs-1-2	17.0%	41.6%	97.5%	3.6%
Cch-CWCL_132-8E-lcwgs-1-2	16.0%	41.7%	97.4%	12.0%
Cch-CWCL_134-2A-lcwgs-1-2	14.5%	41.4%	97.4%	15.1%
Cch-CWCL_136-9A-lcwgs-1-2	15.4%	41.5%	97.6%	8.5%
Cch-CWCL_153-6H-lcwgs-1-2	14.3%	41.7%	97.6%	10.1%
Cch-CWCL_155-3H-lcwgs-1-2	14.9%	41.5%	97.5%	16.6%
Cch-CWCL_157-1B-lcwgs-1-2	28.3%	41.9%	97.3%	1.5%
Cch-CWCL_160-7C-lcwgs-1-2	14.7%	41.5%	97.7%	13.0%
Cch-CWCL_177-7F-lcwgs-1-2	15.8%	41.9%	97.7%	9.9%
Cch-CWCL_180-2G-lcwgs-1-2	14.6%	41.9%	97.5%	10.9%
Cch-CWCL_188-10E-lcwgs-1-2	14.6%	41.9%	97.6%	9.0%
Cch-CWCL_192-10B-lcwgs-1-2	14.0%	41.9%	97.4%	10.9%
Cch-CWCL_196-12G-lcwgs-1-2	14.9%	41.7%	97.6%	4.9%
Cch-CWCL_202-2G-lcwgs-1-2	14.0%	41.4%	97.4%	10.1%
Cch-CWCL_206-6G-lcwgs-1-2	15.2%	41.9%	97.6%	5.6%
Cch-CWCL_209-11C-lcwgs-1-2	14.7%	41.5%	97.5%	15.1%
Cch-CWCL_217-10G-lcwgs-1-2	15.0%	41.5%	97.5%	8.8%
Cch-CWCL_220-7A-lcwgs-1-2	14.8%	41.7%	97.4%	8.5%
Cch-CWCL_223-5D-lcwgs-1-2	14.4%	41.7%	97.5%	16.5%
Cch-CWCL_224-2F-lcwgs-1-2	14.6%	41.6%	97.6%	18.3%
Cch-CWCL_226-8E-lcwgs-1-2	15.1%	41.6%	97.5%	14.8%
Cch-CWCL_238-1D-lcwgs-1-2	16.1%	41.4%	97.6%	14.2%
Cch-CWCL_254-2H-lcwgs-1-2	12.5%	41.7%	97.4%	14.2%
Cch-CWCL_256-3A-lcwgs-1-2	16.0%	41.6%	97.5%	10.5%
Cch-CWCL_259-1C-lcwgs-1-2	15.2%	41.5%	97.6%	18.0%
Cch-CWCL_265-6C-lcwgs-1-2	13.7%	41.6%	97.5%	25.0%
Cch-CWCL_279-8B-lcwgs-1-2	14.3%	41.7%	97.5%	10.6%
Cch-CWCS_103-7B-lcwgs-1-2	15.4%	41.8%	97.6%	7.2%
Cch-CWCS_124-4A-lcwgs-1-2	13.9%	41.8%	97.5%	21.3%
Cch-CWCS_126-2G-lcwgs-1-2	15.9%	41.5%	97.4%	9.3%
Cch-CWCS_137-8H-lcwgs-1-2	15.6%	41.7%	97.5%	7.9%
Cch-CWCS_144-6D-lcwgs-1-2	14.8%	41.4%	97.7%	20.0%
Cch-CWCS_146-5G-lcwgs-1-2	15.4%	41.6%	97.5%	11.8%
Cch-CWCS_158-3G-lcwgs-1-2	11.8%	41.4%	96.7%	10.2%
Cch-CWCS_163-8A-lcwgs-1-2	16.6%	41.8%	97.6%	4.9%
Cch-CWCS_271-5A-lcwgs-1-2	14.7%	41.5%	97.6%	9.7%
Cch-CWCS_281-12E-lcwgs-1-2	15.7%	41.5%	97.7%	3.7%

```
</p>
</details>

</details>

<details>
	<summary>9. Remove duplicates with clumpify</summary>

<details> <summary>9a. Remove duplicates</summary>

Running `runCLUMPIFY_r1r2_array.bash`. Waiting on nodes to become available. LW 2023-07-11

CLUMPIFY has finished. LW 2023-07-13

Rerun CLUMPIFY on appended dataset. KL 2023-08-10

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run/
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/hpc-0289 40
```
- job ID: 2093755
- job stuck. I have to do the same strategy with concatenating files separately.

```
mkdir fq_fp1_GotA fq_fp1_GotB fq_fp1_GotC fq_fp1_GotW

# Move the *.fq.gz files from fq_fp1 to their appropriate subdirectores, then run clumpify on each.

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1_GotA fq_fp1_clmp /scratch/hpc-0289 20
# JobID: 2096163

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1_GotB fq_fp1_clmp /scratch/hpc-0289 20
# JobID: 2096184

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1_GotC fq_fp1_clmp /scratch/hpc-0289 20
# JobID: 2096206

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1_GotW fq_fp1_clmp /scratch/hpc-0289 20
# JobID: 2096213

```
- Job stuck again. Identify the stragglers, and redo the run on them. KL 2023-08-11
- Identified 104 stragglers.

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1_stragglers fq_fp1_clmp /scratch/hpc-0289 20
# JobID: 2097402
```
- Job stuck again. Identified 86 stragglers. Rerun. KL 2023-08-12

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1_stragglers fq_fp1_clmp /scratch/hpc-0289 30
# JobID: 2098809
```

Reviewed the logfile for the clmp runs. There seems to be file problems with the stragglers. I need to review these files. KL 2023-08-13
- All files have been processed with MultiQC and checkFQ.sh. I had no reason to believe that they were problematic. 
- Review the stragglers to see what is going on with them. Redo checkFQ.sh again. KL 2023-08-13
- 80 stragglers were indeed problematic i.e., had incorrect fq.gz format. Rerun 1st trim on these files. Store input and output on *_straggler directories.

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1_stragglers fq_fp1_clmp_stragglers /scratch/hpc-0289 40
# JobID: 2102371 
```


Rerun clumpify on fq_fp1_stragglers. KL 2023-08-13/14
- Left with 52 stragglers. However, they are no longer possible to run on Wahab because the disk quota has been exceeded.
- It looks like my disk space has been used up by my scratch directory. I have to clear this one first. In the meantime, I had LWeeks push Gotanco stragglers. 
- Ask Eric for help on clearing the scratch directory.

Problems on memory and scratch directory
- Run clumpify on turing using a himem node. CBird and KL. 2023-08-16

```
# Do in Turing
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array2.bash fq_fp1_stragglers_sub fq_fp1_clmp_stragglers /scratch-lustre/hpc-0289 1 32 350g himem
# Move all output to fq_fp1_clmp directory, and then clean-up work directory 
```
</details>

<details> <summary>9b. Check duplicate removal success</summary>

Due to previous issues woking in R, I ran `module load container_env R/4.2` instead of `module load container_env mapdamage2`. 

`Clumpify Successfully worked on all samples" LW 2023-07-13


Cannot recover all the outfiles from clumpifying the concatenated libraries due to all the reruns made. I did however look at the files using `checkFQ.sh` to see if they are still correctly formatted as fq.gz. KL 2023-08-16

</details>

<details> <summary>9c. Generate metadata on deduplicated FASTQ files</summary>
Running `runMULTIQC.sbatch`. LW 2023-07-13

<details><summary>Expand for MultiQC Output.</summary>

```bash
Insert output here.
```
  
</p>
</details>

Run MultiQC on fq_fp1_clmp. KL 2023-08-16
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco_chanos-chanos/2nd_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report"  "fq.gz"
```
</details>

</details>

<details>
	<summary>10. Second trim</summary>
Ran `runFASTP_2_cssl.sbatch`. LW 2023-07-13

Run second trim. Save in a temp directory in case something goes wrong and I don't want to overwrite the previous result just yet.  KL 2023-08-16
```
mkdir fq_fp1_clmp_fp2_kl
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_2.sbatch fq_fp1_clmp fq_fp1_clmp_fp2_kl 33
```
Second trim worked perfectly. Delete the old files and replace with this one.

<details><summary>Expand for Updated MultiQC Output.</summary>

```bash

Sample Name	% Duplication	GC content	% PF	% Adapter
Cch-CAL_001-5H-lcwgs-1-2.clmp.r1r2_fastp	6.1%	41.6%	99.5%	0.2%
Cch-CAL_003-3G-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.7%	99.5%	0.3%
Cch-CAL_004-7E-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.6%	99.5%	0.4%
Cch-CAL_005-10E-lcwgs-1-2.clmp.r1r2_fastp	2.4%	41.5%	99.5%	0.4%
Cch-CAL_006-10A-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.9%	99.4%	0.4%
Cch-CAL_008-3B-lcwgs-1-2.clmp.r1r2_fastp	0.9%	41.6%	99.1%	0.4%
Cch-CAL_009-3A-lcwgs-1-2.clmp.r1r2_fastp	3.2%	41.9%	99.5%	0.1%
Cch-CAL_011-4D-lcwgs-1-2.clmp.r1r2_fastp	3.2%	41.8%	99.4%	0.9%
Cch-CAL_012-1F-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.3%	99.5%	0.5%
Cch-CAL_013-5C-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.9%	99.5%	0.3%
Cch-CAL_014-12A-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.8%	99.5%	0.3%
Cch-CAL_015-2D-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.4%	99.5%	0.7%
Cch-CAL_016-12C-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.6%	99.5%	0.2%
Cch-CAL_017-4B-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.9%	99.5%	0.3%
Cch-CAL_018-11G-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.6%	99.5%	0.3%
Cch-CAL_019-2A-lcwgs-1-2.clmp.r1r2_fastp	7.4%	41.5%	99.5%	0.1%
Cch-CAL_021-1E-lcwgs-1-2.clmp.r1r2_fastp	2.2%	42.1%	99.5%	0.5%
Cch-CAL_022-2H-lcwgs-1-2.clmp.r1r2_fastp	2.8%	41.7%	99.5%	0.4%
Cch-CAL_023-9B-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.5%	99.5%	0.4%
Cch-CAL_024-8A-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.4%	99.5%	0.1%
Cch-CAL_025-9F-lcwgs-1-2.clmp.r1r2_fastp	3.6%	41.7%	99.5%	0.5%
Cch-CAL_026-2C-lcwgs-1-2.clmp.r1r2_fastp	3.0%	41.3%	99.4%	1.1%
Cch-CAL_027-2E-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.4%	99.5%	0.6%
Cch-CAL_028-1H-lcwgs-1-2.clmp.r1r2_fastp	4.7%	41.4%	99.5%	0.3%
Cch-CAL_029-3B-lcwgs-1-2.clmp.r1r2_fastp	2.4%	41.5%	99.0%	2.1%
Cch-CAL_030-9D-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.4%	99.5%	1.0%
Cch-CAL_031-12F-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.7%	99.5%	0.6%
Cch-CAL_034-11A-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.7%	99.5%	0.2%
Cch-CAL_036-3D-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.8%	99.5%	0.4%
Cch-CAL_038-11A-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.7%	99.5%	0.4%
Cch-CAL_039-12A-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.9%	99.5%	0.3%
Cch-CAL_040-6D-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.5%	99.5%	0.2%
Cch-CAL_041-12H-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.5%	99.5%	0.2%
Cch-CAL_042-9C-lcwgs-1-2.clmp.r1r2_fastp	3.6%	41.6%	99.4%	0.7%
Cch-CAL_043-2F-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.6%	99.5%	0.5%
Cch-CAL_044-1E-lcwgs-1-2.clmp.r1r2_fastp	3.3%	41.5%	99.5%	1.0%
Cch-CAL_045-11D-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.8%	99.5%	0.3%
Cch-CAL_046-8C-lcwgs-1-2.clmp.r1r2_fastp	3.3%	41.7%	99.4%	1.2%
Cch-CAL_049-4F-lcwgs-1-2.clmp.r1r2_fastp	3.5%	41.5%	99.4%	1.0%
Cch-CAL_050-11B-lcwgs-1-2.clmp.r1r2_fastp	3.3%	41.6%	99.4%	0.6%
Cch-CAS_001-10B-lcwgs-1-2.clmp.r1r2_fastp	4.9%	41.6%	99.5%	0.2%
Cch-CAS_002-7D-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.6%	99.5%	0.4%
Cch-CAS_004-12H-lcwgs-1-2.clmp.r1r2_fastp	4.4%	41.9%	99.5%	0.3%
Cch-CAS_005-8H-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.9%	99.5%	0.5%
Cch-CAS_006-5A-lcwgs-1-2.clmp.r1r2_fastp	13.4%	42.0%	99.4%	0.1%
Cch-CAS_007-7G-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.6%	99.5%	0.4%
Cch-CAS_008-6E-lcwgs-1-2.clmp.r1r2_fastp	4.6%	41.9%	99.5%	0.2%
Cch-CAS_009-5C-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.4%	99.5%	0.4%
Cch-CAS_010-7B-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.5%	99.5%	0.3%
Cch-CAS_011-8D-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.6%	99.4%	0.6%
Cch-CAS_012-10H-lcwgs-1-2.clmp.r1r2_fastp	3.5%	41.5%	99.4%	0.4%
Cch-CAS_013-11A-lcwgs-1-2.clmp.r1r2_fastp	5.8%	41.7%	99.5%	0.1%
Cch-CAS_014-6A-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.5%	99.4%	0.5%
Cch-CAS_015-10F-lcwgs-1-2.clmp.r1r2_fastp	3.1%	41.5%	99.3%	0.9%
Cch-CAS_016-6C-lcwgs-1-2.clmp.r1r2_fastp	4.5%	41.6%	99.5%	0.2%
Cch-CAS_017-11H-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.8%	99.5%	0.3%
Cch-CAS_018-12D-lcwgs-1-2.clmp.r1r2_fastp	3.5%	41.6%	99.5%	0.5%
Cch-CAS_019-5B-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.6%	99.5%	0.5%
Cch-CAS_021-6E-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.7%	99.4%	0.3%
Cch-CAS_022-8G-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.6%	99.5%	0.3%
Cch-CAS_023-10G-lcwgs-1-2.clmp.r1r2_fastp	1.7%	41.8%	99.0%	2.8%
Cch-CAS_024-11G-lcwgs-1-2.clmp.r1r2_fastp	4.4%	41.4%	99.5%	0.3%
Cch-CAS_025-1C-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.9%	99.5%	0.5%
Cch-CAS_026-10E-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.6%	99.5%	0.4%
Cch-CAS_027-7B-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.6%	99.5%	0.6%
Cch-CAS_029-8G-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.5%	99.4%	0.4%
Cch-CAS_030-7D-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.6%	99.5%	0.2%
Cch-CAS_031-9D-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.7%	99.5%	0.3%
Cch-CAS_032-11C-lcwgs-1-2.clmp.r1r2_fastp	4.4%	41.5%	99.6%	0.1%
Cch-CAS_033-10D-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.5%	99.4%	0.3%
Cch-CAS_034-6H-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.8%	99.4%	0.3%
Cch-CAS_035-6B-lcwgs-1-2.clmp.r1r2_fastp	3.2%	41.4%	99.5%	0.9%
Cch-CAS_037-11B-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.6%	99.4%	0.5%
Cch-CAS_038-1D-lcwgs-1-2.clmp.r1r2_fastp	3.6%	41.7%	99.5%	0.8%
Cch-CAS_039-11C-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.6%	99.5%	0.3%
Cch-CAS_041-10C-lcwgs-1-2.clmp.r1r2_fastp	2.9%	41.2%	99.4%	0.6%
Cch-CAS_042-4A-lcwgs-1-2.clmp.r1r2_fastp	4.7%	42.1%	99.5%	0.2%
Cch-CAS_043-10D-lcwgs-1-2.clmp.r1r2_fastp	3.3%	41.5%	99.4%	0.5%
Cch-CAS_044-2E-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.5%	99.4%	1.0%
Cch-CAS_045-11D-lcwgs-1-2.clmp.r1r2_fastp	2.7%	41.4%	99.5%	0.2%
Cch-CAS_046-10F-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.9%	99.5%	0.5%
Cch-CAS_047-8G-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.8%	99.5%	0.3%
Cch-CAS_048-8D-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.6%	99.5%	0.6%
Cch-CAS_049-3E-lcwgs-1-2.clmp.r1r2_fastp	1.6%	41.7%	99.0%	2.6%
Cch-CAS_050-8E-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.8%	99.4%	0.6%
Cch-CBL_001-3C-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.6%	99.5%	0.4%
Cch-CBL_002-4C-lcwgs-1-2.clmp.r1r2_fastp	9.4%	41.7%	99.4%	0.1%
Cch-CBL_003-1H-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.7%	99.5%	0.4%
Cch-CBL_004-5H-lcwgs-1-2.clmp.r1r2_fastp	9.9%	41.8%	99.4%	0.2%
Cch-CBL_005-4C-lcwgs-1-2.clmp.r1r2_fastp	3.6%	41.6%	99.5%	0.6%
Cch-CBL_006-12D-lcwgs-1-2.clmp.r1r2_fastp	3.8%	42.0%	99.5%	0.4%
Cch-CBL_007-7C-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.6%	99.5%	0.4%
Cch-CBL_008-1G-lcwgs-1-2.clmp.r1r2_fastp	3.2%	41.6%	99.3%	1.1%
Cch-CBL_009-9A-lcwgs-1-2.clmp.r1r2_fastp	6.7%	41.5%	99.5%	0.1%
Cch-CBL_010-7H-lcwgs-1-2.clmp.r1r2_fastp	2.2%	43.3%	99.5%	0.2%
Cch-CBL_011-8B-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.4%	99.5%	0.4%
Cch-CBL_012-8C-lcwgs-1-2.clmp.r1r2_fastp	1.0%	41.6%	99.2%	0.3%
Cch-CBL_013-10D-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.5%	99.5%	0.5%
Cch-CBL_014-7F-lcwgs-1-2.clmp.r1r2_fastp	5.0%	41.5%	99.5%	0.2%
Cch-CBL_015-10C-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.5%	99.5%	0.3%
Cch-CBL_016-6E-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.4%	99.5%	0.6%
Cch-CBL_017-12C-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.7%	99.5%	0.6%
Cch-CBL_018-11D-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.6%	99.5%	0.4%
Cch-CBL_019-6H-lcwgs-1-2.clmp.r1r2_fastp	3.4%	41.8%	99.4%	1.1%
Cch-CBL_020-5E-lcwgs-1-2.clmp.r1r2_fastp	3.6%	41.7%	99.5%	0.7%
Cch-CBL_021-6F-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.4%	99.5%	0.7%
Cch-CBL_022-6A-lcwgs-1-2.clmp.r1r2_fastp	8.6%	41.7%	99.4%	0.1%
Cch-CBL_023-10A-lcwgs-1-2.clmp.r1r2_fastp	11.0%	41.6%	99.4%	0.1%
Cch-CBL_025-12F-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.5%	99.4%	0.7%
Cch-CBL_026-12G-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.5%	99.5%	0.5%
Cch-CBL_028-11G-lcwgs-1-2.clmp.r1r2_fastp	2.5%	42.0%	99.5%	0.3%
Cch-CBL_033-11E-lcwgs-1-2.clmp.r1r2_fastp	2.7%	41.8%	99.3%	1.3%
Cch-CBL_034-2F-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.5%	99.5%	0.4%
Cch-CBL_035-3A-lcwgs-1-2.clmp.r1r2_fastp	0.7%	41.6%	99.2%	0.3%
Cch-CBL_037-4D-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.9%	99.5%	0.4%
Cch-CBL_038-9G-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.7%	99.4%	0.4%
Cch-CBL_039-9A-lcwgs-1-2.clmp.r1r2_fastp	4.0%	40.8%	99.5%	0.5%
Cch-CBL_040-1G-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.8%	99.5%	0.4%
Cch-CBL_041-8B-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.8%	99.4%	0.3%
Cch-CBL_042-7A-lcwgs-1-2.clmp.r1r2_fastp	13.8%	41.9%	99.4%	0.1%
Cch-CBL_043-9E-lcwgs-1-2.clmp.r1r2_fastp	3.6%	41.6%	99.4%	0.9%
Cch-CBL_044-1A-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.5%	99.5%	0.2%
Cch-CBL_045-9H-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.7%	99.5%	0.4%
Cch-CBL_046-12D-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.6%	99.5%	0.5%
Cch-CBL_047-4A-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.6%	99.5%	0.3%
Cch-CBS_001-5F-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.7%	99.5%	0.4%
Cch-CBS_002-11F-lcwgs-1-2.clmp.r1r2_fastp	11.1%	41.8%	99.4%	0.2%
Cch-CBS_003-6G-lcwgs-1-2.clmp.r1r2_fastp	5.7%	41.6%	99.5%	0.2%
Cch-CBS_004-8F-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.8%	99.4%	0.3%
Cch-CBS_005-12A-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.8%	99.5%	0.3%
Cch-CBS_007-5C-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.7%	99.5%	0.5%
Cch-CBS_008-5E-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.7%	99.4%	0.5%
Cch-CBS_009-2C-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.7%	99.5%	0.5%
Cch-CBS_010-11F-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.6%	99.5%	0.3%
Cch-CBS_011-1F-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.9%	99.5%	0.2%
Cch-CBS_012-2H-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.5%	99.5%	0.4%
Cch-CBS_014-2B-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.6%	99.5%	0.5%
Cch-CBS_016-10A-lcwgs-1-2.clmp.r1r2_fastp	3.5%	41.5%	99.4%	0.7%
Cch-CBS_017-1F-lcwgs-1-2.clmp.r1r2_fastp	3.1%	41.6%	99.3%	1.2%
Cch-CBS_018-8C-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.6%	99.5%	0.6%
Cch-CBS_020-9C-lcwgs-1-2.clmp.r1r2_fastp	0.6%	41.6%	99.1%	0.4%
Cch-CBS_022-4F-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.5%	99.5%	0.4%
Cch-CBS_023-3A-lcwgs-1-2.clmp.r1r2_fastp	13.6%	41.8%	99.3%	0.1%
Cch-CBS_024-3E-lcwgs-1-2.clmp.r1r2_fastp	9.3%	41.6%	99.1%	0.4%
Cch-CBS_025-7E-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.4%	99.5%	0.6%
Cch-CBS_026-5E-lcwgs-1-2.clmp.r1r2_fastp	3.3%	41.7%	99.4%	1.2%
Cch-CBS_027-4D-lcwgs-1-2.clmp.r1r2_fastp	2.3%	41.6%	99.3%	1.3%
Cch-CBS_028-9D-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.7%	99.5%	0.3%
Cch-CBS_029-4H-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.8%	99.5%	0.4%
Cch-CBS_030-3C-lcwgs-1-2.clmp.r1r2_fastp	1.2%	41.6%	99.2%	0.4%
Cch-CBS_031-4A-lcwgs-1-2.clmp.r1r2_fastp	6.4%	41.6%	99.5%	0.1%
Cch-CBS_032-12E-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.5%	99.5%	0.4%
Cch-CBS_033-5D-lcwgs-1-2.clmp.r1r2_fastp	3.5%	42.1%	99.4%	0.7%
Cch-CBS_037-2B-lcwgs-1-2.clmp.r1r2_fastp	3.4%	41.7%	99.4%	0.7%
Cch-CBS_038-7E-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.8%	99.5%	0.3%
Cch-CBS_039-6G-lcwgs-1-2.clmp.r1r2_fastp	4.9%	41.5%	99.5%	0.1%
Cch-CBS_040-9C-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.3%	99.5%	0.7%
Cch-CBS_041-6A-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.9%	99.4%	0.2%
Cch-CBS_043-4G-lcwgs-1-2.clmp.r1r2_fastp	3.0%	41.5%	99.4%	1.3%
Cch-CBS_044-8F-lcwgs-1-2.clmp.r1r2_fastp	4.2%	42.0%	99.5%	0.4%
Cch-CBS_045-6C-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.8%	99.5%	0.2%
Cch-CBS_046-8D-lcwgs-1-2.clmp.r1r2_fastp	4.3%	42.1%	99.5%	0.2%
Cch-CBS_047-10F-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.6%	99.4%	0.5%
Cch-CBS_048-10H-lcwgs-1-2.clmp.r1r2_fastp	3.1%	41.9%	99.3%	1.1%
Cch-CBS_049-10C-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.9%	99.5%	0.3%
Cch-CBS_050-4G-lcwgs-1-2.clmp.r1r2_fastp	3.5%	41.9%	99.5%	0.5%
Cch-CCL_001-3E-lcwgs-1-2.clmp.r1r2_fastp	4.2%	42.0%	99.5%	0.4%
Cch-CCL_011-3H-lcwgs-1-2.clmp.r1r2_fastp	0.9%	41.6%	99.2%	0.3%
Cch-CCS_001-6D-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.7%	99.5%	0.4%
Cch-CCS_002-4H-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.7%	99.5%	0.3%
Cch-CCS_003-2C-lcwgs-1-2.clmp.r1r2_fastp	4.5%	41.8%	99.5%	0.2%
Cch-CCS_004-11H-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.7%	99.5%	0.3%
Cch-CCS_006-1B-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.9%	99.4%	0.7%
Cch-CCS_008-9E-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.3%	99.5%	0.5%
Cch-CCS_011-7F-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.6%	99.5%	0.8%
Cch-CCS_012-9G-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.7%	99.5%	0.3%
Cch-CCS_013-12B-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.7%	99.5%	0.4%
Cch-CCS_014-9G-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.4%	99.5%	0.5%
Cch-CCS_015-3F-lcwgs-1-2.clmp.r1r2_fastp	4.3%	42.2%	99.5%	0.5%
Cch-CCS_016-5D-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.6%	99.5%	0.4%
Cch-CCS_018-5F-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.7%	99.4%	0.3%
Cch-CCS_019-12F-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.6%	99.5%	0.3%
Cch-CCS_021-9F-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.6%	99.5%	0.6%
Cch-CCS_023-10A-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.6%	99.5%	0.2%
Cch-CCS_024-9B-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.7%	99.5%	0.4%
Cch-CCS_025-6F-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.7%	99.5%	0.3%
Cch-CCS_026-9E-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.9%	99.5%	0.3%
Cch-CCS_028-3C-lcwgs-1-2.clmp.r1r2_fastp	4.2%	42.0%	99.5%	0.4%
Cch-CCS_029-3F-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.6%	99.5%	0.4%
Cch-CCS_030-4C-lcwgs-1-2.clmp.r1r2_fastp	4.8%	42.1%	99.5%	0.1%
Cch-CCS_032-9A-lcwgs-1-2.clmp.r1r2_fastp	4.4%	41.8%	99.5%	0.2%
Cch-CCS_033-4E-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.8%	99.5%	0.6%
Cch-CCS_034-11E-lcwgs-1-2.clmp.r1r2_fastp	4.6%	41.5%	99.6%	0.1%
Cch-CCS_035-2D-lcwgs-1-2.clmp.r1r2_fastp	2.9%	41.3%	99.4%	1.3%
Cch-CCS_037-2B-lcwgs-1-2.clmp.r1r2_fastp	3.3%	41.6%	99.4%	1.0%
Cch-CCS_038-3B-lcwgs-1-2.clmp.r1r2_fastp	4.7%	41.7%	99.4%	0.2%
Cch-CCS_039-12B-lcwgs-1-2.clmp.r1r2_fastp	3.6%	41.4%	99.5%	0.4%
Cch-CCS_040-1D-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.8%	99.5%	0.3%
Cch-CCS_041-7H-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.7%	99.5%	0.5%
Cch-CCS_042-12H-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.4%	99.5%	0.4%
Cch-CCS_043-12C-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.7%	99.5%	0.4%
Cch-CCS_044-12B-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.7%	99.5%	0.4%
Cch-CCS_045-5A-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.8%	99.5%	0.2%
Cch-CCS_046-4B-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.7%	99.5%	0.4%
Cch-CCS_047-4F-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.9%	99.5%	0.4%
Cch-CCS_048-3D-lcwgs-1-2.clmp.r1r2_fastp	0.8%	41.6%	99.2%	0.4%
Cch-CCS_049-1H-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.6%	99.5%	0.1%
Cch-CCS_050-1C-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.6%	99.5%	0.5%
Cch-CWAL_002-9F-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.8%	99.5%	0.3%
Cch-CWAL_019-2A-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.8%	99.5%	0.4%
Cch-CWAL_025-5G-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.8%	99.5%	0.4%
Cch-CWAL_066-5B-lcwgs-1-2.clmp.r1r2_fastp	3.6%	41.6%	99.5%	0.7%
Cch-CWAL_094-1B-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.7%	99.4%	0.9%
Cch-CWAL_136-4G-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.8%	99.5%	0.4%
Cch-CWAL_182-7C-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.9%	99.5%	0.3%
Cch-CWAL_188-10B-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.6%	99.5%	0.4%
Cch-CWAL_228-5B-lcwgs-1-2.clmp.r1r2_fastp	4.0%	42.0%	99.4%	0.4%
Cch-CWAL_230-8H-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.7%	99.4%	0.3%
Cch-CWAS_049-12E-lcwgs-1-2.clmp.r1r2_fastp	3.8%	42.0%	99.5%	0.5%
Cch-CWAS_057-7G-lcwgs-1-2.clmp.r1r2_fastp	3.9%	42.1%	99.5%	0.4%
Cch-CWAS_104-2D-lcwgs-1-2.clmp.r1r2_fastp	3.5%	41.9%	99.4%	0.8%
Cch-CWAS_268-1A-lcwgs-1-2.clmp.r1r2_fastp	4.0%	42.2%	99.4%	0.4%
Cch-CWAS_296-3D-lcwgs-1-2.clmp.r1r2_fastp	3.6%	41.9%	99.4%	1.1%
Cch-CWBL_003-4E-lcwgs-1-2.clmp.r1r2_fastp	3.5%	42.2%	99.4%	0.6%
Cch-CWBL_010-10H-lcwgs-1-2.clmp.r1r2_fastp	3.6%	41.8%	99.4%	0.6%
Cch-CWBL_044-11B-lcwgs-1-2.clmp.r1r2_fastp	3.2%	42.0%	99.3%	1.2%
Cch-CWBL_100-5A-lcwgs-1-2.clmp.r1r2_fastp	2.3%	41.8%	99.2%	1.6%
Cch-CWBL_106-12G-lcwgs-1-2.clmp.r1r2_fastp	3.6%	41.9%	99.5%	0.7%
Cch-CWBL_156-1A-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.5%	99.5%	0.6%
Cch-CWBL_172-1E-lcwgs-1-2.clmp.r1r2_fastp	3.1%	41.7%	99.4%	1.4%
Cch-CWBL_204-3H-lcwgs-1-2.clmp.r1r2_fastp	4.2%	42.0%	99.5%	0.4%
Cch-CWBL_217-2A-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.9%	99.5%	0.4%
Cch-CWBL_231-1A-lcwgs-1-2.clmp.r1r2_fastp	10.5%	42.2%	99.4%	0.1%
Cch-CWBS_016-4E-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.6%	99.5%	0.7%
Cch-CWBS_053-11F-lcwgs-1-2.clmp.r1r2_fastp	4.1%	42.2%	99.5%	0.5%
Cch-CWBS_121-10G-lcwgs-1-2.clmp.r1r2_fastp	3.8%	42.0%	99.4%	0.5%
Cch-CWBS_124-7H-lcwgs-1-2.clmp.r1r2_fastp	3.8%	42.0%	99.4%	0.7%
Cch-CWBS_152-11A-lcwgs-1-2.clmp.r1r2_fastp	3.6%	42.0%	99.4%	0.4%
Cch-CWBS_161-7D-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.6%	99.5%	0.6%
Cch-CWBS_234-8F-lcwgs-1-2.clmp.r1r2_fastp	4.0%	42.0%	99.5%	0.5%
Cch-CWBS_252-1G-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.4%	99.5%	0.5%
Cch-CWBS_290-4B-lcwgs-1-2.clmp.r1r2_fastp	3.4%	41.9%	99.4%	1.0%
Cch-CWCL_009-9B-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.8%	99.5%	0.4%
Cch-CWCL_012-6B-lcwgs-1-2.clmp.r1r2_fastp	5.2%	41.6%	99.5%	0.1%
Cch-CWCL_016-12A-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.7%	99.5%	0.5%
Cch-CWCL_020-7A-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.8%	99.5%	0.3%
Cch-CWCL_024-4H-lcwgs-1-2.clmp.r1r2_fastp	3.0%	41.6%	99.4%	0.7%
Cch-CWCL_026-5F-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.8%	99.5%	0.4%
Cch-CWCL_029-3F-lcwgs-1-2.clmp.r1r2_fastp	1.3%	41.6%	99.1%	0.4%
Cch-CWCL_036-7G-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.5%	99.5%	0.3%
Cch-CWCL_046-9H-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.6%	99.5%	0.4%
Cch-CWCL_047-5H-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.7%	99.5%	0.3%
Cch-CWCL_048-3G-lcwgs-1-2.clmp.r1r2_fastp	3.5%	41.4%	99.5%	0.9%
Cch-CWCL_050-6A-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.5%	99.5%	0.2%
Cch-CWCL_059-9H-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.8%	99.4%	0.4%
Cch-CWCL_070-11H-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.7%	99.5%	0.3%
Cch-CWCL_090-2E-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.5%	99.5%	0.5%
Cch-CWCL_094-11E-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.9%	99.5%	0.5%
Cch-CWCL_101-8A-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.7%	99.5%	0.5%
Cch-CWCL_112-7A-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.6%	99.5%	0.4%
Cch-CWCL_116-5G-lcwgs-1-2.clmp.r1r2_fastp	3.7%	42.0%	99.4%	0.5%
Cch-CWCL_122-8A-lcwgs-1-2.clmp.r1r2_fastp	5.9%	41.6%	99.5%	0.1%
Cch-CWCL_123-6B-lcwgs-1-2.clmp.r1r2_fastp	4.7%	41.5%	99.5%	0.2%
Cch-CWCL_127-6F-lcwgs-1-2.clmp.r1r2_fastp	4.7%	41.6%	99.4%	0.2%
Cch-CWCL_132-8E-lcwgs-1-2.clmp.r1r2_fastp	4.3%	41.7%	99.5%	0.4%
Cch-CWCL_134-2A-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.4%	99.5%	0.6%
Cch-CWCL_136-9A-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.5%	99.5%	0.3%
Cch-CWCL_153-6H-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.7%	99.5%	0.5%
Cch-CWCL_155-3H-lcwgs-1-2.clmp.r1r2_fastp	3.6%	41.5%	99.5%	0.7%
Cch-CWCL_157-1B-lcwgs-1-2.clmp.r1r2_fastp	9.7%	42.0%	99.3%	0.1%
Cch-CWCL_160-7C-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.5%	99.5%	0.5%
Cch-CWCL_177-7F-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.9%	99.5%	0.4%
Cch-CWCL_180-2G-lcwgs-1-2.clmp.r1r2_fastp	3.6%	41.9%	99.5%	0.5%
Cch-CWCL_188-10E-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.9%	99.5%	0.4%
Cch-CWCL_192-10B-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.9%	99.4%	0.5%
Cch-CWCL_196-12G-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.7%	99.5%	0.2%
Cch-CWCL_202-2G-lcwgs-1-2.clmp.r1r2_fastp	3.8%	41.5%	99.4%	0.5%
Cch-CWCL_206-6G-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.9%	99.5%	0.3%
Cch-CWCL_209-11C-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.5%	99.5%	0.6%
Cch-CWCL_217-10G-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.5%	99.4%	0.4%
Cch-CWCL_220-7A-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.7%	99.5%	0.3%
Cch-CWCL_223-5D-lcwgs-1-2.clmp.r1r2_fastp	3.6%	41.7%	99.4%	1.0%
Cch-CWCL_224-2F-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.6%	99.5%	0.7%
Cch-CWCL_226-8E-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.6%	99.5%	0.5%
Cch-CWCL_238-1D-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.4%	99.5%	0.7%
Cch-CWCL_254-2H-lcwgs-1-2.clmp.r1r2_fastp	3.2%	41.7%	99.4%	0.7%
Cch-CWCL_256-3A-lcwgs-1-2.clmp.r1r2_fastp	4.1%	41.6%	99.5%	0.5%
Cch-CWCL_259-1C-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.5%	99.5%	0.8%
Cch-CWCL_265-6C-lcwgs-1-2.clmp.r1r2_fastp	3.2%	41.6%	99.5%	1.1%
Cch-CWCL_279-8B-lcwgs-1-2.clmp.r1r2_fastp	3.7%	41.7%	99.4%	0.5%
Cch-CWCS_103-7B-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.8%	99.5%	0.3%
Cch-CWCS_124-4A-lcwgs-1-2.clmp.r1r2_fastp	3.4%	41.8%	99.4%	1.3%
Cch-CWCS_126-2G-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.5%	99.5%	0.4%
Cch-CWCS_137-8H-lcwgs-1-2.clmp.r1r2_fastp	4.0%	41.7%	99.5%	0.3%
Cch-CWCS_144-6D-lcwgs-1-2.clmp.r1r2_fastp	3.5%	41.4%	99.5%	0.7%
Cch-CWCS_146-5G-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.6%	99.5%	0.5%
Cch-CWCS_158-3G-lcwgs-1-2.clmp.r1r2_fastp	3.5%	41.4%	99.3%	0.6%
Cch-CWCS_163-8A-lcwgs-1-2.clmp.r1r2_fastp	4.5%	41.8%	99.5%	0.2%
Cch-CWCS_271-5A-lcwgs-1-2.clmp.r1r2_fastp	3.9%	41.5%	99.5%	0.4%
Cch-CWCS_281-12E-lcwgs-1-2.clmp.r1r2_fastp	4.2%	41.5%	99.5%	0.1%

```

</p>
</details>

</details>

<details>
	<summary>11. Decontaminate files</summary>

Running `runFQSCRN_6.bash`. LW 2023-07-13

Took 2 days to finish, 5 reads did not run correctly. Moved these reads to `fq_fp1_clmp_fp2_stragglers` and restarted them. LW 2023-07-17

Run fqscrn on concatenated data files. KL 2023-08-17
- Job ID 2116907

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn_kl 20
```

- first run finished on 2023-08-19, but I get 79 stragglers (i.e., no reads, input/output error)
- figure out what those are, put them in a straggler directory, and then rerun

Rerun stragglers. KL 2023-08-19

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2_stragglers fq_fp1_clmp_fp2_fqscrn_kl 20
```
- job ID: 2128024
- second run cancelled on 2023-08-19; 52 stragglers remain.

Reorganize straggler directory and rerun stragglers. Use fewer nodes this time. KL 2023-08-19

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2_stragglers fq_fp1_clmp_fp2_fqscrn_kl 5
```
- job ID: 2129654
- third run finished; 46 stragglers remain; consider running on himem for, but for now, consider using 1 node and see what happens. 

Reorganize straggler directory and rerun stragglers. Use a single node and check progress. KL 2023-08-20

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2_stragglers fq_fp1_clmp_fp2_fqscrn_kl 1
```

```
# Run on turing
# Copy script to working directory and change partition from main to himem. Rename script afterwards.

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run
bash ./runFQSCRN_6-himem.bash fq_fp1_clmp_fp2_stragglers fq_fp1_clmp_fp2_fqscrn_kl 5

```
- job ID: 10535715
- finished with 41 stragglers remaining; raise the problem again with CBird

Reorganize, rerun. 2023-08-22

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run
bash ./runFQSCRN_6-himem.bash fq_fp1_clmp_fp2_stragglers fq_fp1_clmp_fp2_fqscrn 5

```
- job ID: 10536824
- job failed; rerun using CBird's solution, that is to use /scratch/hpc-0289/ as the output directory.

Rerun straggler directory. 2023-08-22
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run

bash # only run if not already in bash

fqScrnPATH=/home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash
indir=fq_fp1_clmp_fp2
outdir=/scratch/hpc-0289/fq_fp1_clmp_fp2_fqscrn
nodes=20

bash $fqScrnPATH $indir $outdir $nodes
```
- job ID: 2141391
- job failed; we are still running out of disk space
- follow Min's directions next run

Do fqscrn with Min's revised script. 2023-08-25
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run

# Purge scratch directory
rm -r /scratch/hpc-0289/fq_fp1_clmp_fp2_fqscrn

# Create a directory to test min's script
mkdir fq_fp1_clmp_fp2_stragglers_min-test

# Move several files to the test directory
mv fq_fp1_clmp_fp2_stragglers/*CC*.fq.gz fq_fp1_clmp_fp2_stragglers_min-test
# Total input file size: 51 Gb (6 files) 

# Copy runFQSCRN_6.bash, change file name to runFQSCRN_6-min.bash, then edit the script to redirect the sbatch to /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6_min.sbatch

# Run using scratch as the output directory:
bash ./runFQSCRN_6-min.bash fq_fp1_clmp_fp2_stragglers_min-test /scratch/hpc-0289/fq_fp1_clmp_fp2_fqscrn 6
```
- job ID: 2148026
- job finished, but with several issues
	1. the *screen.html files were not generated
	2. the output *fastq files were not zipped

### Notes on this run ###
I ran Min's `runFQSCRN_6_min.sbatch` for a subset of the straggler files (6 of 41). Here are some notes on this run:

- Input file size (*fp2): 51 Gb
- Output file size (*fqscrn; directed at scratch directory):  534 Gb
- Output files did not have (1) *screen.html files and (2) were not compressed (i.e., I got *fastq instead of *fastq.gz.) 

If I understood correctly the conversation with Min, the changes in the output files were because of his modified script.
######


- Chris instructed to proceed doing the fastq_screen with the remaining samples, and just manually zip the output.
- Prepare a .sbatch script to zip the fastq files.
	- Compression worked. Both input *fastq and output *fastq.gz had the correct fastq format and had equal line numbers.


Run fqscrn on the remaining stragglers.

```
bash ./runFQSCRN_6-min.bash fq_fp1_clmp_fp2_straggler /scratch/hpc-0289/fq_fp1_clmp_fp2_fqscrn_2 20
```
- job ID: 2149416
- Min's updated script produced the correct number of output files (*screen.html, *screen.txt, *screen.png, *tagged.fastq, *tagged_filter.fastq)
- The *fastq files were still not compressed. I will manually compress them similar to what I did in the previous run.
- I still ran out of disk space; my scratch directory is now at 2.5 Tb. 
- There are 8 stragglers remaining. I will rerun them once all the files from the scratch directory have been compressed and transferred to the gotanco working directory, and after I clear my scratch directory.

The for loop script I wrote is taking too long (20 files in 22 h). I modified the script allowing for parallel runs.
- Run compression in parallel.
- With how the script works, compression is done within the scratch directory, and then the resulting *fastq.gz files are moved to the working directory. Since my scratch is nearly full, I can only did 8 at a time to allow for sufficient space during the process.


Compression completed, but not all files had the correct *.fastq format.
- Reorganize the files, then rerun fqscrn on those that failed.
- After everything, I am left with 36 stragglers for processing. 

Rerun fqscrn on stragglers. KL 2023-08-30
- Total file size remaining is 319 Gb. There is a risk that my scratch directory will be overwhelmed yet again once these files are being unzipped during fastq_screen. I decided to divide the number of files in half, and then run with fewer nodes.
- I created another subdir containing a subset of straggler files
```
bash ./runFQSCRN_6-min.bash fq_fp1_clmp_fp2_stragglers_CW /scratch/hpc-0289/fq_fp1_clmp_fp2_fqscrn 5
# no. of files: 20 (size = 118Gb)
```
- job ID: 2164734
- job finished; compressing files using Min's pigz method
- compression done; checking if all fastq files have the correct format
- moved all output files to working directory

Rerun fqscrn on remaining stragglers. KL 2023-08-31
- Total file size remaining is  203 Gb. There is a risk that my scratch directory will be overwhelmed yet again once these files are being unzipped during f>- I created another subdir containing a subset of straggler files
```
bash ./runFQSCRN_6-min.bash fq_fp1_clmp_fp2_stragglers_CBS /scratch/hpc-0289/fq_fp1_clmp_fp2_fqscrn 6
# no. of files: 6 (size = 77 Gb)
```
- job ID: 2168613
- job finished; compressing files using Min's pigz method
- compression done; checking if all fastq files have the correct format
- moved all output files to working directory


Running fqscrn on last batch of stragglers. KL 2023-08-31
```
bash ./runFQSCRN_6-min.bash fq_fp1_clmp_fp2_stragglers /scratch/hpc-0289/fq_fp1_clmp_fp2_fqscrn 10
# no. of files: 10 (size = 126 Gb)
```
- job ID: 2170414
- job finished; 2 files failed 
- compressing files using Min's pigz method
- compression done; checking if all fastq files have the correct format
- moved all output files to working directory


Running fqscrn on last batch of stragglers. KL 2023-08-31
```
bash ./runFQSCRN_6-min.bash fq_fp1_clmp_fp2_stragglers /scratch/hpc-0289/fq_fp1_clmp_fp2_fqscrn 2
# no. of files: 2 (size = 37 Gb)
```
- job ID: 2174411
- job failed;
- there was a problem with running Min's script; the error says: 
	- "No space left on device at /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run/fastq_screen line 1632, <IN_SUBSET> line 1396512096.
Use of uninitialized value $readsprocessed in numeric eq (==) at /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run/fastq_screen line 458, <IN_SUBSET> line 1396512096. 
- this was the same error when we were running out of disk space, so I deleted the fq_raw_cat to make more space (~1 TB)
- error persisted
- I remembered Brendan saying he used the original `runFQSCRN_6.bash`, and it worked fine; tried doing this (job ID: 2175693)
- It worked! All files have now been screened!




<summary>Expand for MultiQC Output.</summary>

```bash
insert multiqc output here
```

</p>
</details>

</details>

<details>
	<summary>12. Execute RePair</summary>
TBD

<details><summary>Expand for MultiQC Output.</summary>

```bash
Insert output here.
```
</details>

Run re-pair. KL 2023-09-03
```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 40
```
- job ID: 2179002

</details>

<details>
	<summary>13. Clean up</summary>
TBD

Due to the problem with git push/pull, EGarcia deprecated the old directory and create a new one. The *fq.gz files were not included, so I should find a way to transfer them to the new directory.
- Use mv for this.
- Files were successfully transferred from the freshly cloned repo. KL 2023-09-13
</details>

<details>
	<summary>14. Perform multi fastqc on several directories</summary>

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run

# fq_raw_cat2
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw_cat2" "fqc_raw_report"  "fq.gz"
# job ID: 2203270
# job got stuck; 34 stragglers remaining.


# fq_fp1_clmp
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report"  "fq.gz"
# job ID: 2203310
# job got stuck; 2 stragglers remaining (Cch-CAS_049, Cch-CAS_023)

# fq_fp1_clmp_fp2_fqscrn
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp_fp2_fqscrn" "fastq_screen_report"  "tagged_filter.fastq.gz"
# job ID: 2203311
# job got stuck; 2 stragglers remaining (Cch-CAS_049, Cch-CAS_023)

# fq_fp1_clmp_fp2_fqscrn_rprd
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "./fq_fp1_clmp_fp2_fqscrn_rprd" "fqc_rprd_report" "fq.gz"
# job ID: 2203312
# job got stuck; 2 stragglers remaining (Cch-CAS_049, Cch-CAS_023)
```

<details> <summary>Notes</summary>

- QC gets stuck for all the files processed.
- LWeeks informed me that it could be due to fault file formats (which I have made sure to check every step).
- I re-checked again, and true enough, I get two raw, concatenated files who were not in the proper format:
	- Cch-CAS_038-1D-lcwgs-1-2.1.fq.gz (GotPopAS38)
	- Cch-CBL_020-5E-lcwgs-1-2.2.fq.gz (GotPopBL20)

- Concatenate the stragglers.
	- Checked fq.gz file format. All is good.
	- Use the custom `catfiles2.sbatch` to concatenate the reads across different sequencing runs.
	- Use `validateFQ.sbatch` to check file formats.
	- Stragglers concatenated successfully.

- Add the stragglers to the fq_raw_cat2_qc_stragglers directory. Run QC
```
# fq_raw_cat2
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw_cat2_qc_stragglers" "fqc_raw_report"  "fq.gz"
# job ID: 2224743
# job stuck; cancelled; MaxVMSize = 151.8 Gb
# Rerun job ID: 2224755
# job stuck (runtime: 2d17h); cancelled; MaxVMSize (152.32 Gb) < ReqMem (341.80 Gb)  
```

- I checked the fq.gz file format for the two qc_stragglers under fq_fp1_clmp.
	- Use `validateFQ.sbatch` to check file format.
	- Both files had the right format. Proceed with Multi_FASTQC.
```
# fq_fp1_clmp
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp_qc_straggler" "fqc_clmp_report"  "fq.gz"
# job ID: 2224747
# job stuck; cancelled; MaxVMSize = 19.60 Gb
# Rerun job ID: 2224753
# job stuck (runtime: 2d17h); cancelled; MaxVMSize (19.46 Gb) < ReqMem (341.80 Gb)	
```

- MultiQC is no longer working despite sufficient memory. This points toward space issues.
- Try moving the directory to my wahab acct and work from there.
```
# rsynced all straggler directories to /home/klab
# perform `Multi-FASTQC.sh` on these directories.
cd ~/PIRE_tmp
rsync /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run/fq_fp1_clmp_qc_straggler .
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp_qc_straggler" "fqc_clmp_report" "fq.gz"


```


</details>

</details>

## Prepare Reference Genome
Preparation of the reference genome was done previously during the processing of the test lane (i.e., 1st_sequencing_run). LWeeks copied and pasted the refGenome directory from the 1st_sequencing_run and copied it to the 2nd_sequencing_run. Since the 1st_sequencing_run directory will be removed from the PIRE repo, I also added the instructions here.

This section prepares the reference genome, which will serve as the scaffold for the assembly. This follows the instructions from [pire_lcwgs_data_processing](https://github.com/philippinespire/pire_lcwgs_data_processing).

<details>
        <summary>1. Get your reference genome</summary>

Run by klabrador on 2023-05-15

Create a new directory for the reference genome
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run
mkdir refGenome
cd ./refGenome
```

Download the reference genome from NCBI through the [RefSeq database](https://ftp.ncbi.nlm.nih.gov/genomes/refseq/). Retrieve the *.fna.gz file for the species.

``` 
wget https://ftp.ncbi.nlm.nih.gov/genomes/refseq/vertebrate_other/Chanos_chanos/latest_assembly_versions/GCF_902362185.1_fChaCha1.1/GCF_902362185.1_fChaCha1.1_genomic.fna.gz
```
- Reference genome successfully downloaded.

</details>


<details>
        <summary>2. Curate the reference genome</summary>

Run by klabrador on 2023-05-15

```
# Get the line number for every chromosome, contig, and scaffold in the genome.
zgrep -n '^>' GCF_902362185.1_fChaCha1.1_genomic.fna.gz > GCF_902362185.1_fChaCha1.1_genomic_linenum.txt

# Extract the mitogenome and save to file
zcat GCF_902362185.1_fChaCha1.1_genomic.fna.gz | tail -n +8211456 > NC_004693.1_mtgenome.fasta

# Extract the chromosomes and save to file. Make sure to use the line number before that of the next accession number in the sequence.
## For example, the line number for the last chromosome of the reference used here (chr16: NC_044510.1) starts at 7969298, followed by an unplaced genomic scaffold (NW_022111401.1) at line number 8201217. This means that chr16 ends at the "line number before that of the next accession number in the sequence" (i.e., 8201216).   
zcat GCF_902362185.1_fChaCha1.1_genomic.fna.gz | head -n 8201216 > NC_044496.1-NC_044510.1_chr1-16.fasta

# Concatenate and the chromosomes and mitogenome into one file.
cat NC_044496.1-NC_044510.1_chr1-16.fasta NC_004693.1_mtgenome.fasta > GCF_902362185.1_fChaCha1.1_chr1-16-mtgen.fasta

```

</details>

## Map reads to reference genome

This section maps the repaired *fq.gz files to the curated reference genome. This follows the instructions from [dDocentHPC](https://github.com/cbirdlab/dDocentHPC).

LWeeks, RRoberts, and EGarcia did initial runs. I'll take a crack at it.

<details>
        <summary>1. Prepare directory for dDocent runs</summary>

* Run by klabrador on 2023-08-01

```
# Create the mkBAM_dev subdirectory in the working directory
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run
mkdir mkBAM


# Link the re-paired *repr.R1/R2.fq.gz files to the mkBAM_dev directory.
ln ./fq_fp1_clmp_fp2_fqscrn_rprd/*repr.R*.fq.gz ./mkBAM
## Notes: I used softlinks before, and it did not work. Hardlinks do.


# Copy the reference genome to the mkBAM_dev directory, then rename the reference to adhere to the pipeline's naming convention ("reference.[AccessionNo].[referenceType].fasta"). 
cp refGenome/GCF_902362185.1_fChaCha1.1_chr1-16-mtgen.fasta ./mkBAM 
cd ./mkBAM
mv GCF_902362185.1_fChaCha1.1_chr1-16-mtgen.fasta reference.902362185.genome.fasta


# Copy scripts needed from the dDocentHPC repo
cd ./mkBAM
cp /home/e1garcia/shotgun_PIRE/dDocentHPC/configs/config.6.lcwgs .
cp /home/e1garcia/shotgun_PIRE/dDocentHPC/dDocentHPC.sbatch .


# Edit the config file to assign the correct ID for the reference genome.
## under mkREF: set Cutoff1 to 902362185
## under mkREF: sete Cutoff2 to genome


```

</details>

<details>
        <summary>2. Run mkBAM</summary>

- Run by klabrador on 2023-08-01

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run/mkBAM
sbatch dDocentHPC.sbatch mkBAM config.6.lcwgs
```

- job submitted: 2016855
- job failed; try to see what went wrong

- job submitted: 2020874
- job completed, but no *.bam.bai file.
- I checked, the *RAW.bam files were also empty.

- Is this another RAM problem?
	- To check, I will run mkBAM on the library with the smallest file size.

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run/fq_fp1_clmp_fp2_fqscrn_rprd
ls -lSh *fq.gz

# look for the smallest library
## Cch-CAS_049-3E-lcwgs-1-2.clmp.fp2_repr: R1 = 6.2M; R2 = 6.3M

# hardlink the file to mkBAM directory
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run/mkBAM
ln ../fq_fp1_clmp_fp2_fqscrn_rprd/Cch-CAS_049*fq.gz .

# Rerun mkBAM
sbatch dDocentHPC.sbatch mkBAM config.6.lcwgs
```
- job submitted: 2024874
- run is stuck... scancel and rerun.

```
sbatch dDocentHPC.sbatch mkBAM config.6.lcwgs
```
- job submitted: 2029525


</details>

## TO BE CONTINUED

<details>
        <summary>3. Run fltrBAM</summary>

- Run by klabrador on 2023-08-02

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run/mkBAM
sbatch dDocentHPC.sbatch fltrBAM config.6.lcwgs
```

- job submitted: 2020931
- job failed;  cannot access '*902362185.genome-RG.bam': No such file or directory


- Run FASTQC
```
# Copy the `runFASTQC.sbatch` script from dDocentHPC repo
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run/mkBAM_dev2
cp /home/e1garcia/shotgun_PIRE/dDocentHPC/scripts/runFASTQC.sbatch .

# Run FASTQC
sbatch runFASTQC.sbatch

```
- job submitted: 1605399
- job failed; error: "These module(s) or extension(s) exist but cannot be loaded as requested"


</details>

<details>
        <summary>4. Generate number of mapped reads</summary>

- Run by klabrador on 2023-05-22
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run/mkBAM_dev2

sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/mappedReadStats.sbatch mkBAM mkBAM/coverageMappedReads

```

- job submitted: 1610256
- job failed. error :'mkBAM/*-RG.bam': No such file or directory 
- change $1 argument in the mappedReadStats.sbatch

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run/mkBAM_dev2

sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/mappedReadStats.sbatch . mkBAM/coverageMappedReads
```
- job submitted: 1610492
- job completed successfully

</details>


<details> <summary>Steps that were not necesssary but were otherwise executed</summary>

<details>
        <summary>3. Run mkVCF</summary>

- Run by klabrador on 2023-05-17
```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/1st_sequencing_run/mkBAM_dev2
sbatch dDocentHPC_dev2.sbatch mkVCF config.6.lcwgs
```

- job submitted: 1605438
- job completed successfully


</details>

