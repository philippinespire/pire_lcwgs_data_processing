## 1. Download data
Data copied from `gotanco_chanos-chanos/2nd_sequencing_run_depracated/fq_raw` and `gotanco_chanos-chanos/3rd_sequencing_run_depracated/fq_raw`   LW 2023-07-09

## 1.5 Concatenate the files
Created a script to concatenate Lanes 2 and 3 into 1 file for each sample run. `catfiles.sbatch`. Successfully concatenated files; new files went into `fq_raw_cat`. LW 2023-07-09

## 2. Proofread the decode files
Decode file does not match the PIRE naming scheme to be able to successfully run scripts down the line, created a new decode file, `Gotanco-Sequencing-DecodeFile.tsv`. 

300 forward reads, 300 reverse reads in both the decode file and in `fq_raw_cat`. LW 2023-07-10

## 3. Edit the decode file
N/A, created a new file.

## 4. Make a copy of the fq_raw files
N/A

## 5. Perform a renaming dry run.
Dry run unsuccessful, renaming does not remove the characters between the sample name and `.fq.gz`. Copied `renameFQGZ.bash` to the gotanco directory and edited the script so that it works with the initial unconvential naming.

After editing, the dry run was successful. LW 2023-07-10

## 6. Rename the files for real
Successfully renamed the files with the edited script. LW 2023-07-10

## 7. Check the quality of your data.
Started `MultiQC`, still running, and still running as of the morning, for 20 hours now. Canceled job. LW 2023-07-11

<details><summary>Expand for MultiQC Output.</summary>

```bash
Insert output here.
```
</p>
</details>

## 8. First trim.
Started the first trim yesterday, finished as of this morning, still have 300 forward and 300 reverse reads in `fq_fp1`. LW 2023-07-11

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Cch-CAL_001-5H-lcwgs-1-2	16.1%	41.7%	97.5%	8.1%
Cch-CAL_003-3G-lcwgs-1-2	2.9%	41.6%	97.1%	5.1%
Cch-CAL_004-7E-lcwgs-1-2	17.0%	41.7%	97.6%	4.6%
Cch-CAL_005-10E-lcwgs-1-2	16.7%	41.5%	97.5%	4.9%
Cch-CAL_006-10A-lcwgs-1-2	15.1%	41.8%	97.5%	7.8%
Cch-CAL_008-3B-lcwgs-1-2	3.0%	41.6%	97.0%	5.8%
Cch-CAL_009-3A-lcwgs-1-2	19.5%	41.8%	97.6%	2.4%
Cch-CAL_011-4D-lcwgs-1-2	14.2%	41.7%	97.5%	8.4%
Cch-CAL_012-1F-lcwgs-1-2	17.9%	41.3%	97.9%	9.7%
Cch-CAL_013-5C-lcwgs-1-2	16.3%	41.9%	97.7%	4.7%
Cch-CAL_014-12A-lcwgs-1-2	15.5%	41.7%	97.5%	8.3%
Cch-CAL_015-2D-lcwgs-1-2	15.0%	41.3%	97.4%	12.3%
Cch-CAL_016-12C-lcwgs-1-2	15.8%	41.6%	97.6%	5.3%
Cch-CAL_017-4B-lcwgs-1-2	15.8%	41.8%	97.7%	4.3%
Cch-CAL_018-11G-lcwgs-1-2	16.2%	41.6%	97.5%	3.7%
Cch-CAL_019-2A-lcwgs-1-2	24.3%	41.5%	97.8%	1.8%
Cch-CAL_021-1E-lcwgs-1-2	15.4%	42.0%	97.4%	7.1%
Cch-CAL_022-2H-lcwgs-1-2	16.0%	41.6%	97.6%	7.5%
Cch-CAL_023-9B-lcwgs-1-2	16.2%	41.4%	97.7%	7.4%
Cch-CAL_024-8A-lcwgs-1-2	14.8%	41.4%	97.5%	8.4%
Cch-CAL_025-9F-lcwgs-1-2	16.5%	41.6%	97.7%	8.0%
Cch-CAL_026-2C-lcwgs-1-2	14.1%	41.1%	97.6%	19.5%
Cch-CAL_027-2E-lcwgs-1-2	15.9%	41.4%	97.3%	10.8%
Cch-CAL_028-1H-lcwgs-1-2	18.2%	41.4%	97.7%	4.2%
Cch-CAL_029-3B-lcwgs-1-2	14.1%	41.2%	97.6%	8.7%
Cch-CAL_030-9D-lcwgs-1-2	17.7%	41.3%	97.9%	20.2%
Cch-CAL_031-12F-lcwgs-1-2	17.1%	41.6%	97.8%	9.8%
Cch-CAL_034-11A-lcwgs-1-2	15.8%	41.6%	97.6%	4.7%
Cch-CAL_036-3D-lcwgs-1-2	17.3%	41.8%	97.3%	6.3%
Cch-CAL_038-11A-lcwgs-1-2	16.7%	41.7%	97.7%	8.5%
Cch-CAL_039-12A-lcwgs-1-2	16.7%	41.8%	97.7%	5.7%
Cch-CAL_040-6D-lcwgs-1-2	15.7%	41.4%	97.6%	3.5%
Cch-CAL_041-12H-lcwgs-1-2	15.8%	41.5%	97.6%	4.4%
Cch-CAL_042-9C-lcwgs-1-2	16.1%	41.5%	97.8%	6.1%
Cch-CAL_043-2F-lcwgs-1-2	16.7%	41.6%	97.8%	6.2%
Cch-CAL_044-1E-lcwgs-1-2	16.6%	41.4%	97.7%	19.9%
Cch-CAL_045-11D-lcwgs-1-2	17.1%	41.7%	97.6%	4.1%
Cch-CAL_046-8C-lcwgs-1-2	15.7%	41.5%	97.6%	8.9%
Cch-CAL_049-4F-lcwgs-1-2	16.3%	41.5%	97.8%	11.0%
Cch-CAL_050-11B-lcwgs-1-2	13.2%	41.5%	97.5%	9.3%
Cch-CAS_001-10B-lcwgs-1-2	12.2%	41.4%	97.2%	12.0%
Cch-CAS_002-7D-lcwgs-1-2	16.4%	41.8%	97.8%	4.3%
Cch-CAS_004-12H-lcwgs-1-2	16.5%	41.5%	97.6%	5.4%
Cch-CAS_005-8H-lcwgs-1-2	15.7%	41.9%	97.7%	8.2%
Cch-CAS_006-5A-lcwgs-1-2	38.2%	42.0%	97.8%	1.3%
Cch-CAS_007-7G-lcwgs-1-2	15.5%	41.6%	97.8%	7.3%
Cch-CAS_008-6E-lcwgs-1-2	17.6%	41.8%	97.8%	2.8%
Cch-CAS_009-5C-lcwgs-1-2	16.1%	41.4%	97.7%	7.3%
Cch-CAS_010-7B-lcwgs-1-2	16.2%	41.5%	97.6%	9.0%
Cch-CAS_011-8D-lcwgs-1-2	15.9%	41.5%	97.7%	7.8%
Cch-CAS_012-10H-lcwgs-1-2	13.2%	41.5%	97.4%	7.8%
Cch-CAS_013-11A-lcwgs-1-2	19.9%	41.7%	97.5%	2.7%
Cch-CAS_014-6A-lcwgs-1-2	16.3%	41.4%	97.6%	8.7%
Cch-CAS_015-10F-lcwgs-1-2	13.0%	41.4%	97.5%	5.2%
Cch-CAS_016-6C-lcwgs-1-2	17.1%	41.5%	97.7%	2.9%
Cch-CAS_017-11H-lcwgs-1-2	16.7%	41.7%	97.7%	4.9%
Cch-CAS_018-12D-lcwgs-1-2	15.2%	41.6%	97.6%	8.8%
Cch-CAS_019-5B-lcwgs-1-2	15.9%	41.6%	97.5%	8.8%
Cch-CAS_021-6E-lcwgs-1-2	15.7%	41.7%	97.6%	5.1%
Cch-CAS_022-8G-lcwgs-1-2	15.8%	41.6%	97.6%	5.9%
Cch-CAS_023-10G-lcwgs-1-2	9.1%	41.5%	97.0%	9.0%
Cch-CAS_024-11G-lcwgs-1-2	16.8%	41.3%	97.7%	5.3%
Cch-CAS_025-1C-lcwgs-1-2	15.6%	41.9%	97.5%	7.5%
Cch-CAS_026-10E-lcwgs-1-2	15.7%	41.5%	97.6%	8.4%
Cch-CAS_027-7B-lcwgs-1-2	15.4%	41.5%	97.8%	12.2%
Cch-CAS_029-8G-lcwgs-1-2	16.6%	41.5%	97.5%	4.6%
Cch-CAS_030-7D-lcwgs-1-2	16.0%	41.6%	97.6%	4.7%
Cch-CAS_031-9D-lcwgs-1-2	16.2%	41.7%	97.8%	4.2%
Cch-CAS_032-11C-lcwgs-1-2	16.6%	41.5%	97.7%	5.7%
Cch-CAS_033-10D-lcwgs-1-2	15.0%	41.5%	97.5%	4.3%
Cch-CAS_034-6H-lcwgs-1-2	15.5%	41.8%	97.2%	4.0%
Cch-CAS_035-6B-lcwgs-1-2	14.9%	41.4%	97.7%	19.4%
Cch-CAS_037-11B-lcwgs-1-2	15.7%	41.6%	97.6%	6.1%
Cch-CAS_038-1D-lcwgs-1-2	15.1%	41.6%	97.6%	11.9%
Cch-CAS_039-11C-lcwgs-1-2	16.1%	41.6%	97.7%	5.5%
Cch-CAS_041-10C-lcwgs-1-2	11.4%	41.2%	97.3%	11.3%
Cch-CAS_042-4A-lcwgs-1-2	18.0%	42.1%	97.7%	2.4%
Cch-CAS_043-10D-lcwgs-1-2	13.2%	41.5%	97.3%	8.7%
Cch-CAS_044-2E-lcwgs-1-2	15.8%	41.4%	97.6%	7.8%
Cch-CAS_045-11D-lcwgs-1-2	16.9%	41.4%	97.7%	5.3%
Cch-CAS_046-10F-lcwgs-1-2	15.6%	41.9%	97.6%	8.6%
Cch-CAS_047-8G-lcwgs-1-2	16.0%	41.7%	97.6%	4.9%
Cch-CAS_048-8D-lcwgs-1-2	16.5%	41.6%	97.7%	5.8%
Cch-CAS_049-3E-lcwgs-1-2	4.7%	41.4%	97.0%	10.0%
Cch-CAS_050-8E-lcwgs-1-2	15.4%	41.8%	97.7%	8.4%
Cch-CBL_001-3C-lcwgs-1-2	16.6%	41.5%	97.5%	7.0%
Cch-CBL_002-4C-lcwgs-1-2	16.0%	41.5%	97.8%	8.3%
Cch-CBL_003-1H-lcwgs-1-2	15.5%	42.0%	97.7%	6.5%
Cch-CBL_004-5H-lcwgs-1-2	16.2%	41.5%	97.6%	9.8%
Cch-CBL_005-4C-lcwgs-1-2	15.8%	41.6%	97.5%	7.6%
Cch-CBL_006-12D-lcwgs-1-2	15.6%	42.0%	97.3%	6.3%
Cch-CBL_007-7C-lcwgs-1-2	16.1%	41.6%	97.7%	7.1%
Cch-CBL_008-1G-lcwgs-1-2	14.5%	41.5%	97.5%	5.6%
Cch-CBL_009-9A-lcwgs-1-2	22.5%	41.5%	97.6%	2.2%
Cch-CBL_010-7H-lcwgs-1-2	16.6%	41.5%	97.6%	4.5%
Cch-CBL_011-8B-lcwgs-1-2	14.0%	41.4%	97.4%	7.0%
Cch-CBL_012-8C-lcwgs-1-2	3.8%	41.6%	97.0%	5.2%
Cch-CBL_013-10D-lcwgs-1-2	14.1%	41.4%	97.5%	9.8%
Cch-CBL_014-7F-lcwgs-1-2	18.7%	41.5%	97.6%	2.7%
Cch-CBL_015-10C-lcwgs-1-2	15.3%	41.5%	97.6%	6.3%
Cch-CBL_016-6E-lcwgs-1-2	16.0%	41.4%	97.8%	7.4%
Cch-CBL_017-12C-lcwgs-1-2	16.5%	41.6%	97.6%	9.6%
Cch-CBL_018-11D-lcwgs-1-2	16.6%	41.5%	97.5%	9.2%
Cch-CBL_019-6H-lcwgs-1-2	16.0%	41.6%	97.8%	8.0%
Cch-CBL_020-5E-lcwgs-1-2	16.6%	41.6%	97.6%	10.3%
Cch-CBL_021-6F-lcwgs-1-2	16.4%	41.3%	97.8%	12.0%
Cch-CBL_022-6A-lcwgs-1-2	27.5%	41.7%	97.7%	1.4%
Cch-CBL_023-10A-lcwgs-1-2	31.3%	41.6%	97.7%	1.6%
Cch-CBL_025-12F-lcwgs-1-2	16.6%	41.5%	97.7%	8.5%
Cch-CBL_026-12G-lcwgs-1-2	16.6%	41.4%	97.6%	8.3%
Cch-CBL_028-11G-lcwgs-1-2	16.9%	42.0%	97.6%	3.8%
Cch-CBL_033-11E-lcwgs-1-2	14.2%	41.6%	97.6%	10.5%
Cch-CBL_034-2F-lcwgs-1-2	16.8%	41.4%	97.6%	7.2%
Cch-CBL_035-3A-lcwgs-1-2	2.3%	41.6%	96.9%	5.8%
Cch-CBL_037-4D-lcwgs-1-2	16.1%	41.8%	97.7%	5.8%
Cch-CBL_038-9G-lcwgs-1-2	16.4%	41.7%	97.6%	5.4%
Cch-CBL_039-9A-lcwgs-1-2	17.1%	40.7%	97.8%	12.1%
Cch-CBL_040-1G-lcwgs-1-2	15.4%	41.8%	97.5%	6.0%
Cch-CBL_041-8B-lcwgs-1-2	15.9%	41.8%	97.7%	3.7%
Cch-CBL_042-7A-lcwgs-1-2	38.0%	41.8%	97.7%	1.4%
Cch-CBL_043-9E-lcwgs-1-2	16.4%	41.5%	97.7%	7.7%
Cch-CBL_044-1A-lcwgs-1-2	16.1%	41.4%	97.3%	4.7%
Cch-CBL_045-9H-lcwgs-1-2	16.1%	41.7%	97.8%	6.2%
Cch-CBL_046-12D-lcwgs-1-2	15.6%	41.5%	97.5%	10.0%
Cch-CBL_047-4A-lcwgs-1-2	15.2%	41.6%	97.5%	5.9%
Cch-CBS_001-5F-lcwgs-1-2	16.0%	41.2%	97.8%	12.5%
Cch-CBS_002-11F-lcwgs-1-2	17.1%	41.6%	97.5%	6.9%
Cch-CBS_003-6G-lcwgs-1-2	15.4%	41.3%	97.7%	5.1%
Cch-CBS_004-8F-lcwgs-1-2	17.1%	41.8%	97.5%	5.3%
Cch-CBS_005-12A-lcwgs-1-2	17.9%	41.7%	97.5%	11.1%
Cch-CBS_007-5C-lcwgs-1-2	15.9%	41.6%	97.6%	7.9%
Cch-CBS_008-5E-lcwgs-1-2	15.8%	41.7%	97.7%	6.4%
Cch-CBS_009-2C-lcwgs-1-2	16.1%	41.7%	97.5%	8.8%
Cch-CBS_010-11F-lcwgs-1-2	17.4%	41.6%	97.6%	6.3%
Cch-CBS_011-1F-lcwgs-1-2	16.8%	41.9%	97.6%	3.6%
Cch-CBS_012-2H-lcwgs-1-2	15.8%	41.4%	97.3%	10.1%
Cch-CBS_014-2B-lcwgs-1-2	16.1%	41.5%	97.6%	8.2%
Cch-CBS_016-10A-lcwgs-1-2	13.8%	41.4%	97.4%	11.6%
Cch-CBS_017-1F-lcwgs-1-2	14.1%	41.5%	97.5%	9.5%
Cch-CBS_018-8C-lcwgs-1-2	15.9%	41.5%	97.7%	5.2%
Cch-CBS_020-9C-lcwgs-1-2	2.4%	41.6%	97.0%	6.0%
Cch-CBS_022-4F-lcwgs-1-2	16.0%	41.4%	97.5%	6.4%
Cch-CBS_023-3A-lcwgs-1-2	38.0%	41.8%	97.7%	1.6%
Cch-CBS_024-3E-lcwgs-1-2	26.3%	41.4%	97.2%	3.9%
Cch-CBS_025-7E-lcwgs-1-2	15.7%	41.3%	97.9%	13.7%
Cch-CBS_026-5E-lcwgs-1-2	15.7%	41.7%	97.7%	4.4%
Cch-CBS_027-4D-lcwgs-1-2	11.5%	41.5%	97.4%	14.4%
Cch-CBS_028-9D-lcwgs-1-2	16.1%	41.7%	97.6%	7.2%
Cch-CBS_029-4H-lcwgs-1-2	15.7%	41.7%	97.3%	5.8%
Cch-CBS_030-3C-lcwgs-1-2	4.6%	41.6%	97.0%	5.5%
Cch-CBS_031-4A-lcwgs-1-2	22.1%	41.6%	97.8%	1.8%
Cch-CBS_032-12E-lcwgs-1-2	16.3%	41.5%	97.7%	7.6%
Cch-CBS_033-5D-lcwgs-1-2	15.5%	42.0%	97.5%	9.0%
Cch-CBS_037-2B-lcwgs-1-2	14.8%	41.6%	97.4%	8.2%
Cch-CBS_038-7E-lcwgs-1-2	16.6%	41.7%	97.8%	4.6%
Cch-CBS_039-6G-lcwgs-1-2	17.2%	41.5%	97.6%	2.3%
Cch-CBS_040-9C-lcwgs-1-2	17.4%	41.2%	97.8%	12.6%
Cch-CBS_041-6A-lcwgs-1-2	15.8%	41.9%	97.7%	4.0%
Cch-CBS_043-4G-lcwgs-1-2	14.6%	41.4%	97.6%	12.8%
Cch-CBS_044-8F-lcwgs-1-2	16.8%	41.9%	97.8%	5.1%
Cch-CBS_045-6C-lcwgs-1-2	16.5%	41.8%	97.7%	3.3%
Cch-CBS_046-8D-lcwgs-1-2	16.6%	42.1%	97.7%	3.9%
Cch-CBS_047-10F-lcwgs-1-2	16.0%	41.6%	97.4%	6.7%
Cch-CBS_048-10H-lcwgs-1-2	14.3%	41.8%	97.6%	7.2%
Cch-CBS_049-10C-lcwgs-1-2	15.4%	41.9%	97.5%	5.3%
Cch-CBS_050-4G-lcwgs-1-2	15.1%	41.9%	97.7%	6.3%
Cch-CCL_001-3E-lcwgs-1-2	17.3%	42.0%	97.5%	5.3%
Cch-CCL_011-3H-lcwgs-1-2	3.4%	41.6%	96.8%	5.2%
Cch-CCS_001-6D-lcwgs-1-2	16.8%	41.7%	97.6%	3.8%
Cch-CCS_002-4H-lcwgs-1-2	15.5%	41.8%	97.7%	8.2%
Cch-CCS_003-2C-lcwgs-1-2	16.5%	41.7%	97.5%	5.3%
Cch-CCS_004-11H-lcwgs-1-2	16.1%	41.6%	97.7%	9.9%
Cch-CCS_006-1B-lcwgs-1-2	15.8%	41.8%	97.4%	7.1%
Cch-CCS_008-9E-lcwgs-1-2	18.0%	41.3%	97.8%	10.3%
Cch-CCS_011-7F-lcwgs-1-2	16.4%	41.5%	98.0%	9.1%
Cch-CCS_012-9G-lcwgs-1-2	15.8%	41.7%	97.7%	5.5%
Cch-CCS_013-12B-lcwgs-1-2	16.3%	41.7%	97.6%	8.8%
Cch-CCS_014-9G-lcwgs-1-2	17.8%	41.4%	97.7%	7.6%
Cch-CCS_015-3F-lcwgs-1-2	17.8%	42.1%	97.2%	7.6%
Cch-CCS_016-5D-lcwgs-1-2	15.9%	41.6%	97.5%	6.9%
Cch-CCS_018-5F-lcwgs-1-2	16.9%	41.6%	97.5%	4.6%
Cch-CCS_019-12F-lcwgs-1-2	16.4%	41.6%	97.7%	5.9%
Cch-CCS_021-9F-lcwgs-1-2	18.2%	41.6%	97.8%	11.4%
Cch-CCS_023-10A-lcwgs-1-2	13.4%	41.6%	97.4%	7.4%
Cch-CCS_024-9B-lcwgs-1-2	15.9%	41.7%	97.7%	6.4%
Cch-CCS_025-6F-lcwgs-1-2	17.1%	41.6%	97.8%	4.3%
Cch-CCS_026-9E-lcwgs-1-2	16.3%	41.8%	97.7%	5.0%
Cch-CCS_028-3C-lcwgs-1-2	16.9%	41.9%	97.5%	5.7%
Cch-CCS_029-3F-lcwgs-1-2	17.6%	41.6%	97.7%	6.8%
Cch-CCS_030-4C-lcwgs-1-2	18.1%	42.1%	97.7%	2.3%
Cch-CCS_032-9A-lcwgs-1-2	16.6%	41.8%	97.6%	3.9%
Cch-CCS_033-4E-lcwgs-1-2	15.9%	41.7%	97.5%	9.8%
Cch-CCS_034-11E-lcwgs-1-2	16.9%	41.5%	97.6%	6.8%
Cch-CCS_035-2D-lcwgs-1-2	14.6%	41.1%	97.5%	22.3%
Cch-CCS_037-2B-lcwgs-1-2	14.5%	41.4%	97.3%	11.3%
Cch-CCS_038-3B-lcwgs-1-2	17.6%	41.6%	97.3%	3.2%
Cch-CCS_039-12B-lcwgs-1-2	14.9%	41.4%	97.6%	7.5%
Cch-CCS_040-1D-lcwgs-1-2	16.6%	41.8%	97.5%	3.9%
Cch-CCS_041-7H-lcwgs-1-2	16.0%	41.6%	97.8%	8.2%
Cch-CCS_042-12H-lcwgs-1-2	15.4%	41.4%	97.7%	6.0%
Cch-CCS_043-12C-lcwgs-1-2	16.4%	41.7%	97.6%	7.4%
Cch-CCS_044-12B-lcwgs-1-2	16.2%	41.7%	97.8%	6.7%
Cch-CCS_045-5A-lcwgs-1-2	16.7%	41.8%	97.6%	4.0%
Cch-CCS_046-4B-lcwgs-1-2	15.5%	41.6%	97.4%	8.1%
Cch-CCS_047-4F-lcwgs-1-2	16.1%	41.9%	97.7%	5.0%
Cch-CCS_048-3D-lcwgs-1-2	2.9%	41.6%	97.1%	5.8%
Cch-CCS_049-1H-lcwgs-1-2	15.8%	41.6%	97.4%	4.7%
Cch-CCS_050-1C-lcwgs-1-2	15.8%	41.6%	97.6%	7.4%
Cch-CWAL_002-9F-lcwgs-1-2	17.1%	41.7%	97.6%	4.4%
Cch-CWAL_019-2A-lcwgs-1-2	15.4%	41.8%	97.4%	8.2%
Cch-CWAL_025-5G-lcwgs-1-2	16.5%	41.8%	97.6%	6.0%
Cch-CWAL_066-5B-lcwgs-1-2	15.3%	41.5%	97.6%	13.8%
Cch-CWAL_094-1B-lcwgs-1-2	16.6%	41.6%	97.6%	9.4%
Cch-CWAL_136-4G-lcwgs-1-2	16.1%	41.8%	97.6%	6.1%
Cch-CWAL_182-7C-lcwgs-1-2	16.2%	41.8%	97.8%	4.1%
Cch-CWAL_188-10B-lcwgs-1-2	14.9%	41.6%	97.5%	8.2%
Cch-CWAL_228-5B-lcwgs-1-2	15.9%	42.0%	97.6%	4.9%
Cch-CWAL_230-8H-lcwgs-1-2	16.7%	41.7%	97.5%	4.5%
Cch-CWAS_049-12E-lcwgs-1-2	16.2%	42.0%	97.6%	8.6%
Cch-CWAS_057-7G-lcwgs-1-2	15.9%	42.1%	97.7%	5.0%
Cch-CWAS_104-2D-lcwgs-1-2	15.8%	41.9%	97.6%	8.8%
Cch-CWAS_268-1A-lcwgs-1-2	15.8%	42.2%	97.5%	6.2%
Cch-CWAS_296-3D-lcwgs-1-2	16.4%	41.9%	97.6%	6.3%
Cch-CWBL_003-4E-lcwgs-1-2	15.0%	42.1%	97.5%	7.5%
Cch-CWBL_010-10H-lcwgs-1-2	14.5%	41.6%	97.3%	7.4%
Cch-CWBL_044-11B-lcwgs-1-2	15.2%	41.9%	97.5%	5.8%
Cch-CWBL_100-5A-lcwgs-1-2	10.1%	41.6%	97.3%	8.1%
Cch-CWBL_106-12G-lcwgs-1-2	15.9%	41.8%	97.4%	10.7%
Cch-CWBL_156-1A-lcwgs-1-2	17.2%	41.5%	97.7%	10.9%
Cch-CWBL_172-1E-lcwgs-1-2	14.7%	41.6%	97.4%	11.7%
Cch-CWBL_204-3H-lcwgs-1-2	17.3%	41.9%	97.4%	5.9%
Cch-CWBL_217-2A-lcwgs-1-2	16.3%	41.8%	97.7%	6.8%
Cch-CWBL_231-1A-lcwgs-1-2	30.9%	42.2%	97.6%	2.1%
Cch-CWBS_016-4E-lcwgs-1-2	15.5%	41.5%	97.8%	15.1%
Cch-CWBS_053-11F-lcwgs-1-2	16.6%	42.2%	97.7%	6.5%
Cch-CWBS_121-10G-lcwgs-1-2	15.0%	41.9%	97.4%	7.2%
Cch-CWBS_124-7H-lcwgs-1-2	14.9%	42.0%	97.6%	5.2%
Cch-CWBS_152-11A-lcwgs-1-2	14.9%	42.0%	97.5%	6.1%
Cch-CWBS_161-7D-lcwgs-1-2	15.9%	41.6%	97.8%	10.6%
Cch-CWBS_234-8F-lcwgs-1-2	16.7%	42.0%	97.6%	8.3%
Cch-CWBS_252-1G-lcwgs-1-2	17.2%	41.3%	97.8%	6.9%
Cch-CWBS_290-4B-lcwgs-1-2	14.8%	41.8%	97.6%	13.6%
Cch-CWCL_009-9B-lcwgs-1-2	16.8%	41.9%	97.6%	5.3%
Cch-CWCL_012-6B-lcwgs-1-2	15.7%	41.8%	97.7%	3.4%
Cch-CWCL_016-12A-lcwgs-1-2	15.8%	41.7%	97.4%	6.8%
Cch-CWCL_020-7A-lcwgs-1-2	17.0%	41.8%	97.8%	3.2%
Cch-CWCL_024-4H-lcwgs-1-2	15.5%	41.5%	97.6%	9.3%
Cch-CWCL_026-5F-lcwgs-1-2	17.5%	41.8%	97.8%	4.4%
Cch-CWCL_029-3F-lcwgs-1-2	4.7%	41.6%	96.9%	4.9%
Cch-CWCL_036-7G-lcwgs-1-2	16.4%	41.5%	97.7%	3.6%
Cch-CWCL_046-9H-lcwgs-1-2	17.9%	41.6%	97.7%	7.0%
Cch-CWCL_047-5H-lcwgs-1-2	16.3%	41.7%	97.5%	4.9%
Cch-CWCL_048-3G-lcwgs-1-2	15.8%	41.2%	97.7%	12.4%
Cch-CWCL_050-6A-lcwgs-1-2	15.9%	41.5%	97.6%	3.7%
Cch-CWCL_059-9H-lcwgs-1-2	15.9%	41.7%	97.6%	5.6%
Cch-CWCL_070-11H-lcwgs-1-2	16.9%	41.7%	97.5%	4.7%
Cch-CWCL_090-2E-lcwgs-1-2	17.5%	41.5%	97.7%	7.6%
Cch-CWCL_094-11E-lcwgs-1-2	16.1%	41.8%	97.6%	7.6%
Cch-CWCL_101-8A-lcwgs-1-2	15.9%	41.7%	97.6%	9.6%
Cch-CWCL_112-7A-lcwgs-1-2	16.1%	41.6%	97.8%	8.4%
Cch-CWCL_116-5G-lcwgs-1-2	15.4%	41.9%	97.5%	6.0%
Cch-CWCL_122-8A-lcwgs-1-2	20.7%	41.6%	97.6%	1.9%
Cch-CWCL_123-6B-lcwgs-1-2	17.3%	41.5%	97.6%	3.3%
Cch-CWCL_127-6F-lcwgs-1-2	17.6%	41.6%	97.6%	2.5%
Cch-CWCL_132-8E-lcwgs-1-2	16.7%	41.7%	97.5%	9.6%
Cch-CWCL_134-2A-lcwgs-1-2	15.3%	41.4%	97.6%	11.4%
Cch-CWCL_136-9A-lcwgs-1-2	15.7%	41.5%	97.6%	7.1%
Cch-CWCL_153-6H-lcwgs-1-2	15.2%	41.7%	97.7%	6.7%
Cch-CWCL_155-3H-lcwgs-1-2	16.3%	41.4%	97.7%	12.1%
Cch-CWCL_157-1B-lcwgs-1-2	28.7%	41.9%	97.5%	1.3%
Cch-CWCL_160-7C-lcwgs-1-2	15.4%	41.5%	97.8%	10.1%
Cch-CWCL_177-7F-lcwgs-1-2	16.6%	41.9%	97.8%	6.9%
Cch-CWCL_180-2G-lcwgs-1-2	15.5%	41.9%	97.7%	7.1%
Cch-CWCL_188-10E-lcwgs-1-2	15.3%	41.8%	97.7%	6.3%
Cch-CWCL_192-10B-lcwgs-1-2	14.8%	41.9%	97.5%	7.7%
Cch-CWCL_196-12G-lcwgs-1-2	15.4%	41.6%	97.7%	3.7%
Cch-CWCL_202-2G-lcwgs-1-2	15.0%	41.4%	97.6%	6.7%
Cch-CWCL_206-6G-lcwgs-1-2	15.9%	41.8%	97.7%	3.7%
Cch-CWCL_209-11C-lcwgs-1-2	15.8%	41.4%	97.6%	11.9%
Cch-CWCL_217-10G-lcwgs-1-2	15.9%	41.5%	97.6%	5.6%
Cch-CWCL_220-7A-lcwgs-1-2	15.1%	41.7%	97.5%	6.9%
Cch-CWCL_223-5D-lcwgs-1-2	16.4%	41.6%	97.6%	7.9%
Cch-CWCL_224-2F-lcwgs-1-2	15.7%	41.5%	97.7%	13.9%
Cch-CWCL_226-8E-lcwgs-1-2	15.9%	41.6%	97.6%	11.8%
Cch-CWCL_238-1D-lcwgs-1-2	17.7%	41.4%	97.7%	9.2%
Cch-CWCL_254-2H-lcwgs-1-2	13.7%	41.6%	97.5%	9.1%
Cch-CWCL_256-3A-lcwgs-1-2	16.9%	41.5%	97.6%	7.4%
Cch-CWCL_259-1C-lcwgs-1-2	16.7%	41.4%	97.8%	12.6%
Cch-CWCL_265-6C-lcwgs-1-2	15.4%	41.5%	97.7%	17.9%
Cch-CWCL_279-8B-lcwgs-1-2	15.4%	41.7%	97.6%	6.9%
Cch-CWCS_103-7B-lcwgs-1-2	16.1%	41.7%	97.7%	4.8%
Cch-CWCS_124-4A-lcwgs-1-2	15.9%	41.6%	97.7%	10.2%
Cch-CWCS_126-2G-lcwgs-1-2	16.6%	41.4%	97.5%	6.5%
Cch-CWCS_137-8H-lcwgs-1-2	16.2%	41.6%	97.6%	6.1%
Cch-CWCS_144-6D-lcwgs-1-2	16.0%	41.3%	97.8%	16.0%
Cch-CWCS_146-5G-lcwgs-1-2	16.2%	41.6%	97.6%	8.1%
Cch-CWCS_158-3G-lcwgs-1-2	12.9%	41.2%	96.9%	5.1%
Cch-CWCS_163-8A-lcwgs-1-2	17.1%	41.8%	97.7%	3.6%
Cch-CWCS_271-5A-lcwgs-1-2	15.2%	41.5%	97.6%	7.1%
Cch-CWCS_281-12E-lcwgs-1-2	16.2%	41.4%	97.7%	2.9%

```
</p>
</details>

## 9. Remove duplicates with clumpify.

### 9a. Remove duplicates.
Running `runCLUMPIFY_r1r2_array.bash`. Waiting on nodes to become available. LW 2023-07-11

### 9b. Check duplicate removal success.
TBD

### 9c. Generate metadata on deduplicated FASTQ files.
TBD

<details><summary>Expand for MultiQC Output.</summary>

```bash
Insert output here.
```
  
</p>
</details>

## 10. Second trim.
TBD

<details><summary>Expand for MultiQC Output.</summary>

```bash


```

</p>
</details>

## 11. Decontaminate files.
TBD

<details><summary>Expand for MultiQC Output.</summary>

```bash
insert multiqc output here
```

</p>
</details>

## 12. Execute RePair
TBD

<details><summary>Expand for MultiQC Output.</summary>

```bash
Insert output here.
```

</p>
</details>

## 14. Clean up
TBD
