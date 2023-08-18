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
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw_cat" "fqc_raw_report"  "fq.gz"`

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
Pli-CMvi_064-Ex1-4A-lcwgs-1-1.2	14.8%	43%	5.9
Pli-CMvi_065-Ex1-4G-lcwgs-1-1.1	18.0%	43%	0.3
Pli-CMvi_065-Ex1-4G-lcwgs-1-1.2	16.7%	44%	0.3
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
Sample Name	% Duplication	GC content	% PF	% Adapter
Pli-AMvi_004-Ex1-1A-lcwgs-1-1	10.3%	47.0%	68.4%	94.8%
Pli-AMvi_004-Ex1-1A-lcwgs-2-1	17.4%	57.2%	90.1%	16.8%
Pli-AMvi_005-Ex1-2A-lcwgs-1-1	0.8%	44.8%	79.5%	74.7%
Pli-AMvi_005-Ex1-2A-lcwgs-2-1	1.0%	48.9%	67.3%	67.5%
Pli-AMvi_006-Ex1-3A-lcwgs-1-1	0.7%	43.6%	80.8%	77.0%
Pli-AMvi_006-Ex1-3A-lcwgs-2-1	3.7%	45.1%	64.6%	89.2%
Pli-AMvi_007-Ex1-4A-lcwgs-1-1	10.6%	40.4%	86.2%	93.5%
Pli-AMvi_007-Ex1-4A-lcwgs-2-1	0.8%	44.1%	63.6%	87.5%
Pli-AMvi_008-Ex1-1B-lcwgs-1-1	12.3%	41.6%	87.8%	91.9%
Pli-AMvi_008-Ex1-1B-lcwgs-2-1	10.4%	48.4%	53.8%	86.5%
Pli-AMvi_009-Ex1-2B-lcwgs-1-1	1.1%	44.8%	80.4%	77.0%
Pli-AMvi_009-Ex1-2B-lcwgs-2-1	4.5%	49.5%	50.4%	76.4%
Pli-AMvi_010-Ex1-7A-lcwgs-1-1	9.7%	39.3%	92.1%	93.8%
Pli-AMvi_010-Ex1-7A-lcwgs-2-1	12.3%	47.2%	74.2%	82.6%
Pli-AMvi_011-Ex1-8A-lcwgs-1-1	10.9%	39.7%	89.3%	96.1%
Pli-AMvi_011-Ex1-8A-lcwgs-2-1	15.3%	49.0%	74.4%	75.3%
Pli-AMvi_012-Ex1-9A-lcwgs-1-1	12.7%	39.7%	87.9%	95.7%
Pli-AMvi_012-Ex1-9A-lcwgs-2-1	15.5%	47.4%	77.6%	78.5%
Pli-AMvi_013-Ex1-10A-lcwgs-1-1	10.0%	39.5%	92.6%	94.4%
Pli-AMvi_013-Ex1-10A-lcwgs-2-1	1.4%	46.6%	69.0%	84.0%
Pli-AMvi_014-Ex1-11A-lcwgs-1-1	13.2%	46.9%	81.1%	83.0%
Pli-AMvi_014-Ex1-11A-lcwgs-2-1	12.4%	48.6%	10.5%	94.3%
Pli-AMvi_015-Ex1-12A-lcwgs-1-1	3.0%	44.1%	87.3%	57.0%
Pli-AMvi_015-Ex1-12A-lcwgs-2-1	0.6%	53.3%	56.5%	60.7%
Pli-AMvi_016-Ex1-3B-lcwgs-1-1	9.4%	41.4%	91.6%	95.7%
Pli-AMvi_016-Ex1-3B-lcwgs-2-1	9.8%	43.3%	82.3%	95.3%
Pli-AMvi_017-Ex1-4B-lcwgs-1-1	9.3%	41.5%	89.1%	93.3%
Pli-AMvi_017-Ex1-4B-lcwgs-2-1	1.4%	48.1%	50.7%	83.9%
Pli-AMvi_018-Ex1-1C-lcwgs-1-1	10.0%	44.3%	82.2%	88.4%
Pli-AMvi_018-Ex1-1C-lcwgs-2-1	6.6%	50.9%	25.1%	85.7%
Pli-AMvi_019-Ex1-2C-lcwgs-1-1	6.6%	44.0%	81.5%	88.4%
Pli-AMvi_019-Ex1-2C-lcwgs-2-1	3.6%	46.8%	67.3%	76.6%
Pli-AMvi_020-Ex1-3C-lcwgs-1-1	5.7%	44.7%	47.1%	90.0%
Pli-AMvi_020-Ex1-3C-lcwgs-2-1	3.4%	45.8%	56.8%	84.4%
Pli-AMvi_021-Ex1-4C-lcwgs-1-1	9.3%	41.3%	87.7%	95.1%
Pli-AMvi_021-Ex1-4C-lcwgs-2-1	9.6%	43.5%	66.4%	97.1%
Pli-AMvi_022-Ex1-7B-lcwgs-1-1	10.5%	39.5%	92.3%	91.6%
Pli-AMvi_022-Ex1-7B-lcwgs-2-1	19.1%	52.4%	62.7%	61.0%
Pli-AMvi_023-Ex1-8B-lcwgs-1-1	10.5%	39.8%	89.3%	93.8%
Pli-AMvi_023-Ex1-8B-lcwgs-2-1	12.4%	47.9%	51.4%	87.0%
Pli-AMvi_024-Ex1-9B-lcwgs-1-1	11.8%	39.9%	90.9%	95.2%
Pli-AMvi_024-Ex1-9B-lcwgs-2-1	28.5%	53.7%	62.7%	61.6%
Pli-AMvi_025-Ex1-10B-lcwgs-1-1	9.1%	40.2%	89.1%	93.5%
Pli-AMvi_025-Ex1-10B-lcwgs-2-1	6.4%	44.5%	55.8%	80.5%
Pli-AMvi_026-Ex1-11B-lcwgs-1-1	10.3%	41.9%	94.3%	95.7%
Pli-AMvi_026-Ex1-11B-lcwgs-2-1	11.7%	45.1%	23.6%	95.4%
Pli-AMvi_027-Ex1-12B-lcwgs-1-1	4.7%	43.3%	92.4%	41.5%
Pli-AMvi_027-Ex1-12B-lcwgs-2-1	2.0%	50.0%	69.7%	64.2%
Pli-AMvi_028-Ex1-1D-lcwgs-1-1	5.2%	46.1%	76.0%	76.8%
Pli-AMvi_028-Ex1-1D-lcwgs-2-1	2.2%	50.5%	49.1%	76.2%
Pli-AMvi_029-Ex1-2D-lcwgs-1-1	10.1%	42.1%	87.9%	93.9%
Pli-AMvi_029-Ex1-2D-lcwgs-2-1	10.1%	44.2%	59.3%	96.5%
Pli-AMvi_030-Ex1-3D-lcwgs-1-1	9.5%	43.4%	88.2%	94.2%
Pli-AMvi_030-Ex1-3D-lcwgs-2-1	9.6%	44.3%	62.9%	94.9%
Pli-AMvi_031-Ex1-4D-lcwgs-1-1	3.5%	46.1%	73.4%	73.4%
Pli-AMvi_031-Ex1-4D-lcwgs-2-1	1.6%	46.8%	47.3%	86.6%
Pli-AMvi_032-Ex1-5C-lcwgs-1-1	10.8%	41.2%	87.1%	93.6%
Pli-AMvi_032-Ex1-5C-lcwgs-2-1	10.4%	43.1%	66.8%	96.5%
Pli-AMvi_033-Ex1-6C-lcwgs-1-1	8.8%	43.3%	79.4%	92.3%
Pli-AMvi_033-Ex1-6C-lcwgs-2-1	10.9%	44.0%	70.8%	97.6%
Pli-AMvi_034-Ex1-7C-lcwgs-1-1	0.6%	45.7%	74.1%	68.0%
Pli-AMvi_034-Ex1-7C-lcwgs-2-1	6.7%	46.2%	17.6%	93.9%
Pli-AMvi_035-Ex1-8C-lcwgs-1-1	8.3%	42.4%	86.0%	94.7%
Pli-AMvi_035-Ex1-8C-lcwgs-2-1	5.9%	44.6%	27.1%	91.1%
Pli-AMvi_036-Ex1-9C-lcwgs-1-1	23.3%	42.5%	87.3%	64.2%
Pli-AMvi_036-Ex1-9C-lcwgs-2-1	30.7%	48.9%	74.0%	48.3%
Pli-AMvi_037-Ex1-10C-lcwgs-1-1	9.9%	38.9%	91.4%	96.5%
Pli-AMvi_037-Ex1-10C-lcwgs-2-1	20.8%	40.5%	78.2%	85.3%
Pli-AMvi_038-Ex1-11C-lcwgs-1-1	10.4%	44.0%	83.8%	91.1%
Pli-AMvi_038-Ex1-11C-lcwgs-2-1	19.3%	45.3%	72.7%	66.1%
Pli-AMvi_039-Ex1-12C-lcwgs-1-1	5.5%	43.1%	91.4%	43.2%
Pli-AMvi_039-Ex1-12C-lcwgs-2-1	35.8%	57.7%	91.5%	14.1%
Pli-AMvi_040-Ex1-5A-lcwgs-1-1	10.3%	42.1%	90.2%	94.2%
Pli-AMvi_040-Ex1-5A-lcwgs-2-1	14.0%	47.4%	78.6%	80.0%
Pli-AMvi_041-Ex1-6A-lcwgs-1-1	11.4%	38.2%	88.9%	94.2%
Pli-AMvi_041-Ex1-6A-lcwgs-2-1	13.4%	44.5%	81.8%	87.9%
Pli-AMvi_042-Ex1-5B-lcwgs-1-1	0.7%	44.7%	77.8%	64.3%
Pli-AMvi_042-Ex1-5B-lcwgs-2-1	1.8%	47.0%	58.1%	86.8%
Pli-AMvi_043-Ex1-6B-lcwgs-1-1	10.6%	41.9%	83.6%	93.1%
Pli-AMvi_043-Ex1-6B-lcwgs-2-1	16.2%	51.0%	66.2%	78.7%
Pli-AMvi_044-Ex1-5D-lcwgs-1-1	0.6%	45.1%	78.6%	61.5%
Pli-AMvi_044-Ex1-5D-lcwgs-2-1	9.9%	44.5%	40.3%	97.0%
Pli-AMvi_045-Ex1-6D-lcwgs-1-1	8.9%	46.2%	75.9%	86.9%
Pli-AMvi_045-Ex1-6D-lcwgs-2-1	9.5%	47.8%	28.8%	92.8%
Pli-AMvi_046-Ex1-1E-lcwgs-1-1	1.1%	46.0%	75.2%	59.7%
Pli-AMvi_046-Ex1-1E-lcwgs-2-1	10.8%	45.4%	35.3%	92.2%
Pli-AMvi_047-Ex1-2E-lcwgs-1-1	9.7%	40.8%	88.4%	95.1%
Pli-AMvi_047-Ex1-2E-lcwgs-2-1	10.0%	46.0%	41.3%	93.6%
Pli-AMvi_048-Ex1-3E-lcwgs-1-1	0.7%	43.1%	83.1%	76.8%
Pli-AMvi_048-Ex1-3E-lcwgs-2-1	8.6%	38.4%	88.6%	91.4%
Pli-AMvi_049-Ex1-4E-lcwgs-1-1	0.6%	45.2%	81.6%	68.8%
Pli-AMvi_049-Ex1-4E-lcwgs-2-1	1.5%	40.5%	62.0%	83.7%
Pli-AMvi_050-Ex1-5E-lcwgs-1-1	0.5%	44.9%	82.7%	62.6%
Pli-AMvi_050-Ex1-5E-lcwgs-2-1	7.4%	44.0%	68.1%	89.8%
Pli-AMvi_051-Ex1-6E-lcwgs-1-1	7.0%	45.7%	72.2%	79.1%
Pli-AMvi_051-Ex1-6E-lcwgs-2-1	11.7%	48.8%	23.2%	94.6%
Pli-AMvi_052-Ex1-7D-lcwgs-1-1	9.8%	42.9%	88.7%	95.4%
Pli-AMvi_052-Ex1-7D-lcwgs-2-1	10.8%	48.5%	15.2%	94.4%
Pli-AMvi_053-Ex1-8D-lcwgs-1-1	0.8%	44.2%	80.0%	67.2%
Pli-AMvi_053-Ex1-8D-lcwgs-2-1	2.4%	43.6%	47.4%	89.0%
Pli-AMvi_054-Ex1-9D-lcwgs-1-1	9.6%	44.6%	86.0%	93.7%
Pli-AMvi_054-Ex1-9D-lcwgs-2-1	2.2%	47.5%	44.5%	78.1%
Pli-AMvi_055-Ex1-10D-lcwgs-1-1	8.4%	42.1%	90.3%	96.1%
Pli-AMvi_055-Ex1-10D-lcwgs-2-1	11.9%	44.2%	41.1%	90.3%
Pli-AMvi_056-Ex1-11D-lcwgs-1-1	0.8%	43.7%	84.6%	73.7%
Pli-AMvi_056-Ex1-11D-lcwgs-2-1	8.3%	49.5%	56.4%	70.2%
Pli-AMvi_057-Ex1-12D-lcwgs-1-1	9.8%	42.2%	86.4%	50.8%
Pli-AMvi_057-Ex1-12D-lcwgs-2-1	3.8%	51.2%	67.8%	60.1%
Pli-AMvi_058-Ex1-1F-lcwgs-1-1	0.5%	45.8%	77.7%	62.2%
Pli-AMvi_058-Ex1-1F-lcwgs-2-1	33.7%	58.1%	79.4%	26.2%
Pli-AMvi_059-Ex1-2F-lcwgs-1-1	1.1%	44.4%	82.3%	77.1%
Pli-AMvi_059-Ex1-2F-lcwgs-2-1	2.4%	53.5%	67.3%	49.1%
Pli-AMvi_060-Ex1-3F-lcwgs-1-1	0.8%	43.4%	83.6%	78.9%
Pli-AMvi_060-Ex1-3F-lcwgs-2-1	0.0%	48.9%	75.5%	75.0%
Pli-AMvi_061-Ex1-4F-lcwgs-1-1	0.7%	45.3%	81.5%	69.3%
Pli-AMvi_061-Ex1-4F-lcwgs-2-1	1.0%	52.7%	62.6%	66.0%
Pli-AMvi_062-Ex1-5F-lcwgs-1-1	1.3%	45.1%	80.3%	65.8%
Pli-AMvi_062-Ex1-5F-lcwgs-2-1	1.7%	48.8%	68.7%	76.1%
Pli-AMvi_063-Ex1-6F-lcwgs-1-1	7.6%	45.8%	72.3%	85.3%
Pli-AMvi_063-Ex1-6F-lcwgs-2-1	0.9%	47.7%	68.1%	80.8%
Pli-AMvi_064-Ex1-7E-lcwgs-1-1	9.5%	42.5%	92.3%	95.6%
Pli-AMvi_064-Ex1-7E-lcwgs-2-1	13.6%	48.3%	11.3%	94.5%
Pli-AMvi_065-Ex1-8E-lcwgs-1-1	9.5%	39.4%	93.0%	96.1%
Pli-AMvi_065-Ex1-8E-lcwgs-2-1	10.4%	46.0%	37.7%	96.0%
Pli-AMvi_066-Ex1-9E-lcwgs-1-1	0.9%	44.0%	80.1%	68.0%
Pli-AMvi_066-Ex1-9E-lcwgs-2-1	3.7%	48.2%	66.3%	67.4%
Pli-AMvi_067-Ex1-10E-lcwgs-1-1	7.6%	43.4%	90.3%	92.9%
Pli-AMvi_067-Ex1-10E-lcwgs-2-1	14.3%	34.5%	100.0%	95.2%
Pli-AMvi_068-Ex1-1E-lcwgs-1-1	2.0%	46.0%	73.0%	60.5%
Pli-AMvi_068-Ex1-1E-lcwgs-2-1	2.7%	53.2%	56.0%	64.4%
Pli-AMvi_069-Ex1-12E-lcwgs-1-1	1.2%	43.7%	88.0%	32.1%
Pli-AMvi_069-Ex1-12E-lcwgs-2-1	26.1%	60.0%	88.7%	16.6%
Pli-AMvi_070-Ex1-1G-lcwgs-1-1	0.8%	45.6%	77.2%	63.7%
Pli-AMvi_070-Ex1-1G-lcwgs-2-1	38.2%	57.4%	83.2%	22.8%
Pli-AMvi_071-Ex1-2G-lcwgs-1-1	0.8%	44.4%	82.7%	77.3%
Pli-AMvi_071-Ex1-2G-lcwgs-2-1	41.9%	56.6%	85.5%	19.0%
Pli-AMvi_072-Ex1-3G-lcwgs-1-1	0.8%	43.1%	83.3%	79.7%
Pli-AMvi_072-Ex1-3G-lcwgs-2-1	1.9%	49.3%	61.3%	74.0%
Pli-AMvi_073-Ex1-4G-lcwgs-1-1	0.6%	45.2%	80.8%	70.6%
Pli-AMvi_073-Ex1-4G-lcwgs-2-1	10.3%	46.2%	40.3%	90.1%
Pli-AMvi_074-Ex1-5G-lcwgs-1-1	0.9%	44.5%	82.3%	67.1%
Pli-AMvi_074-Ex1-5G-lcwgs-2-1	2.3%	47.1%	65.6%	80.2%
Pli-AMvi_075-Ex1-6G-lcwgs-1-1	0.9%	43.8%	77.0%	50.2%
Pli-AMvi_075-Ex1-6G-lcwgs-2-1	18.3%	51.1%	58.7%	76.1%
Pli-AMvi_076-Ex1-7F-lcwgs-1-1	8.9%	46.2%	83.2%	94.4%
Pli-AMvi_076-Ex1-7F-lcwgs-2-1	1.4%	51.2%	50.9%	74.9%
Pli-AMvi_077-Ex1-8F-lcwgs-1-1	3.9%	45.0%	78.1%	78.0%
Pli-AMvi_077-Ex1-8F-lcwgs-2-1	0.5%	51.4%	59.6%	76.2%
Pli-AMvi_078-Ex1-9F-lcwgs-1-1	0.9%	44.2%	79.7%	70.4%
Pli-AMvi_078-Ex1-9F-lcwgs-2-1	1.6%	50.3%	58.6%	69.5%
Pli-AMvi_079-Ex1-10F-lcwgs-1-1	0.5%	43.3%	83.7%	68.2%
Pli-AMvi_079-Ex1-10F-lcwgs-2-1	11.9%	57.6%	77.9%	30.9%
Pli-AMvi_080-Ex1-11F-lcwgs-1-1	0.9%	43.4%	88.6%	76.1%
Pli-AMvi_080-Ex1-11F-lcwgs-2-1	0.0%	36.4%	94.7%	94.7%
Pli-AMvi_081-Ex1-12F-lcwgs-1-1	1.2%	42.8%	89.0%	29.4%
Pli-AMvi_081-Ex1-12F-lcwgs-2-1	24.7%	56.7%	94.0%	8.4%
Pli-AMvi_082-Ex1-1H-lcwgs-1-1	10.4%	44.9%	82.6%	95.1%
Pli-AMvi_082-Ex1-1H-lcwgs-2-1	18.6%	56.6%	84.2%	39.4%
Pli-AMvi_083-Ex1-2H-lcwgs-1-1	10.6%	41.5%	84.8%	98.0%
Pli-AMvi_083-Ex1-2H-lcwgs-2-1	10.2%	42.6%	82.8%	97.2%
Pli-AMvi_084-Ex1-3H-lcwgs-1-1	10.4%	45.4%	83.0%	95.4%
Pli-AMvi_084-Ex1-3H-lcwgs-2-1	15.4%	50.6%	53.6%	80.3%
Pli-AMvi_085-Ex1-4H-lcwgs-1-1	10.3%	42.8%	84.2%	96.6%
Pli-AMvi_085-Ex1-4H-lcwgs-2-1	10.4%	44.1%	49.8%	97.2%
Pli-AMvi_086-Ex1-5H-lcwgs-1-1	9.2%	46.5%	64.8%	92.5%
Pli-AMvi_086-Ex1-5H-lcwgs-2-1	11.5%	43.5%	69.5%	95.4%
Pli-AMvi_087-Ex1-6H-lcwgs-1-1	9.6%	47.8%	68.6%	95.6%
Pli-AMvi_087-Ex1-6H-lcwgs-2-1	13.1%	51.7%	38.0%	86.9%
Pli-AMvi_088-Ex1-7G-lcwgs-1-1	0.8%	45.1%	79.3%	68.3%
Pli-AMvi_088-Ex1-7G-lcwgs-2-1	13.0%	48.3%	49.6%	86.3%
Pli-AMvi_089-Ex1-8G-lcwgs-1-1	0.9%	43.5%	83.7%	71.1%
Pli-AMvi_089-Ex1-8G-lcwgs-2-1	0.7%	48.5%	56.7%	80.3%
Pli-AMvi_090-Ex1-9G-lcwgs-1-1	0.6%	43.9%	80.0%	70.8%
Pli-AMvi_090-Ex1-9G-lcwgs-2-1	1.9%	49.4%	57.1%	70.9%
Pli-AMvi_091-Ex1-10G-lcwgs-1-1	0.6%	43.3%	82.7%	67.9%
Pli-AMvi_091-Ex1-10G-lcwgs-2-1	9.4%	56.4%	80.6%	27.4%
Pli-AMvi_092-Ex1-11G-lcwgs-1-1	0.9%	43.8%	87.6%	76.5%
Pli-AMvi_092-Ex1-11G-lcwgs-2-1	17.1%	46.7%	73.2%	50.0%
Pli-AMvi_093-Ex1-12G-lcwgs-1-1	5.2%	43.4%	92.1%	38.2%
Pli-AMvi_093-Ex1-12G-lcwgs-2-1	41.2%	57.4%	93.0%	9.1%
Pli-AMvi_094-Ex1-7H-lcwgs-1-1	9.7%	43.6%	82.7%	96.7%
Pli-AMvi_094-Ex1-7H-lcwgs-2-1	9.8%	44.4%	60.3%	97.5%
Pli-AMvi_095-Ex1-8H-lcwgs-1-1	10.2%	47.9%	64.7%	94.5%
Pli-AMvi_095-Ex1-8H-lcwgs-2-1	10.1%	46.3%	44.0%	96.3%
Pli-AMvi_096-Ex1-9H-lcwgs-1-1	3.3%	44.7%	63.7%	78.8%
Pli-AMvi_096-Ex1-9H-lcwgs-2-1	29.7%	49.5%	67.6%	71.6%
Pli-AMvi_097-Ex1-10H-lcwgs-1-1	1.2%	43.9%	82.2%	78.4%
Pli-AMvi_097-Ex1-10H-lcwgs-2-1	3.8%	41.8%	44.7%	83.5%
Pli-AMvi_098-Ex1-11H-lcwgs-1-1	0.7%	43.2%	87.7%	78.3%
Pli-AMvi_098-Ex1-11H-lcwgs-2-1	2.3%	50.6%	70.8%	60.6%
Pli-AMvi_099-Ex1-12H-lcwgs-1-1	7.2%	41.7%	87.2%	35.3%
Pli-AMvi_099-Ex1-12H-lcwgs-2-1	49.5%	55.4%	88.1%	16.1%
Pli-CMvi_001-Ex1-1B-lcwgs-1-1	12.9%	38.3%	92.6%	13.7%
Pli-CMvi_002-Ex1-2A-lcwgs-1-1	8.1%	42.9%	93.8%	23.4%
Pli-CMvi_003-Ex1-2G-lcwgs-1-1	8.9%	42.4%	81.2%	41.5%
Pli-CMvi_004-Ex1-3F-lcwgs-1-1	8.8%	42.6%	95.5%	19.1%
Pli-CMvi_005-Ex1-4C-lcwgs-1-1	0.4%	42.8%	89.7%	45.1%
Pli-CMvi_006-Ex1-5A-lcwgs-1-1	1.5%	43.0%	87.7%	42.4%
Pli-CMvi_007-Ex1-5G-lcwgs-1-1	8.0%	42.6%	87.9%	31.7%
Pli-CMvi_013-Ex1-1C-lcwgs-1-1	12.5%	43.7%	81.2%	17.8%
Pli-CMvi_014-Ex1-2B-lcwgs-1-1	1.2%	42.7%	89.2%	42.1%
Pli-CMvi_015-Ex1-2H-lcwgs-1-1	9.7%	43.0%	80.0%	32.0%
Pli-CMvi_020-Ex1-6D-lcwgs-1-1	14.5%	43.1%	88.7%	23.4%
Pli-CMvi_021-Ex1-6G-lcwgs-1-1	8.2%	42.4%	94.8%	16.8%
Pli-CMvi_022-Ex1-7B-lcwgs-1-1	6.1%	42.3%	92.0%	41.1%
Pli-CMvi_023-Ex1-7F-lcwgs-1-1	8.8%	42.2%	94.1%	35.3%
Pli-CMvi_025-Ex1-1D-lcwgs-1-1	5.9%	43.4%	15.6%	86.1%
Pli-CMvi_028-Ex1-3G-lcwgs-1-1	12.8%	42.9%	94.8%	14.1%
Pli-CMvi_030-Ex1-5B-lcwgs-1-1	0.9%	42.9%	88.7%	38.9%
Pli-CMvi_031-Ex1-5H-lcwgs-1-1	12.6%	43.4%	81.5%	34.9%
Pli-CMvi_034-Ex1-7C-lcwgs-1-1	6.6%	42.3%	93.4%	51.2%
Pli-CMvi_037-Ex1-1E-lcwgs-1-1	12.8%	43.0%	75.1%	24.4%
Pli-CMvi_038-Ex1-2C-lcwgs-1-1	6.9%	42.5%	90.9%	28.9%
Pli-CMvi_039-Ex1-3A-lcwgs-1-1	11.3%	43.4%	87.3%	23.2%
Pli-CMvi_040-Ex1-3H-lcwgs-1-1	9.0%	42.7%	94.3%	18.7%
Pli-CMvi_041-Ex1-4E-lcwgs-1-1	7.8%	42.6%	92.6%	22.8%
Pli-CMvi_042-Ex1-5C-lcwgs-1-1	10.5%	42.9%	93.7%	11.4%
Pli-CMvi_047-Ex1-7G-lcwgs-1-1	8.6%	42.3%	93.1%	33.3%
Pli-CMvi_049-Ex1-1F-lcwgs-1-1	9.0%	42.2%	91.8%	17.3%
Pli-CMvi_051-Ex1-3B-lcwgs-1-1	12.2%	43.0%	94.0%	17.5%
Pli-CMvi_053-Ex1-4F-lcwgs-1-1	7.0%	42.4%	92.7%	28.8%
Pli-CMvi_054-Ex1-5D-lcwgs-1-1	9.2%	42.5%	93.2%	24.4%
Pli-CMvi_059-Ex1-7H-lcwgs-1-1	9.6%	42.8%	94.5%	20.5%
Pli-CMvi_060-Ex1-8F-lcwgs-1-1	8.0%	42.5%	93.1%	23.1%
Pli-CMvi_062-Ex1-2D-lcwgs-1-1	7.4%	42.6%	91.3%	28.7%
Pli-CMvi_063-Ex1-3C-lcwgs-1-1	8.4%	42.8%	93.9%	15.0%
Pli-CMvi_064-Ex1-4A-lcwgs-1-1	7.9%	43.1%	89.8%	12.4%
Pli-CMvi_065-Ex1-4G-lcwgs-1-1	7.0%	42.7%	84.1%	38.6%
Pli-CMvi_066-Ex1-5E-lcwgs-1-1	10.0%	43.3%	94.2%	14.8%
Pli-CMvi_070-Ex1-7D-lcwgs-1-1	5.0%	42.5%	91.5%	42.3%
Pli-CMvi_071-Ex1-8A-lcwgs-1-1	2.9%	43.2%	87.1%	38.9%
Pli-CMvi_072-Ex1-8G-lcwgs-1-1	8.9%	42.8%	91.3%	19.8%
Pli-CMvi_073-Ex1-1G-lcwgs-1-1	12.9%	44.0%	91.7%	19.8%
Pli-CMvi_074-Ex1-2E-lcwgs-1-1	6.7%	42.7%	82.8%	35.7%
Pli-CMvi_075-Ex1-3D-lcwgs-1-1	5.3%	42.5%	92.6%	42.7%
Pli-CMvi_076-Ex1-4B-lcwgs-1-1	2.8%	42.7%	91.0%	37.6%
Pli-CMvi_078-Ex1-5F-lcwgs-1-1	1.4%	42.6%	87.0%	34.0%
Pli-CMvi_082-Ex1-7E-lcwgs-1-1	7.3%	42.2%	92.4%	35.8%
Pli-CMvi_083-Ex1-8B-lcwgs-1-1	7.2%	42.6%	91.9%	23.5%
Pli-CMvi_084-Ex1-8H-lcwgs-1-1	8.5%	42.5%	77.0%	45.1%
Pli-CMvi_085-Ex1-1H-lcwgs-1-1	10.6%	42.7%	93.3%	19.2%
Pli-CMvi_086-Ex1-2F-lcwgs-1-1	11.0%	43.0%	90.7%	13.2%
Pli-CMvi_087-Ex1-3E-lcwgs-1-1	11.6%	42.9%	92.0%	11.6%
Pli-CMvi_089-Ex1-4H-lcwgs-1-1	9.4%	42.8%	90.5%	19.5%
Pli-CMvi_093-Ex1-7A-lcwgs-1-1	1.0%	42.7%	90.5%	50.2%
Pli-CMvi_095-Ex1-8C-lcwgs-1-1	1.0%	42.6%	86.5%	41.5%
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

```
  
</p>
</details>

## 10. Second trim.
`sbatch ../../../pire_fq_gz_processing/runFASTP_2.sbatch fq_fp1_clmp fq_fp1_clmp_fp2 33`

<details><summary>Expand for MultiQC Output.</summary>

```bash

```

</p>
</details>

## 11. Decontaminate files.
`bash ../../../pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn 20`

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
TBD
```

</p>
</details>

## 14. Clean Up
TBD
