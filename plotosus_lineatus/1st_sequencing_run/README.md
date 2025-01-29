\*\*\* \*fq.gz files lost from `fq_fp1` \*\*\*

## 1. Download data
Data downloaded from TAMUCC grid.

## 2. Proofread the decode files
Formatting of the decode file is incorrect, there is a "_" where a "-" should be between the individual ID and the extraction #. There are 246 forward reads and 246 reverse reads, all reads unique.

## 3. Edit the decode file
Editted the decode file.

## 4. Make a copy of the fq_raw files
`screen cp ./* /RC/group/rc_carpenter_ngs/shotgun_PIRE/pire_lcwgs_data_processing/plotosus_lineatus/1st_sequencing_run/fq_raw`

## 5. Perform a renaming dry run.
`bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Pli-A-LCWGS-Seq_SequenceNameDecode.txt`

Dry run uncessful, due to the slight difference in original sample name to account for the Albatross samples being sequenced twice. Made a copy of the rename script and editted it.

`bash /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/plotosus_lineatus/1st_sequencing_run/renameFQGZ.bash Pli-A-LCWGS-Seq_SequenceNameDecode.txt`

Dry run successful.

## 6. Rename the files for real
`bash /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/plotosus_lineatus/1st_sequencing_run/renameFQGZ.bash Pli-A-LCWGS-Seq_SequenceNameDecode.txt rename`

## 7. Check the quality of your data.
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report"  "fq.gz"`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	M Seqs
Pli-AMvi_004-Ex1-1A-lcwgs-1-1.1	35.1%	47%	0.4
Pli-AMvi_004-Ex1-1A-lcwgs-1-1.2	33.6%	48%	0.4
Pli-AMvi_004-Ex1-1A-lcwgs-2-1.1	24.7%	56%	0.1
Pli-AMvi_004-Ex1-1A-lcwgs-2-1.2	21.1%	56%	0.1
Pli-AMvi_005-Ex1-2A-lcwgs-1-1.1	11.1%	46%	0.0
Pli-AMvi_005-Ex1-2A-lcwgs-1-1.2	12.9%	47%	0.0
Pli-AMvi_005-Ex1-2A-lcwgs-2-1.1	16.4%	48%	0.0
Pli-AMvi_005-Ex1-2A-lcwgs-2-1.2	16.9%	49%	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-1-1.1	10.6%	45%	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-1-1.2	11.2%	46%	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-2-1.1	28.4%	46%	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-2-1.2	28.7%	47%	0.0
Pli-AMvi_007-Ex1-4A-lcwgs-1-1.1	19.5%	44%	0.1
Pli-AMvi_007-Ex1-4A-lcwgs-1-1.2	19.0%	45%	0.1
Pli-AMvi_007-Ex1-4A-lcwgs-2-1.1	26.9%	46%	0.0
Pli-AMvi_007-Ex1-4A-lcwgs-2-1.2	25.4%	47%	0.0
Pli-AMvi_008-Ex1-1B-lcwgs-1-1.1	19.2%	44%	0.4
Pli-AMvi_008-Ex1-1B-lcwgs-1-1.2	18.1%	45%	0.4
Pli-AMvi_008-Ex1-1B-lcwgs-2-1.1	49.5%	48%	0.1
Pli-AMvi_008-Ex1-1B-lcwgs-2-1.2	47.9%	48%	0.1
Pli-AMvi_009-Ex1-2B-lcwgs-1-1.1	11.5%	46%	0.0
Pli-AMvi_009-Ex1-2B-lcwgs-1-1.2	13.0%	47%	0.0
Pli-AMvi_009-Ex1-2B-lcwgs-2-1.1	39.2%	49%	0.0
Pli-AMvi_009-Ex1-2B-lcwgs-2-1.2	37.3%	49%	0.0
Pli-AMvi_010-Ex1-7A-lcwgs-1-1.1	14.5%	43%	0.0
Pli-AMvi_010-Ex1-7A-lcwgs-1-1.2	13.6%	44%	0.0
Pli-AMvi_010-Ex1-7A-lcwgs-2-1.1	32.4%	47%	1.6
Pli-AMvi_010-Ex1-7A-lcwgs-2-1.2	31.2%	47%	1.6
Pli-AMvi_011-Ex1-8A-lcwgs-1-1.1	16.0%	44%	0.5
Pli-AMvi_011-Ex1-8A-lcwgs-1-1.2	15.5%	44%	0.5
Pli-AMvi_011-Ex1-8A-lcwgs-2-1.1	34.6%	48%	1.8
Pli-AMvi_011-Ex1-8A-lcwgs-2-1.2	33.0%	48%	1.8
Pli-AMvi_012-Ex1-9A-lcwgs-1-1.1	18.9%	44%	0.3
Pli-AMvi_012-Ex1-9A-lcwgs-1-1.2	18.5%	44%	0.3
Pli-AMvi_012-Ex1-9A-lcwgs-2-1.1	31.6%	47%	0.8
Pli-AMvi_012-Ex1-9A-lcwgs-2-1.2	30.0%	47%	0.8
Pli-AMvi_013-Ex1-10A-lcwgs-1-1.1	12.6%	43%	0.3
Pli-AMvi_013-Ex1-10A-lcwgs-1-1.2	11.6%	44%	0.3
Pli-AMvi_013-Ex1-10A-lcwgs-2-1.1	24.0%	47%	0.0
Pli-AMvi_013-Ex1-10A-lcwgs-2-1.2	27.0%	47%	0.0
Pli-AMvi_014-Ex1-11A-lcwgs-1-1.1	28.8%	47%	0.3
Pli-AMvi_014-Ex1-11A-lcwgs-1-1.2	26.7%	48%	0.3
Pli-AMvi_014-Ex1-11A-lcwgs-2-1.1	83.9%	48%	0.0
Pli-AMvi_014-Ex1-11A-lcwgs-2-1.2	82.5%	48%	0.0
Pli-AMvi_015-Ex1-12A-lcwgs-1-1.1	8.3%	45%	0.0
Pli-AMvi_015-Ex1-12A-lcwgs-1-1.2	8.6%	46%	0.0
Pli-AMvi_015-Ex1-12A-lcwgs-2-1.1	23.1%	51%	0.0
Pli-AMvi_015-Ex1-12A-lcwgs-2-1.2	24.3%	51%	0.0
Pli-AMvi_016-Ex1-3B-lcwgs-1-1.1	13.6%	44%	0.1
Pli-AMvi_016-Ex1-3B-lcwgs-1-1.2	13.2%	45%	0.1
Pli-AMvi_016-Ex1-3B-lcwgs-2-1.1	23.8%	45%	0.1
Pli-AMvi_016-Ex1-3B-lcwgs-2-1.2	22.8%	46%	0.1
Pli-AMvi_017-Ex1-4B-lcwgs-1-1.1	15.8%	45%	0.1
Pli-AMvi_017-Ex1-4B-lcwgs-1-1.2	15.0%	45%	0.1
Pli-AMvi_017-Ex1-4B-lcwgs-2-1.1	37.6%	48%	0.0
Pli-AMvi_017-Ex1-4B-lcwgs-2-1.2	38.7%	48%	0.0
Pli-AMvi_018-Ex1-1C-lcwgs-1-1.1	22.2%	46%	0.1
Pli-AMvi_018-Ex1-1C-lcwgs-1-1.2	20.7%	47%	0.1
Pli-AMvi_018-Ex1-1C-lcwgs-2-1.1	67.5%	48%	0.0
Pli-AMvi_018-Ex1-1C-lcwgs-2-1.2	66.0%	48%	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-1-1.1	17.6%	46%	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-1-1.2	16.7%	46%	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-2-1.1	24.4%	47%	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-2-1.2	24.2%	47%	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-1-1.1	50.1%	47%	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-1-1.2	48.6%	47%	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-2-1.1	35.2%	47%	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-2-1.2	35.8%	47%	0.0
Pli-AMvi_021-Ex1-4C-lcwgs-1-1.1	16.0%	45%	0.1
Pli-AMvi_021-Ex1-4C-lcwgs-1-1.2	15.7%	45%	0.1
Pli-AMvi_021-Ex1-4C-lcwgs-2-1.1	37.9%	46%	0.3
Pli-AMvi_021-Ex1-4C-lcwgs-2-1.2	36.9%	46%	0.3
Pli-AMvi_022-Ex1-7B-lcwgs-1-1.1	14.1%	43%	0.1
Pli-AMvi_022-Ex1-7B-lcwgs-1-1.2	14.0%	44%	0.1
Pli-AMvi_022-Ex1-7B-lcwgs-2-1.1	48.2%	50%	3.3
Pli-AMvi_022-Ex1-7B-lcwgs-2-1.2	45.9%	50%	3.3
Pli-AMvi_023-Ex1-8B-lcwgs-1-1.1	16.0%	44%	0.3
Pli-AMvi_023-Ex1-8B-lcwgs-1-1.2	15.0%	44%	0.3
Pli-AMvi_023-Ex1-8B-lcwgs-2-1.1	53.8%	47%	0.8
Pli-AMvi_023-Ex1-8B-lcwgs-2-1.2	52.7%	48%	0.8
Pli-AMvi_024-Ex1-9B-lcwgs-1-1.1	15.0%	44%	0.4
Pli-AMvi_024-Ex1-9B-lcwgs-1-1.2	14.5%	44%	0.4
Pli-AMvi_024-Ex1-9B-lcwgs-2-1.1	54.5%	50%	1.8
Pli-AMvi_024-Ex1-9B-lcwgs-2-1.2	51.0%	51%	1.8
Pli-AMvi_025-Ex1-10B-lcwgs-1-1.1	16.2%	44%	0.1
Pli-AMvi_025-Ex1-10B-lcwgs-1-1.2	15.4%	45%	0.1
Pli-AMvi_025-Ex1-10B-lcwgs-2-1.1	37.7%	46%	0.0
Pli-AMvi_025-Ex1-10B-lcwgs-2-1.2	37.7%	46%	0.0
Pli-AMvi_026-Ex1-11B-lcwgs-1-1.1	11.7%	44%	2.8
Pli-AMvi_026-Ex1-11B-lcwgs-1-1.2	11.1%	45%	2.8
Pli-AMvi_026-Ex1-11B-lcwgs-2-1.1	73.5%	47%	0.0
Pli-AMvi_026-Ex1-11B-lcwgs-2-1.2	71.7%	47%	0.0
Pli-AMvi_027-Ex1-12B-lcwgs-1-1.1	5.8%	44%	0.0
Pli-AMvi_027-Ex1-12B-lcwgs-1-1.2	5.0%	44%	0.0
Pli-AMvi_027-Ex1-12B-lcwgs-2-1.1	13.9%	49%	0.0
Pli-AMvi_027-Ex1-12B-lcwgs-2-1.2	16.1%	49%	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-1-1.1	18.3%	47%	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-1-1.2	18.6%	48%	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-2-1.1	39.3%	49%	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-2-1.2	39.1%	49%	0.0
Pli-AMvi_029-Ex1-2D-lcwgs-1-1.1	17.2%	45%	0.8
Pli-AMvi_029-Ex1-2D-lcwgs-1-1.2	16.4%	45%	0.8
Pli-AMvi_029-Ex1-2D-lcwgs-2-1.1	44.2%	46%	0.1
Pli-AMvi_029-Ex1-2D-lcwgs-2-1.2	42.6%	47%	0.1
Pli-AMvi_030-Ex1-3D-lcwgs-1-1.1	17.4%	45%	0.1
Pli-AMvi_030-Ex1-3D-lcwgs-1-1.2	16.5%	46%	0.1
Pli-AMvi_030-Ex1-3D-lcwgs-2-1.1	40.6%	46%	0.1
Pli-AMvi_030-Ex1-3D-lcwgs-2-1.2	38.4%	47%	0.1
Pli-AMvi_031-Ex1-4D-lcwgs-1-1.1	19.4%	47%	0.0
Pli-AMvi_031-Ex1-4D-lcwgs-1-1.2	19.6%	48%	0.0
Pli-AMvi_031-Ex1-4D-lcwgs-2-1.1	40.7%	47%	0.0
Pli-AMvi_031-Ex1-4D-lcwgs-2-1.2	39.5%	48%	0.0
Pli-AMvi_032-Ex1-5C-lcwgs-1-1.1	17.3%	44%	0.3
Pli-AMvi_032-Ex1-5C-lcwgs-1-1.2	16.7%	45%	0.3
Pli-AMvi_032-Ex1-5C-lcwgs-2-1.1	38.3%	46%	0.9
Pli-AMvi_032-Ex1-5C-lcwgs-2-1.2	37.6%	46%	0.9
Pli-AMvi_033-Ex1-6C-lcwgs-1-1.1	21.7%	46%	0.0
Pli-AMvi_033-Ex1-6C-lcwgs-1-1.2	21.4%	46%	0.0
Pli-AMvi_033-Ex1-6C-lcwgs-2-1.1	35.2%	46%	1.7
Pli-AMvi_033-Ex1-6C-lcwgs-2-1.2	34.4%	46%	1.7
Pli-AMvi_034-Ex1-7C-lcwgs-1-1.1	12.3%	47%	0.0
Pli-AMvi_034-Ex1-7C-lcwgs-1-1.2	16.4%	48%	0.0
Pli-AMvi_034-Ex1-7C-lcwgs-2-1.1	79.4%	47%	0.0
Pli-AMvi_034-Ex1-7C-lcwgs-2-1.2	77.5%	48%	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-1-1.1	16.1%	45%	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-1-1.2	15.8%	46%	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-2-1.1	66.1%	47%	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-2-1.2	64.6%	47%	0.0
Pli-AMvi_036-Ex1-9C-lcwgs-1-1.1	30.8%	44%	0.3
Pli-AMvi_036-Ex1-9C-lcwgs-1-1.2	28.0%	44%	0.3
Pli-AMvi_036-Ex1-9C-lcwgs-2-1.1	47.5%	48%	4.2
Pli-AMvi_036-Ex1-9C-lcwgs-2-1.2	43.1%	48%	4.2
Pli-AMvi_037-Ex1-10C-lcwgs-1-1.1	13.4%	43%	0.9
Pli-AMvi_037-Ex1-10C-lcwgs-1-1.2	12.6%	44%	0.9
Pli-AMvi_037-Ex1-10C-lcwgs-2-1.1	21.8%	44%	0.0
Pli-AMvi_037-Ex1-10C-lcwgs-2-1.2	20.5%	45%	0.0
Pli-AMvi_038-Ex1-11C-lcwgs-1-1.1	20.9%	46%	0.4
Pli-AMvi_038-Ex1-11C-lcwgs-1-1.2	20.0%	46%	0.4
Pli-AMvi_038-Ex1-11C-lcwgs-2-1.1	14.0%	46%	0.0
Pli-AMvi_038-Ex1-11C-lcwgs-2-1.2	16.5%	46%	0.0
Pli-AMvi_039-Ex1-12C-lcwgs-1-1.1	6.1%	44%	0.0
Pli-AMvi_039-Ex1-12C-lcwgs-1-1.2	6.8%	44%	0.0
Pli-AMvi_039-Ex1-12C-lcwgs-2-1.1	40.7%	56%	0.5
Pli-AMvi_039-Ex1-12C-lcwgs-2-1.2	33.5%	57%	0.5
Pli-AMvi_040-Ex1-5A-lcwgs-1-1.1	16.0%	45%	0.1
Pli-AMvi_040-Ex1-5A-lcwgs-1-1.2	15.3%	45%	0.1
Pli-AMvi_040-Ex1-5A-lcwgs-2-1.1	29.9%	47%	2.1
Pli-AMvi_040-Ex1-5A-lcwgs-2-1.2	28.5%	47%	2.1
Pli-AMvi_041-Ex1-6A-lcwgs-1-1.1	17.2%	43%	0.2
Pli-AMvi_041-Ex1-6A-lcwgs-1-1.2	16.7%	43%	0.2
Pli-AMvi_041-Ex1-6A-lcwgs-2-1.1	26.5%	46%	2.8
Pli-AMvi_041-Ex1-6A-lcwgs-2-1.2	25.6%	46%	2.8
Pli-AMvi_042-Ex1-5B-lcwgs-1-1.1	9.6%	46%	0.0
Pli-AMvi_042-Ex1-5B-lcwgs-1-1.2	12.3%	47%	0.0
Pli-AMvi_042-Ex1-5B-lcwgs-2-1.1	34.4%	47%	0.0
Pli-AMvi_042-Ex1-5B-lcwgs-2-1.2	34.5%	48%	0.0
Pli-AMvi_043-Ex1-6B-lcwgs-1-1.1	22.1%	45%	0.1
Pli-AMvi_043-Ex1-6B-lcwgs-1-1.2	21.4%	45%	0.1
Pli-AMvi_043-Ex1-6B-lcwgs-2-1.1	42.9%	49%	2.2
Pli-AMvi_043-Ex1-6B-lcwgs-2-1.2	41.5%	49%	2.2
Pli-AMvi_044-Ex1-5D-lcwgs-1-1.1	8.2%	46%	0.0
Pli-AMvi_044-Ex1-5D-lcwgs-1-1.2	13.9%	47%	0.0
Pli-AMvi_044-Ex1-5D-lcwgs-2-1.1	61.8%	47%	0.2
Pli-AMvi_044-Ex1-5D-lcwgs-2-1.2	60.4%	47%	0.2
Pli-AMvi_045-Ex1-6D-lcwgs-1-1.1	23.5%	47%	0.0
Pli-AMvi_045-Ex1-6D-lcwgs-1-1.2	23.4%	47%	0.0
Pli-AMvi_045-Ex1-6D-lcwgs-2-1.1	70.0%	47%	0.0
Pli-AMvi_045-Ex1-6D-lcwgs-2-1.2	67.7%	48%	0.0
Pli-AMvi_046-Ex1-1E-lcwgs-1-1.1	13.6%	47%	0.0
Pli-AMvi_046-Ex1-1E-lcwgs-1-1.2	18.1%	48%	0.0
Pli-AMvi_046-Ex1-1E-lcwgs-2-1.1	68.1%	47%	1.3
Pli-AMvi_046-Ex1-1E-lcwgs-2-1.2	66.7%	47%	1.3
Pli-AMvi_047-Ex1-2E-lcwgs-1-1.1	17.4%	44%	0.1
Pli-AMvi_047-Ex1-2E-lcwgs-1-1.2	17.1%	45%	0.1
Pli-AMvi_047-Ex1-2E-lcwgs-2-1.1	56.7%	47%	0.0
Pli-AMvi_047-Ex1-2E-lcwgs-2-1.2	53.0%	47%	0.0
Pli-AMvi_048-Ex1-3E-lcwgs-1-1.1	9.0%	45%	0.0
Pli-AMvi_048-Ex1-3E-lcwgs-1-1.2	10.2%	46%	0.0
Pli-AMvi_048-Ex1-3E-lcwgs-2-1.1	7.1%	42%	0.0
Pli-AMvi_048-Ex1-3E-lcwgs-2-1.2	8.6%	43%	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-1-1.1	7.4%	46%	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-1-1.2	11.3%	47%	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-2-1.1	22.8%	45%	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-2-1.2	22.8%	45%	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-1-1.1	6.5%	46%	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-1-1.2	12.3%	47%	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-2-1.1	30.5%	46%	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-2-1.2	29.2%	46%	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-1-1.1	22.5%	47%	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-1-1.2	23.3%	48%	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-2-1.1	74.4%	47%	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-2-1.2	72.2%	48%	0.0
Pli-AMvi_052-Ex1-7D-lcwgs-1-1.1	15.7%	45%	0.5
Pli-AMvi_052-Ex1-7D-lcwgs-1-1.2	14.9%	46%	0.5
Pli-AMvi_052-Ex1-7D-lcwgs-2-1.1	81.5%	48%	0.0
Pli-AMvi_052-Ex1-7D-lcwgs-2-1.2	79.5%	48%	0.0
Pli-AMvi_053-Ex1-8D-lcwgs-1-1.1	9.3%	46%	0.0
Pli-AMvi_053-Ex1-8D-lcwgs-1-1.2	12.4%	47%	0.0
Pli-AMvi_053-Ex1-8D-lcwgs-2-1.1	42.5%	46%	0.0
Pli-AMvi_053-Ex1-8D-lcwgs-2-1.2	42.7%	47%	0.0
Pli-AMvi_054-Ex1-9D-lcwgs-1-1.1	17.6%	46%	0.1
Pli-AMvi_054-Ex1-9D-lcwgs-1-1.2	16.8%	46%	0.1
Pli-AMvi_054-Ex1-9D-lcwgs-2-1.1	41.0%	47%	0.0
Pli-AMvi_054-Ex1-9D-lcwgs-2-1.2	40.2%	48%	0.0
Pli-AMvi_055-Ex1-10D-lcwgs-1-1.1	15.2%	45%	0.1
Pli-AMvi_055-Ex1-10D-lcwgs-1-1.2	14.4%	45%	0.1
Pli-AMvi_055-Ex1-10D-lcwgs-2-1.1	54.1%	47%	0.0
Pli-AMvi_055-Ex1-10D-lcwgs-2-1.2	55.7%	47%	0.0
Pli-AMvi_056-Ex1-11D-lcwgs-1-1.1	7.5%	45%	0.0
Pli-AMvi_056-Ex1-11D-lcwgs-1-1.2	9.4%	46%	0.0
Pli-AMvi_056-Ex1-11D-lcwgs-2-1.1	35.1%	49%	0.0
Pli-AMvi_056-Ex1-11D-lcwgs-2-1.2	37.2%	48%	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-1-1.1	8.8%	44%	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-1-1.2	9.2%	44%	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-2-1.1	22.0%	50%	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-2-1.2	24.3%	50%	0.0
Pli-AMvi_058-Ex1-1F-lcwgs-1-1.1	11.6%	46%	0.0
Pli-AMvi_058-Ex1-1F-lcwgs-1-1.2	16.3%	48%	0.0
Pli-AMvi_058-Ex1-1F-lcwgs-2-1.1	47.3%	55%	1.5
Pli-AMvi_058-Ex1-1F-lcwgs-2-1.2	41.0%	56%	1.5
Pli-AMvi_059-Ex1-2F-lcwgs-1-1.1	9.8%	46%	0.0
Pli-AMvi_059-Ex1-2F-lcwgs-1-1.2	11.5%	46%	0.0
Pli-AMvi_059-Ex1-2F-lcwgs-2-1.1	18.0%	51%	0.0
Pli-AMvi_059-Ex1-2F-lcwgs-2-1.2	19.4%	51%	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-1-1.1	9.1%	45%	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-1-1.2	10.6%	46%	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-2-1.1	17.0%	48%	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-2-1.2	16.0%	48%	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-1-1.1	8.2%	46%	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-1-1.2	11.5%	47%	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-2-1.1	25.9%	51%	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-2-1.2	26.5%	50%	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-1-1.1	10.7%	46%	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-1-1.2	13.4%	47%	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-2-1.1	22.9%	48%	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-2-1.2	26.0%	48%	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-1-1.1	23.3%	47%	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-1-1.2	22.2%	47%	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-2-1.1	26.0%	48%	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-2-1.2	25.0%	48%	0.0
Pli-AMvi_064-Ex1-7E-lcwgs-1-1.1	14.3%	45%	0.1
Pli-AMvi_064-Ex1-7E-lcwgs-1-1.2	13.9%	45%	0.1
Pli-AMvi_064-Ex1-7E-lcwgs-2-1.1	85.6%	48%	0.0
Pli-AMvi_064-Ex1-7E-lcwgs-2-1.2	83.1%	48%	0.0
Pli-AMvi_065-Ex1-8E-lcwgs-1-1.1	13.1%	43%	0.1
Pli-AMvi_065-Ex1-8E-lcwgs-1-1.2	12.9%	44%	0.1
Pli-AMvi_065-Ex1-8E-lcwgs-2-1.1	60.1%	47%	0.0
Pli-AMvi_065-Ex1-8E-lcwgs-2-1.2	58.3%	47%	0.0
Pli-AMvi_066-Ex1-9E-lcwgs-1-1.1	10.0%	45%	0.0
Pli-AMvi_066-Ex1-9E-lcwgs-1-1.2	13.0%	46%	0.0
Pli-AMvi_066-Ex1-9E-lcwgs-2-1.1	28.6%	47%	0.0
Pli-AMvi_066-Ex1-9E-lcwgs-2-1.2	27.7%	48%	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-1-1.1	12.7%	45%	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-1-1.2	12.3%	46%	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-2-1.1	14.3%	38%	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-2-1.2	14.3%	38%	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-1-1.1	15.8%	47%	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-1-1.2	19.6%	48%	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-2-1.1	33.2%	50%	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-2-1.2	31.5%	50%	0.0
Pli-AMvi_069-Ex1-12E-lcwgs-1-1.1	5.5%	44%	0.0
Pli-AMvi_069-Ex1-12E-lcwgs-1-1.2	6.8%	45%	0.0
Pli-AMvi_069-Ex1-12E-lcwgs-2-1.1	31.7%	58%	0.7
Pli-AMvi_069-Ex1-12E-lcwgs-2-1.2	27.3%	58%	0.7
Pli-AMvi_070-Ex1-1G-lcwgs-1-1.1	12.0%	46%	0.0
Pli-AMvi_070-Ex1-1G-lcwgs-1-1.2	16.6%	48%	0.0
Pli-AMvi_070-Ex1-1G-lcwgs-2-1.1	48.7%	55%	2.3
Pli-AMvi_070-Ex1-1G-lcwgs-2-1.2	41.7%	55%	2.3
Pli-AMvi_071-Ex1-2G-lcwgs-1-1.1	9.6%	46%	0.0
Pli-AMvi_071-Ex1-2G-lcwgs-1-1.2	11.3%	46%	0.0
Pli-AMvi_071-Ex1-2G-lcwgs-2-1.1	50.7%	55%	2.0
Pli-AMvi_071-Ex1-2G-lcwgs-2-1.2	42.5%	55%	2.0
Pli-AMvi_072-Ex1-3G-lcwgs-1-1.1	9.3%	45%	0.0
Pli-AMvi_072-Ex1-3G-lcwgs-1-1.2	10.5%	46%	0.0
Pli-AMvi_072-Ex1-3G-lcwgs-2-1.1	27.0%	48%	0.0
Pli-AMvi_072-Ex1-3G-lcwgs-2-1.2	28.1%	48%	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-1-1.1	8.1%	46%	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-1-1.2	10.8%	47%	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-2-1.1	58.8%	47%	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-2-1.2	56.2%	47%	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-1-1.1	7.5%	45%	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-1-1.2	13.1%	47%	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-2-1.1	27.6%	47%	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-2-1.2	27.7%	48%	0.0
Pli-AMvi_075-Ex1-6G-lcwgs-1-1.1	6.5%	45%	0.0
Pli-AMvi_075-Ex1-6G-lcwgs-1-1.2	12.1%	46%	0.0
Pli-AMvi_075-Ex1-6G-lcwgs-2-1.1	50.5%	49%	0.9
Pli-AMvi_075-Ex1-6G-lcwgs-2-1.2	48.9%	49%	0.9
Pli-AMvi_076-Ex1-7F-lcwgs-1-1.1	17.8%	46%	0.1
Pli-AMvi_076-Ex1-7F-lcwgs-1-1.2	16.8%	47%	0.1
Pli-AMvi_076-Ex1-7F-lcwgs-2-1.1	39.7%	49%	0.0
Pli-AMvi_076-Ex1-7F-lcwgs-2-1.2	38.9%	49%	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-1-1.1	15.5%	46%	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-1-1.2	15.8%	47%	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-2-1.1	31.2%	49%	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-2-1.2	32.5%	49%	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-1-1.1	11.2%	45%	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-1-1.2	13.7%	46%	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-2-1.1	34.1%	49%	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-2-1.2	33.7%	49%	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-1-1.1	6.6%	45%	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-1-1.2	10.0%	46%	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-2-1.1	26.5%	55%	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-2-1.2	26.8%	55%	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-1-1.1	5.3%	45%	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-1-1.2	7.7%	46%	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-2-1.1	0.0%	41%	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-2-1.2	0.0%	42%	0.0
Pli-AMvi_081-Ex1-12F-lcwgs-1-1.1	5.4%	43%	0.0
Pli-AMvi_081-Ex1-12F-lcwgs-1-1.2	5.1%	43%	0.0
Pli-AMvi_081-Ex1-12F-lcwgs-2-1.1	26.5%	56%	0.3
Pli-AMvi_081-Ex1-12F-lcwgs-2-1.2	20.8%	56%	0.3
Pli-AMvi_082-Ex1-1H-lcwgs-1-1.1	22.9%	46%	2.8
Pli-AMvi_082-Ex1-1H-lcwgs-1-1.2	22.2%	46%	2.8
Pli-AMvi_082-Ex1-1H-lcwgs-2-1.1	28.8%	54%	0.3
Pli-AMvi_082-Ex1-1H-lcwgs-2-1.2	25.5%	54%	0.3
Pli-AMvi_083-Ex1-2H-lcwgs-1-1.1	20.8%	45%	3.3
Pli-AMvi_083-Ex1-2H-lcwgs-1-1.2	19.8%	45%	3.3
Pli-AMvi_083-Ex1-2H-lcwgs-2-1.1	23.8%	45%	0.1
Pli-AMvi_083-Ex1-2H-lcwgs-2-1.2	22.7%	46%	0.1
Pli-AMvi_084-Ex1-3H-lcwgs-1-1.1	23.0%	46%	1.4
Pli-AMvi_084-Ex1-3H-lcwgs-1-1.2	21.8%	47%	1.4
Pli-AMvi_084-Ex1-3H-lcwgs-2-1.1	53.2%	48%	0.8
Pli-AMvi_084-Ex1-3H-lcwgs-2-1.2	51.8%	49%	0.8
Pli-AMvi_085-Ex1-4H-lcwgs-1-1.1	19.8%	45%	0.5
Pli-AMvi_085-Ex1-4H-lcwgs-1-1.2	18.8%	46%	0.5
Pli-AMvi_085-Ex1-4H-lcwgs-2-1.1	53.0%	46%	0.1
Pli-AMvi_085-Ex1-4H-lcwgs-2-1.2	52.1%	47%	0.1
Pli-AMvi_086-Ex1-5H-lcwgs-1-1.1	33.5%	47%	0.1
Pli-AMvi_086-Ex1-5H-lcwgs-1-1.2	30.7%	47%	0.1
Pli-AMvi_086-Ex1-5H-lcwgs-2-1.1	36.8%	46%	1.7
Pli-AMvi_086-Ex1-5H-lcwgs-2-1.2	35.8%	46%	1.7
Pli-AMvi_087-Ex1-6H-lcwgs-1-1.1	33.8%	47%	0.3
Pli-AMvi_087-Ex1-6H-lcwgs-1-1.2	32.5%	48%	0.3
Pli-AMvi_087-Ex1-6H-lcwgs-2-1.1	66.2%	48%	2.0
Pli-AMvi_087-Ex1-6H-lcwgs-2-1.2	64.9%	49%	2.0
Pli-AMvi_088-Ex1-7G-lcwgs-1-1.1	8.6%	46%	0.0
Pli-AMvi_088-Ex1-7G-lcwgs-1-1.2	12.5%	47%	0.0
Pli-AMvi_088-Ex1-7G-lcwgs-2-1.1	55.9%	48%	1.6
Pli-AMvi_088-Ex1-7G-lcwgs-2-1.2	54.7%	48%	1.6
Pli-AMvi_089-Ex1-8G-lcwgs-1-1.1	7.6%	45%	0.0
Pli-AMvi_089-Ex1-8G-lcwgs-1-1.2	11.0%	46%	0.0
Pli-AMvi_089-Ex1-8G-lcwgs-2-1.1	34.3%	48%	0.0
Pli-AMvi_089-Ex1-8G-lcwgs-2-1.2	34.8%	48%	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-1-1.1	11.5%	45%	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-1-1.2	13.9%	46%	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-2-1.1	33.4%	48%	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-2-1.2	33.4%	49%	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-1-1.1	5.8%	45%	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-1-1.2	9.0%	46%	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-2-1.1	23.8%	54%	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-2-1.2	22.4%	54%	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-1-1.1	6.5%	45%	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-1-1.2	8.3%	46%	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-2-1.1	9.8%	46%	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-2-1.2	12.2%	47%	0.0
Pli-AMvi_093-Ex1-12G-lcwgs-1-1.1	5.1%	44%	0.0
Pli-AMvi_093-Ex1-12G-lcwgs-1-1.2	5.8%	44%	0.0
Pli-AMvi_093-Ex1-12G-lcwgs-2-1.1	45.3%	56%	0.7
Pli-AMvi_093-Ex1-12G-lcwgs-2-1.2	37.0%	57%	0.7
Pli-AMvi_094-Ex1-7H-lcwgs-1-1.1	20.5%	46%	0.4
Pli-AMvi_094-Ex1-7H-lcwgs-1-1.2	19.3%	46%	0.4
Pli-AMvi_094-Ex1-7H-lcwgs-2-1.1	44.0%	46%	0.5
Pli-AMvi_094-Ex1-7H-lcwgs-2-1.2	43.0%	47%	0.5
Pli-AMvi_095-Ex1-8H-lcwgs-1-1.1	36.3%	47%	0.4
Pli-AMvi_095-Ex1-8H-lcwgs-1-1.2	33.9%	48%	0.4
Pli-AMvi_095-Ex1-8H-lcwgs-2-1.1	57.6%	47%	0.1
Pli-AMvi_095-Ex1-8H-lcwgs-2-1.2	56.0%	47%	0.1
Pli-AMvi_096-Ex1-9H-lcwgs-1-1.1	27.8%	46%	0.0
Pli-AMvi_096-Ex1-9H-lcwgs-1-1.2	27.2%	47%	0.0
Pli-AMvi_096-Ex1-9H-lcwgs-2-1.1	23.0%	47%	0.0
Pli-AMvi_096-Ex1-9H-lcwgs-2-1.2	28.4%	48%	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-1-1.1	10.1%	46%	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-1-1.2	11.5%	47%	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-2-1.1	26.6%	46%	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-2-1.2	38.3%	46%	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-1-1.1	5.7%	45%	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-1-1.2	7.2%	46%	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-2-1.1	19.5%	49%	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-2-1.2	22.1%	49%	0.0
Pli-AMvi_099-Ex1-12H-lcwgs-1-1.1	7.3%	43%	0.0
Pli-AMvi_099-Ex1-12H-lcwgs-1-1.2	7.3%	43%	0.0
Pli-AMvi_099-Ex1-12H-lcwgs-2-1.1	57.1%	54%	1.6
Pli-AMvi_099-Ex1-12H-lcwgs-2-1.2	47.5%	54%	1.6
Pli-CMvi_001-Ex1-1B-lcwgs-1-1.1	16.7%	43%	4.8
Pli-CMvi_001-Ex1-1B-lcwgs-1-1.2	14.7%	43%	4.8
Pli-CMvi_002-Ex1-2A-lcwgs-1-1.1	10.2%	43%	1.5
Pli-CMvi_003-Ex1-2G-lcwgs-1-1.1	23.0%	43%	0.8
Pli-CMvi_003-Ex1-2G-lcwgs-1-1.2	21.8%	44%	0.8
Pli-CMvi_004-Ex1-3F-lcwgs-1-1.1	13.6%	42%	6.1
Pli-CMvi_005-Ex1-4C-lcwgs-1-1.1	4.9%	43%	0.0
Pli-CMvi_005-Ex1-4C-lcwgs-1-1.2	4.5%	44%	0.0
Pli-CMvi_006-Ex1-5A-lcwgs-1-1.1	7.6%	44%	0.1
Pli-CMvi_006-Ex1-5A-lcwgs-1-1.2	7.1%	44%	0.1
Pli-CMvi_007-Ex1-5G-lcwgs-1-1.1	17.6%	43%	3.4
Pli-CMvi_013-Ex1-1C-lcwgs-1-1.1	27.2%	44%	3.3
Pli-CMvi_013-Ex1-1C-lcwgs-1-1.2	23.9%	44%	3.3
Pli-CMvi_014-Ex1-2B-lcwgs-1-1.1	6.9%	43%	0.0
Pli-CMvi_014-Ex1-2B-lcwgs-1-1.2	6.1%	44%	0.0
Pli-CMvi_015-Ex1-2H-lcwgs-1-1.1	26.0%	44%	2.7
Pli-CMvi_015-Ex1-2H-lcwgs-1-1.2	24.3%	44%	2.7
Pli-CMvi_020-Ex1-6D-lcwgs-1-1.1	22.4%	43%	5.2
Pli-CMvi_020-Ex1-6D-lcwgs-1-1.2	19.1%	44%	5.2
Pli-CMvi_021-Ex1-6G-lcwgs-1-1.1	9.1%	42%	0.9
Pli-CMvi_021-Ex1-6G-lcwgs-1-1.2	7.7%	43%	0.9
Pli-CMvi_022-Ex1-7B-lcwgs-1-1.1	10.6%	43%	0.1
Pli-CMvi_022-Ex1-7B-lcwgs-1-1.2	9.6%	43%	0.1
Pli-CMvi_023-Ex1-7F-lcwgs-1-1.1	10.7%	43%	1.3
Pli-CMvi_023-Ex1-7F-lcwgs-1-1.2	9.5%	43%	1.3
Pli-CMvi_025-Ex1-1D-lcwgs-1-1.1	84.1%	47%	0.7
Pli-CMvi_025-Ex1-1D-lcwgs-1-1.2	82.9%	47%	0.7
Pli-CMvi_028-Ex1-3G-lcwgs-1-1.1	14.5%	43%	3.4
Pli-CMvi_028-Ex1-3G-lcwgs-1-1.2	12.0%	43%	3.4
Pli-CMvi_030-Ex1-5B-lcwgs-1-1.1	5.5%	43%	0.0
Pli-CMvi_030-Ex1-5B-lcwgs-1-1.2	4.8%	44%	0.0
Pli-CMvi_031-Ex1-5H-lcwgs-1-1.1	24.9%	44%	3.5
Pli-CMvi_031-Ex1-5H-lcwgs-1-1.2	22.0%	44%	3.5
Pli-CMvi_034-Ex1-7C-lcwgs-1-1.1	9.1%	43%	0.3
Pli-CMvi_034-Ex1-7C-lcwgs-1-1.2	8.4%	43%	0.3
Pli-CMvi_037-Ex1-1E-lcwgs-1-1.1	32.6%	44%	3.8
Pli-CMvi_037-Ex1-1E-lcwgs-1-1.2	29.3%	44%	3.8
Pli-CMvi_038-Ex1-2C-lcwgs-1-1.1	13.1%	43%	0.1
Pli-CMvi_038-Ex1-2C-lcwgs-1-1.2	11.7%	43%	0.1
Pli-CMvi_039-Ex1-3A-lcwgs-1-1.1	20.6%	44%	4.2
Pli-CMvi_039-Ex1-3A-lcwgs-1-1.2	18.2%	44%	4.2
Pli-CMvi_040-Ex1-3H-lcwgs-1-1.1	13.7%	43%	4.7
Pli-CMvi_041-Ex1-4E-lcwgs-1-1.1	13.7%	43%	4.2
Pli-CMvi_042-Ex1-5C-lcwgs-1-1.1	13.5%	43%	5.4
Pli-CMvi_042-Ex1-5C-lcwgs-1-1.2	11.1%	43%	5.4
Pli-CMvi_047-Ex1-7G-lcwgs-1-1.1	11.1%	43%	1.1
Pli-CMvi_047-Ex1-7G-lcwgs-1-1.2	9.7%	43%	1.1
Pli-CMvi_049-Ex1-1F-lcwgs-1-1.1	17.0%	43%	6.8
Pli-CMvi_049-Ex1-1F-lcwgs-1-1.2	15.1%	43%	6.8
Pli-CMvi_051-Ex1-3B-lcwgs-1-1.1	15.6%	43%	8.3
Pli-CMvi_051-Ex1-3B-lcwgs-1-1.2	13.4%	43%	8.3
Pli-CMvi_053-Ex1-4F-lcwgs-1-1.1	9.1%	43%	0.3
Pli-CMvi_053-Ex1-4F-lcwgs-1-1.2	8.1%	43%	0.3
Pli-CMvi_054-Ex1-5D-lcwgs-1-1.1	12.8%	43%	3.2
Pli-CMvi_054-Ex1-5D-lcwgs-1-1.2	11.4%	43%	3.2
Pli-CMvi_059-Ex1-7H-lcwgs-1-1.1	11.9%	43%	2.8
Pli-CMvi_059-Ex1-7H-lcwgs-1-1.2	10.2%	43%	2.8
Pli-CMvi_060-Ex1-8F-lcwgs-1-1.1	11.1%	43%	0.1
Pli-CMvi_060-Ex1-8F-lcwgs-1-1.2	9.6%	43%	0.1
Pli-CMvi_062-Ex1-2D-lcwgs-1-1.1	15.7%	43%	6.2
Pli-CMvi_062-Ex1-2D-lcwgs-1-1.2	14.4%	43%	6.2
Pli-CMvi_063-Ex1-3C-lcwgs-1-1.1	13.2%	43%	4.1
Pli-CMvi_063-Ex1-3C-lcwgs-1-1.2	11.2%	43%	4.1
Pli-CMvi_064-Ex1-4A-lcwgs-1-1.1	17.4%	43%	5.9
Pli-CMvi_064-Ex1-4A-lcwgs-1-1.2	14.8%	43%	5.9
Pli-CMvi_065-Ex1-4G-lcwgs-1-1.1	18.0%	43%	0.3
Pli-CMvi_065-Ex1-4G-lcwgs-1-1.2	16.7%	44%	0.3
Pli-CMvi_066-Ex1-5E-lcwgs-1-1.1	17.8%	43%	8.2
Pli-CMvi_066-Ex1-5E-lcwgs-1-1.2	15.1%	43%	8.2
Pli-CMvi_070-Ex1-7D-lcwgs-1-1.1	9.9%	43%	0.1
Pli-CMvi_070-Ex1-7D-lcwgs-1-1.2	9.0%	44%	0.1
Pli-CMvi_071-Ex1-8A-lcwgs-1-1.1	9.5%	44%	0.0
Pli-CMvi_071-Ex1-8A-lcwgs-1-1.2	9.0%	44%	0.0
Pli-CMvi_072-Ex1-8G-lcwgs-1-1.1	12.1%	43%	0.6
Pli-CMvi_072-Ex1-8G-lcwgs-1-1.2	10.4%	43%	0.6
Pli-CMvi_073-Ex1-1G-lcwgs-1-1.1	22.8%	44%	5.0
Pli-CMvi_073-Ex1-1G-lcwgs-1-1.2	20.0%	44%	5.0
Pli-CMvi_074-Ex1-2E-lcwgs-1-1.1	27.7%	43%	0.2
Pli-CMvi_074-Ex1-2E-lcwgs-1-1.2	17.4%	44%	0.2
Pli-CMvi_075-Ex1-3D-lcwgs-1-1.1	8.5%	43%	0.3
Pli-CMvi_075-Ex1-3D-lcwgs-1-1.2	7.7%	43%	0.3
Pli-CMvi_076-Ex1-4B-lcwgs-1-1.1	6.6%	43%	0.0
Pli-CMvi_076-Ex1-4B-lcwgs-1-1.2	5.9%	44%	0.0
Pli-CMvi_078-Ex1-5F-lcwgs-1-1.1	8.0%	43%	0.1
Pli-CMvi_078-Ex1-5F-lcwgs-1-1.2	7.2%	44%	0.1
Pli-CMvi_082-Ex1-7E-lcwgs-1-1.1	13.4%	43%	0.2
Pli-CMvi_082-Ex1-7E-lcwgs-1-1.2	12.3%	43%	0.2
Pli-CMvi_083-Ex1-8B-lcwgs-1-1.1	10.9%	43%	0.0
Pli-CMvi_083-Ex1-8B-lcwgs-1-1.2	9.3%	43%	0.0
Pli-CMvi_084-Ex1-8H-lcwgs-1-1.1	26.3%	44%	1.0
Pli-CMvi_084-Ex1-8H-lcwgs-1-1.2	24.4%	44%	1.0
Pli-CMvi_085-Ex1-1H-lcwgs-1-1.1	14.3%	43%	4.4
Pli-CMvi_085-Ex1-1H-lcwgs-1-1.2	12.4%	43%	4.4
Pli-CMvi_086-Ex1-2F-lcwgs-1-1.1	16.6%	43%	4.6
Pli-CMvi_086-Ex1-2F-lcwgs-1-1.2	14.1%	43%	4.6
Pli-CMvi_087-Ex1-3E-lcwgs-1-1.1	15.3%	43%	6.3
Pli-CMvi_087-Ex1-3E-lcwgs-1-1.2	12.6%	43%	6.3
Pli-CMvi_089-Ex1-4H-lcwgs-1-1.1	15.0%	43%	2.6
Pli-CMvi_089-Ex1-4H-lcwgs-1-1.2	13.2%	43%	2.6
Pli-CMvi_093-Ex1-7A-lcwgs-1-1.1	5.5%	44%	0.0
Pli-CMvi_093-Ex1-7A-lcwgs-1-1.2	5.3%	44%	0.0
Pli-CMvi_095-Ex1-8C-lcwgs-1-1.1	7.5%	43%	0.0
Pli-CMvi_095-Ex1-8C-lcwgs-1-1.2	7.2%	44%	0.0
```
</p>
</details>

## 8. First trim.
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	# Variants	% Duplication	GC content	% PF	% Adapter
Pli-AMvi_004-Ex1-1A-lcwgs-1-1		10.3%	47.0%	68.4%	94.8%
Pli-AMvi_004-Ex1-1A-lcwgs-2-1		17.4%	57.2%	90.1%	16.8%
Pli-AMvi_005-Ex1-2A-lcwgs-1-1		0.8%	44.8%	79.5%	74.7%
Pli-AMvi_005-Ex1-2A-lcwgs-2-1		1.0%	48.9%	67.3%	67.5%
Pli-AMvi_006-Ex1-3A-lcwgs-1-1		0.7%	43.6%	80.8%	77.0%
Pli-AMvi_006-Ex1-3A-lcwgs-2-1		3.7%	45.1%	64.6%	89.2%
Pli-AMvi_007-Ex1-4A-lcwgs-1-1		10.6%	40.4%	86.2%	93.5%
Pli-AMvi_007-Ex1-4A-lcwgs-2-1		0.8%	44.1%	63.6%	87.5%
Pli-AMvi_008-Ex1-1B-lcwgs-1-1		12.3%	41.6%	87.8%	91.9%
Pli-AMvi_008-Ex1-1B-lcwgs-2-1		10.4%	48.4%	53.8%	86.5%
Pli-AMvi_009-Ex1-2B-lcwgs-1-1		1.1%	44.8%	80.4%	77.0%
Pli-AMvi_009-Ex1-2B-lcwgs-2-1		4.5%	49.5%	50.4%	76.4%
Pli-AMvi_010-Ex1-7A-lcwgs-1-1		9.7%	39.3%	92.1%	93.8%
Pli-AMvi_010-Ex1-7A-lcwgs-2-1		12.3%	47.2%	74.2%	82.6%
Pli-AMvi_011-Ex1-8A-lcwgs-1-1		10.9%	39.7%	89.3%	96.1%
Pli-AMvi_011-Ex1-8A-lcwgs-2-1		15.3%	49.0%	74.4%	75.3%
Pli-AMvi_012-Ex1-9A-lcwgs-1-1		12.7%	39.7%	87.9%	95.7%
Pli-AMvi_012-Ex1-9A-lcwgs-2-1		15.5%	47.4%	77.6%	78.5%
Pli-AMvi_013-Ex1-10A-lcwgs-1-1		10.0%	39.5%	92.6%	94.4%
Pli-AMvi_013-Ex1-10A-lcwgs-2-1		1.4%	46.6%	69.0%	84.0%
Pli-AMvi_014-Ex1-11A-lcwgs-1-1		13.2%	46.9%	81.1%	83.0%
Pli-AMvi_014-Ex1-11A-lcwgs-2-1		12.4%	48.6%	10.5%	94.3%
Pli-AMvi_015-Ex1-12A-lcwgs-1-1		3.0%	44.1%	87.3%	57.0%
Pli-AMvi_015-Ex1-12A-lcwgs-2-1		0.6%	53.3%	56.5%	60.7%
Pli-AMvi_016-Ex1-3B-lcwgs-1-1		9.4%	41.4%	91.6%	95.7%
Pli-AMvi_016-Ex1-3B-lcwgs-2-1		9.8%	43.3%	82.3%	95.3%
Pli-AMvi_017-Ex1-4B-lcwgs-1-1		9.3%	41.5%	89.1%	93.3%
Pli-AMvi_017-Ex1-4B-lcwgs-2-1		1.4%	48.1%	50.7%	83.9%
Pli-AMvi_018-Ex1-1C-lcwgs-1-1		10.0%	44.3%	82.2%	88.4%
Pli-AMvi_018-Ex1-1C-lcwgs-2-1		6.6%	50.9%	25.1%	85.7%
Pli-AMvi_019-Ex1-2C-lcwgs-1-1		6.6%	44.0%	81.5%	88.4%
Pli-AMvi_019-Ex1-2C-lcwgs-2-1		3.6%	46.8%	67.3%	76.6%
Pli-AMvi_020-Ex1-3C-lcwgs-1-1		5.7%	44.7%	47.1%	90.0%
Pli-AMvi_020-Ex1-3C-lcwgs-2-1		3.4%	45.8%	56.8%	84.4%
Pli-AMvi_021-Ex1-4C-lcwgs-1-1		9.3%	41.3%	87.7%	95.1%
Pli-AMvi_021-Ex1-4C-lcwgs-2-1		9.6%	43.5%	66.4%	97.1%
Pli-AMvi_022-Ex1-7B-lcwgs-1-1		10.5%	39.5%	92.3%	91.6%
Pli-AMvi_022-Ex1-7B-lcwgs-2-1		19.1%	52.4%	62.7%	61.0%
Pli-AMvi_023-Ex1-8B-lcwgs-1-1		10.5%	39.8%	89.3%	93.8%
Pli-AMvi_023-Ex1-8B-lcwgs-2-1		12.4%	47.9%	51.4%	87.0%
Pli-AMvi_024-Ex1-9B-lcwgs-1-1		11.8%	39.9%	90.9%	95.2%
Pli-AMvi_024-Ex1-9B-lcwgs-2-1		28.5%	53.7%	62.7%	61.6%
Pli-AMvi_025-Ex1-10B-lcwgs-1-1		9.1%	40.2%	89.1%	93.5%
Pli-AMvi_025-Ex1-10B-lcwgs-2-1		6.4%	44.5%	55.8%	80.5%
Pli-AMvi_026-Ex1-11B-lcwgs-1-1		10.3%	41.9%	94.3%	95.7%
Pli-AMvi_026-Ex1-11B-lcwgs-2-1		11.7%	45.1%	23.6%	95.4%
Pli-AMvi_027-Ex1-12B-lcwgs-1-1		4.7%	43.3%	92.4%	41.5%
Pli-AMvi_027-Ex1-12B-lcwgs-2-1		2.0%	50.0%	69.7%	64.2%
Pli-AMvi_028-Ex1-1D-lcwgs-1-1		5.2%	46.1%	76.0%	76.8%
Pli-AMvi_028-Ex1-1D-lcwgs-2-1		2.2%	50.5%	49.1%	76.2%
Pli-AMvi_029-Ex1-2D-lcwgs-1-1		10.1%	42.1%	87.9%	93.9%
Pli-AMvi_029-Ex1-2D-lcwgs-2-1		10.1%	44.2%	59.3%	96.5%
Pli-AMvi_030-Ex1-3D-lcwgs-1-1		9.5%	43.4%	88.2%	94.2%
Pli-AMvi_030-Ex1-3D-lcwgs-2-1		9.6%	44.3%	62.9%	94.9%
Pli-AMvi_031-Ex1-4D-lcwgs-1-1		3.5%	46.1%	73.4%	73.4%
Pli-AMvi_031-Ex1-4D-lcwgs-2-1		1.6%	46.8%	47.3%	86.6%
Pli-AMvi_032-Ex1-5C-lcwgs-1-1		10.8%	41.2%	87.1%	93.6%
Pli-AMvi_032-Ex1-5C-lcwgs-2-1		10.4%	43.1%	66.8%	96.5%
Pli-AMvi_033-Ex1-6C-lcwgs-1-1		8.8%	43.3%	79.4%	92.3%
Pli-AMvi_033-Ex1-6C-lcwgs-2-1		10.9%	44.0%	70.8%	97.6%
Pli-AMvi_034-Ex1-7C-lcwgs-1-1		0.6%	45.7%	74.1%	68.0%
Pli-AMvi_034-Ex1-7C-lcwgs-2-1		6.7%	46.2%	17.6%	93.9%
Pli-AMvi_035-Ex1-8C-lcwgs-1-1		8.3%	42.4%	86.0%	94.7%
Pli-AMvi_035-Ex1-8C-lcwgs-2-1		5.9%	44.6%	27.1%	91.1%
Pli-AMvi_036-Ex1-9C-lcwgs-1-1		23.3%	42.5%	87.3%	64.2%
Pli-AMvi_036-Ex1-9C-lcwgs-2-1		30.7%	48.9%	74.0%	48.3%
Pli-AMvi_037-Ex1-10C-lcwgs-1-1		9.9%	38.9%	91.4%	96.5%
Pli-AMvi_037-Ex1-10C-lcwgs-2-1		20.8%	40.5%	78.2%	85.3%
Pli-AMvi_038-Ex1-11C-lcwgs-1-1		10.4%	44.0%	83.8%	91.1%
Pli-AMvi_038-Ex1-11C-lcwgs-2-1		19.3%	45.3%	72.7%	66.1%
Pli-AMvi_039-Ex1-12C-lcwgs-1-1		5.5%	43.1%	91.4%	43.2%
Pli-AMvi_039-Ex1-12C-lcwgs-2-1		35.8%	57.7%	91.5%	14.1%
Pli-AMvi_040-Ex1-5A-lcwgs-1-1		10.3%	42.1%	90.2%	94.2%
Pli-AMvi_040-Ex1-5A-lcwgs-2-1		14.0%	47.4%	78.6%	80.0%
Pli-AMvi_041-Ex1-6A-lcwgs-1-1		11.4%	38.2%	88.9%	94.2%
Pli-AMvi_041-Ex1-6A-lcwgs-2-1		13.4%	44.5%	81.8%	87.9%
Pli-AMvi_042-Ex1-5B-lcwgs-1-1		0.7%	44.7%	77.8%	64.3%
Pli-AMvi_042-Ex1-5B-lcwgs-2-1		1.8%	47.0%	58.1%	86.8%
Pli-AMvi_043-Ex1-6B-lcwgs-1-1		10.6%	41.9%	83.6%	93.1%
Pli-AMvi_043-Ex1-6B-lcwgs-2-1		16.2%	51.0%	66.2%	78.7%
Pli-AMvi_044-Ex1-5D-lcwgs-1-1		0.6%	45.1%	78.6%	61.5%
Pli-AMvi_044-Ex1-5D-lcwgs-2-1		9.9%	44.5%	40.3%	97.0%
Pli-AMvi_045-Ex1-6D-lcwgs-1-1		8.9%	46.2%	75.9%	86.9%
Pli-AMvi_045-Ex1-6D-lcwgs-2-1		9.5%	47.8%	28.8%	92.8%
Pli-AMvi_046-Ex1-1E-lcwgs-1-1		1.1%	46.0%	75.2%	59.7%
Pli-AMvi_046-Ex1-1E-lcwgs-2-1		10.8%	45.4%	35.3%	92.2%
Pli-AMvi_047-Ex1-2E-lcwgs-1-1		9.7%	40.8%	88.4%	95.1%
Pli-AMvi_047-Ex1-2E-lcwgs-2-1		10.0%	46.0%	41.3%	93.6%
Pli-AMvi_048-Ex1-3E-lcwgs-1-1		0.7%	43.1%	83.1%	76.8%
Pli-AMvi_048-Ex1-3E-lcwgs-2-1		8.6%	38.4%	88.6%	91.4%
Pli-AMvi_049-Ex1-4E-lcwgs-1-1		0.6%	45.2%	81.6%	68.8%
Pli-AMvi_049-Ex1-4E-lcwgs-2-1		1.5%	40.5%	62.0%	83.7%
Pli-AMvi_050-Ex1-5E-lcwgs-1-1		0.5%	44.9%	82.7%	62.6%
Pli-AMvi_050-Ex1-5E-lcwgs-2-1		7.4%	44.0%	68.1%	89.8%
Pli-AMvi_051-Ex1-6E-lcwgs-1-1		7.0%	45.7%	72.2%	79.1%
Pli-AMvi_051-Ex1-6E-lcwgs-2-1		11.7%	48.8%	23.2%	94.6%
Pli-AMvi_052-Ex1-7D-lcwgs-1-1		9.8%	42.9%	88.7%	95.4%
Pli-AMvi_052-Ex1-7D-lcwgs-2-1		10.8%	48.5%	15.2%	94.4%
Pli-AMvi_053-Ex1-8D-lcwgs-1-1		0.8%	44.2%	80.0%	67.2%
Pli-AMvi_053-Ex1-8D-lcwgs-2-1		2.4%	43.6%	47.4%	89.0%
Pli-AMvi_054-Ex1-9D-lcwgs-1-1		9.6%	44.6%	86.0%	93.7%
Pli-AMvi_054-Ex1-9D-lcwgs-2-1		2.2%	47.5%	44.5%	78.1%
Pli-AMvi_055-Ex1-10D-lcwgs-1-1		8.4%	42.1%	90.3%	96.1%
Pli-AMvi_055-Ex1-10D-lcwgs-2-1		11.9%	44.2%	41.1%	90.3%
Pli-AMvi_056-Ex1-11D-lcwgs-1-1		0.8%	43.7%	84.6%	73.7%
Pli-AMvi_056-Ex1-11D-lcwgs-2-1		8.3%	49.5%	56.4%	70.2%
Pli-AMvi_057-Ex1-12D-lcwgs-1-1		9.8%	42.2%	86.4%	50.8%
Pli-AMvi_057-Ex1-12D-lcwgs-2-1		3.8%	51.2%	67.8%	60.1%
Pli-AMvi_058-Ex1-1F-lcwgs-1-1		0.5%	45.8%	77.7%	62.2%
Pli-AMvi_058-Ex1-1F-lcwgs-2-1		33.7%	58.1%	79.4%	26.2%
Pli-AMvi_059-Ex1-2F-lcwgs-1-1		1.1%	44.4%	82.3%	77.1%
Pli-AMvi_059-Ex1-2F-lcwgs-2-1		2.4%	53.5%	67.3%	49.1%
Pli-AMvi_060-Ex1-3F-lcwgs-1-1		0.8%	43.4%	83.6%	78.9%
Pli-AMvi_060-Ex1-3F-lcwgs-2-1		0.0%	48.9%	75.5%	75.0%
Pli-AMvi_061-Ex1-4F-lcwgs-1-1		0.7%	45.3%	81.5%	69.3%
Pli-AMvi_061-Ex1-4F-lcwgs-2-1		1.0%	52.7%	62.6%	66.0%
Pli-AMvi_062-Ex1-5F-lcwgs-1-1		1.3%	45.1%	80.3%	65.8%
Pli-AMvi_062-Ex1-5F-lcwgs-2-1		1.7%	48.8%	68.7%	76.1%
Pli-AMvi_063-Ex1-6F-lcwgs-1-1		7.6%	45.8%	72.3%	85.3%
Pli-AMvi_063-Ex1-6F-lcwgs-2-1		0.9%	47.7%	68.1%	80.8%
Pli-AMvi_064-Ex1-7E-lcwgs-1-1		9.5%	42.5%	92.3%	95.6%
Pli-AMvi_064-Ex1-7E-lcwgs-2-1		13.6%	48.3%	11.3%	94.5%
Pli-AMvi_065-Ex1-8E-lcwgs-1-1		9.5%	39.4%	93.0%	96.1%
Pli-AMvi_065-Ex1-8E-lcwgs-2-1		10.4%	46.0%	37.7%	96.0%
Pli-AMvi_066-Ex1-9E-lcwgs-1-1		0.9%	44.0%	80.1%	68.0%
Pli-AMvi_066-Ex1-9E-lcwgs-2-1		3.7%	48.2%	66.3%	67.4%
Pli-AMvi_067-Ex1-10E-lcwgs-1-1		7.6%	43.4%	90.3%	92.9%
Pli-AMvi_067-Ex1-10E-lcwgs-2-1		14.3%	34.5%	100.0%	95.2%
Pli-AMvi_068-Ex1-1E-lcwgs-1-1		2.0%	46.0%	73.0%	60.5%
Pli-AMvi_068-Ex1-1E-lcwgs-2-1		2.7%	53.2%	56.0%	64.4%
Pli-AMvi_069-Ex1-12E-lcwgs-1-1		1.2%	43.7%	88.0%	32.1%
Pli-AMvi_069-Ex1-12E-lcwgs-2-1		26.1%	60.0%	88.7%	16.6%
Pli-AMvi_070-Ex1-1G-lcwgs-1-1		0.8%	45.6%	77.2%	63.7%
Pli-AMvi_070-Ex1-1G-lcwgs-2-1		38.2%	57.4%	83.2%	22.8%
Pli-AMvi_071-Ex1-2G-lcwgs-1-1		0.8%	44.4%	82.7%	77.3%
Pli-AMvi_071-Ex1-2G-lcwgs-2-1		41.9%	56.6%	85.5%	19.0%
Pli-AMvi_072-Ex1-3G-lcwgs-1-1		0.8%	43.1%	83.3%	79.7%
Pli-AMvi_072-Ex1-3G-lcwgs-2-1		1.9%	49.3%	61.3%	74.0%
Pli-AMvi_073-Ex1-4G-lcwgs-1-1		0.6%	45.2%	80.8%	70.6%
Pli-AMvi_073-Ex1-4G-lcwgs-2-1		10.3%	46.2%	40.3%	90.1%
Pli-AMvi_074-Ex1-5G-lcwgs-1-1		0.9%	44.5%	82.3%	67.1%
Pli-AMvi_074-Ex1-5G-lcwgs-2-1		2.3%	47.1%	65.6%	80.2%
Pli-AMvi_075-Ex1-6G-lcwgs-1-1		0.9%	43.8%	77.0%	50.2%
Pli-AMvi_075-Ex1-6G-lcwgs-2-1		18.3%	51.1%	58.7%	76.1%
Pli-AMvi_076-Ex1-7F-lcwgs-1-1		8.9%	46.2%	83.2%	94.4%
Pli-AMvi_076-Ex1-7F-lcwgs-2-1		1.4%	51.2%	50.9%	74.9%
Pli-AMvi_077-Ex1-8F-lcwgs-1-1		3.9%	45.0%	78.1%	78.0%
Pli-AMvi_077-Ex1-8F-lcwgs-2-1		0.5%	51.4%	59.6%	76.2%
Pli-AMvi_078-Ex1-9F-lcwgs-1-1		0.9%	44.2%	79.7%	70.4%
Pli-AMvi_078-Ex1-9F-lcwgs-2-1		1.6%	50.3%	58.6%	69.5%
Pli-AMvi_079-Ex1-10F-lcwgs-1-1		0.5%	43.3%	83.7%	68.2%
Pli-AMvi_079-Ex1-10F-lcwgs-2-1		11.9%	57.6%	77.9%	30.9%
Pli-AMvi_080-Ex1-11F-lcwgs-1-1		0.9%	43.4%	88.6%	76.1%
Pli-AMvi_080-Ex1-11F-lcwgs-2-1		0.0%	36.4%	94.7%	94.7%
Pli-AMvi_081-Ex1-12F-lcwgs-1-1		1.2%	42.8%	89.0%	29.4%
Pli-AMvi_081-Ex1-12F-lcwgs-2-1		24.7%	56.7%	94.0%	8.4%
Pli-AMvi_082-Ex1-1H-lcwgs-1-1		10.4%	44.9%	82.6%	95.1%
Pli-AMvi_082-Ex1-1H-lcwgs-2-1		18.6%	56.6%	84.2%	39.4%
Pli-AMvi_083-Ex1-2H-lcwgs-1-1		10.6%	41.5%	84.8%	98.0%
Pli-AMvi_083-Ex1-2H-lcwgs-2-1		10.2%	42.6%	82.8%	97.2%
Pli-AMvi_084-Ex1-3H-lcwgs-1-1		10.4%	45.4%	83.0%	95.4%
Pli-AMvi_084-Ex1-3H-lcwgs-2-1		15.4%	50.6%	53.6%	80.3%
Pli-AMvi_085-Ex1-4H-lcwgs-1-1		10.3%	42.8%	84.2%	96.6%
Pli-AMvi_085-Ex1-4H-lcwgs-2-1		10.4%	44.1%	49.8%	97.2%
Pli-AMvi_086-Ex1-5H-lcwgs-1-1		9.2%	46.5%	64.8%	92.5%
Pli-AMvi_086-Ex1-5H-lcwgs-2-1		11.5%	43.5%	69.5%	95.4%
Pli-AMvi_087-Ex1-6H-lcwgs-1-1		9.6%	47.8%	68.6%	95.6%
Pli-AMvi_087-Ex1-6H-lcwgs-2-1		13.1%	51.7%	38.0%	86.9%
Pli-AMvi_088-Ex1-7G-lcwgs-1-1		0.8%	45.1%	79.3%	68.3%
Pli-AMvi_088-Ex1-7G-lcwgs-2-1		13.0%	48.3%	49.6%	86.3%
Pli-AMvi_089-Ex1-8G-lcwgs-1-1		0.9%	43.5%	83.7%	71.1%
Pli-AMvi_089-Ex1-8G-lcwgs-2-1		0.7%	48.5%	56.7%	80.3%
Pli-AMvi_090-Ex1-9G-lcwgs-1-1		0.6%	43.9%	80.0%	70.8%
Pli-AMvi_090-Ex1-9G-lcwgs-2-1		1.9%	49.4%	57.1%	70.9%
Pli-AMvi_091-Ex1-10G-lcwgs-1-1		0.6%	43.3%	82.7%	67.9%
Pli-AMvi_091-Ex1-10G-lcwgs-2-1		9.4%	56.4%	80.6%	27.4%
Pli-AMvi_092-Ex1-11G-lcwgs-1-1		0.9%	43.8%	87.6%	76.5%
Pli-AMvi_092-Ex1-11G-lcwgs-2-1		17.1%	46.7%	73.2%	50.0%
Pli-AMvi_093-Ex1-12G-lcwgs-1-1		5.2%	43.4%	92.1%	38.2%
Pli-AMvi_093-Ex1-12G-lcwgs-2-1		41.2%	57.4%	93.0%	9.1%
Pli-AMvi_094-Ex1-7H-lcwgs-1-1		9.7%	43.6%	82.7%	96.7%
Pli-AMvi_094-Ex1-7H-lcwgs-2-1		9.8%	44.4%	60.3%	97.5%
Pli-AMvi_095-Ex1-8H-lcwgs-1-1		10.2%	47.9%	64.7%	94.5%
Pli-AMvi_095-Ex1-8H-lcwgs-2-1		10.1%	46.3%	44.0%	96.3%
Pli-AMvi_096-Ex1-9H-lcwgs-1-1		3.3%	44.7%	63.7%	78.8%
Pli-AMvi_096-Ex1-9H-lcwgs-2-1		29.7%	49.5%	67.6%	71.6%
Pli-AMvi_097-Ex1-10H-lcwgs-1-1		1.2%	43.9%	82.2%	78.4%
Pli-AMvi_097-Ex1-10H-lcwgs-2-1		3.8%	41.8%	44.7%	83.5%
Pli-AMvi_098-Ex1-11H-lcwgs-1-1		0.7%	43.2%	87.7%	78.3%
Pli-AMvi_098-Ex1-11H-lcwgs-2-1		2.3%	50.6%	70.8%	60.6%
Pli-AMvi_099-Ex1-12H-lcwgs-1-1		7.2%	41.7%	87.2%	35.3%
Pli-AMvi_099-Ex1-12H-lcwgs-2-1		49.5%	55.4%	88.1%	16.1%
Pli-CMvi_001-Ex1-1B-lcwgs-1-1		11.3%	42.8%	91.1%	17.7%
Pli-CMvi_002-Ex1-2A-lcwgs-1-1		8.1%	42.9%	93.8%	23.4%
Pli-CMvi_003-Ex1-2G-lcwgs-1-1		8.9%	42.4%	81.2%	41.5%
Pli-CMvi_004-Ex1-3F-lcwgs-1-1		8.8%	42.6%	95.5%	19.1%
Pli-CMvi_005-Ex1-4C-lcwgs-1-1		0.4%	42.8%	89.7%	45.1%
Pli-CMvi_006-Ex1-5A-lcwgs-1-1		1.5%	43.0%	87.7%	42.4%
Pli-CMvi_007-Ex1-5G-lcwgs-1-1		8.0%	42.6%	87.9%	31.7%
Pli-CMvi_013-Ex1-1C-lcwgs-1-1		12.5%	43.7%	81.2%	17.8%
Pli-CMvi_014-Ex1-2B-lcwgs-1-1		1.2%	42.7%	89.2%	42.1%
Pli-CMvi_015-Ex1-2H-lcwgs-1-1		9.7%	43.0%	80.0%	32.0%
Pli-CMvi_020-Ex1-6D-lcwgs-1-1		14.5%	43.1%	88.7%	23.4%
Pli-CMvi_021-Ex1-6G-lcwgs-1-1		8.2%	42.4%	94.8%	16.8%
Pli-CMvi_022-Ex1-7B-lcwgs-1-1		6.1%	42.3%	92.0%	41.1%
Pli-CMvi_023-Ex1-7F-lcwgs-1-1		8.8%	42.2%	94.1%	35.3%
Pli-CMvi_025-Ex1-1D-lcwgs-1-1		5.9%	43.4%	15.6%	86.1%
Pli-CMvi_028-Ex1-3G-lcwgs-1-1		12.8%	42.9%	94.8%	14.1%
Pli-CMvi_030-Ex1-5B-lcwgs-1-1		0.9%	42.9%	88.7%	38.9%
Pli-CMvi_031-Ex1-5H-lcwgs-1-1		12.6%	43.4%	81.5%	34.9%
Pli-CMvi_034-Ex1-7C-lcwgs-1-1		6.6%	42.3%	93.4%	51.2%
Pli-CMvi_037-Ex1-1E-lcwgs-1-1		12.8%	43.0%	75.1%	24.4%
Pli-CMvi_038-Ex1-2C-lcwgs-1-1		6.9%	42.5%	90.9%	28.9%
Pli-CMvi_039-Ex1-3A-lcwgs-1-1		11.3%	43.4%	87.3%	23.2%
Pli-CMvi_040-Ex1-3H-lcwgs-1-1		9.0%	42.7%	94.3%	18.7%
Pli-CMvi_041-Ex1-4E-lcwgs-1-1		7.8%	42.6%	92.6%	22.8%
Pli-CMvi_042-Ex1-5C-lcwgs-1-1		10.5%	42.9%	93.7%	11.4%
Pli-CMvi_047-Ex1-7G-lcwgs-1-1		8.6%	42.3%	93.1%	33.3%
Pli-CMvi_049-Ex1-1F-lcwgs-1-1		11.6%	42.7%	92.0%	18.3%
Pli-CMvi_051-Ex1-3B-lcwgs-1-1		12.2%	43.0%	94.0%	17.5%
Pli-CMvi_053-Ex1-4F-lcwgs-1-1		7.0%	42.4%	92.7%	28.8%
Pli-CMvi_054-Ex1-5D-lcwgs-1-1		9.2%	42.5%	93.2%	24.4%
Pli-CMvi_059-Ex1-7H-lcwgs-1-1		9.6%	42.8%	94.5%	20.5%
Pli-CMvi_060-Ex1-8F-lcwgs-1-1		8.0%	42.5%	93.1%	23.1%
Pli-CMvi_062-Ex1-2D-lcwgs-1-1		9.5%	42.5%	91.4%	28.5%
Pli-CMvi_063-Ex1-3C-lcwgs-1-1		10.5%	42.8%	93.9%	14.7%
Pli-CMvi_064-Ex1-4A-lcwgs-1-1		10.8%	43.1%	90.0%	12.2%
Pli-CMvi_065-Ex1-4G-lcwgs-1-1		7.0%	42.7%	84.1%	38.6%
Pli-CMvi_066-Ex1-5E-lcwgs-1-1		13.6%	43.2%	94.4%	14.5%
Pli-CMvi_070-Ex1-7D-lcwgs-1-1		5.0%	42.5%	91.5%	42.3%
Pli-CMvi_071-Ex1-8A-lcwgs-1-1		2.9%	43.2%	87.1%	38.9%
Pli-CMvi_072-Ex1-8G-lcwgs-1-1		8.9%	42.8%	91.3%	19.8%
Pli-CMvi_073-Ex1-1G-lcwgs-1-1		12.9%	44.0%	91.7%	19.8%
Pli-CMvi_074-Ex1-2E-lcwgs-1-1		6.7%	42.7%	82.8%	35.7%
Pli-CMvi_075-Ex1-3D-lcwgs-1-1		5.3%	42.5%	92.6%	42.7%
Pli-CMvi_076-Ex1-4B-lcwgs-1-1		2.8%	42.7%	91.0%	37.6%
Pli-CMvi_078-Ex1-5F-lcwgs-1-1		1.4%	42.6%	87.0%	34.0%
Pli-CMvi_082-Ex1-7E-lcwgs-1-1		7.3%	42.2%	92.4%	35.8%
Pli-CMvi_083-Ex1-8B-lcwgs-1-1		7.2%	42.6%	91.9%	23.5%
Pli-CMvi_084-Ex1-8H-lcwgs-1-1		8.5%	42.5%	77.0%	45.1%
Pli-CMvi_085-Ex1-1H-lcwgs-1-1		10.6%	42.7%	93.3%	19.2%
Pli-CMvi_086-Ex1-2F-lcwgs-1-1		11.0%	43.0%	90.7%	13.2%
Pli-CMvi_087-Ex1-3E-lcwgs-1-1		11.6%	42.9%	92.0%	11.6%
Pli-CMvi_089-Ex1-4H-lcwgs-1-1		9.4%	42.8%	90.5%	19.5%
Pli-CMvi_093-Ex1-7A-lcwgs-1-1		1.0%	42.7%	90.5%	50.2%
Pli-CMvi_095-Ex1-8C-lcwgs-1-1		1.0%	42.6%	86.5%	41.5%
```
</p>
</details>

## 9. Remove duplicates with clumpify.

### 9a. Remove duplicates.
`bash ../../../pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/hpc-0351 20`

### 9b. Check duplicate removal success.
```bash
[hpc-0351@wahab-01 ~]$ enable_lmod
[hpc-0351@wahab-01 ~]$ module load container_env R/4.2
[hpc-0351@wahab-01 ~]$ crun R < /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkClumpify_EG.R --no-save
```

"Clumpify Successfully worked on all samples"

### 9c. Generate metadata on deduplicated FASTQ files.
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report"  "fq.gz"`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	Length	M Seqs
Pli-AMvi_004-Ex1-1A-lcwgs-1-1.clmp.r1	2.9%	46%	63 bp	0.2
Pli-AMvi_004-Ex1-1A-lcwgs-1-1.clmp.r2	2.8%	47%	63 bp	0.2
Pli-AMvi_004-Ex1-1A-lcwgs-2-1.clmp.r1	9.3%	57%	145 bp	0.1
Pli-AMvi_004-Ex1-1A-lcwgs-2-1.clmp.r2	6.2%	57%	144 bp	0.1
Pli-AMvi_005-Ex1-2A-lcwgs-1-1.clmp.r1	2.9%	44%	84 bp	0.0
Pli-AMvi_005-Ex1-2A-lcwgs-1-1.clmp.r2	4.5%	44%	84 bp	0.0
Pli-AMvi_005-Ex1-2A-lcwgs-2-1.clmp.r1	0.3%	48%	97 bp	0.0
Pli-AMvi_005-Ex1-2A-lcwgs-2-1.clmp.r2	0.7%	49%	97 bp	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-1-1.clmp.r1	2.4%	43%	80 bp	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-1-1.clmp.r2	3.4%	43%	80 bp	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-2-1.clmp.r1	0.8%	44%	73 bp	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-2-1.clmp.r2	0.8%	44%	73 bp	0.0
Pli-AMvi_007-Ex1-4A-lcwgs-1-1.clmp.r1	2.5%	40%	71 bp	0.1
Pli-AMvi_007-Ex1-4A-lcwgs-1-1.clmp.r2	2.3%	40%	71 bp	0.1
Pli-AMvi_007-Ex1-4A-lcwgs-2-1.clmp.r1	0.9%	44%	79 bp	0.0
Pli-AMvi_007-Ex1-4A-lcwgs-2-1.clmp.r2	0.9%	44%	79 bp	0.0
Pli-AMvi_008-Ex1-1B-lcwgs-1-1.clmp.r1	3.6%	41%	74 bp	0.3
Pli-AMvi_008-Ex1-1B-lcwgs-1-1.clmp.r2	3.1%	41%	74 bp	0.3
Pli-AMvi_008-Ex1-1B-lcwgs-2-1.clmp.r1	2.7%	48%	86 bp	0.0
Pli-AMvi_008-Ex1-1B-lcwgs-2-1.clmp.r2	2.2%	48%	86 bp	0.0
Pli-AMvi_009-Ex1-2B-lcwgs-1-1.clmp.r1	2.8%	44%	81 bp	0.0
Pli-AMvi_009-Ex1-2B-lcwgs-1-1.clmp.r2	4.4%	44%	81 bp	0.0
Pli-AMvi_009-Ex1-2B-lcwgs-2-1.clmp.r1	1.2%	49%	98 bp	0.0
Pli-AMvi_009-Ex1-2B-lcwgs-2-1.clmp.r2	0.2%	49%	98 bp	0.0
Pli-AMvi_010-Ex1-7A-lcwgs-1-1.clmp.r1	3.1%	39%	71 bp	0.0
Pli-AMvi_010-Ex1-7A-lcwgs-1-1.clmp.r2	2.4%	39%	71 bp	0.0
Pli-AMvi_010-Ex1-7A-lcwgs-2-1.clmp.r1	2.0%	46%	87 bp	1.0
Pli-AMvi_010-Ex1-7A-lcwgs-2-1.clmp.r2	1.6%	47%	87 bp	1.0
Pli-AMvi_011-Ex1-8A-lcwgs-1-1.clmp.r1	1.2%	39%	70 bp	0.4
Pli-AMvi_011-Ex1-8A-lcwgs-1-1.clmp.r2	1.2%	39%	70 bp	0.4
Pli-AMvi_011-Ex1-8A-lcwgs-2-1.clmp.r1	3.3%	48%	96 bp	1.2
Pli-AMvi_011-Ex1-8A-lcwgs-2-1.clmp.r2	2.6%	48%	96 bp	1.2
Pli-AMvi_012-Ex1-9A-lcwgs-1-1.clmp.r1	1.4%	39%	72 bp	0.3
Pli-AMvi_012-Ex1-9A-lcwgs-1-1.clmp.r2	1.3%	39%	72 bp	0.3
Pli-AMvi_012-Ex1-9A-lcwgs-2-1.clmp.r1	3.1%	46%	92 bp	0.5
Pli-AMvi_012-Ex1-9A-lcwgs-2-1.clmp.r2	2.4%	47%	92 bp	0.5
Pli-AMvi_013-Ex1-10A-lcwgs-1-1.clmp.r1	1.9%	39%	74 bp	0.3
Pli-AMvi_013-Ex1-10A-lcwgs-1-1.clmp.r2	1.6%	39%	74 bp	0.3
Pli-AMvi_013-Ex1-10A-lcwgs-2-1.clmp.r1	0.0%	47%	90 bp	0.0
Pli-AMvi_013-Ex1-10A-lcwgs-2-1.clmp.r2	0.0%	46%	90 bp	0.0
Pli-AMvi_014-Ex1-11A-lcwgs-1-1.clmp.r1	15.4%	46%	81 bp	0.2
Pli-AMvi_014-Ex1-11A-lcwgs-1-1.clmp.r2	13.4%	46%	81 bp	0.2
Pli-AMvi_014-Ex1-11A-lcwgs-2-1.clmp.r1	1.9%	48%	63 bp	0.0
Pli-AMvi_014-Ex1-11A-lcwgs-2-1.clmp.r2	0.6%	48%	63 bp	0.0
Pli-AMvi_015-Ex1-12A-lcwgs-1-1.clmp.r1	1.1%	43%	107 bp	0.0
Pli-AMvi_015-Ex1-12A-lcwgs-1-1.clmp.r2	1.1%	44%	107 bp	0.0
Pli-AMvi_015-Ex1-12A-lcwgs-2-1.clmp.r1	0.3%	53%	109 bp	0.0
Pli-AMvi_015-Ex1-12A-lcwgs-2-1.clmp.r2	0.3%	53%	108 bp	0.0
Pli-AMvi_016-Ex1-3B-lcwgs-1-1.clmp.r1	1.3%	41%	64 bp	0.1
Pli-AMvi_016-Ex1-3B-lcwgs-1-1.clmp.r2	1.2%	41%	64 bp	0.1
Pli-AMvi_016-Ex1-3B-lcwgs-2-1.clmp.r1	1.0%	43%	70 bp	0.1
Pli-AMvi_016-Ex1-3B-lcwgs-2-1.clmp.r2	0.7%	43%	70 bp	0.1
Pli-AMvi_017-Ex1-4B-lcwgs-1-1.clmp.r1	2.8%	41%	67 bp	0.1
Pli-AMvi_017-Ex1-4B-lcwgs-1-1.clmp.r2	2.4%	41%	67 bp	0.1
Pli-AMvi_017-Ex1-4B-lcwgs-2-1.clmp.r1	1.2%	47%	90 bp	0.0
Pli-AMvi_017-Ex1-4B-lcwgs-2-1.clmp.r2	0.6%	48%	90 bp	0.0
Pli-AMvi_018-Ex1-1C-lcwgs-1-1.clmp.r1	5.6%	44%	68 bp	0.0
Pli-AMvi_018-Ex1-1C-lcwgs-1-1.clmp.r2	5.0%	44%	68 bp	0.0
Pli-AMvi_018-Ex1-1C-lcwgs-2-1.clmp.r1	1.5%	50%	99 bp	0.0
Pli-AMvi_018-Ex1-1C-lcwgs-2-1.clmp.r2	1.0%	51%	99 bp	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-1-1.clmp.r1	2.9%	43%	65 bp	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-1-1.clmp.r2	2.9%	44%	65 bp	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-2-1.clmp.r1	0.3%	46%	88 bp	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-2-1.clmp.r2	0.3%	47%	87 bp	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-1-1.clmp.r1	2.4%	44%	68 bp	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-1-1.clmp.r2	3.1%	44%	68 bp	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-2-1.clmp.r1	1.0%	45%	80 bp	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-2-1.clmp.r2	0.7%	45%	81 bp	0.0
Pli-AMvi_021-Ex1-4C-lcwgs-1-1.clmp.r1	1.5%	41%	63 bp	0.1
Pli-AMvi_021-Ex1-4C-lcwgs-1-1.clmp.r2	1.5%	41%	63 bp	0.1
Pli-AMvi_021-Ex1-4C-lcwgs-2-1.clmp.r1	1.6%	43%	60 bp	0.2
Pli-AMvi_021-Ex1-4C-lcwgs-2-1.clmp.r2	1.4%	43%	60 bp	0.2
Pli-AMvi_022-Ex1-7B-lcwgs-1-1.clmp.r1	1.7%	39%	77 bp	0.0
Pli-AMvi_022-Ex1-7B-lcwgs-1-1.clmp.r2	1.7%	39%	77 bp	0.0
Pli-AMvi_022-Ex1-7B-lcwgs-2-1.clmp.r1	6.0%	51%	124 bp	1.8
Pli-AMvi_022-Ex1-7B-lcwgs-2-1.clmp.r2	4.6%	52%	124 bp	1.8
Pli-AMvi_023-Ex1-8B-lcwgs-1-1.clmp.r1	2.3%	39%	70 bp	0.2
Pli-AMvi_023-Ex1-8B-lcwgs-1-1.clmp.r2	2.1%	39%	70 bp	0.2
Pli-AMvi_023-Ex1-8B-lcwgs-2-1.clmp.r1	2.2%	47%	88 bp	0.4
Pli-AMvi_023-Ex1-8B-lcwgs-2-1.clmp.r2	1.8%	47%	88 bp	0.4
Pli-AMvi_024-Ex1-9B-lcwgs-1-1.clmp.r1	1.6%	39%	68 bp	0.3
Pli-AMvi_024-Ex1-9B-lcwgs-1-1.clmp.r2	1.5%	39%	68 bp	0.3
Pli-AMvi_024-Ex1-9B-lcwgs-2-1.clmp.r1	9.2%	52%	115 bp	0.9
Pli-AMvi_024-Ex1-9B-lcwgs-2-1.clmp.r2	6.9%	52%	114 bp	0.9
Pli-AMvi_025-Ex1-10B-lcwgs-1-1.clmp.r1	2.2%	40%	68 bp	0.1
Pli-AMvi_025-Ex1-10B-lcwgs-1-1.clmp.r2	1.9%	40%	68 bp	0.1
Pli-AMvi_025-Ex1-10B-lcwgs-2-1.clmp.r1	0.0%	44%	94 bp	0.0
Pli-AMvi_025-Ex1-10B-lcwgs-2-1.clmp.r2	0.0%	44%	94 bp	0.0
Pli-AMvi_026-Ex1-11B-lcwgs-1-1.clmp.r1	1.4%	41%	67 bp	2.2
Pli-AMvi_026-Ex1-11B-lcwgs-1-1.clmp.r2	1.3%	41%	67 bp	2.2
Pli-AMvi_026-Ex1-11B-lcwgs-2-1.clmp.r1	0.7%	45%	55 bp	0.0
Pli-AMvi_026-Ex1-11B-lcwgs-2-1.clmp.r2	0.4%	45%	55 bp	0.0
Pli-AMvi_027-Ex1-12B-lcwgs-1-1.clmp.r1	0.8%	43%	122 bp	0.0
Pli-AMvi_027-Ex1-12B-lcwgs-1-1.clmp.r2	0.0%	43%	122 bp	0.0
Pli-AMvi_027-Ex1-12B-lcwgs-2-1.clmp.r1	0.2%	49%	100 bp	0.0
Pli-AMvi_027-Ex1-12B-lcwgs-2-1.clmp.r2	0.2%	50%	100 bp	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-1-1.clmp.r1	3.5%	45%	78 bp	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-1-1.clmp.r2	5.4%	46%	78 bp	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-2-1.clmp.r1	0.9%	50%	102 bp	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-2-1.clmp.r2	0.4%	50%	102 bp	0.0
Pli-AMvi_029-Ex1-2D-lcwgs-1-1.clmp.r1	2.3%	41%	68 bp	0.6
Pli-AMvi_029-Ex1-2D-lcwgs-1-1.clmp.r2	2.3%	41%	68 bp	0.6
Pli-AMvi_029-Ex1-2D-lcwgs-2-1.clmp.r1	1.0%	44%	66 bp	0.0
Pli-AMvi_029-Ex1-2D-lcwgs-2-1.clmp.r2	0.8%	44%	66 bp	0.0
Pli-AMvi_030-Ex1-3D-lcwgs-1-1.clmp.r1	2.8%	43%	64 bp	0.1
Pli-AMvi_030-Ex1-3D-lcwgs-1-1.clmp.r2	2.3%	43%	64 bp	0.1
Pli-AMvi_030-Ex1-3D-lcwgs-2-1.clmp.r1	1.2%	44%	59 bp	0.0
Pli-AMvi_030-Ex1-3D-lcwgs-2-1.clmp.r2	1.0%	44%	59 bp	0.0
Pli-AMvi_031-Ex1-4D-lcwgs-1-1.clmp.r1	5.5%	45%	81 bp	0.0
Pli-AMvi_031-Ex1-4D-lcwgs-1-1.clmp.r2	7.0%	46%	81 bp	0.0
Pli-AMvi_031-Ex1-4D-lcwgs-2-1.clmp.r1	1.8%	46%	81 bp	0.0
Pli-AMvi_031-Ex1-4D-lcwgs-2-1.clmp.r2	0.0%	46%	81 bp	0.0
Pli-AMvi_032-Ex1-5C-lcwgs-1-1.clmp.r1	2.0%	41%	68 bp	0.2
Pli-AMvi_032-Ex1-5C-lcwgs-1-1.clmp.r2	1.9%	41%	68 bp	0.2
Pli-AMvi_032-Ex1-5C-lcwgs-2-1.clmp.r1	0.9%	43%	69 bp	0.5
Pli-AMvi_032-Ex1-5C-lcwgs-2-1.clmp.r2	0.8%	43%	69 bp	0.5
Pli-AMvi_033-Ex1-6C-lcwgs-1-1.clmp.r1	1.6%	43%	65 bp	0.0
Pli-AMvi_033-Ex1-6C-lcwgs-1-1.clmp.r2	1.7%	43%	65 bp	0.0
Pli-AMvi_033-Ex1-6C-lcwgs-2-1.clmp.r1	0.9%	43%	67 bp	1.0
Pli-AMvi_033-Ex1-6C-lcwgs-2-1.clmp.r2	0.8%	43%	67 bp	1.0
Pli-AMvi_034-Ex1-7C-lcwgs-1-1.clmp.r1	3.3%	45%	89 bp	0.0
Pli-AMvi_034-Ex1-7C-lcwgs-1-1.clmp.r2	6.7%	46%	89 bp	0.0
Pli-AMvi_034-Ex1-7C-lcwgs-2-1.clmp.r1	1.3%	46%	68 bp	0.0
Pli-AMvi_034-Ex1-7C-lcwgs-2-1.clmp.r2	0.7%	46%	68 bp	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-1-1.clmp.r1	1.0%	42%	62 bp	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-1-1.clmp.r2	1.3%	42%	62 bp	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-2-1.clmp.r1	0.4%	44%	77 bp	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-2-1.clmp.r2	0.4%	44%	77 bp	0.0
Pli-AMvi_036-Ex1-9C-lcwgs-1-1.clmp.r1	12.2%	42%	98 bp	0.2
Pli-AMvi_036-Ex1-9C-lcwgs-1-1.clmp.r2	9.8%	42%	98 bp	0.2
Pli-AMvi_036-Ex1-9C-lcwgs-2-1.clmp.r1	10.1%	48%	123 bp	2.4
Pli-AMvi_036-Ex1-9C-lcwgs-2-1.clmp.r2	7.6%	48%	123 bp	2.4
Pli-AMvi_037-Ex1-10C-lcwgs-1-1.clmp.r1	1.2%	38%	68 bp	0.7
Pli-AMvi_037-Ex1-10C-lcwgs-1-1.clmp.r2	1.0%	38%	68 bp	0.7
Pli-AMvi_037-Ex1-10C-lcwgs-2-1.clmp.r1	0.0%	40%	86 bp	0.0
Pli-AMvi_037-Ex1-10C-lcwgs-2-1.clmp.r2	0.0%	41%	86 bp	0.0
Pli-AMvi_038-Ex1-11C-lcwgs-1-1.clmp.r1	3.4%	43%	71 bp	0.3
Pli-AMvi_038-Ex1-11C-lcwgs-1-1.clmp.r2	3.3%	43%	71 bp	0.3
Pli-AMvi_038-Ex1-11C-lcwgs-2-1.clmp.r1	0.0%	45%	104 bp	0.0
Pli-AMvi_038-Ex1-11C-lcwgs-2-1.clmp.r2	0.0%	44%	103 bp	0.0
Pli-AMvi_039-Ex1-12C-lcwgs-1-1.clmp.r1	1.6%	43%	121 bp	0.0
Pli-AMvi_039-Ex1-12C-lcwgs-1-1.clmp.r2	1.2%	43%	121 bp	0.0
Pli-AMvi_039-Ex1-12C-lcwgs-2-1.clmp.r1	16.1%	57%	145 bp	0.3
Pli-AMvi_039-Ex1-12C-lcwgs-2-1.clmp.r2	11.0%	57%	145 bp	0.3
Pli-AMvi_040-Ex1-5A-lcwgs-1-1.clmp.r1	2.5%	42%	70 bp	0.1
Pli-AMvi_040-Ex1-5A-lcwgs-1-1.clmp.r2	2.0%	42%	70 bp	0.1
Pli-AMvi_040-Ex1-5A-lcwgs-2-1.clmp.r1	2.8%	47%	93 bp	1.4
Pli-AMvi_040-Ex1-5A-lcwgs-2-1.clmp.r2	2.2%	47%	93 bp	1.4
Pli-AMvi_041-Ex1-6A-lcwgs-1-1.clmp.r1	3.2%	37%	74 bp	0.2
Pli-AMvi_041-Ex1-6A-lcwgs-1-1.clmp.r2	2.8%	38%	74 bp	0.2
Pli-AMvi_041-Ex1-6A-lcwgs-2-1.clmp.r1	1.9%	44%	83 bp	1.9
Pli-AMvi_041-Ex1-6A-lcwgs-2-1.clmp.r2	1.6%	44%	83 bp	1.9
Pli-AMvi_042-Ex1-5B-lcwgs-1-1.clmp.r1	3.1%	44%	91 bp	0.0
Pli-AMvi_042-Ex1-5B-lcwgs-1-1.clmp.r2	5.7%	45%	91 bp	0.0
Pli-AMvi_042-Ex1-5B-lcwgs-2-1.clmp.r1	0.7%	46%	85 bp	0.0
Pli-AMvi_042-Ex1-5B-lcwgs-2-1.clmp.r2	0.4%	47%	84 bp	0.0
Pli-AMvi_043-Ex1-6B-lcwgs-1-1.clmp.r1	2.1%	41%	71 bp	0.1
Pli-AMvi_043-Ex1-6B-lcwgs-1-1.clmp.r2	1.7%	41%	71 bp	0.1
Pli-AMvi_043-Ex1-6B-lcwgs-2-1.clmp.r1	3.2%	50%	95 bp	1.2
Pli-AMvi_043-Ex1-6B-lcwgs-2-1.clmp.r2	2.7%	50%	95 bp	1.2
Pli-AMvi_044-Ex1-5D-lcwgs-1-1.clmp.r1	2.4%	44%	94 bp	0.0
Pli-AMvi_044-Ex1-5D-lcwgs-1-1.clmp.r2	7.5%	45%	94 bp	0.0
Pli-AMvi_044-Ex1-5D-lcwgs-2-1.clmp.r1	1.0%	44%	60 bp	0.1
Pli-AMvi_044-Ex1-5D-lcwgs-2-1.clmp.r2	0.8%	44%	60 bp	0.1
Pli-AMvi_045-Ex1-6D-lcwgs-1-1.clmp.r1	4.1%	46%	65 bp	0.0
Pli-AMvi_045-Ex1-6D-lcwgs-1-1.clmp.r2	4.0%	46%	65 bp	0.0
Pli-AMvi_045-Ex1-6D-lcwgs-2-1.clmp.r1	2.4%	47%	58 bp	0.0
Pli-AMvi_045-Ex1-6D-lcwgs-2-1.clmp.r2	2.2%	47%	58 bp	0.0
Pli-AMvi_046-Ex1-1E-lcwgs-1-1.clmp.r1	4.7%	45%	99 bp	0.0
Pli-AMvi_046-Ex1-1E-lcwgs-1-1.clmp.r2	9.7%	46%	98 bp	0.0
Pli-AMvi_046-Ex1-1E-lcwgs-2-1.clmp.r1	2.2%	45%	87 bp	0.4
Pli-AMvi_046-Ex1-1E-lcwgs-2-1.clmp.r2	1.9%	45%	87 bp	0.4
Pli-AMvi_047-Ex1-2E-lcwgs-1-1.clmp.r1	1.7%	40%	69 bp	0.1
Pli-AMvi_047-Ex1-2E-lcwgs-1-1.clmp.r2	1.5%	40%	69 bp	0.1
Pli-AMvi_047-Ex1-2E-lcwgs-2-1.clmp.r1	0.9%	45%	52 bp	0.0
Pli-AMvi_047-Ex1-2E-lcwgs-2-1.clmp.r2	0.7%	46%	52 bp	0.0
Pli-AMvi_048-Ex1-3E-lcwgs-1-1.clmp.r1	1.2%	42%	81 bp	0.0
Pli-AMvi_048-Ex1-3E-lcwgs-1-1.clmp.r2	2.7%	43%	81 bp	0.0
Pli-AMvi_048-Ex1-3E-lcwgs-2-1.clmp.r1	0.0%	38%	80 bp	0.0
Pli-AMvi_048-Ex1-3E-lcwgs-2-1.clmp.r2	0.0%	38%	80 bp	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-1-1.clmp.r1	2.0%	44%	90 bp	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-1-1.clmp.r2	5.6%	45%	90 bp	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-2-1.clmp.r1	0.0%	40%	78 bp	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-2-1.clmp.r2	0.0%	40%	78 bp	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-1-1.clmp.r1	2.1%	44%	95 bp	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-1-1.clmp.r2	7.5%	45%	95 bp	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-2-1.clmp.r1	0.0%	44%	81 bp	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-2-1.clmp.r2	0.0%	44%	80 bp	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-1-1.clmp.r1	4.1%	45%	77 bp	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-1-1.clmp.r2	4.8%	45%	77 bp	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-2-1.clmp.r1	1.7%	48%	54 bp	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-2-1.clmp.r2	1.3%	48%	54 bp	0.0
Pli-AMvi_052-Ex1-7D-lcwgs-1-1.clmp.r1	1.9%	42%	67 bp	0.4
Pli-AMvi_052-Ex1-7D-lcwgs-1-1.clmp.r2	1.8%	42%	67 bp	0.4
Pli-AMvi_052-Ex1-7D-lcwgs-2-1.clmp.r1	1.6%	48%	62 bp	0.0
Pli-AMvi_052-Ex1-7D-lcwgs-2-1.clmp.r2	1.3%	48%	62 bp	0.0
Pli-AMvi_053-Ex1-8D-lcwgs-1-1.clmp.r1	2.7%	43%	90 bp	0.0
Pli-AMvi_053-Ex1-8D-lcwgs-1-1.clmp.r2	5.6%	44%	89 bp	0.0
Pli-AMvi_053-Ex1-8D-lcwgs-2-1.clmp.r1	1.3%	43%	83 bp	0.0
Pli-AMvi_053-Ex1-8D-lcwgs-2-1.clmp.r2	0.9%	43%	83 bp	0.0
Pli-AMvi_054-Ex1-9D-lcwgs-1-1.clmp.r1	2.5%	44%	57 bp	0.0
Pli-AMvi_054-Ex1-9D-lcwgs-1-1.clmp.r2	2.3%	44%	57 bp	0.0
Pli-AMvi_054-Ex1-9D-lcwgs-2-1.clmp.r1	0.8%	47%	96 bp	0.0
Pli-AMvi_054-Ex1-9D-lcwgs-2-1.clmp.r2	0.5%	47%	95 bp	0.0
Pli-AMvi_055-Ex1-10D-lcwgs-1-1.clmp.r1	1.9%	42%	61 bp	0.1
Pli-AMvi_055-Ex1-10D-lcwgs-1-1.clmp.r2	1.5%	42%	61 bp	0.1
Pli-AMvi_055-Ex1-10D-lcwgs-2-1.clmp.r1	0.9%	44%	87 bp	0.0
Pli-AMvi_055-Ex1-10D-lcwgs-2-1.clmp.r2	0.0%	44%	87 bp	0.0
Pli-AMvi_056-Ex1-11D-lcwgs-1-1.clmp.r1	2.4%	43%	85 bp	0.0
Pli-AMvi_056-Ex1-11D-lcwgs-1-1.clmp.r2	4.4%	43%	85 bp	0.0
Pli-AMvi_056-Ex1-11D-lcwgs-2-1.clmp.r1	8.0%	50%	110 bp	0.0
Pli-AMvi_056-Ex1-11D-lcwgs-2-1.clmp.r2	4.0%	48%	109 bp	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-1-1.clmp.r1	0.4%	42%	118 bp	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-1-1.clmp.r2	0.4%	42%	117 bp	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-2-1.clmp.r1	0.8%	51%	109 bp	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-2-1.clmp.r2	0.3%	51%	109 bp	0.0
Pli-AMvi_058-Ex1-1F-lcwgs-1-1.clmp.r1	3.7%	45%	100 bp	0.0
Pli-AMvi_058-Ex1-1F-lcwgs-1-1.clmp.r2	7.8%	46%	99 bp	0.0
Pli-AMvi_058-Ex1-1F-lcwgs-2-1.clmp.r1	14.0%	57%	144 bp	0.9
Pli-AMvi_058-Ex1-1F-lcwgs-2-1.clmp.r2	10.0%	58%	144 bp	0.9
Pli-AMvi_059-Ex1-2F-lcwgs-1-1.clmp.r1	1.7%	44%	84 bp	0.0
Pli-AMvi_059-Ex1-2F-lcwgs-1-1.clmp.r2	3.0%	44%	84 bp	0.0
Pli-AMvi_059-Ex1-2F-lcwgs-2-1.clmp.r1	0.7%	53%	130 bp	0.0
Pli-AMvi_059-Ex1-2F-lcwgs-2-1.clmp.r2	0.7%	53%	129 bp	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-1-1.clmp.r1	1.2%	43%	80 bp	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-1-1.clmp.r2	2.9%	43%	80 bp	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-2-1.clmp.r1	0.0%	48%	95 bp	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-2-1.clmp.r2	0.0%	49%	95 bp	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-1-1.clmp.r1	2.1%	45%	90 bp	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-1-1.clmp.r2	5.5%	45%	90 bp	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-2-1.clmp.r1	0.0%	52%	111 bp	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-2-1.clmp.r2	0.0%	52%	110 bp	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-1-1.clmp.r1	2.9%	44%	93 bp	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-1-1.clmp.r2	6.4%	45%	93 bp	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-2-1.clmp.r1	0.4%	48%	96 bp	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-2-1.clmp.r2	0.4%	48%	95 bp	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-1-1.clmp.r1	3.5%	45%	63 bp	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-1-1.clmp.r2	3.1%	45%	63 bp	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-2-1.clmp.r1	0.3%	47%	89 bp	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-2-1.clmp.r2	0.4%	47%	89 bp	0.0
Pli-AMvi_064-Ex1-7E-lcwgs-1-1.clmp.r1	1.8%	42%	68 bp	0.1
Pli-AMvi_064-Ex1-7E-lcwgs-1-1.clmp.r2	1.4%	42%	68 bp	0.1
Pli-AMvi_064-Ex1-7E-lcwgs-2-1.clmp.r1	1.4%	48%	66 bp	0.0
Pli-AMvi_064-Ex1-7E-lcwgs-2-1.clmp.r2	1.1%	48%	66 bp	0.0
Pli-AMvi_065-Ex1-8E-lcwgs-1-1.clmp.r1	1.2%	39%	67 bp	0.1
Pli-AMvi_065-Ex1-8E-lcwgs-1-1.clmp.r2	1.0%	39%	67 bp	0.1
Pli-AMvi_065-Ex1-8E-lcwgs-2-1.clmp.r1	0.9%	45%	50 bp	0.0
Pli-AMvi_065-Ex1-8E-lcwgs-2-1.clmp.r2	0.6%	45%	50 bp	0.0
Pli-AMvi_066-Ex1-9E-lcwgs-1-1.clmp.r1	2.7%	43%	91 bp	0.0
Pli-AMvi_066-Ex1-9E-lcwgs-1-1.clmp.r2	5.7%	44%	91 bp	0.0
Pli-AMvi_066-Ex1-9E-lcwgs-2-1.clmp.r1	1.3%	48%	109 bp	0.0
Pli-AMvi_066-Ex1-9E-lcwgs-2-1.clmp.r2	0.4%	48%	109 bp	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-1-1.clmp.r1	2.1%	43%	69 bp	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-1-1.clmp.r2	2.0%	43%	69 bp	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-2-1.clmp.r1	5.3%	35%	107 bp	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-2-1.clmp.r2	5.3%	35%	108 bp	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-1-1.clmp.r1	4.9%	45%	99 bp	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-1-1.clmp.r2	9.1%	46%	98 bp	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-2-1.clmp.r1	1.6%	52%	114 bp	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-2-1.clmp.r2	1.6%	53%	114 bp	0.0
Pli-AMvi_069-Ex1-12E-lcwgs-1-1.clmp.r1	0.9%	43%	130 bp	0.0
Pli-AMvi_069-Ex1-12E-lcwgs-1-1.clmp.r2	1.3%	44%	129 bp	0.0
Pli-AMvi_069-Ex1-12E-lcwgs-2-1.clmp.r1	9.6%	59%	146 bp	0.5
Pli-AMvi_069-Ex1-12E-lcwgs-2-1.clmp.r2	6.9%	59%	145 bp	0.5
Pli-AMvi_070-Ex1-1G-lcwgs-1-1.clmp.r1	2.4%	45%	98 bp	0.0
Pli-AMvi_070-Ex1-1G-lcwgs-1-1.clmp.r2	7.1%	46%	97 bp	0.0
Pli-AMvi_070-Ex1-1G-lcwgs-2-1.clmp.r1	16.3%	57%	144 bp	1.4
Pli-AMvi_070-Ex1-1G-lcwgs-2-1.clmp.r2	11.6%	57%	144 bp	1.4
Pli-AMvi_071-Ex1-2G-lcwgs-1-1.clmp.r1	1.3%	44%	85 bp	0.0
Pli-AMvi_071-Ex1-2G-lcwgs-1-1.clmp.r2	3.0%	44%	84 bp	0.0
Pli-AMvi_071-Ex1-2G-lcwgs-2-1.clmp.r1	18.1%	56%	145 bp	1.2
Pli-AMvi_071-Ex1-2G-lcwgs-2-1.clmp.r2	12.9%	56%	145 bp	1.2
Pli-AMvi_072-Ex1-3G-lcwgs-1-1.clmp.r1	0.9%	42%	79 bp	0.0
Pli-AMvi_072-Ex1-3G-lcwgs-1-1.clmp.r2	2.3%	43%	79 bp	0.0
Pli-AMvi_072-Ex1-3G-lcwgs-2-1.clmp.r1	0.7%	49%	96 bp	0.0
Pli-AMvi_072-Ex1-3G-lcwgs-2-1.clmp.r2	0.7%	49%	95 bp	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-1-1.clmp.r1	1.8%	44%	90 bp	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-1-1.clmp.r2	4.4%	45%	89 bp	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-2-1.clmp.r1	2.4%	46%	57 bp	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-2-1.clmp.r2	2.1%	46%	57 bp	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-1-1.clmp.r1	1.6%	44%	91 bp	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-1-1.clmp.r2	6.0%	44%	91 bp	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-2-1.clmp.r1	1.0%	47%	91 bp	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-2-1.clmp.r2	0.6%	47%	91 bp	0.0
Pli-AMvi_075-Ex1-6G-lcwgs-1-1.clmp.r1	2.0%	43%	109 bp	0.0
Pli-AMvi_075-Ex1-6G-lcwgs-1-1.clmp.r2	6.5%	44%	108 bp	0.0
Pli-AMvi_075-Ex1-6G-lcwgs-2-1.clmp.r1	4.4%	50%	101 bp	0.5
Pli-AMvi_075-Ex1-6G-lcwgs-2-1.clmp.r2	3.4%	50%	100 bp	0.5
Pli-AMvi_076-Ex1-7F-lcwgs-1-1.clmp.r1	2.2%	46%	56 bp	0.0
Pli-AMvi_076-Ex1-7F-lcwgs-1-1.clmp.r2	1.6%	46%	56 bp	0.0
Pli-AMvi_076-Ex1-7F-lcwgs-2-1.clmp.r1	0.3%	51%	108 bp	0.0
Pli-AMvi_076-Ex1-7F-lcwgs-2-1.clmp.r2	0.5%	51%	108 bp	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-1-1.clmp.r1	2.6%	44%	76 bp	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-1-1.clmp.r2	4.3%	45%	76 bp	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-2-1.clmp.r1	0.5%	51%	99 bp	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-2-1.clmp.r2	0.5%	51%	99 bp	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-1-1.clmp.r1	2.4%	43%	90 bp	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-1-1.clmp.r2	5.4%	44%	90 bp	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-2-1.clmp.r1	0.0%	50%	110 bp	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-2-1.clmp.r2	0.3%	50%	110 bp	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-1-1.clmp.r1	2.2%	42%	92 bp	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-1-1.clmp.r2	5.5%	43%	91 bp	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-2-1.clmp.r1	5.8%	57%	144 bp	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-2-1.clmp.r2	4.0%	57%	143 bp	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-1-1.clmp.r1	1.9%	43%	84 bp	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-1-1.clmp.r2	3.7%	43%	84 bp	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-2-1.clmp.r1	0.0%	36%	82 bp	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-2-1.clmp.r2	0.0%	36%	82 bp	0.0
Pli-AMvi_081-Ex1-12F-lcwgs-1-1.clmp.r1	1.3%	42%	135 bp	0.0
Pli-AMvi_081-Ex1-12F-lcwgs-1-1.clmp.r2	1.3%	42%	135 bp	0.0
Pli-AMvi_081-Ex1-12F-lcwgs-2-1.clmp.r1	11.2%	56%	147 bp	0.2
Pli-AMvi_081-Ex1-12F-lcwgs-2-1.clmp.r2	7.5%	56%	146 bp	0.2
Pli-AMvi_082-Ex1-1H-lcwgs-1-1.clmp.r1	1.7%	44%	68 bp	1.9
Pli-AMvi_082-Ex1-1H-lcwgs-1-1.clmp.r2	1.5%	44%	68 bp	1.9
Pli-AMvi_082-Ex1-1H-lcwgs-2-1.clmp.r1	11.3%	56%	127 bp	0.2
Pli-AMvi_082-Ex1-1H-lcwgs-2-1.clmp.r2	8.3%	56%	127 bp	0.2
Pli-AMvi_083-Ex1-2H-lcwgs-1-1.clmp.r1	0.9%	41%	61 bp	2.2
Pli-AMvi_083-Ex1-2H-lcwgs-1-1.clmp.r2	0.8%	41%	61 bp	2.2
Pli-AMvi_083-Ex1-2H-lcwgs-2-1.clmp.r1	1.0%	42%	66 bp	0.1
Pli-AMvi_083-Ex1-2H-lcwgs-2-1.clmp.r2	0.7%	42%	66 bp	0.1
Pli-AMvi_084-Ex1-3H-lcwgs-1-1.clmp.r1	2.6%	45%	65 bp	1.0
Pli-AMvi_084-Ex1-3H-lcwgs-1-1.clmp.r2	2.6%	45%	65 bp	1.0
Pli-AMvi_084-Ex1-3H-lcwgs-2-1.clmp.r1	4.0%	50%	100 bp	0.4
Pli-AMvi_084-Ex1-3H-lcwgs-2-1.clmp.r2	3.2%	50%	100 bp	0.4
Pli-AMvi_085-Ex1-4H-lcwgs-1-1.clmp.r1	1.6%	42%	59 bp	0.4
Pli-AMvi_085-Ex1-4H-lcwgs-1-1.clmp.r2	1.6%	42%	59 bp	0.4
Pli-AMvi_085-Ex1-4H-lcwgs-2-1.clmp.r1	0.9%	44%	64 bp	0.1
Pli-AMvi_085-Ex1-4H-lcwgs-2-1.clmp.r2	0.7%	44%	64 bp	0.1
Pli-AMvi_086-Ex1-5H-lcwgs-1-1.clmp.r1	2.3%	46%	51 bp	0.0
Pli-AMvi_086-Ex1-5H-lcwgs-1-1.clmp.r2	2.0%	46%	51 bp	0.0
Pli-AMvi_086-Ex1-5H-lcwgs-2-1.clmp.r1	1.1%	43%	72 bp	1.0
Pli-AMvi_086-Ex1-5H-lcwgs-2-1.clmp.r2	1.0%	43%	72 bp	1.0
Pli-AMvi_087-Ex1-6H-lcwgs-1-1.clmp.r1	4.1%	47%	58 bp	0.2
Pli-AMvi_087-Ex1-6H-lcwgs-1-1.clmp.r2	3.6%	47%	58 bp	0.2
Pli-AMvi_087-Ex1-6H-lcwgs-2-1.clmp.r1	2.9%	51%	96 bp	0.7
Pli-AMvi_087-Ex1-6H-lcwgs-2-1.clmp.r2	2.4%	51%	96 bp	0.7
Pli-AMvi_088-Ex1-7G-lcwgs-1-1.clmp.r1	2.0%	44%	91 bp	0.0
Pli-AMvi_088-Ex1-7G-lcwgs-1-1.clmp.r2	5.9%	45%	91 bp	0.0
Pli-AMvi_088-Ex1-7G-lcwgs-2-1.clmp.r1	2.8%	48%	91 bp	0.7
Pli-AMvi_088-Ex1-7G-lcwgs-2-1.clmp.r2	2.3%	48%	91 bp	0.7
Pli-AMvi_089-Ex1-8G-lcwgs-1-1.clmp.r1	1.9%	43%	89 bp	0.0
Pli-AMvi_089-Ex1-8G-lcwgs-1-1.clmp.r2	4.8%	43%	89 bp	0.0
Pli-AMvi_089-Ex1-8G-lcwgs-2-1.clmp.r1	0.2%	48%	93 bp	0.0
Pli-AMvi_089-Ex1-8G-lcwgs-2-1.clmp.r2	0.3%	48%	93 bp	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-1-1.clmp.r1	1.8%	43%	89 bp	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-1-1.clmp.r2	4.7%	44%	89 bp	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-2-1.clmp.r1	0.7%	49%	107 bp	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-2-1.clmp.r2	0.5%	49%	106 bp	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-1-1.clmp.r1	1.6%	43%	92 bp	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-1-1.clmp.r2	4.5%	43%	92 bp	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-2-1.clmp.r1	4.8%	56%	143 bp	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-2-1.clmp.r2	2.5%	56%	143 bp	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-1-1.clmp.r1	2.4%	43%	84 bp	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-1-1.clmp.r2	4.0%	44%	84 bp	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-2-1.clmp.r1	3.4%	45%	119 bp	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-2-1.clmp.r2	0.0%	47%	118 bp	0.0
Pli-AMvi_093-Ex1-12G-lcwgs-1-1.clmp.r1	0.0%	43%	131 bp	0.0
Pli-AMvi_093-Ex1-12G-lcwgs-1-1.clmp.r2	0.8%	43%	130 bp	0.0
Pli-AMvi_093-Ex1-12G-lcwgs-2-1.clmp.r1	19.6%	57%	147 bp	0.5
Pli-AMvi_093-Ex1-12G-lcwgs-2-1.clmp.r2	13.4%	57%	146 bp	0.5
Pli-AMvi_094-Ex1-7H-lcwgs-1-1.clmp.r1	1.5%	43%	60 bp	0.3
Pli-AMvi_094-Ex1-7H-lcwgs-1-1.clmp.r2	1.4%	43%	60 bp	0.3
Pli-AMvi_094-Ex1-7H-lcwgs-2-1.clmp.r1	0.7%	44%	64 bp	0.2
Pli-AMvi_094-Ex1-7H-lcwgs-2-1.clmp.r2	0.7%	44%	64 bp	0.2
Pli-AMvi_095-Ex1-8H-lcwgs-1-1.clmp.r1	2.4%	47%	53 bp	0.2
Pli-AMvi_095-Ex1-8H-lcwgs-1-1.clmp.r2	2.2%	47%	53 bp	0.2
Pli-AMvi_095-Ex1-8H-lcwgs-2-1.clmp.r1	1.0%	46%	64 bp	0.0
Pli-AMvi_095-Ex1-8H-lcwgs-2-1.clmp.r2	0.8%	46%	64 bp	0.0
Pli-AMvi_096-Ex1-9H-lcwgs-1-1.clmp.r1	3.5%	44%	77 bp	0.0
Pli-AMvi_096-Ex1-9H-lcwgs-1-1.clmp.r2	5.7%	44%	76 bp	0.0
Pli-AMvi_096-Ex1-9H-lcwgs-2-1.clmp.r1	0.0%	49%	103 bp	0.0
Pli-AMvi_096-Ex1-9H-lcwgs-2-1.clmp.r2	0.0%	49%	103 bp	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-1-1.clmp.r1	2.7%	43%	80 bp	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-1-1.clmp.r2	4.5%	44%	80 bp	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-2-1.clmp.r1	0.0%	42%	73 bp	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-2-1.clmp.r2	2.4%	42%	73 bp	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-1-1.clmp.r1	1.4%	42%	82 bp	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-1-1.clmp.r2	2.9%	43%	82 bp	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-2-1.clmp.r1	0.0%	50%	116 bp	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-2-1.clmp.r2	0.0%	50%	116 bp	0.0
Pli-AMvi_099-Ex1-12H-lcwgs-1-1.clmp.r1	0.0%	41%	134 bp	0.0
Pli-AMvi_099-Ex1-12H-lcwgs-1-1.clmp.r2	0.0%	41%	133 bp	0.0
Pli-AMvi_099-Ex1-12H-lcwgs-2-1.clmp.r1	23.2%	55%	145 bp	0.9
Pli-AMvi_099-Ex1-12H-lcwgs-2-1.clmp.r2	15.9%	55%	145 bp	0.9
Pli-CMvi_001-Ex1-1B-lcwgs-1-1.clmp.r1	7.1%	42%	143 bp	4.0
Pli-CMvi_001-Ex1-1B-lcwgs-1-1.clmp.r2	6.8%	42%	143 bp	4.0
Pli-CMvi_002-Ex1-2A-lcwgs-1-1.clmp.r1	4.4%	42%	139 bp	1.1
Pli-CMvi_002-Ex1-2A-lcwgs-1-1.clmp.r2	3.8%	43%	139 bp	1.1
Pli-CMvi_003-Ex1-2G-lcwgs-1-1.clmp.r1	3.7%	42%	135 bp	0.6
Pli-CMvi_003-Ex1-2G-lcwgs-1-1.clmp.r2	3.1%	42%	134 bp	0.6
Pli-CMvi_004-Ex1-3F-lcwgs-1-1.clmp.r1	4.8%	42%	141 bp	1.0
Pli-CMvi_004-Ex1-3F-lcwgs-1-1.clmp.r2	4.1%	42%	141 bp	1.0
Pli-CMvi_005-Ex1-4C-lcwgs-1-1.clmp.r1	0.6%	42%	122 bp	0.0
Pli-CMvi_005-Ex1-4C-lcwgs-1-1.clmp.r2	0.3%	42%	122 bp	0.0
Pli-CMvi_006-Ex1-5A-lcwgs-1-1.clmp.r1	1.2%	42%	125 bp	0.1
Pli-CMvi_006-Ex1-5A-lcwgs-1-1.clmp.r2	0.8%	43%	124 bp	0.1
Pli-CMvi_007-Ex1-5G-lcwgs-1-1.clmp.r1	4.3%	42%	136 bp	0.9
Pli-CMvi_007-Ex1-5G-lcwgs-1-1.clmp.r2	3.8%	42%	136 bp	0.9
Pli-CMvi_013-Ex1-1C-lcwgs-1-1.clmp.r1	8.6%	43%	147 bp	2.5
Pli-CMvi_013-Ex1-1C-lcwgs-1-1.clmp.r2	7.7%	43%	147 bp	2.5
Pli-CMvi_014-Ex1-2B-lcwgs-1-1.clmp.r1	1.2%	42%	126 bp	0.0
Pli-CMvi_014-Ex1-2B-lcwgs-1-1.clmp.r2	0.7%	42%	126 bp	0.0
Pli-CMvi_015-Ex1-2H-lcwgs-1-1.clmp.r1	6.1%	42%	141 bp	2.0
Pli-CMvi_015-Ex1-2H-lcwgs-1-1.clmp.r2	5.7%	43%	140 bp	2.0
Pli-CMvi_020-Ex1-6D-lcwgs-1-1.clmp.r1	8.9%	42%	141 bp	4.1
Pli-CMvi_020-Ex1-6D-lcwgs-1-1.clmp.r2	8.3%	43%	140 bp	4.1
Pli-CMvi_021-Ex1-6G-lcwgs-1-1.clmp.r1	4.8%	42%	144 bp	0.8
Pli-CMvi_021-Ex1-6G-lcwgs-1-1.clmp.r2	4.3%	42%	143 bp	0.8
Pli-CMvi_022-Ex1-7B-lcwgs-1-1.clmp.r1	2.4%	42%	130 bp	0.1
Pli-CMvi_022-Ex1-7B-lcwgs-1-1.clmp.r2	1.8%	42%	130 bp	0.1
Pli-CMvi_023-Ex1-7F-lcwgs-1-1.clmp.r1	3.8%	42%	134 bp	1.2
Pli-CMvi_023-Ex1-7F-lcwgs-1-1.clmp.r2	3.4%	42%	134 bp	1.2
Pli-CMvi_025-Ex1-1D-lcwgs-1-1.clmp.r1	3.6%	43%	135 bp	0.1
Pli-CMvi_025-Ex1-1D-lcwgs-1-1.clmp.r2	2.6%	43%	135 bp	0.1
Pli-CMvi_028-Ex1-3G-lcwgs-1-1.clmp.r1	8.0%	42%	144 bp	2.9
Pli-CMvi_028-Ex1-3G-lcwgs-1-1.clmp.r2	7.4%	43%	144 bp	2.9
Pli-CMvi_030-Ex1-5B-lcwgs-1-1.clmp.r1	0.9%	42%	128 bp	0.0
Pli-CMvi_030-Ex1-5B-lcwgs-1-1.clmp.r2	0.5%	42%	128 bp	0.0
Pli-CMvi_031-Ex1-5H-lcwgs-1-1.clmp.r1	7.4%	43%	137 bp	2.6
Pli-CMvi_031-Ex1-5H-lcwgs-1-1.clmp.r2	7.0%	43%	137 bp	2.6
Pli-CMvi_034-Ex1-7C-lcwgs-1-1.clmp.r1	2.1%	42%	126 bp	0.2
Pli-CMvi_034-Ex1-7C-lcwgs-1-1.clmp.r2	1.9%	42%	126 bp	0.2
Pli-CMvi_037-Ex1-1E-lcwgs-1-1.clmp.r1	8.2%	42%	147 bp	2.6
Pli-CMvi_037-Ex1-1E-lcwgs-1-1.clmp.r2	7.1%	43%	146 bp	2.6
Pli-CMvi_038-Ex1-2C-lcwgs-1-1.clmp.r1	3.7%	42%	135 bp	0.1
Pli-CMvi_038-Ex1-2C-lcwgs-1-1.clmp.r2	2.7%	42%	135 bp	0.1
Pli-CMvi_039-Ex1-3A-lcwgs-1-1.clmp.r1	7.2%	43%	142 bp	3.4
Pli-CMvi_039-Ex1-3A-lcwgs-1-1.clmp.r2	6.6%	43%	142 bp	3.4
Pli-CMvi_040-Ex1-3H-lcwgs-1-1.clmp.r1	5.5%	42%	141 bp	1.9
Pli-CMvi_040-Ex1-3H-lcwgs-1-1.clmp.r2	5.0%	42%	141 bp	1.9
Pli-CMvi_041-Ex1-4E-lcwgs-1-1.clmp.r1	5.1%	42%	140 bp	1.9
Pli-CMvi_041-Ex1-4E-lcwgs-1-1.clmp.r2	4.8%	42%	140 bp	1.9
Pli-CMvi_042-Ex1-5C-lcwgs-1-1.clmp.r1	7.0%	42%	145 bp	4.7
Pli-CMvi_042-Ex1-5C-lcwgs-1-1.clmp.r2	7.0%	43%	144 bp	4.7
Pli-CMvi_047-Ex1-7G-lcwgs-1-1.clmp.r1	3.7%	42%	135 bp	0.9
Pli-CMvi_047-Ex1-7G-lcwgs-1-1.clmp.r2	3.2%	42%	135 bp	0.9
Pli-CMvi_049-Ex1-1F-lcwgs-1-1.clmp.r1	7.2%	42%	144 bp	5.7
Pli-CMvi_049-Ex1-1F-lcwgs-1-1.clmp.r2	7.2%	42%	143 bp	5.7
Pli-CMvi_051-Ex1-3B-lcwgs-1-1.clmp.r1	8.1%	42%	142 bp	7.1
Pli-CMvi_051-Ex1-3B-lcwgs-1-1.clmp.r2	8.2%	43%	142 bp	7.1
Pli-CMvi_053-Ex1-4F-lcwgs-1-1.clmp.r1	3.0%	42%	137 bp	0.3
Pli-CMvi_053-Ex1-4F-lcwgs-1-1.clmp.r2	2.5%	42%	137 bp	0.3
Pli-CMvi_054-Ex1-5D-lcwgs-1-1.clmp.r1	5.8%	42%	139 bp	2.7
Pli-CMvi_054-Ex1-5D-lcwgs-1-1.clmp.r2	5.7%	42%	139 bp	2.7
Pli-CMvi_059-Ex1-7H-lcwgs-1-1.clmp.r1	6.1%	42%	141 bp	2.4
Pli-CMvi_059-Ex1-7H-lcwgs-1-1.clmp.r2	5.7%	42%	141 bp	2.4
Pli-CMvi_060-Ex1-8F-lcwgs-1-1.clmp.r1	4.0%	42%	140 bp	0.1
Pli-CMvi_060-Ex1-8F-lcwgs-1-1.clmp.r2	2.9%	42%	140 bp	0.1
Pli-CMvi_062-Ex1-2D-lcwgs-1-1.clmp.r1	6.0%	42%	138 bp	5.2
Pli-CMvi_062-Ex1-2D-lcwgs-1-1.clmp.r2	6.2%	42%	137 bp	5.2
Pli-CMvi_063-Ex1-3C-lcwgs-1-1.clmp.r1	7.2%	42%	144 bp	3.6
Pli-CMvi_063-Ex1-3C-lcwgs-1-1.clmp.r2	6.8%	42%	143 bp	3.6
Pli-CMvi_064-Ex1-4A-lcwgs-1-1.clmp.r1	7.5%	43%	146 bp	4.9
Pli-CMvi_064-Ex1-4A-lcwgs-1-1.clmp.r2	7.4%	43%	145 bp	4.9
Pli-CMvi_065-Ex1-4G-lcwgs-1-1.clmp.r1	3.0%	42%	134 bp	0.2
Pli-CMvi_065-Ex1-4G-lcwgs-1-1.clmp.r2	2.4%	42%	134 bp	0.2
Pli-CMvi_066-Ex1-5E-lcwgs-1-1.clmp.r1	9.2%	43%	144 bp	7.0
Pli-CMvi_066-Ex1-5E-lcwgs-1-1.clmp.r2	9.5%	43%	144 bp	7.0
Pli-CMvi_070-Ex1-7D-lcwgs-1-1.clmp.r1	2.2%	42%	129 bp	0.1
Pli-CMvi_070-Ex1-7D-lcwgs-1-1.clmp.r2	1.5%	42%	128 bp	0.1
Pli-CMvi_071-Ex1-8A-lcwgs-1-1.clmp.r1	1.4%	43%	128 bp	0.0
Pli-CMvi_071-Ex1-8A-lcwgs-1-1.clmp.r2	1.0%	43%	127 bp	0.0
Pli-CMvi_072-Ex1-8G-lcwgs-1-1.clmp.r1	4.7%	42%	142 bp	0.6
Pli-CMvi_072-Ex1-8G-lcwgs-1-1.clmp.r2	3.8%	42%	142 bp	0.6
Pli-CMvi_073-Ex1-1G-lcwgs-1-1.clmp.r1	10.7%	43%	143 bp	4.1
Pli-CMvi_073-Ex1-1G-lcwgs-1-1.clmp.r2	10.5%	44%	142 bp	4.1
Pli-CMvi_074-Ex1-2E-lcwgs-1-1.clmp.r1	4.8%	42%	136 bp	0.2
Pli-CMvi_074-Ex1-2E-lcwgs-1-1.clmp.r2	3.8%	42%	136 bp	0.2
Pli-CMvi_075-Ex1-3D-lcwgs-1-1.clmp.r1	2.3%	42%	129 bp	0.3
Pli-CMvi_075-Ex1-3D-lcwgs-1-1.clmp.r2	1.9%	42%	129 bp	0.3
Pli-CMvi_076-Ex1-4B-lcwgs-1-1.clmp.r1	1.6%	42%	129 bp	0.0
Pli-CMvi_076-Ex1-4B-lcwgs-1-1.clmp.r2	1.1%	42%	129 bp	0.0
Pli-CMvi_078-Ex1-5F-lcwgs-1-1.clmp.r1	1.1%	42%	134 bp	0.0
Pli-CMvi_078-Ex1-5F-lcwgs-1-1.clmp.r2	0.8%	42%	134 bp	0.0
Pli-CMvi_082-Ex1-7E-lcwgs-1-1.clmp.r1	3.6%	42%	133 bp	0.1
Pli-CMvi_082-Ex1-7E-lcwgs-1-1.clmp.r2	2.8%	42%	133 bp	0.1
Pli-CMvi_083-Ex1-8B-lcwgs-1-1.clmp.r1	3.7%	42%	139 bp	0.0
Pli-CMvi_083-Ex1-8B-lcwgs-1-1.clmp.r2	2.5%	42%	138 bp	0.0
Pli-CMvi_084-Ex1-8H-lcwgs-1-1.clmp.r1	3.8%	42%	133 bp	0.7
Pli-CMvi_084-Ex1-8H-lcwgs-1-1.clmp.r2	3.1%	42%	132 bp	0.7
Pli-CMvi_085-Ex1-1H-lcwgs-1-1.clmp.r1	6.9%	42%	142 bp	3.8
Pli-CMvi_085-Ex1-1H-lcwgs-1-1.clmp.r2	6.6%	42%	141 bp	3.8
Pli-CMvi_086-Ex1-2F-lcwgs-1-1.clmp.r1	7.5%	42%	145 bp	3.8
Pli-CMvi_086-Ex1-2F-lcwgs-1-1.clmp.r2	6.9%	43%	145 bp	3.8
Pli-CMvi_087-Ex1-3E-lcwgs-1-1.clmp.r1	7.4%	42%	145 bp	5.3
Pli-CMvi_087-Ex1-3E-lcwgs-1-1.clmp.r2	7.1%	43%	145 bp	5.3
Pli-CMvi_089-Ex1-4H-lcwgs-1-1.clmp.r1	5.9%	42%	142 bp	2.1
Pli-CMvi_089-Ex1-4H-lcwgs-1-1.clmp.r2	5.5%	42%	142 bp	2.1
Pli-CMvi_093-Ex1-7A-lcwgs-1-1.clmp.r1	0.6%	42%	120 bp	0.0
Pli-CMvi_093-Ex1-7A-lcwgs-1-1.clmp.r2	0.4%	42%	120 bp	0.0
Pli-CMvi_095-Ex1-8C-lcwgs-1-1.clmp.r1	0.7%	42%	126 bp	0.0
Pli-CMvi_095-Ex1-8C-lcwgs-1-1.clmp.r2	0.4%	42%	126 bp	0.0
```
  
</p>
</details>

## 10. Second trim.
`sbatch ../../../pire_fq_gz_processing/runFASTP_2.sbatch fq_fp1_clmp fq_fp1_clmp_fp2 33`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	# Variants	% Duplication	GC content	% PF	% Adapter
Pli-AMvi_004-Ex1-1A-lcwgs-1-1.clmp.r1r2_fastp		0.7%	46.7%	96.8%	3.3%
Pli-AMvi_004-Ex1-1A-lcwgs-2-1.clmp.r1r2_fastp		7.4%	57.1%	96.7%	0.2%
Pli-AMvi_005-Ex1-2A-lcwgs-1-1.clmp.r1r2_fastp		0.2%	44.3%	97.0%	1.9%
Pli-AMvi_005-Ex1-2A-lcwgs-2-1.clmp.r1r2_fastp		0.6%	48.2%	93.8%	1.1%
Pli-AMvi_006-Ex1-3A-lcwgs-1-1.clmp.r1r2_fastp		0.2%	43.0%	97.4%	2.0%
Pli-AMvi_006-Ex1-3A-lcwgs-2-1.clmp.r1r2_fastp		0.2%	44.2%	97.7%	3.1%
Pli-AMvi_007-Ex1-4A-lcwgs-1-1.clmp.r1r2_fastp		1.1%	40.1%	98.8%	1.6%
Pli-AMvi_007-Ex1-4A-lcwgs-2-1.clmp.r1r2_fastp		0.0%	43.9%	96.8%	1.9%
Pli-AMvi_008-Ex1-1B-lcwgs-1-1.clmp.r1r2_fastp		1.5%	40.9%	95.9%	3.3%
Pli-AMvi_008-Ex1-1B-lcwgs-2-1.clmp.r1r2_fastp		1.4%	48.1%	98.6%	1.4%
Pli-AMvi_009-Ex1-2B-lcwgs-1-1.clmp.r1r2_fastp		0.2%	44.3%	96.9%	2.2%
Pli-AMvi_009-Ex1-2B-lcwgs-2-1.clmp.r1r2_fastp		0.2%	48.9%	94.9%	1.6%
Pli-AMvi_010-Ex1-7A-lcwgs-1-1.clmp.r1r2_fastp		0.9%	38.7%	96.4%	3.0%
Pli-AMvi_010-Ex1-7A-lcwgs-2-1.clmp.r1r2_fastp		2.5%	46.7%	98.7%	1.3%
Pli-AMvi_011-Ex1-8A-lcwgs-1-1.clmp.r1r2_fastp		1.1%	39.4%	98.5%	2.1%
Pli-AMvi_011-Ex1-8A-lcwgs-2-1.clmp.r1r2_fastp		4.2%	48.4%	98.4%	1.1%
Pli-AMvi_012-Ex1-9A-lcwgs-1-1.clmp.r1r2_fastp		1.4%	39.3%	98.5%	2.0%
Pli-AMvi_012-Ex1-9A-lcwgs-2-1.clmp.r1r2_fastp		3.9%	46.7%	98.5%	1.2%
Pli-AMvi_013-Ex1-10A-lcwgs-1-1.clmp.r1r2_fastp		1.2%	39.1%	97.8%	2.3%
Pli-AMvi_013-Ex1-10A-lcwgs-2-1.clmp.r1r2_fastp		0.0%	45.7%	97.1%	1.5%
Pli-AMvi_014-Ex1-11A-lcwgs-1-1.clmp.r1r2_fastp		2.6%	45.5%	84.9%	9.8%
Pli-AMvi_014-Ex1-11A-lcwgs-2-1.clmp.r1r2_fastp		0.9%	48.2%	97.9%	1.9%
Pli-AMvi_015-Ex1-12A-lcwgs-1-1.clmp.r1r2_fastp		1.5%	43.9%	99.1%	2.3%
Pli-AMvi_015-Ex1-12A-lcwgs-2-1.clmp.r1r2_fastp		0.3%	52.4%	89.1%	1.6%
Pli-AMvi_016-Ex1-3B-lcwgs-1-1.clmp.r1r2_fastp		0.6%	41.2%	99.0%	1.6%
Pli-AMvi_016-Ex1-3B-lcwgs-2-1.clmp.r1r2_fastp		0.8%	43.2%	99.2%	1.5%
Pli-AMvi_017-Ex1-4B-lcwgs-1-1.clmp.r1r2_fastp		0.7%	41.2%	98.7%	1.5%
Pli-AMvi_017-Ex1-4B-lcwgs-2-1.clmp.r1r2_fastp		0.6%	47.4%	95.8%	1.5%
Pli-AMvi_018-Ex1-1C-lcwgs-1-1.clmp.r1r2_fastp		0.8%	44.0%	98.2%	1.6%
Pli-AMvi_018-Ex1-1C-lcwgs-2-1.clmp.r1r2_fastp		0.4%	50.6%	95.6%	1.0%
Pli-AMvi_019-Ex1-2C-lcwgs-1-1.clmp.r1r2_fastp		0.4%	43.7%	98.4%	1.8%
Pli-AMvi_019-Ex1-2C-lcwgs-2-1.clmp.r1r2_fastp		0.3%	46.8%	97.2%	0.5%
Pli-AMvi_020-Ex1-3C-lcwgs-1-1.clmp.r1r2_fastp		0.5%	44.2%	95.2%	3.8%
Pli-AMvi_020-Ex1-3C-lcwgs-2-1.clmp.r1r2_fastp		0.4%	45.4%	97.3%	3.0%
Pli-AMvi_021-Ex1-4C-lcwgs-1-1.clmp.r1r2_fastp		0.6%	41.0%	97.9%	2.5%
Pli-AMvi_021-Ex1-4C-lcwgs-2-1.clmp.r1r2_fastp		0.5%	43.3%	98.9%	2.3%
Pli-AMvi_022-Ex1-7B-lcwgs-1-1.clmp.r1r2_fastp		1.1%	39.3%	99.0%	1.6%
Pli-AMvi_022-Ex1-7B-lcwgs-2-1.clmp.r1r2_fastp		7.1%	51.8%	97.4%	0.9%
Pli-AMvi_023-Ex1-8B-lcwgs-1-1.clmp.r1r2_fastp		1.0%	39.5%	98.9%	1.6%
Pli-AMvi_023-Ex1-8B-lcwgs-2-1.clmp.r1r2_fastp		2.3%	47.4%	98.0%	1.8%
Pli-AMvi_024-Ex1-9B-lcwgs-1-1.clmp.r1r2_fastp		1.2%	39.6%	99.1%	1.4%
Pli-AMvi_024-Ex1-9B-lcwgs-2-1.clmp.r1r2_fastp		11.6%	52.5%	97.4%	0.7%
Pli-AMvi_025-Ex1-10B-lcwgs-1-1.clmp.r1r2_fastp		0.8%	39.9%	98.7%	1.5%
Pli-AMvi_025-Ex1-10B-lcwgs-2-1.clmp.r1r2_fastp		0.0%	44.1%	97.6%	0.0%
Pli-AMvi_026-Ex1-11B-lcwgs-1-1.clmp.r1r2_fastp		1.1%	41.5%	99.1%	1.6%
Pli-AMvi_026-Ex1-11B-lcwgs-2-1.clmp.r1r2_fastp		0.4%	45.0%	99.1%	1.1%
Pli-AMvi_027-Ex1-12B-lcwgs-1-1.clmp.r1r2_fastp		0.0%	43.1%	97.2%	0.8%
Pli-AMvi_027-Ex1-12B-lcwgs-2-1.clmp.r1r2_fastp		0.2%	49.5%	94.2%	2.4%
Pli-AMvi_028-Ex1-1D-lcwgs-1-1.clmp.r1r2_fastp		0.3%	45.6%	98.1%	1.8%
Pli-AMvi_028-Ex1-1D-lcwgs-2-1.clmp.r1r2_fastp		0.6%	50.0%	95.6%	1.9%
Pli-AMvi_029-Ex1-2D-lcwgs-1-1.clmp.r1r2_fastp		0.9%	41.7%	98.7%	1.7%
Pli-AMvi_029-Ex1-2D-lcwgs-2-1.clmp.r1r2_fastp		0.7%	44.1%	99.2%	1.5%
Pli-AMvi_030-Ex1-3D-lcwgs-1-1.clmp.r1r2_fastp		0.6%	42.9%	96.7%	3.1%
Pli-AMvi_030-Ex1-3D-lcwgs-2-1.clmp.r1r2_fastp		0.5%	44.2%	98.8%	2.1%
Pli-AMvi_031-Ex1-4D-lcwgs-1-1.clmp.r1r2_fastp		0.5%	45.5%	97.1%	1.7%
Pli-AMvi_031-Ex1-4D-lcwgs-2-1.clmp.r1r2_fastp		1.0%	46.1%	94.6%	1.8%
Pli-AMvi_032-Ex1-5C-lcwgs-1-1.clmp.r1r2_fastp		1.0%	41.0%	98.9%	1.6%
Pli-AMvi_032-Ex1-5C-lcwgs-2-1.clmp.r1r2_fastp		0.8%	42.9%	99.3%	1.7%
Pli-AMvi_033-Ex1-6C-lcwgs-1-1.clmp.r1r2_fastp		0.4%	43.1%	98.8%	1.6%
Pli-AMvi_033-Ex1-6C-lcwgs-2-1.clmp.r1r2_fastp		0.7%	43.7%	99.3%	1.8%
Pli-AMvi_034-Ex1-7C-lcwgs-1-1.clmp.r1r2_fastp		0.3%	45.1%	96.4%	1.7%
Pli-AMvi_034-Ex1-7C-lcwgs-2-1.clmp.r1r2_fastp		0.3%	46.0%	98.1%	1.9%
Pli-AMvi_035-Ex1-8C-lcwgs-1-1.clmp.r1r2_fastp		0.5%	42.3%	99.1%	1.6%
Pli-AMvi_035-Ex1-8C-lcwgs-2-1.clmp.r1r2_fastp		0.4%	44.3%	98.7%	1.5%
Pli-AMvi_036-Ex1-9C-lcwgs-1-1.clmp.r1r2_fastp		7.5%	42.0%	97.6%	1.6%
Pli-AMvi_036-Ex1-9C-lcwgs-2-1.clmp.r1r2_fastp		13.1%	48.2%	97.2%	0.7%
Pli-AMvi_037-Ex1-10C-lcwgs-1-1.clmp.r1r2_fastp		1.0%	38.6%	99.0%	1.7%
Pli-AMvi_037-Ex1-10C-lcwgs-2-1.clmp.r1r2_fastp		0.0%	41.0%	98.2%	0.0%
Pli-AMvi_038-Ex1-11C-lcwgs-1-1.clmp.r1r2_fastp		1.1%	43.6%	98.6%	1.7%
Pli-AMvi_038-Ex1-11C-lcwgs-2-1.clmp.r1r2_fastp		0.0%	44.7%	97.7%	1.1%
Pli-AMvi_039-Ex1-12C-lcwgs-1-1.clmp.r1r2_fastp		0.4%	42.7%	97.6%	2.0%
Pli-AMvi_039-Ex1-12C-lcwgs-2-1.clmp.r1r2_fastp		17.5%	57.4%	96.3%	0.2%
Pli-AMvi_040-Ex1-5A-lcwgs-1-1.clmp.r1r2_fastp		0.9%	41.9%	98.9%	1.6%
Pli-AMvi_040-Ex1-5A-lcwgs-2-1.clmp.r1r2_fastp		3.2%	46.8%	98.6%	1.2%
Pli-AMvi_041-Ex1-6A-lcwgs-1-1.clmp.r1r2_fastp		1.5%	37.7%	98.2%	2.1%
Pli-AMvi_041-Ex1-6A-lcwgs-2-1.clmp.r1r2_fastp		2.1%	44.0%	98.9%	1.4%
Pli-AMvi_042-Ex1-5B-lcwgs-1-1.clmp.r1r2_fastp		0.4%	44.2%	96.6%	1.4%
Pli-AMvi_042-Ex1-5B-lcwgs-2-1.clmp.r1r2_fastp		0.1%	46.5%	97.0%	1.6%
Pli-AMvi_043-Ex1-6B-lcwgs-1-1.clmp.r1r2_fastp		1.3%	41.5%	99.0%	1.4%
Pli-AMvi_043-Ex1-6B-lcwgs-2-1.clmp.r1r2_fastp		3.8%	50.4%	98.5%	1.1%
Pli-AMvi_044-Ex1-5D-lcwgs-1-1.clmp.r1r2_fastp		0.3%	44.4%	97.3%	1.4%
Pli-AMvi_044-Ex1-5D-lcwgs-2-1.clmp.r1r2_fastp		0.5%	44.4%	99.3%	1.6%
Pli-AMvi_045-Ex1-6D-lcwgs-1-1.clmp.r1r2_fastp		0.8%	45.9%	97.7%	1.5%
Pli-AMvi_045-Ex1-6D-lcwgs-2-1.clmp.r1r2_fastp		0.6%	47.8%	99.0%	1.5%
Pli-AMvi_046-Ex1-1E-lcwgs-1-1.clmp.r1r2_fastp		0.5%	45.4%	96.7%	1.9%
Pli-AMvi_046-Ex1-1E-lcwgs-2-1.clmp.r1r2_fastp		1.4%	45.2%	99.0%	1.4%
Pli-AMvi_047-Ex1-2E-lcwgs-1-1.clmp.r1r2_fastp		0.8%	40.5%	97.7%	2.4%
Pli-AMvi_047-Ex1-2E-lcwgs-2-1.clmp.r1r2_fastp		0.7%	45.9%	99.4%	1.6%
Pli-AMvi_048-Ex1-3E-lcwgs-1-1.clmp.r1r2_fastp		0.1%	42.7%	97.9%	1.5%
Pli-AMvi_048-Ex1-3E-lcwgs-2-1.clmp.r1r2_fastp		0.0%	38.6%	100.0%	0.0%
Pli-AMvi_049-Ex1-4E-lcwgs-1-1.clmp.r1r2_fastp		0.4%	44.8%	97.6%	1.7%
Pli-AMvi_049-Ex1-4E-lcwgs-2-1.clmp.r1r2_fastp		0.0%	40.2%	92.9%	0.0%
Pli-AMvi_050-Ex1-5E-lcwgs-1-1.clmp.r1r2_fastp		0.1%	44.1%	96.9%	1.1%
Pli-AMvi_050-Ex1-5E-lcwgs-2-1.clmp.r1r2_fastp		0.0%	44.0%	98.6%	2.1%
Pli-AMvi_051-Ex1-6E-lcwgs-1-1.clmp.r1r2_fastp		0.9%	45.3%	97.1%	1.5%
Pli-AMvi_051-Ex1-6E-lcwgs-2-1.clmp.r1r2_fastp		1.0%	48.8%	98.9%	1.9%
Pli-AMvi_052-Ex1-7D-lcwgs-1-1.clmp.r1r2_fastp		0.8%	42.6%	99.0%	1.7%
Pli-AMvi_052-Ex1-7D-lcwgs-2-1.clmp.r1r2_fastp		0.4%	48.3%	98.8%	1.6%
Pli-AMvi_053-Ex1-8D-lcwgs-1-1.clmp.r1r2_fastp		0.3%	43.7%	96.9%	1.7%
Pli-AMvi_053-Ex1-8D-lcwgs-2-1.clmp.r1r2_fastp		0.4%	43.6%	98.3%	2.1%
Pli-AMvi_054-Ex1-9D-lcwgs-1-1.clmp.r1r2_fastp		0.5%	44.3%	97.0%	3.2%
Pli-AMvi_054-Ex1-9D-lcwgs-2-1.clmp.r1r2_fastp		0.5%	46.9%	93.7%	0.5%
Pli-AMvi_055-Ex1-10D-lcwgs-1-1.clmp.r1r2_fastp		0.5%	41.8%	97.6%	2.6%
Pli-AMvi_055-Ex1-10D-lcwgs-2-1.clmp.r1r2_fastp		0.0%	44.3%	96.5%	0.9%
Pli-AMvi_056-Ex1-11D-lcwgs-1-1.clmp.r1r2_fastp		0.2%	43.2%	97.6%	1.9%
Pli-AMvi_056-Ex1-11D-lcwgs-2-1.clmp.r1r2_fastp		4.2%	49.5%	100.0%	0.0%
Pli-AMvi_057-Ex1-12D-lcwgs-1-1.clmp.r1r2_fastp		0.4%	42.1%	97.2%	1.2%
Pli-AMvi_057-Ex1-12D-lcwgs-2-1.clmp.r1r2_fastp		0.5%	50.7%	94.8%	1.4%
Pli-AMvi_058-Ex1-1F-lcwgs-1-1.clmp.r1r2_fastp		0.4%	45.2%	97.2%	1.3%
Pli-AMvi_058-Ex1-1F-lcwgs-2-1.clmp.r1r2_fastp		16.6%	57.9%	96.3%	0.2%
Pli-AMvi_059-Ex1-2F-lcwgs-1-1.clmp.r1r2_fastp		0.2%	44.0%	97.7%	1.5%
Pli-AMvi_059-Ex1-2F-lcwgs-2-1.clmp.r1r2_fastp		0.7%	53.1%	93.8%	0.7%
Pli-AMvi_060-Ex1-3F-lcwgs-1-1.clmp.r1r2_fastp		0.2%	43.0%	98.1%	2.0%
Pli-AMvi_060-Ex1-3F-lcwgs-2-1.clmp.r1r2_fastp		0.0%	48.3%	98.6%	1.4%
Pli-AMvi_061-Ex1-4F-lcwgs-1-1.clmp.r1r2_fastp		0.2%	44.8%	97.6%	1.9%
Pli-AMvi_061-Ex1-4F-lcwgs-2-1.clmp.r1r2_fastp		0.0%	52.8%	94.5%	1.1%
Pli-AMvi_062-Ex1-5F-lcwgs-1-1.clmp.r1r2_fastp		0.3%	44.5%	97.2%	1.9%
Pli-AMvi_062-Ex1-5F-lcwgs-2-1.clmp.r1r2_fastp		0.4%	48.7%	98.9%	0.7%
Pli-AMvi_063-Ex1-6F-lcwgs-1-1.clmp.r1r2_fastp		0.6%	45.5%	98.2%	1.6%
Pli-AMvi_063-Ex1-6F-lcwgs-2-1.clmp.r1r2_fastp		0.4%	47.3%	97.8%	1.9%
Pli-AMvi_064-Ex1-7E-lcwgs-1-1.clmp.r1r2_fastp		0.8%	42.4%	99.1%	1.6%
Pli-AMvi_064-Ex1-7E-lcwgs-2-1.clmp.r1r2_fastp		0.6%	48.1%	98.8%	1.6%
Pli-AMvi_065-Ex1-8E-lcwgs-1-1.clmp.r1r2_fastp		0.7%	39.3%	99.2%	1.7%
Pli-AMvi_065-Ex1-8E-lcwgs-2-1.clmp.r1r2_fastp		0.5%	45.9%	99.4%	1.8%
Pli-AMvi_066-Ex1-9E-lcwgs-1-1.clmp.r1r2_fastp		0.5%	43.5%	97.9%	1.5%
Pli-AMvi_066-Ex1-9E-lcwgs-2-1.clmp.r1r2_fastp		1.3%	47.7%	97.4%	0.0%
Pli-AMvi_067-Ex1-10E-lcwgs-1-1.clmp.r1r2_fastp		0.6%	43.1%	96.8%	3.0%
Pli-AMvi_067-Ex1-10E-lcwgs-2-1.clmp.r1r2_fastp		5.3%	35.5%	100.0%	0.0%
Pli-AMvi_068-Ex1-1E-lcwgs-1-1.clmp.r1r2_fastp		0.6%	45.3%	96.8%	0.8%
Pli-AMvi_068-Ex1-1E-lcwgs-2-1.clmp.r1r2_fastp		1.6%	52.8%	96.9%	0.0%
Pli-AMvi_069-Ex1-12E-lcwgs-1-1.clmp.r1r2_fastp		0.6%	43.4%	97.2%	0.6%
Pli-AMvi_069-Ex1-12E-lcwgs-2-1.clmp.r1r2_fastp		11.7%	59.6%	96.9%	0.1%
Pli-AMvi_070-Ex1-1G-lcwgs-1-1.clmp.r1r2_fastp		0.4%	45.1%	96.4%	1.1%
Pli-AMvi_070-Ex1-1G-lcwgs-2-1.clmp.r1r2_fastp		19.5%	57.3%	96.3%	0.2%
Pli-AMvi_071-Ex1-2G-lcwgs-1-1.clmp.r1r2_fastp		0.2%	44.0%	97.5%	1.9%
Pli-AMvi_071-Ex1-2G-lcwgs-2-1.clmp.r1r2_fastp		21.7%	56.6%	96.1%	0.2%
Pli-AMvi_072-Ex1-3G-lcwgs-1-1.clmp.r1r2_fastp		0.2%	42.7%	98.0%	2.3%
Pli-AMvi_072-Ex1-3G-lcwgs-2-1.clmp.r1r2_fastp		0.4%	48.4%	97.1%	1.5%
Pli-AMvi_073-Ex1-4G-lcwgs-1-1.clmp.r1r2_fastp		0.4%	44.7%	97.4%	1.7%
Pli-AMvi_073-Ex1-4G-lcwgs-2-1.clmp.r1r2_fastp		0.5%	46.0%	99.0%	2.0%
Pli-AMvi_074-Ex1-5G-lcwgs-1-1.clmp.r1r2_fastp		0.5%	43.9%	98.0%	2.0%
Pli-AMvi_074-Ex1-5G-lcwgs-2-1.clmp.r1r2_fastp		0.5%	46.8%	96.8%	1.9%
Pli-AMvi_075-Ex1-6G-lcwgs-1-1.clmp.r1r2_fastp		0.5%	43.3%	95.4%	1.2%
Pli-AMvi_075-Ex1-6G-lcwgs-2-1.clmp.r1r2_fastp		5.1%	50.5%	97.7%	1.5%
Pli-AMvi_076-Ex1-7F-lcwgs-1-1.clmp.r1r2_fastp		0.5%	46.0%	99.1%	1.6%
Pli-AMvi_076-Ex1-7F-lcwgs-2-1.clmp.r1r2_fastp		0.5%	50.9%	96.4%	1.8%
Pli-AMvi_077-Ex1-8F-lcwgs-1-1.clmp.r1r2_fastp		0.4%	44.5%	97.9%	1.8%
Pli-AMvi_077-Ex1-8F-lcwgs-2-1.clmp.r1r2_fastp		0.5%	50.4%	97.4%	3.7%
Pli-AMvi_078-Ex1-9F-lcwgs-1-1.clmp.r1r2_fastp		0.3%	43.7%	97.7%	1.6%
Pli-AMvi_078-Ex1-9F-lcwgs-2-1.clmp.r1r2_fastp		0.3%	50.1%	97.6%	1.7%
Pli-AMvi_079-Ex1-10F-lcwgs-1-1.clmp.r1r2_fastp		0.3%	42.6%	97.8%	1.6%
Pli-AMvi_079-Ex1-10F-lcwgs-2-1.clmp.r1r2_fastp		5.1%	57.5%	98.2%	0.4%
Pli-AMvi_080-Ex1-11F-lcwgs-1-1.clmp.r1r2_fastp		0.4%	42.9%	97.8%	2.0%
Pli-AMvi_080-Ex1-11F-lcwgs-2-1.clmp.r1r2_fastp		0.0%	36.4%	100.0%	0.0%
Pli-AMvi_081-Ex1-12F-lcwgs-1-1.clmp.r1r2_fastp		1.3%	42.5%	95.6%	0.6%
Pli-AMvi_081-Ex1-12F-lcwgs-2-1.clmp.r1r2_fastp		11.7%	56.5%	96.4%	0.1%
Pli-AMvi_082-Ex1-1H-lcwgs-1-1.clmp.r1r2_fastp		1.0%	44.6%	99.0%	1.8%
Pli-AMvi_082-Ex1-1H-lcwgs-2-1.clmp.r1r2_fastp		7.3%	56.1%	97.0%	0.7%
Pli-AMvi_083-Ex1-2H-lcwgs-1-1.clmp.r1r2_fastp		0.6%	41.2%	99.2%	1.8%
Pli-AMvi_083-Ex1-2H-lcwgs-2-1.clmp.r1r2_fastp		0.7%	42.5%	99.2%	1.6%
Pli-AMvi_084-Ex1-3H-lcwgs-1-1.clmp.r1r2_fastp		0.7%	45.0%	98.7%	2.2%
Pli-AMvi_084-Ex1-3H-lcwgs-2-1.clmp.r1r2_fastp		4.2%	50.0%	98.3%	1.1%
Pli-AMvi_085-Ex1-4H-lcwgs-1-1.clmp.r1r2_fastp		0.6%	42.5%	99.0%	1.9%
Pli-AMvi_085-Ex1-4H-lcwgs-2-1.clmp.r1r2_fastp		0.6%	44.0%	98.9%	2.1%
Pli-AMvi_086-Ex1-5H-lcwgs-1-1.clmp.r1r2_fastp		0.4%	46.1%	97.1%	3.1%
Pli-AMvi_086-Ex1-5H-lcwgs-2-1.clmp.r1r2_fastp		1.1%	43.3%	99.1%	1.5%
Pli-AMvi_087-Ex1-6H-lcwgs-1-1.clmp.r1r2_fastp		0.6%	47.6%	97.6%	2.8%
Pli-AMvi_087-Ex1-6H-lcwgs-2-1.clmp.r1r2_fastp		3.0%	51.3%	98.5%	1.2%
Pli-AMvi_088-Ex1-7G-lcwgs-1-1.clmp.r1r2_fastp		0.1%	44.6%	97.9%	2.0%
Pli-AMvi_088-Ex1-7G-lcwgs-2-1.clmp.r1r2_fastp		2.7%	47.9%	98.6%	1.3%
Pli-AMvi_089-Ex1-8G-lcwgs-1-1.clmp.r1r2_fastp		0.2%	43.0%	97.6%	2.0%
Pli-AMvi_089-Ex1-8G-lcwgs-2-1.clmp.r1r2_fastp		0.2%	48.2%	97.4%	2.0%
Pli-AMvi_090-Ex1-9G-lcwgs-1-1.clmp.r1r2_fastp		0.2%	43.3%	97.6%	1.6%
Pli-AMvi_090-Ex1-9G-lcwgs-2-1.clmp.r1r2_fastp		0.6%	49.2%	97.0%	0.8%
Pli-AMvi_091-Ex1-10G-lcwgs-1-1.clmp.r1r2_fastp		0.2%	42.7%	97.5%	1.5%
Pli-AMvi_091-Ex1-10G-lcwgs-2-1.clmp.r1r2_fastp		2.8%	56.4%	97.1%	0.9%
Pli-AMvi_092-Ex1-11G-lcwgs-1-1.clmp.r1r2_fastp		0.1%	43.3%	98.3%	1.6%
Pli-AMvi_092-Ex1-11G-lcwgs-2-1.clmp.r1r2_fastp		3.4%	46.3%	96.6%	0.0%
Pli-AMvi_093-Ex1-12G-lcwgs-1-1.clmp.r1r2_fastp		0.0%	43.3%	98.1%	1.1%
Pli-AMvi_093-Ex1-12G-lcwgs-2-1.clmp.r1r2_fastp		21.7%	57.2%	95.9%	0.1%
Pli-AMvi_094-Ex1-7H-lcwgs-1-1.clmp.r1r2_fastp		0.6%	43.3%	99.1%	1.9%
Pli-AMvi_094-Ex1-7H-lcwgs-2-1.clmp.r1r2_fastp		0.6%	44.2%	98.8%	2.1%
Pli-AMvi_095-Ex1-8H-lcwgs-1-1.clmp.r1r2_fastp		0.5%	47.6%	97.4%	3.0%
Pli-AMvi_095-Ex1-8H-lcwgs-2-1.clmp.r1r2_fastp		0.7%	46.2%	98.5%	2.0%
Pli-AMvi_096-Ex1-9H-lcwgs-1-1.clmp.r1r2_fastp		0.6%	44.1%	97.3%	2.0%
Pli-AMvi_096-Ex1-9H-lcwgs-2-1.clmp.r1r2_fastp		0.0%	49.3%	100.0%	0.0%
Pli-AMvi_097-Ex1-10H-lcwgs-1-1.clmp.r1r2_fastp		0.3%	43.4%	97.5%	2.1%
Pli-AMvi_097-Ex1-10H-lcwgs-2-1.clmp.r1r2_fastp		2.5%	41.6%	97.6%	2.4%
Pli-AMvi_098-Ex1-11H-lcwgs-1-1.clmp.r1r2_fastp		0.2%	42.8%	97.9%	2.2%
Pli-AMvi_098-Ex1-11H-lcwgs-2-1.clmp.r1r2_fastp		0.0%	50.6%	100.0%	0.0%
Pli-AMvi_099-Ex1-12H-lcwgs-1-1.clmp.r1r2_fastp		0.0%	41.4%	97.9%	0.6%
Pli-AMvi_099-Ex1-12H-lcwgs-2-1.clmp.r1r2_fastp		27.0%	55.6%	95.7%	0.2%
Pli-CMvi_001-Ex1-1B-lcwgs-1-1.clmp.r1r2_fastp		4.4%	42.7%	97.4%	0.3%
Pli-CMvi_002-Ex1-2A-lcwgs-1-1.clmp.r1r2_fastp		3.1%	42.7%	97.6%	0.4%
Pli-CMvi_003-Ex1-2G-lcwgs-1-1.clmp.r1r2_fastp		2.8%	42.2%	97.8%	0.5%
Pli-CMvi_004-Ex1-3F-lcwgs-1-1.clmp.r1r2_fastp		3.5%	42.4%	97.5%	0.3%
Pli-CMvi_005-Ex1-4C-lcwgs-1-1.clmp.r1r2_fastp		0.2%	42.6%	97.2%	1.2%
Pli-CMvi_006-Ex1-5A-lcwgs-1-1.clmp.r1r2_fastp		0.5%	42.8%	97.3%	1.1%
Pli-CMvi_007-Ex1-5G-lcwgs-1-1.clmp.r1r2_fastp		3.1%	42.4%	97.4%	0.4%
Pli-CMvi_013-Ex1-1C-lcwgs-1-1.clmp.r1r2_fastp		5.8%	43.5%	96.7%	0.2%
Pli-CMvi_014-Ex1-2B-lcwgs-1-1.clmp.r1r2_fastp		0.4%	42.4%	95.7%	2.5%
Pli-CMvi_015-Ex1-2H-lcwgs-1-1.clmp.r1r2_fastp		3.5%	42.8%	97.5%	0.4%
Pli-CMvi_020-Ex1-6D-lcwgs-1-1.clmp.r1r2_fastp		6.1%	43.0%	97.4%	0.5%
Pli-CMvi_021-Ex1-6G-lcwgs-1-1.clmp.r1r2_fastp		3.2%	42.3%	97.5%	0.3%
Pli-CMvi_022-Ex1-7B-lcwgs-1-1.clmp.r1r2_fastp		2.0%	42.1%	98.0%	0.8%
Pli-CMvi_023-Ex1-7F-lcwgs-1-1.clmp.r1r2_fastp		2.9%	42.1%	98.1%	0.6%
Pli-CMvi_025-Ex1-1D-lcwgs-1-1.clmp.r1r2_fastp		2.2%	43.2%	97.4%	0.7%
Pli-CMvi_028-Ex1-3G-lcwgs-1-1.clmp.r1r2_fastp		5.8%	42.8%	97.3%	0.3%
Pli-CMvi_030-Ex1-5B-lcwgs-1-1.clmp.r1r2_fastp		0.3%	42.6%	97.0%	1.0%
Pli-CMvi_031-Ex1-5H-lcwgs-1-1.clmp.r1r2_fastp		5.1%	43.2%	97.4%	0.5%
Pli-CMvi_034-Ex1-7C-lcwgs-1-1.clmp.r1r2_fastp		1.9%	42.2%	98.4%	0.9%
Pli-CMvi_037-Ex1-1E-lcwgs-1-1.clmp.r1r2_fastp		5.9%	42.9%	96.6%	0.2%
Pli-CMvi_038-Ex1-2C-lcwgs-1-1.clmp.r1r2_fastp		2.4%	42.4%	97.5%	0.6%
Pli-CMvi_039-Ex1-3A-lcwgs-1-1.clmp.r1r2_fastp		4.3%	43.2%	97.4%	0.4%
Pli-CMvi_040-Ex1-3H-lcwgs-1-1.clmp.r1r2_fastp		3.5%	42.6%	97.2%	0.3%
Pli-CMvi_041-Ex1-4E-lcwgs-1-1.clmp.r1r2_fastp		3.0%	42.5%	97.4%	0.4%
Pli-CMvi_042-Ex1-5C-lcwgs-1-1.clmp.r1r2_fastp		4.2%	42.7%	97.2%	0.2%
Pli-CMvi_047-Ex1-7G-lcwgs-1-1.clmp.r1r2_fastp		2.9%	42.2%	97.9%	0.5%
Pli-CMvi_049-Ex1-1F-lcwgs-1-1.clmp.r1r2_fastp		4.4%	42.6%	97.5%	0.3%
Pli-CMvi_051-Ex1-3B-lcwgs-1-1.clmp.r1r2_fastp		4.7%	42.9%	97.4%	0.3%
Pli-CMvi_053-Ex1-4F-lcwgs-1-1.clmp.r1r2_fastp		2.6%	42.2%	97.8%	0.5%
Pli-CMvi_054-Ex1-5D-lcwgs-1-1.clmp.r1r2_fastp		3.3%	42.4%	97.7%	0.5%
Pli-CMvi_059-Ex1-7H-lcwgs-1-1.clmp.r1r2_fastp		3.6%	42.6%	97.5%	0.4%
Pli-CMvi_060-Ex1-8F-lcwgs-1-1.clmp.r1r2_fastp		3.0%	42.4%	97.5%	0.4%
Pli-CMvi_062-Ex1-2D-lcwgs-1-1.clmp.r1r2_fastp		3.3%	42.4%	97.8%	0.5%
Pli-CMvi_063-Ex1-3C-lcwgs-1-1.clmp.r1r2_fastp		4.1%	42.6%	97.4%	0.3%
Pli-CMvi_064-Ex1-4A-lcwgs-1-1.clmp.r1r2_fastp		4.6%	43.0%	97.0%	0.2%
Pli-CMvi_065-Ex1-4G-lcwgs-1-1.clmp.r1r2_fastp		2.4%	42.6%	97.8%	0.6%
Pli-CMvi_066-Ex1-5E-lcwgs-1-1.clmp.r1r2_fastp		5.5%	43.1%	97.3%	0.3%
Pli-CMvi_070-Ex1-7D-lcwgs-1-1.clmp.r1r2_fastp		1.6%	42.4%	98.0%	1.0%
Pli-CMvi_071-Ex1-8A-lcwgs-1-1.clmp.r1r2_fastp		1.0%	43.0%	97.4%	1.1%
Pli-CMvi_072-Ex1-8G-lcwgs-1-1.clmp.r1r2_fastp		3.7%	42.6%	97.4%	0.3%
Pli-CMvi_073-Ex1-1G-lcwgs-1-1.clmp.r1r2_fastp		5.3%	43.9%	97.3%	0.3%
Pli-CMvi_074-Ex1-2E-lcwgs-1-1.clmp.r1r2_fastp		2.3%	42.6%	97.4%	0.6%
Pli-CMvi_075-Ex1-3D-lcwgs-1-1.clmp.r1r2_fastp		1.6%	42.4%	98.0%	0.8%
Pli-CMvi_076-Ex1-4B-lcwgs-1-1.clmp.r1r2_fastp		1.0%	42.5%	97.4%	1.0%
Pli-CMvi_078-Ex1-5F-lcwgs-1-1.clmp.r1r2_fastp		0.6%	42.5%	97.2%	0.8%
Pli-CMvi_082-Ex1-7E-lcwgs-1-1.clmp.r1r2_fastp		2.4%	42.1%	97.8%	0.7%
Pli-CMvi_083-Ex1-8B-lcwgs-1-1.clmp.r1r2_fastp		2.8%	42.4%	97.4%	0.6%
Pli-CMvi_084-Ex1-8H-lcwgs-1-1.clmp.r1r2_fastp		2.9%	42.4%	97.7%	0.6%
Pli-CMvi_085-Ex1-1H-lcwgs-1-1.clmp.r1r2_fastp		4.0%	42.6%	97.5%	0.3%
Pli-CMvi_086-Ex1-2F-lcwgs-1-1.clmp.r1r2_fastp		4.8%	42.8%	97.1%	0.2%
Pli-CMvi_087-Ex1-3E-lcwgs-1-1.clmp.r1r2_fastp		4.8%	42.8%	97.0%	0.2%
Pli-CMvi_089-Ex1-4H-lcwgs-1-1.clmp.r1r2_fastp		3.6%	42.7%	97.4%	0.3%
Pli-CMvi_093-Ex1-7A-lcwgs-1-1.clmp.r1r2_fastp		0.3%	42.6%	97.7%	1.4%
Pli-CMvi_095-Ex1-8C-lcwgs-1-1.clmp.r1r2_fastp		0.4%	42.5%	97.3%	1.0%
```

</p>
</details>

## 11. Decontaminate files.
`bash ../../../pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn 20`

```bash
[hpc-0351@wahab-01 1st_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*tagged.fastq.gz | wc -l
492
[hpc-0351@wahab-01 1st_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*tagged_filter.fastq.gz | wc -l
492
[hpc-0351@wahab-01 1st_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*screen.txt | wc -l
492
[hpc-0351@wahab-01 1st_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*screen.png | wc -l
492
[hpc-0351@wahab-01 1st_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*screen.html | wc -l
492
[hpc-0351@wahab-01 1st_sequencing_run]$ grep 'error' slurm-fqscrn.*out
[hpc-0351@wahab-01 1st_sequencing_run]$ grep 'No reads in' slurm-fqscrn.*out
```

`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runMULTIQC.sbatch fq_fp1_clmp_fp2_fqscrn fastq_screen_report`

<details><summary>Expand for MultiQC Output.</summary>

```bash
insert multiqc output here
```

</p>
</details>

## 12. Execute RePair
`sbatch ../../../pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 40`

`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "./fq_fp1_clmp_fp2_fqscrn_rprd" "fqc_rprd_report" "fq.gz"`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	Length	M Seqs
Pli-AMvi_004-Ex1-1A-lcwgs-1-1.clmp.fp2_repr.R1	1.1%	46%	59 bp	0.2
Pli-AMvi_004-Ex1-1A-lcwgs-1-1.clmp.fp2_repr.R2	0.9%	46%	59 bp	0.2
Pli-AMvi_004-Ex1-1A-lcwgs-2-1.clmp.fp2_repr.R1	7.7%	51%	143 bp	0.0
Pli-AMvi_004-Ex1-1A-lcwgs-2-1.clmp.fp2_repr.R2	4.7%	51%	133 bp	0.0
Pli-AMvi_005-Ex1-2A-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	42%	77 bp	0.0
Pli-AMvi_005-Ex1-2A-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	42%	75 bp	0.0
Pli-AMvi_005-Ex1-2A-lcwgs-2-1.clmp.fp2_repr.R1	0.6%	43%	86 bp	0.0
Pli-AMvi_005-Ex1-2A-lcwgs-2-1.clmp.fp2_repr.R2	0.4%	43%	84 bp	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	41%	72 bp	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	41%	71 bp	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-2-1.clmp.fp2_repr.R1	0.3%	41%	68 bp	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-2-1.clmp.fp2_repr.R2	0.3%	41%	67 bp	0.0
Pli-AMvi_007-Ex1-4A-lcwgs-1-1.clmp.fp2_repr.R1	0.8%	39%	68 bp	0.1
Pli-AMvi_007-Ex1-4A-lcwgs-1-1.clmp.fp2_repr.R2	0.7%	39%	68 bp	0.1
Pli-AMvi_007-Ex1-4A-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	41%	75 bp	0.0
Pli-AMvi_007-Ex1-4A-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	41%	74 bp	0.0
Pli-AMvi_008-Ex1-1B-lcwgs-1-1.clmp.fp2_repr.R1	0.9%	40%	69 bp	0.2
Pli-AMvi_008-Ex1-1B-lcwgs-1-1.clmp.fp2_repr.R2	0.8%	40%	69 bp	0.2
Pli-AMvi_008-Ex1-1B-lcwgs-2-1.clmp.fp2_repr.R1	1.0%	44%	78 bp	0.0
Pli-AMvi_008-Ex1-1B-lcwgs-2-1.clmp.fp2_repr.R2	0.8%	44%	78 bp	0.0
Pli-AMvi_009-Ex1-2B-lcwgs-1-1.clmp.fp2_repr.R1	0.2%	43%	74 bp	0.0
Pli-AMvi_009-Ex1-2B-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	42%	72 bp	0.0
Pli-AMvi_009-Ex1-2B-lcwgs-2-1.clmp.fp2_repr.R1	0.5%	44%	87 bp	0.0
Pli-AMvi_009-Ex1-2B-lcwgs-2-1.clmp.fp2_repr.R2	0.3%	44%	85 bp	0.0
Pli-AMvi_010-Ex1-7A-lcwgs-1-1.clmp.fp2_repr.R1	0.6%	37%	67 bp	0.0
Pli-AMvi_010-Ex1-7A-lcwgs-1-1.clmp.fp2_repr.R2	0.6%	37%	67 bp	0.0
Pli-AMvi_010-Ex1-7A-lcwgs-2-1.clmp.fp2_repr.R1	1.1%	42%	79 bp	0.8
Pli-AMvi_010-Ex1-7A-lcwgs-2-1.clmp.fp2_repr.R2	0.9%	42%	78 bp	0.8
Pli-AMvi_011-Ex1-8A-lcwgs-1-1.clmp.fp2_repr.R1	0.7%	39%	68 bp	0.3
Pli-AMvi_011-Ex1-8A-lcwgs-1-1.clmp.fp2_repr.R2	0.6%	39%	68 bp	0.3
Pli-AMvi_011-Ex1-8A-lcwgs-2-1.clmp.fp2_repr.R1	2.0%	44%	88 bp	0.9
Pli-AMvi_011-Ex1-8A-lcwgs-2-1.clmp.fp2_repr.R2	1.5%	44%	86 bp	0.9
Pli-AMvi_012-Ex1-9A-lcwgs-1-1.clmp.fp2_repr.R1	0.9%	39%	70 bp	0.2
Pli-AMvi_012-Ex1-9A-lcwgs-1-1.clmp.fp2_repr.R2	0.8%	39%	70 bp	0.2
Pli-AMvi_012-Ex1-9A-lcwgs-2-1.clmp.fp2_repr.R1	1.8%	43%	85 bp	0.4
Pli-AMvi_012-Ex1-9A-lcwgs-2-1.clmp.fp2_repr.R2	1.5%	42%	83 bp	0.4
Pli-AMvi_013-Ex1-10A-lcwgs-1-1.clmp.fp2_repr.R1	0.8%	38%	72 bp	0.2
Pli-AMvi_013-Ex1-10A-lcwgs-1-1.clmp.fp2_repr.R2	0.7%	38%	72 bp	0.2
Pli-AMvi_013-Ex1-10A-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	42%	80 bp	0.0
Pli-AMvi_013-Ex1-10A-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	42%	79 bp	0.0
Pli-AMvi_014-Ex1-11A-lcwgs-1-1.clmp.fp2_repr.R1	1.9%	43%	72 bp	0.1
Pli-AMvi_014-Ex1-11A-lcwgs-1-1.clmp.fp2_repr.R2	1.5%	43%	71 bp	0.1
Pli-AMvi_014-Ex1-11A-lcwgs-2-1.clmp.fp2_repr.R1	1.1%	46%	59 bp	0.0
Pli-AMvi_014-Ex1-11A-lcwgs-2-1.clmp.fp2_repr.R2	1.1%	46%	59 bp	0.0
Pli-AMvi_015-Ex1-12A-lcwgs-1-1.clmp.fp2_repr.R1	0.7%	43%	107 bp	0.0
Pli-AMvi_015-Ex1-12A-lcwgs-1-1.clmp.fp2_repr.R2	0.7%	43%	102 bp	0.0
Pli-AMvi_015-Ex1-12A-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	48%	96 bp	0.0
Pli-AMvi_015-Ex1-12A-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	47%	92 bp	0.0
Pli-AMvi_016-Ex1-3B-lcwgs-1-1.clmp.fp2_repr.R1	0.6%	40%	62 bp	0.0
Pli-AMvi_016-Ex1-3B-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	40%	62 bp	0.0
Pli-AMvi_016-Ex1-3B-lcwgs-2-1.clmp.fp2_repr.R1	0.6%	41%	68 bp	0.1
Pli-AMvi_016-Ex1-3B-lcwgs-2-1.clmp.fp2_repr.R2	0.5%	41%	67 bp	0.1
Pli-AMvi_017-Ex1-4B-lcwgs-1-1.clmp.fp2_repr.R1	0.6%	40%	64 bp	0.1
Pli-AMvi_017-Ex1-4B-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	40%	64 bp	0.1
Pli-AMvi_017-Ex1-4B-lcwgs-2-1.clmp.fp2_repr.R1	0.4%	43%	81 bp	0.0
Pli-AMvi_017-Ex1-4B-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	44%	80 bp	0.0
Pli-AMvi_018-Ex1-1C-lcwgs-1-1.clmp.fp2_repr.R1	0.6%	42%	62 bp	0.0
Pli-AMvi_018-Ex1-1C-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	42%	62 bp	0.0
Pli-AMvi_018-Ex1-1C-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	46%	90 bp	0.0
Pli-AMvi_018-Ex1-1C-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	46%	87 bp	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-1-1.clmp.fp2_repr.R1	0.3%	42%	59 bp	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-1-1.clmp.fp2_repr.R2	0.2%	42%	59 bp	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	43%	77 bp	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-2-1.clmp.fp2_repr.R2	0.2%	43%	74 bp	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-1-1.clmp.fp2_repr.R1	0.2%	43%	62 bp	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-1-1.clmp.fp2_repr.R2	0.2%	43%	62 bp	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	43%	70 bp	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	42%	70 bp	0.0
Pli-AMvi_021-Ex1-4C-lcwgs-1-1.clmp.fp2_repr.R1	0.5%	40%	61 bp	0.1
Pli-AMvi_021-Ex1-4C-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	40%	61 bp	0.1
Pli-AMvi_021-Ex1-4C-lcwgs-2-1.clmp.fp2_repr.R1	0.7%	42%	59 bp	0.2
Pli-AMvi_021-Ex1-4C-lcwgs-2-1.clmp.fp2_repr.R2	0.6%	42%	59 bp	0.2
Pli-AMvi_022-Ex1-7B-lcwgs-1-1.clmp.fp2_repr.R1	0.9%	38%	75 bp	0.0
Pli-AMvi_022-Ex1-7B-lcwgs-1-1.clmp.fp2_repr.R2	0.8%	38%	75 bp	0.0
Pli-AMvi_022-Ex1-7B-lcwgs-2-1.clmp.fp2_repr.R1	4.1%	46%	117 bp	1.2
Pli-AMvi_022-Ex1-7B-lcwgs-2-1.clmp.fp2_repr.R2	3.1%	46%	112 bp	1.2
Pli-AMvi_023-Ex1-8B-lcwgs-1-1.clmp.fp2_repr.R1	1.3%	38%	67 bp	0.2
Pli-AMvi_023-Ex1-8B-lcwgs-1-1.clmp.fp2_repr.R2	1.1%	38%	67 bp	0.2
Pli-AMvi_023-Ex1-8B-lcwgs-2-1.clmp.fp2_repr.R1	1.2%	43%	80 bp	0.3
Pli-AMvi_023-Ex1-8B-lcwgs-2-1.clmp.fp2_repr.R2	0.9%	43%	79 bp	0.3
Pli-AMvi_024-Ex1-9B-lcwgs-1-1.clmp.fp2_repr.R1	0.7%	38%	66 bp	0.3
Pli-AMvi_024-Ex1-9B-lcwgs-1-1.clmp.fp2_repr.R2	0.6%	38%	66 bp	0.3
Pli-AMvi_024-Ex1-9B-lcwgs-2-1.clmp.fp2_repr.R1	6.0%	47%	104 bp	0.6
Pli-AMvi_024-Ex1-9B-lcwgs-2-1.clmp.fp2_repr.R2	4.3%	47%	99 bp	0.6
Pli-AMvi_025-Ex1-10B-lcwgs-1-1.clmp.fp2_repr.R1	0.8%	39%	66 bp	0.1
Pli-AMvi_025-Ex1-10B-lcwgs-1-1.clmp.fp2_repr.R2	0.6%	39%	66 bp	0.1
Pli-AMvi_025-Ex1-10B-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	42%	90 bp	0.0
Pli-AMvi_025-Ex1-10B-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	42%	89 bp	0.0
Pli-AMvi_026-Ex1-11B-lcwgs-1-1.clmp.fp2_repr.R1	0.6%	40%	65 bp	1.9
Pli-AMvi_026-Ex1-11B-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	40%	65 bp	1.9
Pli-AMvi_026-Ex1-11B-lcwgs-2-1.clmp.fp2_repr.R1	0.2%	43%	52 bp	0.0
Pli-AMvi_026-Ex1-11B-lcwgs-2-1.clmp.fp2_repr.R2	0.1%	43%	52 bp	0.0
Pli-AMvi_027-Ex1-12B-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	43%	119 bp	0.0
Pli-AMvi_027-Ex1-12B-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	42%	113 bp	0.0
Pli-AMvi_027-Ex1-12B-lcwgs-2-1.clmp.fp2_repr.R1	0.1%	45%	89 bp	0.0
Pli-AMvi_027-Ex1-12B-lcwgs-2-1.clmp.fp2_repr.R2	0.3%	45%	87 bp	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-1-1.clmp.fp2_repr.R1	0.2%	44%	68 bp	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	44%	67 bp	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-2-1.clmp.fp2_repr.R1	0.2%	47%	90 bp	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	47%	87 bp	0.0
Pli-AMvi_029-Ex1-2D-lcwgs-1-1.clmp.fp2_repr.R1	0.6%	40%	66 bp	0.5
Pli-AMvi_029-Ex1-2D-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	40%	66 bp	0.5
Pli-AMvi_029-Ex1-2D-lcwgs-2-1.clmp.fp2_repr.R1	0.6%	42%	64 bp	0.0
Pli-AMvi_029-Ex1-2D-lcwgs-2-1.clmp.fp2_repr.R2	0.5%	42%	64 bp	0.0
Pli-AMvi_030-Ex1-3D-lcwgs-1-1.clmp.fp2_repr.R1	0.6%	42%	61 bp	0.1
Pli-AMvi_030-Ex1-3D-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	42%	60 bp	0.1
Pli-AMvi_030-Ex1-3D-lcwgs-2-1.clmp.fp2_repr.R1	0.5%	43%	57 bp	0.0
Pli-AMvi_030-Ex1-3D-lcwgs-2-1.clmp.fp2_repr.R2	0.4%	43%	57 bp	0.0
Pli-AMvi_031-Ex1-4D-lcwgs-1-1.clmp.fp2_repr.R1	0.2%	43%	72 bp	0.0
Pli-AMvi_031-Ex1-4D-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	43%	70 bp	0.0
Pli-AMvi_031-Ex1-4D-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	43%	75 bp	0.0
Pli-AMvi_031-Ex1-4D-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	43%	71 bp	0.0
Pli-AMvi_032-Ex1-5C-lcwgs-1-1.clmp.fp2_repr.R1	1.3%	40%	66 bp	0.2
Pli-AMvi_032-Ex1-5C-lcwgs-1-1.clmp.fp2_repr.R2	1.1%	40%	66 bp	0.2
Pli-AMvi_032-Ex1-5C-lcwgs-2-1.clmp.fp2_repr.R1	0.6%	41%	67 bp	0.5
Pli-AMvi_032-Ex1-5C-lcwgs-2-1.clmp.fp2_repr.R2	0.5%	41%	67 bp	0.5
Pli-AMvi_033-Ex1-6C-lcwgs-1-1.clmp.fp2_repr.R1	0.4%	42%	62 bp	0.0
Pli-AMvi_033-Ex1-6C-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	42%	61 bp	0.0
Pli-AMvi_033-Ex1-6C-lcwgs-2-1.clmp.fp2_repr.R1	0.6%	43%	66 bp	0.9
Pli-AMvi_033-Ex1-6C-lcwgs-2-1.clmp.fp2_repr.R2	0.5%	43%	66 bp	0.9
Pli-AMvi_034-Ex1-7C-lcwgs-1-1.clmp.fp2_repr.R1	0.2%	43%	79 bp	0.0
Pli-AMvi_034-Ex1-7C-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	43%	77 bp	0.0
Pli-AMvi_034-Ex1-7C-lcwgs-2-1.clmp.fp2_repr.R1	0.1%	44%	60 bp	0.0
Pli-AMvi_034-Ex1-7C-lcwgs-2-1.clmp.fp2_repr.R2	0.1%	44%	60 bp	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-1-1.clmp.fp2_repr.R1	0.4%	41%	59 bp	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	41%	59 bp	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-2-1.clmp.fp2_repr.R1	0.2%	43%	68 bp	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-2-1.clmp.fp2_repr.R2	0.2%	43%	67 bp	0.0
Pli-AMvi_036-Ex1-9C-lcwgs-1-1.clmp.fp2_repr.R1	2.0%	40%	72 bp	0.1
Pli-AMvi_036-Ex1-9C-lcwgs-1-1.clmp.fp2_repr.R2	1.6%	40%	71 bp	0.1
Pli-AMvi_036-Ex1-9C-lcwgs-2-1.clmp.fp2_repr.R1	5.6%	47%	101 bp	1.1
Pli-AMvi_036-Ex1-9C-lcwgs-2-1.clmp.fp2_repr.R2	4.1%	47%	97 bp	1.1
Pli-AMvi_037-Ex1-10C-lcwgs-1-1.clmp.fp2_repr.R1	0.7%	38%	67 bp	0.7
Pli-AMvi_037-Ex1-10C-lcwgs-1-1.clmp.fp2_repr.R2	0.6%	38%	66 bp	0.7
Pli-AMvi_037-Ex1-10C-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	40%	82 bp	0.0
Pli-AMvi_037-Ex1-10C-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	40%	81 bp	0.0
Pli-AMvi_038-Ex1-11C-lcwgs-1-1.clmp.fp2_repr.R1	0.7%	42%	67 bp	0.3
Pli-AMvi_038-Ex1-11C-lcwgs-1-1.clmp.fp2_repr.R2	0.6%	42%	67 bp	0.3
Pli-AMvi_038-Ex1-11C-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	42%	88 bp	0.0
Pli-AMvi_038-Ex1-11C-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	42%	87 bp	0.0
Pli-AMvi_039-Ex1-12C-lcwgs-1-1.clmp.fp2_repr.R1	0.9%	43%	118 bp	0.0
Pli-AMvi_039-Ex1-12C-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	42%	112 bp	0.0
Pli-AMvi_039-Ex1-12C-lcwgs-2-1.clmp.fp2_repr.R1	20.3%	52%	143 bp	0.2
Pli-AMvi_039-Ex1-12C-lcwgs-2-1.clmp.fp2_repr.R2	13.8%	52%	133 bp	0.2
Pli-AMvi_040-Ex1-5A-lcwgs-1-1.clmp.fp2_repr.R1	0.7%	41%	68 bp	0.1
Pli-AMvi_040-Ex1-5A-lcwgs-1-1.clmp.fp2_repr.R2	0.6%	41%	68 bp	0.1
Pli-AMvi_040-Ex1-5A-lcwgs-2-1.clmp.fp2_repr.R1	1.5%	43%	85 bp	1.1
Pli-AMvi_040-Ex1-5A-lcwgs-2-1.clmp.fp2_repr.R2	1.2%	43%	84 bp	1.1
Pli-AMvi_041-Ex1-6A-lcwgs-1-1.clmp.fp2_repr.R1	1.5%	37%	72 bp	0.2
Pli-AMvi_041-Ex1-6A-lcwgs-1-1.clmp.fp2_repr.R2	1.3%	37%	72 bp	0.2
Pli-AMvi_041-Ex1-6A-lcwgs-2-1.clmp.fp2_repr.R1	1.1%	41%	78 bp	1.6
Pli-AMvi_041-Ex1-6A-lcwgs-2-1.clmp.fp2_repr.R2	0.9%	41%	78 bp	1.6
Pli-AMvi_042-Ex1-5B-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	42%	81 bp	0.0
Pli-AMvi_042-Ex1-5B-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	42%	80 bp	0.0
Pli-AMvi_042-Ex1-5B-lcwgs-2-1.clmp.fp2_repr.R1	0.3%	43%	79 bp	0.0
Pli-AMvi_042-Ex1-5B-lcwgs-2-1.clmp.fp2_repr.R2	0.1%	43%	77 bp	0.0
Pli-AMvi_043-Ex1-6B-lcwgs-1-1.clmp.fp2_repr.R1	0.9%	40%	67 bp	0.1
Pli-AMvi_043-Ex1-6B-lcwgs-1-1.clmp.fp2_repr.R2	0.7%	40%	67 bp	0.1
Pli-AMvi_043-Ex1-6B-lcwgs-2-1.clmp.fp2_repr.R1	1.7%	46%	85 bp	0.9
Pli-AMvi_043-Ex1-6B-lcwgs-2-1.clmp.fp2_repr.R2	1.4%	45%	83 bp	0.9
Pli-AMvi_044-Ex1-5D-lcwgs-1-1.clmp.fp2_repr.R1	0.2%	42%	84 bp	0.0
Pli-AMvi_044-Ex1-5D-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	42%	82 bp	0.0
Pli-AMvi_044-Ex1-5D-lcwgs-2-1.clmp.fp2_repr.R1	0.5%	43%	58 bp	0.1
Pli-AMvi_044-Ex1-5D-lcwgs-2-1.clmp.fp2_repr.R2	0.4%	43%	58 bp	0.1
Pli-AMvi_045-Ex1-6D-lcwgs-1-1.clmp.fp2_repr.R1	0.4%	44%	59 bp	0.0
Pli-AMvi_045-Ex1-6D-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	44%	59 bp	0.0
Pli-AMvi_045-Ex1-6D-lcwgs-2-1.clmp.fp2_repr.R1	0.5%	46%	54 bp	0.0
Pli-AMvi_045-Ex1-6D-lcwgs-2-1.clmp.fp2_repr.R2	0.5%	46%	54 bp	0.0
Pli-AMvi_046-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	43%	86 bp	0.0
Pli-AMvi_046-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	43%	84 bp	0.0
Pli-AMvi_046-Ex1-1E-lcwgs-2-1.clmp.fp2_repr.R1	1.0%	43%	84 bp	0.3
Pli-AMvi_046-Ex1-1E-lcwgs-2-1.clmp.fp2_repr.R2	0.8%	43%	83 bp	0.3
Pli-AMvi_047-Ex1-2E-lcwgs-1-1.clmp.fp2_repr.R1	0.7%	40%	67 bp	0.1
Pli-AMvi_047-Ex1-2E-lcwgs-1-1.clmp.fp2_repr.R2	0.6%	40%	67 bp	0.1
Pli-AMvi_047-Ex1-2E-lcwgs-2-1.clmp.fp2_repr.R1	0.6%	45%	51 bp	0.0
Pli-AMvi_047-Ex1-2E-lcwgs-2-1.clmp.fp2_repr.R2	0.4%	45%	51 bp	0.0
Pli-AMvi_048-Ex1-3E-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	41%	73 bp	0.0
Pli-AMvi_048-Ex1-3E-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	41%	71 bp	0.0
Pli-AMvi_048-Ex1-3E-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	37%	78 bp	0.0
Pli-AMvi_048-Ex1-3E-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	37%	77 bp	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	42%	81 bp	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	43%	79 bp	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	39%	80 bp	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	39%	80 bp	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	41%	81 bp	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	41%	80 bp	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	42%	79 bp	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	42%	79 bp	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-1-1.clmp.fp2_repr.R1	0.4%	43%	69 bp	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	43%	69 bp	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-2-1.clmp.fp2_repr.R1	0.4%	48%	51 bp	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-2-1.clmp.fp2_repr.R2	0.4%	48%	51 bp	0.0
Pli-AMvi_052-Ex1-7D-lcwgs-1-1.clmp.fp2_repr.R1	0.6%	42%	65 bp	0.3
Pli-AMvi_052-Ex1-7D-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	42%	65 bp	0.3
Pli-AMvi_052-Ex1-7D-lcwgs-2-1.clmp.fp2_repr.R1	0.4%	47%	58 bp	0.0
Pli-AMvi_052-Ex1-7D-lcwgs-2-1.clmp.fp2_repr.R2	0.2%	47%	57 bp	0.0
Pli-AMvi_053-Ex1-8D-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	41%	78 bp	0.0
Pli-AMvi_053-Ex1-8D-lcwgs-1-1.clmp.fp2_repr.R2	0.2%	41%	76 bp	0.0
Pli-AMvi_053-Ex1-8D-lcwgs-2-1.clmp.fp2_repr.R1	0.5%	40%	80 bp	0.0
Pli-AMvi_053-Ex1-8D-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	40%	80 bp	0.0
Pli-AMvi_054-Ex1-9D-lcwgs-1-1.clmp.fp2_repr.R1	0.4%	43%	53 bp	0.0
Pli-AMvi_054-Ex1-9D-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	43%	53 bp	0.0
Pli-AMvi_054-Ex1-9D-lcwgs-2-1.clmp.fp2_repr.R1	0.4%	44%	83 bp	0.0
Pli-AMvi_054-Ex1-9D-lcwgs-2-1.clmp.fp2_repr.R2	0.4%	43%	82 bp	0.0
Pli-AMvi_055-Ex1-10D-lcwgs-1-1.clmp.fp2_repr.R1	0.5%	41%	60 bp	0.1
Pli-AMvi_055-Ex1-10D-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	41%	59 bp	0.1
Pli-AMvi_055-Ex1-10D-lcwgs-2-1.clmp.fp2_repr.R1	1.0%	43%	85 bp	0.0
Pli-AMvi_055-Ex1-10D-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	43%	85 bp	0.0
Pli-AMvi_056-Ex1-11D-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	41%	78 bp	0.0
Pli-AMvi_056-Ex1-11D-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	41%	76 bp	0.0
Pli-AMvi_056-Ex1-11D-lcwgs-2-1.clmp.fp2_repr.R1	7.5%	45%	104 bp	0.0
Pli-AMvi_056-Ex1-11D-lcwgs-2-1.clmp.fp2_repr.R2	2.5%	43%	96 bp	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-1-1.clmp.fp2_repr.R1	0.5%	42%	121 bp	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	42%	116 bp	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-2-1.clmp.fp2_repr.R1	0.2%	46%	95 bp	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-2-1.clmp.fp2_repr.R2	0.2%	46%	91 bp	0.0
Pli-AMvi_058-Ex1-1F-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	43%	88 bp	0.0
Pli-AMvi_058-Ex1-1F-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	43%	86 bp	0.0
Pli-AMvi_058-Ex1-1F-lcwgs-2-1.clmp.fp2_repr.R1	12.5%	52%	142 bp	0.5
Pli-AMvi_058-Ex1-1F-lcwgs-2-1.clmp.fp2_repr.R2	8.3%	52%	132 bp	0.5
Pli-AMvi_059-Ex1-2F-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	42%	77 bp	0.0
Pli-AMvi_059-Ex1-2F-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	42%	75 bp	0.0
Pli-AMvi_059-Ex1-2F-lcwgs-2-1.clmp.fp2_repr.R1	1.1%	48%	121 bp	0.0
Pli-AMvi_059-Ex1-2F-lcwgs-2-1.clmp.fp2_repr.R2	1.1%	49%	117 bp	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	41%	72 bp	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	41%	71 bp	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	43%	86 bp	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	44%	84 bp	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	43%	80 bp	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	43%	79 bp	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	46%	96 bp	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	46%	89 bp	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	42%	82 bp	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	42%	81 bp	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-2-1.clmp.fp2_repr.R1	0.5%	45%	85 bp	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-2-1.clmp.fp2_repr.R2	0.5%	45%	83 bp	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-1-1.clmp.fp2_repr.R1	0.4%	44%	55 bp	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	44%	55 bp	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-2-1.clmp.fp2_repr.R1	0.3%	43%	82 bp	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-2-1.clmp.fp2_repr.R2	0.5%	43%	80 bp	0.0
Pli-AMvi_064-Ex1-7E-lcwgs-1-1.clmp.fp2_repr.R1	0.7%	41%	67 bp	0.1
Pli-AMvi_064-Ex1-7E-lcwgs-1-1.clmp.fp2_repr.R2	0.6%	41%	67 bp	0.1
Pli-AMvi_064-Ex1-7E-lcwgs-2-1.clmp.fp2_repr.R1	0.1%	46%	60 bp	0.0
Pli-AMvi_064-Ex1-7E-lcwgs-2-1.clmp.fp2_repr.R2	0.1%	46%	59 bp	0.0
Pli-AMvi_065-Ex1-8E-lcwgs-1-1.clmp.fp2_repr.R1	0.6%	38%	65 bp	0.1
Pli-AMvi_065-Ex1-8E-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	38%	65 bp	0.1
Pli-AMvi_065-Ex1-8E-lcwgs-2-1.clmp.fp2_repr.R1	0.4%	45%	49 bp	0.0
Pli-AMvi_065-Ex1-8E-lcwgs-2-1.clmp.fp2_repr.R2	0.3%	45%	49 bp	0.0
Pli-AMvi_066-Ex1-9E-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	41%	81 bp	0.0
Pli-AMvi_066-Ex1-9E-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	41%	80 bp	0.0
Pli-AMvi_066-Ex1-9E-lcwgs-2-1.clmp.fp2_repr.R1	1.5%	44%	89 bp	0.0
Pli-AMvi_066-Ex1-9E-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	44%	86 bp	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-1-1.clmp.fp2_repr.R1	0.6%	42%	66 bp	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	42%	66 bp	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-2-1.clmp.fp2_repr.R1	5.3%	35%	107 bp	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-2-1.clmp.fp2_repr.R2	5.3%	35%	105 bp	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R1	0.2%	43%	90 bp	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R2	0.2%	43%	87 bp	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	47%	102 bp	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-2-1.clmp.fp2_repr.R2	1.1%	47%	99 bp	0.0
Pli-AMvi_069-Ex1-12E-lcwgs-1-1.clmp.fp2_repr.R1	0.8%	43%	130 bp	0.0
Pli-AMvi_069-Ex1-12E-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	43%	122 bp	0.0
Pli-AMvi_069-Ex1-12E-lcwgs-2-1.clmp.fp2_repr.R1	8.3%	55%	144 bp	0.3
Pli-AMvi_069-Ex1-12E-lcwgs-2-1.clmp.fp2_repr.R2	5.5%	55%	135 bp	0.3
Pli-AMvi_070-Ex1-1G-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	43%	87 bp	0.0
Pli-AMvi_070-Ex1-1G-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	43%	85 bp	0.0
Pli-AMvi_070-Ex1-1G-lcwgs-2-1.clmp.fp2_repr.R1	14.6%	52%	142 bp	0.7
Pli-AMvi_070-Ex1-1G-lcwgs-2-1.clmp.fp2_repr.R2	9.7%	52%	132 bp	0.7
Pli-AMvi_071-Ex1-2G-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	42%	77 bp	0.0
Pli-AMvi_071-Ex1-2G-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	43%	75 bp	0.0
Pli-AMvi_071-Ex1-2G-lcwgs-2-1.clmp.fp2_repr.R1	16.7%	51%	143 bp	0.7
Pli-AMvi_071-Ex1-2G-lcwgs-2-1.clmp.fp2_repr.R2	11.0%	51%	133 bp	0.7
Pli-AMvi_072-Ex1-3G-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	41%	73 bp	0.0
Pli-AMvi_072-Ex1-3G-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	41%	71 bp	0.0
Pli-AMvi_072-Ex1-3G-lcwgs-2-1.clmp.fp2_repr.R1	0.5%	44%	87 bp	0.0
Pli-AMvi_072-Ex1-3G-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	43%	84 bp	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	43%	81 bp	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	43%	79 bp	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-2-1.clmp.fp2_repr.R1	0.3%	44%	53 bp	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-2-1.clmp.fp2_repr.R2	0.3%	44%	53 bp	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	42%	80 bp	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	41%	79 bp	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-2-1.clmp.fp2_repr.R1	0.1%	43%	82 bp	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-2-1.clmp.fp2_repr.R2	0.1%	43%	81 bp	0.0
Pli-AMvi_075-Ex1-6G-lcwgs-1-1.clmp.fp2_repr.R1	0.2%	41%	98 bp	0.0
Pli-AMvi_075-Ex1-6G-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	41%	95 bp	0.0
Pli-AMvi_075-Ex1-6G-lcwgs-2-1.clmp.fp2_repr.R1	2.6%	46%	91 bp	0.3
Pli-AMvi_075-Ex1-6G-lcwgs-2-1.clmp.fp2_repr.R2	1.9%	45%	88 bp	0.3
Pli-AMvi_076-Ex1-7F-lcwgs-1-1.clmp.fp2_repr.R1	0.4%	45%	53 bp	0.0
Pli-AMvi_076-Ex1-7F-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	45%	53 bp	0.0
Pli-AMvi_076-Ex1-7F-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	45%	97 bp	0.0
Pli-AMvi_076-Ex1-7F-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	45%	93 bp	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	42%	67 bp	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-1-1.clmp.fp2_repr.R2	0.2%	42%	66 bp	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-2-1.clmp.fp2_repr.R1	0.7%	45%	88 bp	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-2-1.clmp.fp2_repr.R2	0.7%	45%	86 bp	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	41%	80 bp	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	41%	78 bp	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	46%	97 bp	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-2-1.clmp.fp2_repr.R2	0.5%	46%	93 bp	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-1-1.clmp.fp2_repr.R1	0.2%	40%	81 bp	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	40%	79 bp	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-2-1.clmp.fp2_repr.R1	0.7%	50%	139 bp	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-2-1.clmp.fp2_repr.R2	1.4%	50%	132 bp	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	41%	77 bp	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	41%	75 bp	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	36%	82 bp	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	36%	81 bp	0.0
Pli-AMvi_081-Ex1-12F-lcwgs-1-1.clmp.fp2_repr.R1	1.2%	41%	135 bp	0.0
Pli-AMvi_081-Ex1-12F-lcwgs-1-1.clmp.fp2_repr.R2	1.6%	42%	131 bp	0.0
Pli-AMvi_081-Ex1-12F-lcwgs-2-1.clmp.fp2_repr.R1	12.6%	51%	145 bp	0.1
Pli-AMvi_081-Ex1-12F-lcwgs-2-1.clmp.fp2_repr.R2	7.9%	51%	135 bp	0.1
Pli-AMvi_082-Ex1-1H-lcwgs-1-1.clmp.fp2_repr.R1	0.6%	43%	64 bp	1.6
Pli-AMvi_082-Ex1-1H-lcwgs-1-1.clmp.fp2_repr.R2	0.6%	43%	64 bp	1.6
Pli-AMvi_082-Ex1-1H-lcwgs-2-1.clmp.fp2_repr.R1	6.4%	50%	116 bp	0.1
Pli-AMvi_082-Ex1-1H-lcwgs-2-1.clmp.fp2_repr.R2	4.1%	50%	110 bp	0.1
Pli-AMvi_083-Ex1-2H-lcwgs-1-1.clmp.fp2_repr.R1	0.5%	40%	60 bp	2.0
Pli-AMvi_083-Ex1-2H-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	40%	59 bp	2.0
Pli-AMvi_083-Ex1-2H-lcwgs-2-1.clmp.fp2_repr.R1	0.7%	41%	64 bp	0.1
Pli-AMvi_083-Ex1-2H-lcwgs-2-1.clmp.fp2_repr.R2	0.6%	41%	64 bp	0.1
Pli-AMvi_084-Ex1-3H-lcwgs-1-1.clmp.fp2_repr.R1	0.6%	43%	63 bp	0.8
Pli-AMvi_084-Ex1-3H-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	43%	63 bp	0.8
Pli-AMvi_084-Ex1-3H-lcwgs-2-1.clmp.fp2_repr.R1	2.1%	45%	92 bp	0.3
Pli-AMvi_084-Ex1-3H-lcwgs-2-1.clmp.fp2_repr.R2	1.6%	45%	90 bp	0.3
Pli-AMvi_085-Ex1-4H-lcwgs-1-1.clmp.fp2_repr.R1	0.4%	41%	57 bp	0.3
Pli-AMvi_085-Ex1-4H-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	41%	57 bp	0.3
Pli-AMvi_085-Ex1-4H-lcwgs-2-1.clmp.fp2_repr.R1	0.5%	42%	62 bp	0.1
Pli-AMvi_085-Ex1-4H-lcwgs-2-1.clmp.fp2_repr.R2	0.5%	42%	62 bp	0.1
Pli-AMvi_086-Ex1-5H-lcwgs-1-1.clmp.fp2_repr.R1	0.4%	45%	47 bp	0.0
Pli-AMvi_086-Ex1-5H-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	45%	47 bp	0.0
Pli-AMvi_086-Ex1-5H-lcwgs-2-1.clmp.fp2_repr.R1	0.7%	41%	69 bp	0.9
Pli-AMvi_086-Ex1-5H-lcwgs-2-1.clmp.fp2_repr.R2	0.6%	41%	69 bp	0.9
Pli-AMvi_087-Ex1-6H-lcwgs-1-1.clmp.fp2_repr.R1	0.6%	47%	56 bp	0.1
Pli-AMvi_087-Ex1-6H-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	47%	56 bp	0.1
Pli-AMvi_087-Ex1-6H-lcwgs-2-1.clmp.fp2_repr.R1	1.5%	47%	87 bp	0.5
Pli-AMvi_087-Ex1-6H-lcwgs-2-1.clmp.fp2_repr.R2	1.2%	47%	85 bp	0.5
Pli-AMvi_088-Ex1-7G-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	43%	79 bp	0.0
Pli-AMvi_088-Ex1-7G-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	43%	78 bp	0.0
Pli-AMvi_088-Ex1-7G-lcwgs-2-1.clmp.fp2_repr.R1	1.3%	44%	81 bp	0.5
Pli-AMvi_088-Ex1-7G-lcwgs-2-1.clmp.fp2_repr.R2	1.1%	44%	80 bp	0.5
Pli-AMvi_089-Ex1-8G-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	41%	80 bp	0.0
Pli-AMvi_089-Ex1-8G-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	41%	79 bp	0.0
Pli-AMvi_089-Ex1-8G-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	44%	85 bp	0.0
Pli-AMvi_089-Ex1-8G-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	44%	82 bp	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	41%	80 bp	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	41%	78 bp	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-2-1.clmp.fp2_repr.R1	0.5%	45%	92 bp	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-2-1.clmp.fp2_repr.R2	0.5%	44%	90 bp	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	40%	82 bp	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	40%	80 bp	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-2-1.clmp.fp2_repr.R1	2.4%	51%	140 bp	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-2-1.clmp.fp2_repr.R2	1.6%	50%	132 bp	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	41%	76 bp	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	41%	75 bp	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	43%	111 bp	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	45%	107 bp	0.0
Pli-AMvi_093-Ex1-12G-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	42%	131 bp	0.0
Pli-AMvi_093-Ex1-12G-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	43%	123 bp	0.0
Pli-AMvi_093-Ex1-12G-lcwgs-2-1.clmp.fp2_repr.R1	17.8%	51%	145 bp	0.2
Pli-AMvi_093-Ex1-12G-lcwgs-2-1.clmp.fp2_repr.R2	11.2%	52%	134 bp	0.2
Pli-AMvi_094-Ex1-7H-lcwgs-1-1.clmp.fp2_repr.R1	0.4%	42%	58 bp	0.2
Pli-AMvi_094-Ex1-7H-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	42%	58 bp	0.2
Pli-AMvi_094-Ex1-7H-lcwgs-2-1.clmp.fp2_repr.R1	0.5%	43%	62 bp	0.2
Pli-AMvi_094-Ex1-7H-lcwgs-2-1.clmp.fp2_repr.R2	0.5%	43%	62 bp	0.2
Pli-AMvi_095-Ex1-8H-lcwgs-1-1.clmp.fp2_repr.R1	0.7%	47%	50 bp	0.2
Pli-AMvi_095-Ex1-8H-lcwgs-1-1.clmp.fp2_repr.R2	0.6%	47%	50 bp	0.2
Pli-AMvi_095-Ex1-8H-lcwgs-2-1.clmp.fp2_repr.R1	0.6%	45%	62 bp	0.0
Pli-AMvi_095-Ex1-8H-lcwgs-2-1.clmp.fp2_repr.R2	0.5%	45%	62 bp	0.0
Pli-AMvi_096-Ex1-9H-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	42%	67 bp	0.0
Pli-AMvi_096-Ex1-9H-lcwgs-1-1.clmp.fp2_repr.R2	0.2%	42%	65 bp	0.0
Pli-AMvi_096-Ex1-9H-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	44%	95 bp	0.0
Pli-AMvi_096-Ex1-9H-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	43%	90 bp	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	41%	72 bp	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	41%	71 bp	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-2-1.clmp.fp2_repr.R1	2.9%	39%	69 bp	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-2-1.clmp.fp2_repr.R2	2.9%	38%	68 bp	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-1-1.clmp.fp2_repr.R1	0.1%	41%	76 bp	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	41%	74 bp	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-2-1.clmp.fp2_repr.R1	0.0%	44%	108 bp	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-2-1.clmp.fp2_repr.R2	0.0%	44%	104 bp	0.0
Pli-AMvi_099-Ex1-12H-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	41%	132 bp	0.0
Pli-AMvi_099-Ex1-12H-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	41%	128 bp	0.0
Pli-AMvi_099-Ex1-12H-lcwgs-2-1.clmp.fp2_repr.R1	21.8%	50%	143 bp	0.5
Pli-AMvi_099-Ex1-12H-lcwgs-2-1.clmp.fp2_repr.R2	13.7%	50%	131 bp	0.5
Pli-CMvi_001-Ex1-1B-lcwgs-1-1.clmp.fp2_repr.R1	6.8%	42%	141 bp	3.5
Pli-CMvi_001-Ex1-1B-lcwgs-1-1.clmp.fp2_repr.R2	6.4%	42%	134 bp	3.5
Pli-CMvi_002-Ex1-2A-lcwgs-1-1.clmp.fp2_repr.R1	3.9%	42%	137 bp	0.9
Pli-CMvi_002-Ex1-2A-lcwgs-1-1.clmp.fp2_repr.R2	3.5%	42%	131 bp	0.9
Pli-CMvi_003-Ex1-2G-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	42%	132 bp	0.5
Pli-CMvi_003-Ex1-2G-lcwgs-1-1.clmp.fp2_repr.R2	2.8%	42%	127 bp	0.5
Pli-CMvi_004-Ex1-3F-lcwgs-1-1.clmp.fp2_repr.R1	4.4%	42%	139 bp	0.8
Pli-CMvi_004-Ex1-3F-lcwgs-1-1.clmp.fp2_repr.R2	3.9%	42%	132 bp	0.8
Pli-CMvi_005-Ex1-4C-lcwgs-1-1.clmp.fp2_repr.R1	0.2%	42%	119 bp	0.0
Pli-CMvi_005-Ex1-4C-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	42%	115 bp	0.0
Pli-CMvi_006-Ex1-5A-lcwgs-1-1.clmp.fp2_repr.R1	0.7%	42%	122 bp	0.1
Pli-CMvi_006-Ex1-5A-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	42%	117 bp	0.1
Pli-CMvi_007-Ex1-5G-lcwgs-1-1.clmp.fp2_repr.R1	4.0%	42%	134 bp	0.8
Pli-CMvi_007-Ex1-5G-lcwgs-1-1.clmp.fp2_repr.R2	3.5%	42%	128 bp	0.8
Pli-CMvi_013-Ex1-1C-lcwgs-1-1.clmp.fp2_repr.R1	7.9%	43%	145 bp	2.1
Pli-CMvi_013-Ex1-1C-lcwgs-1-1.clmp.fp2_repr.R2	7.0%	43%	136 bp	2.1
Pli-CMvi_014-Ex1-2B-lcwgs-1-1.clmp.fp2_repr.R1	0.6%	42%	123 bp	0.0
Pli-CMvi_014-Ex1-2B-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	42%	119 bp	0.0
Pli-CMvi_015-Ex1-2H-lcwgs-1-1.clmp.fp2_repr.R1	5.5%	42%	139 bp	1.7
Pli-CMvi_015-Ex1-2H-lcwgs-1-1.clmp.fp2_repr.R2	5.3%	42%	132 bp	1.7
Pli-CMvi_020-Ex1-6D-lcwgs-1-1.clmp.fp2_repr.R1	8.3%	42%	139 bp	3.6
Pli-CMvi_020-Ex1-6D-lcwgs-1-1.clmp.fp2_repr.R2	8.0%	43%	132 bp	3.6
Pli-CMvi_021-Ex1-6G-lcwgs-1-1.clmp.fp2_repr.R1	4.5%	42%	142 bp	0.7
Pli-CMvi_021-Ex1-6G-lcwgs-1-1.clmp.fp2_repr.R2	4.0%	42%	135 bp	0.7
Pli-CMvi_022-Ex1-7B-lcwgs-1-1.clmp.fp2_repr.R1	2.0%	42%	128 bp	0.1
Pli-CMvi_022-Ex1-7B-lcwgs-1-1.clmp.fp2_repr.R2	1.5%	42%	124 bp	0.1
Pli-CMvi_023-Ex1-7F-lcwgs-1-1.clmp.fp2_repr.R1	3.5%	42%	133 bp	1.0
Pli-CMvi_023-Ex1-7F-lcwgs-1-1.clmp.fp2_repr.R2	3.2%	42%	128 bp	1.0
Pli-CMvi_025-Ex1-1D-lcwgs-1-1.clmp.fp2_repr.R1	2.6%	42%	133 bp	0.1
Pli-CMvi_025-Ex1-1D-lcwgs-1-1.clmp.fp2_repr.R2	1.8%	42%	127 bp	0.1
Pli-CMvi_028-Ex1-3G-lcwgs-1-1.clmp.fp2_repr.R1	7.3%	42%	142 bp	2.5
Pli-CMvi_028-Ex1-3G-lcwgs-1-1.clmp.fp2_repr.R2	6.7%	42%	135 bp	2.5
Pli-CMvi_030-Ex1-5B-lcwgs-1-1.clmp.fp2_repr.R1	0.4%	42%	125 bp	0.0
Pli-CMvi_030-Ex1-5B-lcwgs-1-1.clmp.fp2_repr.R2	0.3%	42%	120 bp	0.0
Pli-CMvi_031-Ex1-5H-lcwgs-1-1.clmp.fp2_repr.R1	6.7%	43%	135 bp	2.2
Pli-CMvi_031-Ex1-5H-lcwgs-1-1.clmp.fp2_repr.R2	6.5%	43%	129 bp	2.2
Pli-CMvi_034-Ex1-7C-lcwgs-1-1.clmp.fp2_repr.R1	1.9%	42%	124 bp	0.2
Pli-CMvi_034-Ex1-7C-lcwgs-1-1.clmp.fp2_repr.R2	1.7%	42%	121 bp	0.2
Pli-CMvi_037-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R1	7.3%	42%	145 bp	2.2
Pli-CMvi_037-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R2	6.4%	42%	135 bp	2.2
Pli-CMvi_038-Ex1-2C-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	42%	133 bp	0.1
Pli-CMvi_038-Ex1-2C-lcwgs-1-1.clmp.fp2_repr.R2	2.0%	42%	128 bp	0.1
Pli-CMvi_039-Ex1-3A-lcwgs-1-1.clmp.fp2_repr.R1	6.6%	43%	140 bp	2.9
Pli-CMvi_039-Ex1-3A-lcwgs-1-1.clmp.fp2_repr.R2	6.4%	43%	133 bp	2.9
Pli-CMvi_040-Ex1-3H-lcwgs-1-1.clmp.fp2_repr.R1	5.0%	42%	139 bp	1.6
Pli-CMvi_040-Ex1-3H-lcwgs-1-1.clmp.fp2_repr.R2	4.6%	42%	132 bp	1.6
Pli-CMvi_041-Ex1-4E-lcwgs-1-1.clmp.fp2_repr.R1	4.7%	42%	138 bp	1.6
Pli-CMvi_041-Ex1-4E-lcwgs-1-1.clmp.fp2_repr.R2	4.6%	42%	132 bp	1.6
Pli-CMvi_042-Ex1-5C-lcwgs-1-1.clmp.fp2_repr.R1	6.8%	42%	143 bp	4.0
Pli-CMvi_042-Ex1-5C-lcwgs-1-1.clmp.fp2_repr.R2	6.8%	42%	135 bp	4.0
Pli-CMvi_047-Ex1-7G-lcwgs-1-1.clmp.fp2_repr.R1	3.4%	42%	133 bp	0.8
Pli-CMvi_047-Ex1-7G-lcwgs-1-1.clmp.fp2_repr.R2	3.0%	42%	128 bp	0.8
Pli-CMvi_049-Ex1-1F-lcwgs-1-1.clmp.fp2_repr.R1	6.6%	42%	142 bp	5.0
Pli-CMvi_049-Ex1-1F-lcwgs-1-1.clmp.fp2_repr.R2	6.8%	42%	135 bp	5.0
Pli-CMvi_051-Ex1-3B-lcwgs-1-1.clmp.fp2_repr.R1	7.4%	42%	140 bp	6.1
Pli-CMvi_051-Ex1-3B-lcwgs-1-1.clmp.fp2_repr.R2	7.7%	42%	134 bp	6.1
Pli-CMvi_053-Ex1-4F-lcwgs-1-1.clmp.fp2_repr.R1	2.7%	42%	135 bp	0.2
Pli-CMvi_053-Ex1-4F-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	42%	130 bp	0.2
Pli-CMvi_054-Ex1-5D-lcwgs-1-1.clmp.fp2_repr.R1	5.3%	42%	137 bp	2.4
Pli-CMvi_054-Ex1-5D-lcwgs-1-1.clmp.fp2_repr.R2	5.3%	42%	131 bp	2.4
Pli-CMvi_059-Ex1-7H-lcwgs-1-1.clmp.fp2_repr.R1	5.5%	42%	139 bp	2.1
Pli-CMvi_059-Ex1-7H-lcwgs-1-1.clmp.fp2_repr.R2	5.3%	42%	133 bp	2.1
Pli-CMvi_060-Ex1-8F-lcwgs-1-1.clmp.fp2_repr.R1	3.3%	42%	138 bp	0.1
Pli-CMvi_060-Ex1-8F-lcwgs-1-1.clmp.fp2_repr.R2	2.3%	42%	132 bp	0.1
Pli-CMvi_062-Ex1-2D-lcwgs-1-1.clmp.fp2_repr.R1	5.5%	42%	136 bp	4.5
Pli-CMvi_062-Ex1-2D-lcwgs-1-1.clmp.fp2_repr.R2	5.8%	42%	130 bp	4.5
Pli-CMvi_063-Ex1-3C-lcwgs-1-1.clmp.fp2_repr.R1	6.9%	42%	142 bp	3.1
Pli-CMvi_063-Ex1-3C-lcwgs-1-1.clmp.fp2_repr.R2	6.7%	42%	135 bp	3.1
Pli-CMvi_064-Ex1-4A-lcwgs-1-1.clmp.fp2_repr.R1	7.2%	42%	144 bp	4.2
Pli-CMvi_064-Ex1-4A-lcwgs-1-1.clmp.fp2_repr.R2	6.8%	43%	135 bp	4.2
Pli-CMvi_065-Ex1-4G-lcwgs-1-1.clmp.fp2_repr.R1	2.6%	42%	132 bp	0.2
Pli-CMvi_065-Ex1-4G-lcwgs-1-1.clmp.fp2_repr.R2	2.1%	42%	127 bp	0.2
Pli-CMvi_066-Ex1-5E-lcwgs-1-1.clmp.fp2_repr.R1	8.6%	43%	142 bp	6.1
Pli-CMvi_066-Ex1-5E-lcwgs-1-1.clmp.fp2_repr.R2	9.0%	43%	135 bp	6.1
Pli-CMvi_070-Ex1-7D-lcwgs-1-1.clmp.fp2_repr.R1	1.7%	42%	126 bp	0.1
Pli-CMvi_070-Ex1-7D-lcwgs-1-1.clmp.fp2_repr.R2	1.2%	42%	122 bp	0.1
Pli-CMvi_071-Ex1-8A-lcwgs-1-1.clmp.fp2_repr.R1	1.1%	42%	126 bp	0.0
Pli-CMvi_071-Ex1-8A-lcwgs-1-1.clmp.fp2_repr.R2	0.7%	42%	120 bp	0.0
Pli-CMvi_072-Ex1-8G-lcwgs-1-1.clmp.fp2_repr.R1	4.2%	42%	140 bp	0.5
Pli-CMvi_072-Ex1-8G-lcwgs-1-1.clmp.fp2_repr.R2	3.4%	42%	133 bp	0.5
Pli-CMvi_073-Ex1-1G-lcwgs-1-1.clmp.fp2_repr.R1	10.6%	43%	141 bp	3.6
Pli-CMvi_073-Ex1-1G-lcwgs-1-1.clmp.fp2_repr.R2	11.0%	43%	134 bp	3.6
Pli-CMvi_074-Ex1-2E-lcwgs-1-1.clmp.fp2_repr.R1	3.7%	42%	134 bp	0.1
Pli-CMvi_074-Ex1-2E-lcwgs-1-1.clmp.fp2_repr.R2	2.9%	42%	129 bp	0.1
Pli-CMvi_075-Ex1-3D-lcwgs-1-1.clmp.fp2_repr.R1	2.0%	42%	127 bp	0.2
Pli-CMvi_075-Ex1-3D-lcwgs-1-1.clmp.fp2_repr.R2	1.8%	42%	123 bp	0.2
Pli-CMvi_076-Ex1-4B-lcwgs-1-1.clmp.fp2_repr.R1	1.1%	42%	126 bp	0.0
Pli-CMvi_076-Ex1-4B-lcwgs-1-1.clmp.fp2_repr.R2	0.9%	42%	121 bp	0.0
Pli-CMvi_078-Ex1-5F-lcwgs-1-1.clmp.fp2_repr.R1	0.8%	42%	132 bp	0.0
Pli-CMvi_078-Ex1-5F-lcwgs-1-1.clmp.fp2_repr.R2	0.6%	42%	126 bp	0.0
Pli-CMvi_082-Ex1-7E-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	42%	131 bp	0.1
Pli-CMvi_082-Ex1-7E-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	42%	126 bp	0.1
Pli-CMvi_083-Ex1-8B-lcwgs-1-1.clmp.fp2_repr.R1	3.0%	42%	137 bp	0.0
Pli-CMvi_083-Ex1-8B-lcwgs-1-1.clmp.fp2_repr.R2	2.0%	42%	131 bp	0.0
Pli-CMvi_084-Ex1-8H-lcwgs-1-1.clmp.fp2_repr.R1	3.4%	42%	131 bp	0.6
Pli-CMvi_084-Ex1-8H-lcwgs-1-1.clmp.fp2_repr.R2	2.9%	42%	125 bp	0.6
Pli-CMvi_085-Ex1-1H-lcwgs-1-1.clmp.fp2_repr.R1	6.6%	42%	139 bp	3.3
Pli-CMvi_085-Ex1-1H-lcwgs-1-1.clmp.fp2_repr.R2	6.5%	42%	133 bp	3.3
Pli-CMvi_086-Ex1-2F-lcwgs-1-1.clmp.fp2_repr.R1	7.2%	42%	143 bp	3.3
Pli-CMvi_086-Ex1-2F-lcwgs-1-1.clmp.fp2_repr.R2	6.8%	42%	135 bp	3.3
Pli-CMvi_087-Ex1-3E-lcwgs-1-1.clmp.fp2_repr.R1	6.7%	42%	143 bp	4.5
Pli-CMvi_087-Ex1-3E-lcwgs-1-1.clmp.fp2_repr.R2	6.5%	42%	135 bp	4.5
Pli-CMvi_089-Ex1-4H-lcwgs-1-1.clmp.fp2_repr.R1	5.4%	42%	140 bp	1.9
Pli-CMvi_089-Ex1-4H-lcwgs-1-1.clmp.fp2_repr.R2	5.2%	42%	134 bp	1.9
Pli-CMvi_093-Ex1-7A-lcwgs-1-1.clmp.fp2_repr.R1	0.3%	42%	118 bp	0.0
Pli-CMvi_093-Ex1-7A-lcwgs-1-1.clmp.fp2_repr.R2	0.2%	42%	114 bp	0.0
Pli-CMvi_095-Ex1-8C-lcwgs-1-1.clmp.fp2_repr.R1	0.4%	42%	124 bp	0.0
Pli-CMvi_095-Ex1-8C-lcwgs-1-1.clmp.fp2_repr.R2	0.3%	42%	118 bp	0.0
```

</p>
</details>

## 14. Clean Up
```bash
mkdir logs
mv *out logs
```

## Delete Interim Files
Followed directions in https://github.com/philippinespire/pire_ssl_data_processing#f-cleaning-up

Before: 188 G
After: 65 G
Space saved: 123 G
