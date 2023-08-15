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

## 6.5 Concatenate the files
Need to concatenate the albatross samples. Made of a copy of '/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gotanco-chanos_chanos/2nd_sequencing_run/scripts/catfiles.sbatch' to `plotosus_lineatus/1st_sequencing_run/fq_raw`.

Editted the catfiles script based off the naming convention for these samples. Copied some of the individuals to `fq_raw_test` and ran `bash fq_raw/catfiles.sbatch fq_raw_test fq_raw_cat 1` for forward reads and then bash fq_raw/catfiles.sbatch fq_raw_test fq_raw_cat 2` for reverse reads.

Test individuals concatenated successfully. Deleted test folder and cat folder.

Performed concatenation on the whole sample set. `bash fq_raw/catfiles.sbatch fq_raw fq_raw_cat 1` and `bash fq_raw/catfiles.sbatch fq_raw fq_raw_cat 2`

Concatention successful.

## 7. Check the quality of your data.
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw_cat" "fqc_raw_report"  "fq.gz"`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	M Seqs
Sample Name	% Dups	% GC	M Seqs
Pli-AMvi_004-Ex1-1A-lcwgs-X-1.1	31.6%	49%	0.5
Pli-AMvi_004-Ex1-1A-lcwgs-X-1.2	30.9%	49%	0.5
Pli-AMvi_005-Ex1-2A-lcwgs-X-1.1	12.1%	46%	0.0
Pli-AMvi_005-Ex1-2A-lcwgs-X-1.2	13.7%	47%	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-X-1.1	13.0%	45%	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-X-1.2	13.5%	46%	0.0
Pli-AMvi_007-Ex1-4A-lcwgs-X-1.1	19.6%	44%	0.1
Pli-AMvi_007-Ex1-4A-lcwgs-X-1.2	19.1%	45%	0.1
Pli-AMvi_008-Ex1-1B-lcwgs-X-1.1	17.8%	45%	0.4
Pli-AMvi_008-Ex1-1B-lcwgs-X-1.2	16.7%	45%	0.4
Pli-AMvi_009-Ex1-2B-lcwgs-X-1.1	15.7%	46%	0.0
Pli-AMvi_009-Ex1-2B-lcwgs-X-1.2	16.7%	47%	0.0
Pli-AMvi_010-Ex1-7A-lcwgs-X-1.1	30.3%	47%	1.6
Pli-AMvi_010-Ex1-7A-lcwgs-X-1.2	29.2%	47%	1.6
Pli-AMvi_011-Ex1-8A-lcwgs-X-1.1	10.7%	47%	2.3
Pli-AMvi_011-Ex1-8A-lcwgs-X-1.2	10.2%	47%	2.3
Pli-AMvi_012-Ex1-9A-lcwgs-X-1.1	12.7%	46%	1.1
Pli-AMvi_012-Ex1-9A-lcwgs-X-1.2	12.2%	46%	1.1
Pli-AMvi_013-Ex1-10A-lcwgs-X-1.1	12.6%	43%	0.3
Pli-AMvi_013-Ex1-10A-lcwgs-X-1.2	11.6%	44%	0.3
Pli-AMvi_014-Ex1-11A-lcwgs-X-1.1	28.6%	47%	0.3
Pli-AMvi_014-Ex1-11A-lcwgs-X-1.2	26.4%	48%	0.3
Pli-AMvi_015-Ex1-12A-lcwgs-X-1.1	17.6%	49%	0.0
Pli-AMvi_015-Ex1-12A-lcwgs-X-1.2	18.4%	49%	0.0
Pli-AMvi_016-Ex1-3B-lcwgs-X-1.1	21.0%	45%	0.1
Pli-AMvi_016-Ex1-3B-lcwgs-X-1.2	20.3%	45%	0.1
Pli-AMvi_017-Ex1-4B-lcwgs-X-1.1	16.0%	45%	0.1
Pli-AMvi_017-Ex1-4B-lcwgs-X-1.2	15.3%	45%	0.1
Pli-AMvi_018-Ex1-1C-lcwgs-X-1.1	25.8%	46%	0.1
Pli-AMvi_018-Ex1-1C-lcwgs-X-1.2	24.3%	47%	0.1
Pli-AMvi_019-Ex1-2C-lcwgs-X-1.1	17.9%	46%	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-X-1.2	17.0%	47%	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-X-1.1	49.8%	47%	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-X-1.2	48.4%	47%	0.0
Pli-AMvi_021-Ex1-4C-lcwgs-X-1.1	31.4%	46%	0.4
Pli-AMvi_021-Ex1-4C-lcwgs-X-1.2	30.6%	46%	0.4
Pli-AMvi_022-Ex1-7B-lcwgs-X-1.1	40.9%	50%	3.4
Pli-AMvi_022-Ex1-7B-lcwgs-X-1.2	39.5%	50%	3.4
Pli-AMvi_023-Ex1-8B-lcwgs-X-1.1	10.4%	46%	1.1
Pli-AMvi_023-Ex1-8B-lcwgs-X-1.2	33.5%	47%	1.1
Pli-AMvi_024-Ex1-9B-lcwgs-X-1.1	10.3%	49%	2.2
Pli-AMvi_024-Ex1-9B-lcwgs-X-1.2	9.8%	49%	2.2
Pli-AMvi_025-Ex1-10B-lcwgs-X-1.1	16.2%	44%	0.1
Pli-AMvi_025-Ex1-10B-lcwgs-X-1.2	15.4%	45%	0.1
Pli-AMvi_026-Ex1-11B-lcwgs-X-1.1	11.7%	44%	2.8
Pli-AMvi_026-Ex1-11B-lcwgs-X-1.2	11.1%	45%	2.8
Pli-AMvi_027-Ex1-12B-lcwgs-X-1.1	12.6%	48%	0.0
Pli-AMvi_027-Ex1-12B-lcwgs-X-1.2	14.4%	49%	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-X-1.1	22.1%	47%	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-X-1.2	22.4%	48%	0.0
Pli-AMvi_029-Ex1-2D-lcwgs-X-1.1	16.6%	45%	0.9
Pli-AMvi_029-Ex1-2D-lcwgs-X-1.2	15.8%	45%	0.9
Pli-AMvi_030-Ex1-3D-lcwgs-X-1.1	32.6%	46%	0.2
Pli-AMvi_030-Ex1-3D-lcwgs-X-1.2	31.4%	46%	0.2
Pli-AMvi_031-Ex1-4D-lcwgs-X-1.1	20.1%	47%	0.0
Pli-AMvi_031-Ex1-4D-lcwgs-X-1.2	20.2%	48%	0.0
Pli-AMvi_032-Ex1-5C-lcwgs-X-1.1	10.8%	45%	1.2
Pli-AMvi_032-Ex1-5C-lcwgs-X-1.2	10.3%	46%	1.2
Pli-AMvi_033-Ex1-6C-lcwgs-X-1.1	34.6%	46%	1.7
Pli-AMvi_033-Ex1-6C-lcwgs-X-1.2	33.8%	46%	1.7
Pli-AMvi_034-Ex1-7C-lcwgs-X-1.1	69.3%	47%	0.0
Pli-AMvi_034-Ex1-7C-lcwgs-X-1.2	68.2%	48%	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-X-1.1	21.2%	45%	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-X-1.2	20.9%	46%	0.0
Pli-AMvi_036-Ex1-9C-lcwgs-X-1.1	18.4%	48%	4.5
Pli-AMvi_036-Ex1-9C-lcwgs-X-1.2	16.4%	48%	4.5
Pli-AMvi_037-Ex1-10C-lcwgs-X-1.1	13.4%	43%	0.9
Pli-AMvi_037-Ex1-10C-lcwgs-X-1.2	12.6%	44%	0.9
Pli-AMvi_038-Ex1-11C-lcwgs-X-1.1	20.8%	46%	0.4
Pli-AMvi_038-Ex1-11C-lcwgs-X-1.2	20.0%	46%	0.4
Pli-AMvi_039-Ex1-12C-lcwgs-X-1.1	40.6%	56%	0.5
Pli-AMvi_039-Ex1-12C-lcwgs-X-1.2	33.5%	57%	0.5
Pli-AMvi_040-Ex1-5A-lcwgs-X-1.1	26.0%	47%	2.2
Pli-AMvi_040-Ex1-5A-lcwgs-X-1.2	25.1%	47%	2.2
Pli-AMvi_041-Ex1-6A-lcwgs-X-1.1	22.1%	45%	3.0
Pli-AMvi_041-Ex1-6A-lcwgs-X-1.2	9.6%	46%	3.0
Pli-AMvi_042-Ex1-5B-lcwgs-X-1.1	19.1%	46%	0.0
Pli-AMvi_042-Ex1-5B-lcwgs-X-1.2	20.9%	47%	0.0
Pli-AMvi_043-Ex1-6B-lcwgs-X-1.1	36.4%	49%	2.3
Pli-AMvi_043-Ex1-6B-lcwgs-X-1.2	35.5%	49%	2.3
Pli-AMvi_044-Ex1-5D-lcwgs-X-1.1	60.9%	47%	0.2
Pli-AMvi_044-Ex1-5D-lcwgs-X-1.2	59.7%	47%	0.2
Pli-AMvi_045-Ex1-6D-lcwgs-X-1.1	48.4%	47%	0.0
Pli-AMvi_045-Ex1-6D-lcwgs-X-1.2	47.1%	48%	0.0
Pli-AMvi_046-Ex1-1E-lcwgs-X-1.1	67.5%	47%	1.3
Pli-AMvi_046-Ex1-1E-lcwgs-X-1.2	66.2%	47%	1.3
Pli-AMvi_047-Ex1-2E-lcwgs-X-1.1	20.3%	44%	0.1
Pli-AMvi_047-Ex1-2E-lcwgs-X-1.2	17.2%	45%	0.1
Pli-AMvi_048-Ex1-3E-lcwgs-X-1.1	9.0%	45%	0.0
Pli-AMvi_048-Ex1-3E-lcwgs-X-1.2	10.2%	46%	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-X-1.1	7.8%	46%	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-X-1.2	11.6%	47%	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-X-1.1	8.7%	46%	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-X-1.2	13.8%	47%	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-X-1.1	61.0%	47%	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-X-1.2	59.5%	48%	0.0
Pli-AMvi_052-Ex1-7D-lcwgs-X-1.1	15.5%	45%	0.5
Pli-AMvi_052-Ex1-7D-lcwgs-X-1.2	14.8%	46%	0.5
Pli-AMvi_053-Ex1-8D-lcwgs-X-1.1	13.5%	46%	0.0
Pli-AMvi_053-Ex1-8D-lcwgs-X-1.2	16.2%	47%	0.0
Pli-AMvi_054-Ex1-9D-lcwgs-X-1.1	18.0%	46%	0.1
Pli-AMvi_054-Ex1-9D-lcwgs-X-1.2	17.1%	46%	0.1
Pli-AMvi_055-Ex1-10D-lcwgs-X-1.1	15.2%	45%	0.1
Pli-AMvi_055-Ex1-10D-lcwgs-X-1.2	14.4%	45%	0.1
Pli-AMvi_056-Ex1-11D-lcwgs-X-1.1	7.9%	45%	0.0
Pli-AMvi_056-Ex1-11D-lcwgs-X-1.2	9.8%	46%	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-X-1.1	19.0%	48%	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-X-1.2	21.0%	48%	0.0
Pli-AMvi_058-Ex1-1F-lcwgs-X-1.1	46.7%	55%	1.5
Pli-AMvi_058-Ex1-1F-lcwgs-X-1.2	40.5%	56%	1.5
Pli-AMvi_059-Ex1-2F-lcwgs-X-1.1	10.1%	46%	0.0
Pli-AMvi_059-Ex1-2F-lcwgs-X-1.2	11.8%	47%	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-X-1.1	9.2%	45%	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-X-1.2	10.6%	46%	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-X-1.1	8.8%	46%	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-X-1.2	12.1%	47%	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-X-1.1	12.2%	46%	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-X-1.2	15.0%	47%	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-X-1.1	23.6%	47%	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-X-1.2	22.5%	47%	0.0
Pli-AMvi_064-Ex1-7E-lcwgs-X-1.1	14.4%	45%	0.1
Pli-AMvi_064-Ex1-7E-lcwgs-X-1.2	14.0%	46%	0.1
Pli-AMvi_065-Ex1-8E-lcwgs-X-1.1	18.5%	44%	0.1
Pli-AMvi_065-Ex1-8E-lcwgs-X-1.2	18.0%	44%	0.1
Pli-AMvi_066-Ex1-9E-lcwgs-X-1.1	11.8%	46%	0.0
Pli-AMvi_066-Ex1-9E-lcwgs-X-1.2	14.5%	47%	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-X-1.1	12.8%	45%	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-X-1.2	12.4%	46%	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-X-1.1	17.0%	47%	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-X-1.2	20.4%	48%	0.0
Pli-AMvi_069-Ex1-12E-lcwgs-X-1.1	31.7%	58%	0.7
Pli-AMvi_069-Ex1-12E-lcwgs-X-1.2	27.3%	58%	0.7
Pli-AMvi_070-Ex1-1G-lcwgs-X-1.1	47.8%	55%	2.3
Pli-AMvi_070-Ex1-1G-lcwgs-X-1.2	41.2%	55%	2.3
Pli-AMvi_071-Ex1-2G-lcwgs-X-1.1	47.9%	55%	2.0
Pli-AMvi_071-Ex1-2G-lcwgs-X-1.2	40.3%	55%	2.0
Pli-AMvi_072-Ex1-3G-lcwgs-X-1.1	10.3%	45%	0.0
Pli-AMvi_072-Ex1-3G-lcwgs-X-1.2	11.5%	46%	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-X-1.1	45.1%	47%	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-X-1.2	43.9%	47%	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-X-1.1	14.0%	46%	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-X-1.2	17.8%	47%	0.0
Pli-AMvi_075-Ex1-6G-lcwgs-X-1.1	50.1%	49%	0.9
Pli-AMvi_075-Ex1-6G-lcwgs-X-1.2	48.6%	49%	0.9
Pli-AMvi_076-Ex1-7F-lcwgs-X-1.1	18.2%	47%	0.1
Pli-AMvi_076-Ex1-7F-lcwgs-X-1.2	17.1%	47%	0.1
Pli-AMvi_077-Ex1-8F-lcwgs-X-1.1	16.5%	46%	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-X-1.2	16.9%	47%	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-X-1.1	14.4%	46%	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-X-1.2	16.4%	47%	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-X-1.1	8.6%	46%	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-X-1.2	11.6%	47%	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-X-1.1	5.3%	45%	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-X-1.2	7.6%	46%	0.0
Pli-AMvi_081-Ex1-12F-lcwgs-X-1.1	26.4%	56%	0.3
Pli-AMvi_081-Ex1-12F-lcwgs-X-1.2	20.8%	56%	0.3
Pli-AMvi_082-Ex1-1H-lcwgs-X-1.1	22.0%	47%	3.1
Pli-AMvi_082-Ex1-1H-lcwgs-X-1.2	21.3%	47%	3.1
Pli-AMvi_083-Ex1-2H-lcwgs-X-1.1	20.5%	45%	3.4
Pli-AMvi_083-Ex1-2H-lcwgs-X-1.2	19.6%	45%	3.4
Pli-AMvi_084-Ex1-3H-lcwgs-X-1.1	19.4%	47%	2.3
Pli-AMvi_084-Ex1-3H-lcwgs-X-1.2	18.3%	48%	2.3
Pli-AMvi_085-Ex1-4H-lcwgs-X-1.1	17.8%	45%	0.7
Pli-AMvi_085-Ex1-4H-lcwgs-X-1.2	16.9%	46%	0.7
Pli-AMvi_086-Ex1-5H-lcwgs-X-1.1	35.8%	46%	1.7
Pli-AMvi_086-Ex1-5H-lcwgs-X-1.2	34.5%	46%	1.7
Pli-AMvi_087-Ex1-6H-lcwgs-X-1.1	13.2%	48%	2.3
Pli-AMvi_087-Ex1-6H-lcwgs-X-1.2	12.3%	49%	2.3
Pli-AMvi_088-Ex1-7G-lcwgs-X-1.1	55.5%	48%	1.6
Pli-AMvi_088-Ex1-7G-lcwgs-X-1.2	54.4%	48%	1.6
Pli-AMvi_089-Ex1-8G-lcwgs-X-1.1	15.0%	46%	0.0
Pli-AMvi_089-Ex1-8G-lcwgs-X-1.2	17.5%	47%	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-X-1.1	18.3%	46%	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-X-1.2	19.9%	47%	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-X-1.1	8.1%	46%	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-X-1.2	10.7%	47%	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-X-1.1	6.5%	45%	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-X-1.2	8.3%	46%	0.0
Pli-AMvi_093-Ex1-12G-lcwgs-X-1.1	45.2%	56%	0.7
Pli-AMvi_093-Ex1-12G-lcwgs-X-1.2	37.0%	57%	0.7
Pli-AMvi_094-Ex1-7H-lcwgs-X-1.1	14.4%	46%	0.9
Pli-AMvi_094-Ex1-7H-lcwgs-X-1.2	13.6%	46%	0.9
Pli-AMvi_095-Ex1-8H-lcwgs-X-1.1	33.5%	47%	0.5
Pli-AMvi_095-Ex1-8H-lcwgs-X-1.2	31.2%	48%	0.5
Pli-AMvi_096-Ex1-9H-lcwgs-X-1.1	27.7%	46%	0.0
Pli-AMvi_096-Ex1-9H-lcwgs-X-1.2	27.2%	47%	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-X-1.1	10.3%	46%	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-X-1.2	11.8%	47%	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-X-1.1	6.0%	45%	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-X-1.2	7.4%	46%	0.0
Pli-AMvi_099-Ex1-12H-lcwgs-X-1.1	57.0%	54%	1.6
Pli-AMvi_099-Ex1-12H-lcwgs-X-1.2	47.3%	54%	1.6
Pli-CMvi_001-Ex1-1B-lcwgs-1-1.1	16.7%	43%	4.8
Pli-CMvi_001-Ex1-1B-lcwgs-1-1.2	14.7%	43%	4.8
Pli-CMvi_002-Ex1-2A-lcwgs-1-1.1	13.3%	43%	6.4
Pli-CMvi_002-Ex1-2A-lcwgs-1-1.2	11.7%	43%	6.4
Pli-CMvi_003-Ex1-2G-lcwgs-X-1.1	23.0%	43%	0.8
Pli-CMvi_003-Ex1-2G-lcwgs-X-1.2	21.8%	44%	0.8
Pli-CMvi_004-Ex1-3F-lcwgs-1-1.1	13.6%	42%	6.1
Pli-CMvi_004-Ex1-3F-lcwgs-1-1.2	11.5%	43%	6.1
Pli-CMvi_005-Ex1-4C-lcwgs-X-1.1	4.9%	43%	0.0
Pli-CMvi_005-Ex1-4C-lcwgs-X-1.2	4.5%	44%	0.0
Pli-CMvi_006-Ex1-5A-lcwgs-X-1.1	7.6%	44%	0.1
Pli-CMvi_006-Ex1-5A-lcwgs-X-1.2	7.1%	44%	0.1
Pli-CMvi_007-Ex1-5G-lcwgs-1-1.1	17.6%	43%	3.4
Pli-CMvi_007-Ex1-5G-lcwgs-1-1.2	15.5%	43%	3.4
Pli-CMvi_013-Ex1-1C-lcwgs-X-1.1	27.2%	44%	3.3
Pli-CMvi_013-Ex1-1C-lcwgs-X-1.2	23.9%	44%	3.3
Pli-CMvi_014-Ex1-2B-lcwgs-X-1.1	6.9%	43%	0.0
Pli-CMvi_014-Ex1-2B-lcwgs-X-1.2	6.1%	44%	0.0
Pli-CMvi_015-Ex1-2H-lcwgs-X-1.1	26.0%	44%	2.7
Pli-CMvi_015-Ex1-2H-lcwgs-X-1.2	24.3%	44%	2.7
Pli-CMvi_020-Ex1-6D-lcwgs-X-1.1	22.4%	43%	5.2
Pli-CMvi_020-Ex1-6D-lcwgs-X-1.2	19.1%	44%	5.2
Pli-CMvi_021-Ex1-6G-lcwgs-X-1.1	9.1%	42%	0.9
Pli-CMvi_021-Ex1-6G-lcwgs-X-1.2	7.7%	43%	0.9
Pli-CMvi_022-Ex1-7B-lcwgs-X-1.1	10.6%	43%	0.1
Pli-CMvi_022-Ex1-7B-lcwgs-X-1.2	9.6%	43%	0.1
Pli-CMvi_023-Ex1-7F-lcwgs-X-1.1	10.7%	43%	1.3
Pli-CMvi_023-Ex1-7F-lcwgs-X-1.2	9.5%	43%	1.3
Pli-CMvi_025-Ex1-1D-lcwgs-X-1.1	84.1%	47%	0.7
Pli-CMvi_025-Ex1-1D-lcwgs-X-1.2	82.9%	47%	0.7
Pli-CMvi_028-Ex1-3G-lcwgs-X-1.1	14.5%	43%	3.4
Pli-CMvi_028-Ex1-3G-lcwgs-X-1.2	12.0%	43%	3.4
Pli-CMvi_030-Ex1-5B-lcwgs-X-1.1	5.5%	43%	0.0
Pli-CMvi_030-Ex1-5B-lcwgs-X-1.2	4.8%	44%	0.0
Pli-CMvi_031-Ex1-5H-lcwgs-X-1.1	24.9%	44%	3.5
Pli-CMvi_031-Ex1-5H-lcwgs-X-1.2	22.0%	44%	3.5
Pli-CMvi_034-Ex1-7C-lcwgs-X-1.1	9.1%	43%	0.3
Pli-CMvi_034-Ex1-7C-lcwgs-X-1.2	8.4%	43%	0.3
Pli-CMvi_037-Ex1-1E-lcwgs-X-1.1	32.6%	44%	3.8
Pli-CMvi_037-Ex1-1E-lcwgs-X-1.2	29.3%	44%	3.8
Pli-CMvi_038-Ex1-2C-lcwgs-X-1.1	13.1%	43%	0.1
Pli-CMvi_038-Ex1-2C-lcwgs-X-1.2	11.7%	43%	0.1
Pli-CMvi_039-Ex1-3A-lcwgs-X-1.1	20.6%	44%	4.2
Pli-CMvi_039-Ex1-3A-lcwgs-X-1.2	18.2%	44%	4.2
Pli-CMvi_040-Ex1-3H-lcwgs-1-1.1	13.7%	43%	4.7
Pli-CMvi_040-Ex1-3H-lcwgs-1-1.2	11.5%	43%	4.7
Pli-CMvi_041-Ex1-4E-lcwgs-1-1.1	13.7%	43%	4.2
Pli-CMvi_041-Ex1-4E-lcwgs-1-1.2	12.0%	43%	4.2
Pli-CMvi_042-Ex1-5C-lcwgs-X-1.1	13.5%	43%	5.4
Pli-CMvi_042-Ex1-5C-lcwgs-X-1.2	11.1%	43%	5.4
Pli-CMvi_047-Ex1-7G-lcwgs-X-1.1	11.1%	43%	1.1
Pli-CMvi_047-Ex1-7G-lcwgs-X-1.2	9.7%	43%	1.1
Pli-CMvi_049-Ex1-1F-lcwgs-1-1.1	17.0%	43%	6.8
Pli-CMvi_049-Ex1-1F-lcwgs-1-1.2	15.1%	43%	6.8
Pli-CMvi_051-Ex1-3B-lcwgs-X-1.1	15.6%	43%	8.3
Pli-CMvi_051-Ex1-3B-lcwgs-X-1.2	13.4%	43%	8.3
Pli-CMvi_053-Ex1-4F-lcwgs-X-1.1	9.1%	43%	0.3
Pli-CMvi_053-Ex1-4F-lcwgs-X-1.2	8.1%	43%	0.3
Pli-CMvi_054-Ex1-5D-lcwgs-X-1.1	12.8%	43%	3.2
Pli-CMvi_054-Ex1-5D-lcwgs-X-1.2	11.4%	43%	3.2
Pli-CMvi_059-Ex1-7H-lcwgs-X-1.1	11.9%	43%	2.8
Pli-CMvi_059-Ex1-7H-lcwgs-X-1.2	10.2%	43%	2.8
Pli-CMvi_060-Ex1-8F-lcwgs-X-1.1	11.1%	43%	0.1
Pli-CMvi_060-Ex1-8F-lcwgs-X-1.2	9.6%	43%	0.1
Pli-CMvi_062-Ex1-2D-lcwgs-1-1.1	15.7%	43%	6.2
Pli-CMvi_062-Ex1-2D-lcwgs-1-1.2	14.4%	43%	6.2
Pli-CMvi_063-Ex1-3C-lcwgs-1-1.1	13.2%	43%	4.1
Pli-CMvi_063-Ex1-3C-lcwgs-1-1.2	11.2%	43%	4.1
Pli-CMvi_064-Ex1-4A-lcwgs-1-1.1	17.4%	43%	5.9
Pli-CMvi_064-Ex1-4A-lcwgs-1-1.2	14.8%	43%	5.9
Pli-CMvi_065-Ex1-4G-lcwgs-X-1.1	18.0%	43%	0.3
Pli-CMvi_065-Ex1-4G-lcwgs-X-1.2	16.7%	44%	0.3
Pli-CMvi_066-Ex1-5E-lcwgs-1-1.1	17.8%	43%	8.2
Pli-CMvi_066-Ex1-5E-lcwgs-1-1.2	15.1%	43%	8.2
Pli-CMvi_066-Ex1-5E-lcwgs-X-1.2	15.1%	43%	8.2
Pli-CMvi_070-Ex1-7D-lcwgs-X-1.1	9.9%	43%	0.1
Pli-CMvi_070-Ex1-7D-lcwgs-X-1.2	9.0%	44%	0.1
Pli-CMvi_071-Ex1-8A-lcwgs-X-1.1	9.5%	44%	0.0
Pli-CMvi_071-Ex1-8A-lcwgs-X-1.2	9.0%	44%	0.0
Pli-CMvi_072-Ex1-8G-lcwgs-X-1.1	12.1%	43%	0.6
Pli-CMvi_072-Ex1-8G-lcwgs-X-1.2	10.4%	43%	0.6
Pli-CMvi_073-Ex1-1G-lcwgs-X-1.1	22.8%	44%	5.0
Pli-CMvi_073-Ex1-1G-lcwgs-X-1.2	20.0%	44%	5.0
Pli-CMvi_074-Ex1-2E-lcwgs-X-1.1	27.7%	43%	0.2
Pli-CMvi_074-Ex1-2E-lcwgs-X-1.2	17.4%	44%	0.2
Pli-CMvi_075-Ex1-3D-lcwgs-X-1.1	8.5%	43%	0.3
Pli-CMvi_075-Ex1-3D-lcwgs-X-1.2	7.7%	43%	0.3
Pli-CMvi_076-Ex1-4B-lcwgs-X-1.1	6.6%	43%	0.0
Pli-CMvi_076-Ex1-4B-lcwgs-X-1.2	5.9%	44%	0.0
Pli-CMvi_078-Ex1-5F-lcwgs-X-1.1	8.0%	43%	0.1
Pli-CMvi_078-Ex1-5F-lcwgs-X-1.2	7.2%	44%	0.1
Pli-CMvi_082-Ex1-7E-lcwgs-X-1.1	13.4%	43%	0.2
Pli-CMvi_082-Ex1-7E-lcwgs-X-1.2	12.3%	43%	0.2
Pli-CMvi_083-Ex1-8B-lcwgs-X-1.1	10.9%	43%	0.0
Pli-CMvi_083-Ex1-8B-lcwgs-X-1.2	9.3%	43%	0.0
Pli-CMvi_084-Ex1-8H-lcwgs-X-1.1	26.3%	44%	1.0
Pli-CMvi_084-Ex1-8H-lcwgs-X-1.2	24.4%	44%	1.0
Pli-CMvi_085-Ex1-1H-lcwgs-X-1.1	14.3%	43%	4.4
Pli-CMvi_085-Ex1-1H-lcwgs-X-1.2	12.4%	43%	4.4
Pli-CMvi_086-Ex1-2F-lcwgs-X-1.1	16.6%	43%	4.6
Pli-CMvi_086-Ex1-2F-lcwgs-X-1.2	14.1%	43%	4.6
Pli-CMvi_087-Ex1-3E-lcwgs-X-1.1	15.3%	43%	6.3
Pli-CMvi_087-Ex1-3E-lcwgs-X-1.2	12.6%	43%	6.3
Pli-CMvi_089-Ex1-4H-lcwgs-X-1.1	15.0%	43%	2.6
Pli-CMvi_089-Ex1-4H-lcwgs-X-1.2	13.2%	43%	2.6
Pli-CMvi_093-Ex1-7A-lcwgs-X-1.1	5.5%	44%	0.0
Pli-CMvi_093-Ex1-7A-lcwgs-X-1.2	5.3%	44%	0.0
Pli-CMvi_095-Ex1-8C-lcwgs-X-1.1	7.5%	43%	0.0
Pli-CMvi_095-Ex1-8C-lcwgs-X-1.2	7.2%	44%	0.0
```
</p>
</details>

## 8. First trim.
`sbatch ../../../pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw_cat fq_fp1`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Pli-AMvi_004-Ex1-1A-lcwgs-X-1	12.2%	51.1%	72.2%	81.0%
Pli-AMvi_005-Ex1-2A-lcwgs-X-1	0.7%	45.4%	77.6%	73.6%
Pli-AMvi_006-Ex1-3A-lcwgs-X-1	1.1%	43.7%	78.8%	78.5%
Pli-AMvi_007-Ex1-4A-lcwgs-X-1	10.5%	40.4%	86.0%	93.4%
Pli-AMvi_008-Ex1-1B-lcwgs-X-1	12.1%	42.5%	82.2%	91.0%
Pli-AMvi_009-Ex1-2B-lcwgs-X-1	1.3%	45.3%	76.0%	76.9%
Pli-AMvi_010-Ex1-7A-lcwgs-X-1	12.2%	47.0%	74.7%	82.9%
Pli-AMvi_011-Ex1-8A-lcwgs-X-1	14.4%	47.4%	77.4%	79.5%
Pli-AMvi_012-Ex1-9A-lcwgs-X-1	14.7%	45.2%	80.8%	83.8%
Pli-AMvi_013-Ex1-10A-lcwgs-X-1	10.0%	39.5%	92.6%	94.4%
Pli-AMvi_014-Ex1-11A-lcwgs-X-1	13.2%	46.9%	79.9%	83.2%
Pli-AMvi_015-Ex1-12A-lcwgs-X-1	1.6%	48.9%	68.0%	59.3%
Pli-AMvi_016-Ex1-3B-lcwgs-X-1	9.6%	42.4%	86.4%	95.5%
Pli-AMvi_017-Ex1-4B-lcwgs-X-1	9.2%	41.5%	88.7%	93.2%
Pli-AMvi_018-Ex1-1C-lcwgs-X-1	9.8%	44.6%	77.7%	88.2%
Pli-AMvi_019-Ex1-2C-lcwgs-X-1	6.5%	44.1%	81.0%	88.0%
Pli-AMvi_020-Ex1-3C-lcwgs-X-1	5.6%	44.7%	47.3%	89.9%
Pli-AMvi_021-Ex1-4C-lcwgs-X-1	9.5%	42.9%	70.3%	96.7%
Pli-AMvi_022-Ex1-7B-lcwgs-X-1	18.9%	52.2%	63.2%	61.5%
Pli-AMvi_023-Ex1-8B-lcwgs-X-1	11.8%	45.3%	61.0%	88.7%
Pli-AMvi_024-Ex1-9B-lcwgs-X-1	24.6%	51.4%	68.2%	68.2%
Pli-AMvi_025-Ex1-10B-lcwgs-X-1	9.1%	40.2%	89.1%	93.5%
Pli-AMvi_026-Ex1-11B-lcwgs-X-1	10.3%	41.9%	94.1%	95.7%
Pli-AMvi_027-Ex1-12B-lcwgs-X-1	1.8%	48.4%	73.4%	60.6%
Pli-AMvi_028-Ex1-1D-lcwgs-X-1	4.5%	46.8%	71.2%	76.7%
Pli-AMvi_029-Ex1-2D-lcwgs-X-1	10.1%	42.2%	85.3%	94.2%
Pli-AMvi_030-Ex1-3D-lcwgs-X-1	9.5%	43.7%	77.6%	94.5%
Pli-AMvi_031-Ex1-4D-lcwgs-X-1	3.5%	46.1%	72.7%	73.7%
Pli-AMvi_032-Ex1-5C-lcwgs-X-1	10.5%	42.6%	71.4%	95.8%
Pli-AMvi_033-Ex1-6C-lcwgs-X-1	10.9%	43.9%	70.9%	97.5%
Pli-AMvi_034-Ex1-7C-lcwgs-X-1	4.2%	46.0%	26.2%	90.0%
Pli-AMvi_035-Ex1-8C-lcwgs-X-1	8.2%	42.5%	79.9%	94.4%
Pli-AMvi_036-Ex1-9C-lcwgs-X-1	30.3%	48.5%	74.8%	49.2%
Pli-AMvi_037-Ex1-10C-lcwgs-X-1	9.9%	38.9%	91.4%	96.5%
Pli-AMvi_038-Ex1-11C-lcwgs-X-1	10.4%	44.0%	83.8%	91.1%
Pli-AMvi_039-Ex1-12C-lcwgs-X-1	35.8%	57.6%	91.5%	14.1%
Pli-AMvi_040-Ex1-5A-lcwgs-X-1	13.9%	47.2%	79.0%	80.5%
Pli-AMvi_041-Ex1-6A-lcwgs-X-1	13.2%	44.0%	82.3%	88.4%
Pli-AMvi_042-Ex1-5B-lcwgs-X-1	1.0%	45.4%	70.3%	72.8%
Pli-AMvi_043-Ex1-6B-lcwgs-X-1	15.9%	50.7%	66.9%	79.3%
Pli-AMvi_044-Ex1-5D-lcwgs-X-1	9.6%	44.6%	40.9%	96.4%
Pli-AMvi_045-Ex1-6D-lcwgs-X-1	8.9%	46.6%	50.9%	90.0%
Pli-AMvi_046-Ex1-1E-lcwgs-X-1	10.7%	45.4%	35.4%	92.2%
Pli-AMvi_047-Ex1-2E-lcwgs-X-1	9.7%	41.0%	85.0%	95.0%
Pli-AMvi_048-Ex1-3E-lcwgs-X-1	0.7%	43.0%	83.2%	76.9%
Pli-AMvi_049-Ex1-4E-lcwgs-X-1	0.6%	45.2%	81.2%	69.1%
Pli-AMvi_050-Ex1-5E-lcwgs-X-1	1.0%	44.9%	81.4%	65.0%
Pli-AMvi_051-Ex1-6E-lcwgs-X-1	9.1%	46.9%	36.1%	90.5%
Pli-AMvi_052-Ex1-7D-lcwgs-X-1	9.8%	42.9%	86.7%	95.4%
Pli-AMvi_053-Ex1-8D-lcwgs-X-1	0.9%	44.2%	76.0%	69.9%
Pli-AMvi_054-Ex1-9D-lcwgs-X-1	9.6%	44.6%	85.5%	93.5%
Pli-AMvi_055-Ex1-10D-lcwgs-X-1	8.4%	42.1%	90.2%	96.1%
Pli-AMvi_056-Ex1-11D-lcwgs-X-1	0.9%	43.7%	84.2%	73.7%
Pli-AMvi_057-Ex1-12D-lcwgs-X-1	3.3%	48.6%	72.0%	58.0%
Pli-AMvi_058-Ex1-1F-lcwgs-X-1	33.6%	58.1%	79.3%	26.3%
Pli-AMvi_059-Ex1-2F-lcwgs-X-1	1.1%	44.7%	81.8%	76.2%
Pli-AMvi_060-Ex1-3F-lcwgs-X-1	0.8%	43.5%	83.5%	78.9%
Pli-AMvi_061-Ex1-4F-lcwgs-X-1	0.7%	45.6%	80.8%	69.2%
Pli-AMvi_062-Ex1-5F-lcwgs-X-1	1.2%	45.5%	78.9%	67.1%
Pli-AMvi_063-Ex1-6F-lcwgs-X-1	7.1%	46.0%	72.0%	84.9%
Pli-AMvi_064-Ex1-7E-lcwgs-X-1	9.6%	42.6%	86.7%	95.5%
Pli-AMvi_065-Ex1-8E-lcwgs-X-1	9.5%	39.7%	86.7%	96.1%
Pli-AMvi_066-Ex1-9E-lcwgs-X-1	1.1%	44.4%	78.8%	67.9%
Pli-AMvi_067-Ex1-10E-lcwgs-X-1	7.6%	43.4%	90.3%	92.9%
Pli-AMvi_068-Ex1-1E-lcwgs-X-1	2.0%	46.4%	71.9%	60.8%
Pli-AMvi_069-Ex1-12E-lcwgs-X-1	26.1%	60.0%	88.7%	16.6%
Pli-AMvi_070-Ex1-1G-lcwgs-X-1	38.1%	57.4%	83.2%	22.9%
Pli-AMvi_071-Ex1-2G-lcwgs-X-1	41.7%	56.5%	85.4%	19.2%
Pli-AMvi_072-Ex1-3G-lcwgs-X-1	0.8%	43.3%	82.2%	79.4%
Pli-AMvi_073-Ex1-4G-lcwgs-X-1	6.2%	45.6%	51.4%	84.8%
Pli-AMvi_074-Ex1-5G-lcwgs-X-1	1.3%	45.2%	77.0%	71.2%
Pli-AMvi_075-Ex1-6G-lcwgs-X-1	18.2%	51.1%	58.8%	76.0%
Pli-AMvi_076-Ex1-7F-lcwgs-X-1	8.8%	46.3%	82.7%	94.1%
Pli-AMvi_077-Ex1-8F-lcwgs-X-1	3.7%	45.4%	77.0%	77.9%
Pli-AMvi_078-Ex1-9F-lcwgs-X-1	1.0%	44.9%	76.9%	70.3%
Pli-AMvi_079-Ex1-10F-lcwgs-X-1	1.6%	45.3%	83.1%	64.5%
Pli-AMvi_080-Ex1-11F-lcwgs-X-1	0.9%	43.3%	88.6%	76.1%
Pli-AMvi_081-Ex1-12F-lcwgs-X-1	24.6%	56.7%	94.0%	8.4%
Pli-AMvi_082-Ex1-1H-lcwgs-X-1	11.4%	46.7%	82.8%	90.3%
Pli-AMvi_083-Ex1-2H-lcwgs-X-1	10.6%	41.5%	84.7%	98.0%
Pli-AMvi_084-Ex1-3H-lcwgs-X-1	12.0%	47.3%	72.2%	89.9%
Pli-AMvi_085-Ex1-4H-lcwgs-X-1	10.3%	43.0%	77.4%	96.7%
Pli-AMvi_086-Ex1-5H-lcwgs-X-1	11.4%	43.6%	69.3%	95.3%
Pli-AMvi_087-Ex1-6H-lcwgs-X-1	12.5%	51.1%	42.0%	88.0%
Pli-AMvi_088-Ex1-7G-lcwgs-X-1	12.9%	48.3%	49.6%	86.3%
Pli-AMvi_089-Ex1-8G-lcwgs-X-1	0.9%	44.5%	76.3%	73.6%
Pli-AMvi_090-Ex1-9G-lcwgs-X-1	0.9%	45.4%	73.0%	70.8%
Pli-AMvi_091-Ex1-10G-lcwgs-X-1	1.6%	45.7%	82.5%	62.9%
Pli-AMvi_092-Ex1-11G-lcwgs-X-1	1.0%	43.8%	87.5%	76.4%
Pli-AMvi_093-Ex1-12G-lcwgs-X-1	41.2%	57.4%	93.0%	9.1%
Pli-AMvi_094-Ex1-7H-lcwgs-X-1	9.8%	43.9%	70.7%	97.1%
Pli-AMvi_095-Ex1-8H-lcwgs-X-1	10.2%	47.7%	61.8%	94.8%
Pli-AMvi_096-Ex1-9H-lcwgs-X-1	3.3%	44.8%	63.8%	78.7%
Pli-AMvi_097-Ex1-10H-lcwgs-X-1	1.2%	43.9%	81.9%	78.4%
Pli-AMvi_098-Ex1-11H-lcwgs-X-1	0.7%	43.3%	87.5%	78.1%
Pli-AMvi_099-Ex1-12H-lcwgs-X-1	49.5%	55.4%	88.1%	16.1%
Pli-CMvi_001-Ex1-1B-lcwgs-1-1	11.3%	42.8%	91.1%	17.7%
Pli-CMvi_002-Ex1-2A-lcwgs-1-1	10.0%	42.8%	93.9%	23.1%
Pli-CMvi_003-Ex1-2G-lcwgs-X-1	8.9%	42.4%	81.2%	41.5%
Pli-CMvi_004-Ex1-3F-lcwgs-1-1	11.8%	42.5%	95.5%	18.8%
Pli-CMvi_005-Ex1-4C-lcwgs-X-1	0.4%	42.8%	89.7%	45.1%
Pli-CMvi_006-Ex1-5A-lcwgs-X-1	1.5%	43.0%	87.7%	42.4%
Pli-CMvi_007-Ex1-5G-lcwgs-1-1	10.7%	42.5%	88.1%	31.2%
Pli-CMvi_013-Ex1-1C-lcwgs-X-1	12.5%	43.7%	81.2%	17.8%
Pli-CMvi_014-Ex1-2B-lcwgs-X-1	1.2%	42.7%	89.2%	42.1%
Pli-CMvi_015-Ex1-2H-lcwgs-X-1	9.7%	43.0%	80.0%	32.0%
Pli-CMvi_020-Ex1-6D-lcwgs-X-1	14.5%	43.1%	88.7%	23.4%
Pli-CMvi_021-Ex1-6G-lcwgs-X-1	8.2%	42.4%	94.8%	16.8%
Pli-CMvi_022-Ex1-7B-lcwgs-X-1	6.1%	42.3%	92.0%	41.1%
Pli-CMvi_023-Ex1-7F-lcwgs-X-1	8.8%	42.2%	94.1%	35.3%
Pli-CMvi_025-Ex1-1D-lcwgs-X-1	5.9%	43.4%	15.6%	86.1%
Pli-CMvi_028-Ex1-3G-lcwgs-X-1	12.8%	42.9%	94.8%	14.1%
Pli-CMvi_030-Ex1-5B-lcwgs-X-1	0.9%	42.9%	88.7%	38.9%
Pli-CMvi_031-Ex1-5H-lcwgs-X-1	12.6%	43.4%	81.5%	34.9%
Pli-CMvi_034-Ex1-7C-lcwgs-X-1	6.6%	42.3%	93.4%	51.2%
Pli-CMvi_037-Ex1-1E-lcwgs-X-1	12.8%	43.0%	75.1%	24.4%
Pli-CMvi_038-Ex1-2C-lcwgs-X-1	6.9%	42.5%	90.9%	28.9%
Pli-CMvi_039-Ex1-3A-lcwgs-X-1	11.3%	43.4%	87.3%	23.2%
Pli-CMvi_040-Ex1-3H-lcwgs-1-1	11.3%	42.7%	94.5%	18.3%
Pli-CMvi_041-Ex1-4E-lcwgs-1-1	9.3%	42.6%	92.8%	22.4%
Pli-CMvi_042-Ex1-5C-lcwgs-X-1	10.5%	42.9%	93.7%	11.4%
Pli-CMvi_047-Ex1-7G-lcwgs-X-1	8.6%	42.3%	93.1%	33.3%
Pli-CMvi_049-Ex1-1F-lcwgs-1-1	11.6%	42.7%	92.0%	18.3%
Pli-CMvi_051-Ex1-3B-lcwgs-X-1	12.2%	43.0%	94.0%	17.5%
Pli-CMvi_053-Ex1-4F-lcwgs-X-1	7.0%	42.4%	92.7%	28.8%
Pli-CMvi_054-Ex1-5D-lcwgs-X-1	9.2%	42.5%	93.2%	24.4%
Pli-CMvi_059-Ex1-7H-lcwgs-X-1	9.6%	42.8%	94.5%	20.5%
Pli-CMvi_060-Ex1-8F-lcwgs-X-1	8.0%	42.5%	93.1%	23.1%
Pli-CMvi_062-Ex1-2D-lcwgs-1-1	9.5%	42.5%	91.4%	28.5%
Pli-CMvi_063-Ex1-3C-lcwgs-1-1	10.5%	42.8%	93.9%	14.7%
Pli-CMvi_064-Ex1-4A-lcwgs-1-1	10.8%	43.1%	90.0%	12.2%
Pli-CMvi_065-Ex1-4G-lcwgs-X-1	7.0%	42.7%	84.1%	38.6%
Pli-CMvi_066-Ex1-5E-lcwgs-1-1	13.6%	43.2%	94.4%	14.5%
Pli-CMvi_070-Ex1-7D-lcwgs-X-1	5.0%	42.5%	91.5%	42.3%
Pli-CMvi_071-Ex1-8A-lcwgs-X-1	2.9%	43.2%	87.1%	38.9%
Pli-CMvi_072-Ex1-8G-lcwgs-X-1	8.9%	42.8%	91.3%	19.8%
Pli-CMvi_073-Ex1-1G-lcwgs-X-1	12.9%	44.0%	91.7%	19.8%
Pli-CMvi_074-Ex1-2E-lcwgs-X-1	6.7%	42.7%	82.8%	35.7%
Pli-CMvi_075-Ex1-3D-lcwgs-X-1	5.3%	42.5%	92.6%	42.7%
Pli-CMvi_076-Ex1-4B-lcwgs-X-1	2.8%	42.7%	91.0%	37.6%
Pli-CMvi_078-Ex1-5F-lcwgs-X-1	1.4%	42.6%	87.0%	34.0%
Pli-CMvi_082-Ex1-7E-lcwgs-X-1	7.3%	42.2%	92.4%	35.8%
Pli-CMvi_083-Ex1-8B-lcwgs-X-1	7.2%	42.6%	91.9%	23.5%
Pli-CMvi_084-Ex1-8H-lcwgs-X-1	8.5%	42.5%	77.0%	45.1%
Pli-CMvi_085-Ex1-1H-lcwgs-X-1	10.6%	42.7%	93.3%	19.2%
Pli-CMvi_086-Ex1-2F-lcwgs-X-1	11.0%	43.0%	90.7%	13.2%
Pli-CMvi_087-Ex1-3E-lcwgs-X-1	11.6%	42.9%	92.0%	11.6%
Pli-CMvi_089-Ex1-4H-lcwgs-X-1	9.4%	42.8%	90.5%	19.5%
Pli-CMvi_093-Ex1-7A-lcwgs-X-1	1.0%	42.7%	90.5%	50.2%
Pli-CMvi_095-Ex1-8C-lcwgs-X-1	1.0%	42.6%	86.5%	41.5%
```
</p>
</details>

## 9. Remove duplicates with clumpify.

### 9a. Remove duplicates.
`bash ../../../pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/hpc-0351 20`

### 9b. Check duplicate removal success.
"Clumpify Successfully worked on all samples"

### 9c. Generate metadata on deduplicated FASTQ files.
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report"  "fq.gz"`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	Length	M Seqs
Pli-AMvi_004-Ex1-1A-lcwgs-X-1.clmp.r1	3.7%	51%	82 bp	0.3
Pli-AMvi_004-Ex1-1A-lcwgs-X-1.clmp.r2	3.1%	51%	82 bp	0.3
Pli-AMvi_005-Ex1-2A-lcwgs-X-1.clmp.r1	2.7%	45%	86 bp	0.0
Pli-AMvi_005-Ex1-2A-lcwgs-X-1.clmp.r2	4.1%	45%	86 bp	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-X-1.clmp.r1	2.4%	43%	79 bp	0.0
Pli-AMvi_006-Ex1-3A-lcwgs-X-1.clmp.r2	3.2%	43%	79 bp	0.0
Pli-AMvi_007-Ex1-4A-lcwgs-X-1.clmp.r1	2.5%	40%	71 bp	0.1
Pli-AMvi_007-Ex1-4A-lcwgs-X-1.clmp.r2	2.3%	40%	71 bp	0.1
Pli-AMvi_008-Ex1-1B-lcwgs-X-1.clmp.r1	3.4%	42%	75 bp	0.3
Pli-AMvi_008-Ex1-1B-lcwgs-X-1.clmp.r2	2.9%	42%	75 bp	0.3
Pli-AMvi_009-Ex1-2B-lcwgs-X-1.clmp.r1	2.7%	45%	83 bp	0.0
Pli-AMvi_009-Ex1-2B-lcwgs-X-1.clmp.r2	4.1%	45%	83 bp	0.0
Pli-AMvi_010-Ex1-7A-lcwgs-X-1.clmp.r1	2.0%	46%	87 bp	1.0
Pli-AMvi_010-Ex1-7A-lcwgs-X-1.clmp.r2	1.7%	46%	87 bp	1.0
Pli-AMvi_011-Ex1-8A-lcwgs-X-1.clmp.r1	2.8%	47%	90 bp	1.5
Pli-AMvi_011-Ex1-8A-lcwgs-X-1.clmp.r2	2.4%	47%	90 bp	1.5
Pli-AMvi_012-Ex1-9A-lcwgs-X-1.clmp.r1	2.5%	44%	86 bp	0.8
Pli-AMvi_012-Ex1-9A-lcwgs-X-1.clmp.r2	2.0%	44%	86 bp	0.8
Pli-AMvi_013-Ex1-10A-lcwgs-X-1.clmp.r1	1.9%	39%	74 bp	0.3
Pli-AMvi_013-Ex1-10A-lcwgs-X-1.clmp.r2	1.6%	39%	74 bp	0.3
Pli-AMvi_014-Ex1-11A-lcwgs-X-1.clmp.r1	15.3%	46%	81 bp	0.2
Pli-AMvi_014-Ex1-11A-lcwgs-X-1.clmp.r2	13.4%	46%	81 bp	0.2
Pli-AMvi_015-Ex1-12A-lcwgs-X-1.clmp.r1	0.7%	48%	108 bp	0.0
Pli-AMvi_015-Ex1-12A-lcwgs-X-1.clmp.r2	0.7%	49%	108 bp	0.0
Pli-AMvi_016-Ex1-3B-lcwgs-X-1.clmp.r1	1.2%	42%	68 bp	0.1
Pli-AMvi_016-Ex1-3B-lcwgs-X-1.clmp.r2	1.0%	42%	68 bp	0.1
Pli-AMvi_017-Ex1-4B-lcwgs-X-1.clmp.r1	2.8%	41%	67 bp	0.1
Pli-AMvi_017-Ex1-4B-lcwgs-X-1.clmp.r2	2.4%	41%	67 bp	0.1
Pli-AMvi_018-Ex1-1C-lcwgs-X-1.clmp.r1	5.5%	44%	69 bp	0.0
Pli-AMvi_018-Ex1-1C-lcwgs-X-1.clmp.r2	4.9%	44%	69 bp	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-X-1.clmp.r1	2.8%	44%	66 bp	0.0
Pli-AMvi_019-Ex1-2C-lcwgs-X-1.clmp.r2	2.8%	44%	66 bp	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-X-1.clmp.r1	2.4%	44%	68 bp	0.0
Pli-AMvi_020-Ex1-3C-lcwgs-X-1.clmp.r2	3.1%	44%	68 bp	0.0
Pli-AMvi_021-Ex1-4C-lcwgs-X-1.clmp.r1	1.0%	42%	61 bp	0.2
Pli-AMvi_021-Ex1-4C-lcwgs-X-1.clmp.r2	1.0%	42%	61 bp	0.2
Pli-AMvi_022-Ex1-7B-lcwgs-X-1.clmp.r1	5.9%	51%	123 bp	1.8
Pli-AMvi_022-Ex1-7B-lcwgs-X-1.clmp.r2	4.6%	51%	122 bp	1.8
Pli-AMvi_023-Ex1-8B-lcwgs-X-1.clmp.r1	2.2%	45%	82 bp	0.6
Pli-AMvi_023-Ex1-8B-lcwgs-X-1.clmp.r2	1.9%	45%	82 bp	0.6
Pli-AMvi_024-Ex1-9B-lcwgs-X-1.clmp.r1	6.8%	50%	102 bp	1.2
Pli-AMvi_024-Ex1-9B-lcwgs-X-1.clmp.r2	5.4%	50%	102 bp	1.2
Pli-AMvi_025-Ex1-10B-lcwgs-X-1.clmp.r1	2.2%	40%	68 bp	0.1
Pli-AMvi_025-Ex1-10B-lcwgs-X-1.clmp.r2	1.9%	40%	68 bp	0.1
Pli-AMvi_026-Ex1-11B-lcwgs-X-1.clmp.r1	1.4%	41%	67 bp	2.2
Pli-AMvi_026-Ex1-11B-lcwgs-X-1.clmp.r2	1.3%	41%	67 bp	2.2
Pli-AMvi_027-Ex1-12B-lcwgs-X-1.clmp.r1	0.3%	48%	104 bp	0.0
Pli-AMvi_027-Ex1-12B-lcwgs-X-1.clmp.r2	0.2%	48%	104 bp	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-X-1.clmp.r1	3.2%	46%	81 bp	0.0
Pli-AMvi_028-Ex1-1D-lcwgs-X-1.clmp.r2	4.9%	47%	81 bp	0.0
Pli-AMvi_029-Ex1-2D-lcwgs-X-1.clmp.r1	2.2%	42%	68 bp	0.7
Pli-AMvi_029-Ex1-2D-lcwgs-X-1.clmp.r2	2.2%	42%	68 bp	0.7
Pli-AMvi_030-Ex1-3D-lcwgs-X-1.clmp.r1	2.8%	43%	62 bp	0.1
Pli-AMvi_030-Ex1-3D-lcwgs-X-1.clmp.r2	2.4%	43%	62 bp	0.1
Pli-AMvi_031-Ex1-4D-lcwgs-X-1.clmp.r1	5.6%	45%	81 bp	0.0
Pli-AMvi_031-Ex1-4D-lcwgs-X-1.clmp.r2	6.9%	46%	81 bp	0.0
Pli-AMvi_032-Ex1-5C-lcwgs-X-1.clmp.r1	1.1%	42%	69 bp	0.7
Pli-AMvi_032-Ex1-5C-lcwgs-X-1.clmp.r2	1.1%	42%	69 bp	0.7
Pli-AMvi_033-Ex1-6C-lcwgs-X-1.clmp.r1	1.0%	43%	67 bp	1.0
Pli-AMvi_033-Ex1-6C-lcwgs-X-1.clmp.r2	0.8%	43%	67 bp	1.0
Pli-AMvi_034-Ex1-7C-lcwgs-X-1.clmp.r1	2.3%	45%	77 bp	0.0
Pli-AMvi_034-Ex1-7C-lcwgs-X-1.clmp.r2	3.6%	46%	77 bp	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-X-1.clmp.r1	1.0%	42%	62 bp	0.0
Pli-AMvi_035-Ex1-8C-lcwgs-X-1.clmp.r2	1.2%	42%	62 bp	0.0
Pli-AMvi_036-Ex1-9C-lcwgs-X-1.clmp.r1	9.8%	47%	121 bp	2.6
Pli-AMvi_036-Ex1-9C-lcwgs-X-1.clmp.r2	7.4%	48%	121 bp	2.6
Pli-AMvi_037-Ex1-10C-lcwgs-X-1.clmp.r1	1.2%	38%	68 bp	0.7
Pli-AMvi_037-Ex1-10C-lcwgs-X-1.clmp.r2	1.0%	38%	68 bp	0.7
Pli-AMvi_038-Ex1-11C-lcwgs-X-1.clmp.r1	3.4%	43%	71 bp	0.3
Pli-AMvi_038-Ex1-11C-lcwgs-X-1.clmp.r2	3.3%	43%	71 bp	0.3
Pli-AMvi_039-Ex1-12C-lcwgs-X-1.clmp.r1	16.1%	57%	145 bp	0.3
Pli-AMvi_039-Ex1-12C-lcwgs-X-1.clmp.r2	11.0%	57%	145 bp	0.3
Pli-AMvi_040-Ex1-5A-lcwgs-X-1.clmp.r1	2.8%	46%	92 bp	1.5
Pli-AMvi_040-Ex1-5A-lcwgs-X-1.clmp.r2	2.2%	47%	92 bp	1.5
Pli-AMvi_041-Ex1-6A-lcwgs-X-1.clmp.r1	1.9%	43%	83 bp	2.1
Pli-AMvi_041-Ex1-6A-lcwgs-X-1.clmp.r2	1.7%	43%	83 bp	2.1
Pli-AMvi_042-Ex1-5B-lcwgs-X-1.clmp.r1	2.4%	45%	89 bp	0.0
Pli-AMvi_042-Ex1-5B-lcwgs-X-1.clmp.r2	4.2%	45%	89 bp	0.0
Pli-AMvi_043-Ex1-6B-lcwgs-X-1.clmp.r1	3.2%	50%	94 bp	1.3
Pli-AMvi_043-Ex1-6B-lcwgs-X-1.clmp.r2	2.6%	50%	94 bp	1.3
Pli-AMvi_044-Ex1-5D-lcwgs-X-1.clmp.r1	1.1%	44%	61 bp	0.1
Pli-AMvi_044-Ex1-5D-lcwgs-X-1.clmp.r2	1.1%	44%	61 bp	0.1
Pli-AMvi_045-Ex1-6D-lcwgs-X-1.clmp.r1	3.8%	46%	63 bp	0.0
Pli-AMvi_045-Ex1-6D-lcwgs-X-1.clmp.r2	3.6%	46%	63 bp	0.0
Pli-AMvi_046-Ex1-1E-lcwgs-X-1.clmp.r1	2.2%	45%	87 bp	0.4
Pli-AMvi_046-Ex1-1E-lcwgs-X-1.clmp.r2	2.0%	45%	87 bp	0.4
Pli-AMvi_047-Ex1-2E-lcwgs-X-1.clmp.r1	1.7%	40%	68 bp	0.1
Pli-AMvi_047-Ex1-2E-lcwgs-X-1.clmp.r2	1.5%	40%	68 bp	0.1
Pli-AMvi_048-Ex1-3E-lcwgs-X-1.clmp.r1	1.2%	42%	81 bp	0.0
Pli-AMvi_048-Ex1-3E-lcwgs-X-1.clmp.r2	2.7%	43%	81 bp	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-X-1.clmp.r1	2.0%	44%	90 bp	0.0
Pli-AMvi_049-Ex1-4E-lcwgs-X-1.clmp.r2	5.5%	45%	89 bp	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-X-1.clmp.r1	2.1%	44%	94 bp	0.0
Pli-AMvi_050-Ex1-5E-lcwgs-X-1.clmp.r2	7.1%	45%	94 bp	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-X-1.clmp.r1	3.1%	46%	66 bp	0.0
Pli-AMvi_051-Ex1-6E-lcwgs-X-1.clmp.r2	3.3%	47%	66 bp	0.0
Pli-AMvi_052-Ex1-7D-lcwgs-X-1.clmp.r1	1.9%	42%	67 bp	0.4
Pli-AMvi_052-Ex1-7D-lcwgs-X-1.clmp.r2	1.8%	42%	67 bp	0.4
Pli-AMvi_053-Ex1-8D-lcwgs-X-1.clmp.r1	2.7%	43%	89 bp	0.0
Pli-AMvi_053-Ex1-8D-lcwgs-X-1.clmp.r2	5.3%	44%	89 bp	0.0
Pli-AMvi_054-Ex1-9D-lcwgs-X-1.clmp.r1	2.5%	44%	57 bp	0.0
Pli-AMvi_054-Ex1-9D-lcwgs-X-1.clmp.r2	2.3%	44%	57 bp	0.0
Pli-AMvi_055-Ex1-10D-lcwgs-X-1.clmp.r1	1.9%	42%	62 bp	0.1
Pli-AMvi_055-Ex1-10D-lcwgs-X-1.clmp.r2	1.5%	42%	62 bp	0.1
Pli-AMvi_056-Ex1-11D-lcwgs-X-1.clmp.r1	2.5%	43%	86 bp	0.0
Pli-AMvi_056-Ex1-11D-lcwgs-X-1.clmp.r2	4.4%	44%	85 bp	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-X-1.clmp.r1	0.7%	48%	112 bp	0.0
Pli-AMvi_057-Ex1-12D-lcwgs-X-1.clmp.r2	0.3%	48%	111 bp	0.0
Pli-AMvi_058-Ex1-1F-lcwgs-X-1.clmp.r1	13.9%	57%	144 bp	0.9
Pli-AMvi_058-Ex1-1F-lcwgs-X-1.clmp.r2	10.0%	58%	144 bp	0.9
Pli-AMvi_059-Ex1-2F-lcwgs-X-1.clmp.r1	1.7%	44%	85 bp	0.0
Pli-AMvi_059-Ex1-2F-lcwgs-X-1.clmp.r2	2.9%	44%	85 bp	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-X-1.clmp.r1	1.2%	43%	80 bp	0.0
Pli-AMvi_060-Ex1-3F-lcwgs-X-1.clmp.r2	2.9%	43%	80 bp	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-X-1.clmp.r1	2.0%	45%	91 bp	0.0
Pli-AMvi_061-Ex1-4F-lcwgs-X-1.clmp.r2	5.3%	45%	90 bp	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-X-1.clmp.r1	2.7%	45%	93 bp	0.0
Pli-AMvi_062-Ex1-5F-lcwgs-X-1.clmp.r2	5.8%	45%	93 bp	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-X-1.clmp.r1	3.3%	46%	65 bp	0.0
Pli-AMvi_063-Ex1-6F-lcwgs-X-1.clmp.r2	2.9%	46%	65 bp	0.0
Pli-AMvi_064-Ex1-7E-lcwgs-X-1.clmp.r1	1.8%	42%	68 bp	0.1
Pli-AMvi_064-Ex1-7E-lcwgs-X-1.clmp.r2	1.4%	42%	68 bp	0.1
Pli-AMvi_065-Ex1-8E-lcwgs-X-1.clmp.r1	1.2%	39%	66 bp	0.1
Pli-AMvi_065-Ex1-8E-lcwgs-X-1.clmp.r2	1.0%	39%	66 bp	0.1
Pli-AMvi_066-Ex1-9E-lcwgs-X-1.clmp.r1	2.6%	44%	93 bp	0.0
Pli-AMvi_066-Ex1-9E-lcwgs-X-1.clmp.r2	5.3%	44%	92 bp	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-X-1.clmp.r1	2.1%	43%	69 bp	0.0
Pli-AMvi_067-Ex1-10E-lcwgs-X-1.clmp.r2	2.0%	43%	69 bp	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-X-1.clmp.r1	4.8%	45%	100 bp	0.0
Pli-AMvi_068-Ex1-1E-lcwgs-X-1.clmp.r2	8.7%	46%	99 bp	0.0
Pli-AMvi_069-Ex1-12E-lcwgs-X-1.clmp.r1	9.6%	59%	146 bp	0.5
Pli-AMvi_069-Ex1-12E-lcwgs-X-1.clmp.r2	6.9%	59%	145 bp	0.5
Pli-AMvi_070-Ex1-1G-lcwgs-X-1.clmp.r1	16.3%	57%	144 bp	1.4
Pli-AMvi_070-Ex1-1G-lcwgs-X-1.clmp.r2	11.6%	57%	143 bp	1.4
Pli-AMvi_071-Ex1-2G-lcwgs-X-1.clmp.r1	18.0%	56%	145 bp	1.3
Pli-AMvi_071-Ex1-2G-lcwgs-X-1.clmp.r2	12.8%	56%	144 bp	1.3
Pli-AMvi_072-Ex1-3G-lcwgs-X-1.clmp.r1	0.9%	43%	80 bp	0.0
Pli-AMvi_072-Ex1-3G-lcwgs-X-1.clmp.r2	2.3%	43%	80 bp	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-X-1.clmp.r1	2.2%	45%	72 bp	0.0
Pli-AMvi_073-Ex1-4G-lcwgs-X-1.clmp.r2	3.2%	45%	72 bp	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-X-1.clmp.r1	1.6%	44%	91 bp	0.0
Pli-AMvi_074-Ex1-5G-lcwgs-X-1.clmp.r2	4.7%	45%	91 bp	0.0
Pli-AMvi_075-Ex1-6G-lcwgs-X-1.clmp.r1	4.4%	50%	101 bp	0.5
Pli-AMvi_075-Ex1-6G-lcwgs-X-1.clmp.r2	3.4%	50%	101 bp	0.5
Pli-AMvi_076-Ex1-7F-lcwgs-X-1.clmp.r1	2.2%	46%	57 bp	0.0
Pli-AMvi_076-Ex1-7F-lcwgs-X-1.clmp.r2	1.6%	46%	57 bp	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-X-1.clmp.r1	2.5%	45%	77 bp	0.0
Pli-AMvi_077-Ex1-8F-lcwgs-X-1.clmp.r2	4.1%	45%	77 bp	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-X-1.clmp.r1	2.2%	44%	92 bp	0.0
Pli-AMvi_078-Ex1-9F-lcwgs-X-1.clmp.r2	4.9%	45%	92 bp	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-X-1.clmp.r1	2.5%	44%	96 bp	0.0
Pli-AMvi_079-Ex1-10F-lcwgs-X-1.clmp.r2	5.3%	45%	96 bp	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-X-1.clmp.r1	1.9%	43%	84 bp	0.0
Pli-AMvi_080-Ex1-11F-lcwgs-X-1.clmp.r2	3.7%	43%	84 bp	0.0
Pli-AMvi_081-Ex1-12F-lcwgs-X-1.clmp.r1	11.2%	56%	147 bp	0.2
Pli-AMvi_081-Ex1-12F-lcwgs-X-1.clmp.r2	7.4%	56%	146 bp	0.2
Pli-AMvi_082-Ex1-1H-lcwgs-X-1.clmp.r1	2.1%	46%	73 bp	2.1
Pli-AMvi_082-Ex1-1H-lcwgs-X-1.clmp.r2	1.8%	46%	73 bp	2.1
Pli-AMvi_083-Ex1-2H-lcwgs-X-1.clmp.r1	0.9%	41%	61 bp	2.3
Pli-AMvi_083-Ex1-2H-lcwgs-X-1.clmp.r2	0.8%	41%	61 bp	2.3
Pli-AMvi_084-Ex1-3H-lcwgs-X-1.clmp.r1	3.1%	47%	75 bp	1.4
Pli-AMvi_084-Ex1-3H-lcwgs-X-1.clmp.r2	2.9%	47%	75 bp	1.4
Pli-AMvi_085-Ex1-4H-lcwgs-X-1.clmp.r1	1.5%	42%	60 bp	0.4
Pli-AMvi_085-Ex1-4H-lcwgs-X-1.clmp.r2	1.5%	42%	60 bp	0.4
Pli-AMvi_086-Ex1-5H-lcwgs-X-1.clmp.r1	1.1%	43%	71 bp	1.0
Pli-AMvi_086-Ex1-5H-lcwgs-X-1.clmp.r2	1.0%	43%	71 bp	1.0
Pli-AMvi_087-Ex1-6H-lcwgs-X-1.clmp.r1	2.7%	50%	88 bp	0.8
Pli-AMvi_087-Ex1-6H-lcwgs-X-1.clmp.r2	2.3%	51%	88 bp	0.8
Pli-AMvi_088-Ex1-7G-lcwgs-X-1.clmp.r1	2.8%	48%	91 bp	0.7
Pli-AMvi_088-Ex1-7G-lcwgs-X-1.clmp.r2	2.4%	48%	91 bp	0.7
Pli-AMvi_089-Ex1-8G-lcwgs-X-1.clmp.r1	1.6%	44%	90 bp	0.0
Pli-AMvi_089-Ex1-8G-lcwgs-X-1.clmp.r2	3.9%	44%	90 bp	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-X-1.clmp.r1	1.6%	45%	94 bp	0.0
Pli-AMvi_090-Ex1-9G-lcwgs-X-1.clmp.r2	3.7%	45%	93 bp	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-X-1.clmp.r1	1.9%	45%	98 bp	0.0
Pli-AMvi_091-Ex1-10G-lcwgs-X-1.clmp.r2	4.3%	45%	97 bp	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-X-1.clmp.r1	2.4%	43%	84 bp	0.0
Pli-AMvi_092-Ex1-11G-lcwgs-X-1.clmp.r2	4.0%	44%	84 bp	0.0
Pli-AMvi_093-Ex1-12G-lcwgs-X-1.clmp.r1	19.5%	57%	147 bp	0.5
Pli-AMvi_093-Ex1-12G-lcwgs-X-1.clmp.r2	13.4%	57%	146 bp	0.5
Pli-AMvi_094-Ex1-7H-lcwgs-X-1.clmp.r1	1.1%	43%	62 bp	0.5
Pli-AMvi_094-Ex1-7H-lcwgs-X-1.clmp.r2	1.1%	43%	62 bp	0.5
Pli-AMvi_095-Ex1-8H-lcwgs-X-1.clmp.r1	2.3%	47%	54 bp	0.3
Pli-AMvi_095-Ex1-8H-lcwgs-X-1.clmp.r2	2.1%	47%	55 bp	0.3
Pli-AMvi_096-Ex1-9H-lcwgs-X-1.clmp.r1	3.4%	44%	77 bp	0.0
Pli-AMvi_096-Ex1-9H-lcwgs-X-1.clmp.r2	5.7%	45%	77 bp	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-X-1.clmp.r1	2.7%	43%	80 bp	0.0
Pli-AMvi_097-Ex1-10H-lcwgs-X-1.clmp.r2	4.5%	44%	80 bp	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-X-1.clmp.r1	1.4%	43%	83 bp	0.0
Pli-AMvi_098-Ex1-11H-lcwgs-X-1.clmp.r2	2.9%	43%	83 bp	0.0
Pli-AMvi_099-Ex1-12H-lcwgs-X-1.clmp.r1	23.2%	55%	145 bp	0.9
Pli-AMvi_099-Ex1-12H-lcwgs-X-1.clmp.r2	15.8%	55%	145 bp	0.9
Pli-CMvi_001-Ex1-1B-lcwgs-1-1.clmp.r1	7.1%	42%	143 bp	4.0
Pli-CMvi_001-Ex1-1B-lcwgs-1-1.clmp.r2	6.8%	42%	143 bp	4.0
Pli-CMvi_002-Ex1-2A-lcwgs-1-1.clmp.r1	6.4%	42%	140 bp	5.5
Pli-CMvi_002-Ex1-2A-lcwgs-1-1.clmp.r2	6.5%	42%	139 bp	5.5
Pli-CMvi_003-Ex1-2G-lcwgs-X-1.clmp.r1	3.7%	42%	135 bp	0.6
Pli-CMvi_003-Ex1-2G-lcwgs-X-1.clmp.r2	3.1%	42%	134 bp	0.6
Pli-CMvi_004-Ex1-3F-lcwgs-1-1.clmp.r1	7.2%	42%	142 bp	5.3
Pli-CMvi_004-Ex1-3F-lcwgs-1-1.clmp.r2	7.1%	42%	141 bp	5.3
Pli-CMvi_005-Ex1-4C-lcwgs-X-1.clmp.r1	0.6%	42%	122 bp	0.0
Pli-CMvi_005-Ex1-4C-lcwgs-X-1.clmp.r2	0.3%	42%	122 bp	0.0
Pli-CMvi_006-Ex1-5A-lcwgs-X-1.clmp.r1	1.2%	42%	125 bp	0.1
Pli-CMvi_006-Ex1-5A-lcwgs-X-1.clmp.r2	0.8%	43%	124 bp	0.1
Pli-CMvi_007-Ex1-5G-lcwgs-1-1.clmp.r1	6.4%	42%	137 bp	2.8
Pli-CMvi_007-Ex1-5G-lcwgs-1-1.clmp.r2	5.9%	42%	136 bp	2.8
Pli-CMvi_013-Ex1-1C-lcwgs-X-1.clmp.r1	8.6%	43%	147 bp	2.5
Pli-CMvi_013-Ex1-1C-lcwgs-X-1.clmp.r2	7.7%	43%	147 bp	2.5
Pli-CMvi_014-Ex1-2B-lcwgs-X-1.clmp.r1	1.2%	42%	126 bp	0.0
Pli-CMvi_014-Ex1-2B-lcwgs-X-1.clmp.r2	0.7%	42%	126 bp	0.0
Pli-CMvi_015-Ex1-2H-lcwgs-X-1.clmp.r1	6.1%	42%	141 bp	2.0
Pli-CMvi_015-Ex1-2H-lcwgs-X-1.clmp.r2	5.7%	43%	140 bp	2.0
Pli-CMvi_020-Ex1-6D-lcwgs-X-1.clmp.r1	8.9%	42%	141 bp	4.1
Pli-CMvi_020-Ex1-6D-lcwgs-X-1.clmp.r2	8.3%	43%	140 bp	4.1
Pli-CMvi_021-Ex1-6G-lcwgs-X-1.clmp.r1	4.8%	42%	144 bp	0.8
Pli-CMvi_021-Ex1-6G-lcwgs-X-1.clmp.r2	4.3%	42%	143 bp	0.8
Pli-CMvi_022-Ex1-7B-lcwgs-X-1.clmp.r1	2.4%	42%	130 bp	0.1
Pli-CMvi_022-Ex1-7B-lcwgs-X-1.clmp.r2	1.8%	42%	130 bp	0.1
Pli-CMvi_023-Ex1-7F-lcwgs-X-1.clmp.r1	3.8%	42%	134 bp	1.2
Pli-CMvi_023-Ex1-7F-lcwgs-X-1.clmp.r2	3.4%	42%	134 bp	1.2
Pli-CMvi_025-Ex1-1D-lcwgs-X-1.clmp.r1	3.6%	43%	135 bp	0.1
Pli-CMvi_025-Ex1-1D-lcwgs-X-1.clmp.r2	2.6%	43%	135 bp	0.1
Pli-CMvi_028-Ex1-3G-lcwgs-X-1.clmp.r1	8.0%	42%	144 bp	2.9
Pli-CMvi_028-Ex1-3G-lcwgs-X-1.clmp.r2	7.4%	43%	144 bp	2.9
Pli-CMvi_030-Ex1-5B-lcwgs-X-1.clmp.r1	0.9%	42%	128 bp	0.0
Pli-CMvi_030-Ex1-5B-lcwgs-X-1.clmp.r2	0.5%	42%	128 bp	0.0
Pli-CMvi_031-Ex1-5H-lcwgs-X-1.clmp.r1	7.4%	43%	137 bp	2.6
Pli-CMvi_031-Ex1-5H-lcwgs-X-1.clmp.r2	7.0%	43%	137 bp	2.6
Pli-CMvi_034-Ex1-7C-lcwgs-X-1.clmp.r1	2.1%	42%	126 bp	0.2
Pli-CMvi_034-Ex1-7C-lcwgs-X-1.clmp.r2	1.9%	42%	126 bp	0.2
Pli-CMvi_037-Ex1-1E-lcwgs-X-1.clmp.r1	8.2%	42%	147 bp	2.6
Pli-CMvi_037-Ex1-1E-lcwgs-X-1.clmp.r2	7.1%	43%	146 bp	2.6
Pli-CMvi_038-Ex1-2C-lcwgs-X-1.clmp.r1	3.7%	42%	135 bp	0.1
Pli-CMvi_038-Ex1-2C-lcwgs-X-1.clmp.r2	2.7%	42%	135 bp	0.1
Pli-CMvi_039-Ex1-3A-lcwgs-X-1.clmp.r1	7.2%	43%	142 bp	3.4
Pli-CMvi_039-Ex1-3A-lcwgs-X-1.clmp.r2	6.6%	43%	142 bp	3.4
Pli-CMvi_040-Ex1-3H-lcwgs-1-1.clmp.r1	6.8%	42%	142 bp	4.0
Pli-CMvi_040-Ex1-3H-lcwgs-1-1.clmp.r2	6.5%	42%	141 bp	4.0
Pli-CMvi_041-Ex1-4E-lcwgs-1-1.clmp.r1	6.4%	42%	140 bp	3.6
Pli-CMvi_041-Ex1-4E-lcwgs-1-1.clmp.r2	6.3%	42%	140 bp	3.6
Pli-CMvi_042-Ex1-5C-lcwgs-X-1.clmp.r1	7.0%	42%	145 bp	4.7
Pli-CMvi_042-Ex1-5C-lcwgs-X-1.clmp.r2	7.0%	43%	144 bp	4.7
Pli-CMvi_047-Ex1-7G-lcwgs-X-1.clmp.r1	3.7%	42%	135 bp	0.9
Pli-CMvi_047-Ex1-7G-lcwgs-X-1.clmp.r2	3.2%	42%	135 bp	0.9
Pli-CMvi_049-Ex1-1F-lcwgs-1-1.clmp.r1	7.2%	42%	144 bp	5.7
Pli-CMvi_049-Ex1-1F-lcwgs-1-1.clmp.r2	7.2%	42%	143 bp	5.7
Pli-CMvi_051-Ex1-3B-lcwgs-X-1.clmp.r1	8.1%	42%	142 bp	7.1
Pli-CMvi_051-Ex1-3B-lcwgs-X-1.clmp.r2	8.2%	43%	142 bp	7.1
Pli-CMvi_053-Ex1-4F-lcwgs-X-1.clmp.r1	3.0%	42%	137 bp	0.3
Pli-CMvi_053-Ex1-4F-lcwgs-X-1.clmp.r2	2.5%	42%	137 bp	0.3
Pli-CMvi_054-Ex1-5D-lcwgs-X-1.clmp.r1	5.8%	42%	139 bp	2.7
Pli-CMvi_054-Ex1-5D-lcwgs-X-1.clmp.r2	5.7%	42%	139 bp	2.7
Pli-CMvi_059-Ex1-7H-lcwgs-X-1.clmp.r1	6.1%	42%	141 bp	2.4
Pli-CMvi_059-Ex1-7H-lcwgs-X-1.clmp.r2	5.7%	42%	141 bp	2.4
Pli-CMvi_060-Ex1-8F-lcwgs-X-1.clmp.r1	4.0%	42%	140 bp	0.1
Pli-CMvi_060-Ex1-8F-lcwgs-X-1.clmp.r2	2.9%	42%	140 bp	0.1
Pli-CMvi_062-Ex1-2D-lcwgs-1-1.clmp.r1	6.0%	42%	138 bp	5.2
Pli-CMvi_062-Ex1-2D-lcwgs-1-1.clmp.r2	6.2%	42%	137 bp	5.2
Pli-CMvi_063-Ex1-3C-lcwgs-1-1.clmp.r1	7.2%	42%	144 bp	3.6
Pli-CMvi_063-Ex1-3C-lcwgs-1-1.clmp.r2	6.8%	42%	143 bp	3.6
Pli-CMvi_064-Ex1-4A-lcwgs-1-1.clmp.r1	7.5%	43%	146 bp	4.9
Pli-CMvi_064-Ex1-4A-lcwgs-1-1.clmp.r2	7.4%	43%	145 bp	4.9
Pli-CMvi_065-Ex1-4G-lcwgs-X-1.clmp.r1	3.0%	42%	134 bp	0.2
Pli-CMvi_065-Ex1-4G-lcwgs-X-1.clmp.r2	2.4%	42%	134 bp	0.2
Pli-CMvi_066-Ex1-5E-lcwgs-1-1.clmp.r1	9.2%	43%	144 bp	7.0
Pli-CMvi_066-Ex1-5E-lcwgs-1-1.clmp.r2	9.5%	43%	144 bp	7.0
Pli-CMvi_070-Ex1-7D-lcwgs-X-1.clmp.r1	2.2%	42%	129 bp	0.1
Pli-CMvi_070-Ex1-7D-lcwgs-X-1.clmp.r2	1.5%	42%	128 bp	0.1
Pli-CMvi_071-Ex1-8A-lcwgs-X-1.clmp.r1	1.4%	43%	128 bp	0.0
Pli-CMvi_071-Ex1-8A-lcwgs-X-1.clmp.r2	1.0%	43%	127 bp	0.0
Pli-CMvi_072-Ex1-8G-lcwgs-X-1.clmp.r1	4.7%	42%	142 bp	0.6
Pli-CMvi_072-Ex1-8G-lcwgs-X-1.clmp.r2	3.8%	42%	142 bp	0.6
Pli-CMvi_073-Ex1-1G-lcwgs-X-1.clmp.r1	10.7%	43%	143 bp	4.1
Pli-CMvi_073-Ex1-1G-lcwgs-X-1.clmp.r2	10.5%	44%	142 bp	4.1
Pli-CMvi_074-Ex1-2E-lcwgs-X-1.clmp.r1	4.8%	42%	136 bp	0.2
Pli-CMvi_074-Ex1-2E-lcwgs-X-1.clmp.r2	3.8%	42%	136 bp	0.2
Pli-CMvi_075-Ex1-3D-lcwgs-X-1.clmp.r1	2.3%	42%	129 bp	0.3
Pli-CMvi_075-Ex1-3D-lcwgs-X-1.clmp.r2	1.9%	42%	129 bp	0.3
Pli-CMvi_076-Ex1-4B-lcwgs-X-1.clmp.r1	1.6%	42%	129 bp	0.0
Pli-CMvi_076-Ex1-4B-lcwgs-X-1.clmp.r2	1.1%	42%	129 bp	0.0
Pli-CMvi_078-Ex1-5F-lcwgs-X-1.clmp.r1	1.1%	42%	134 bp	0.0
Pli-CMvi_078-Ex1-5F-lcwgs-X-1.clmp.r2	0.8%	42%	134 bp	0.0
Pli-CMvi_082-Ex1-7E-lcwgs-X-1.clmp.r1	3.6%	42%	133 bp	0.1
Pli-CMvi_082-Ex1-7E-lcwgs-X-1.clmp.r2	2.8%	42%	133 bp	0.1
Pli-CMvi_083-Ex1-8B-lcwgs-X-1.clmp.r1	3.7%	42%	139 bp	0.0
Pli-CMvi_083-Ex1-8B-lcwgs-X-1.clmp.r2	2.5%	42%	138 bp	0.0
Pli-CMvi_084-Ex1-8H-lcwgs-X-1.clmp.r1	3.8%	42%	133 bp	0.7
Pli-CMvi_084-Ex1-8H-lcwgs-X-1.clmp.r2	3.1%	42%	132 bp	0.7
Pli-CMvi_085-Ex1-1H-lcwgs-X-1.clmp.r1	6.9%	42%	142 bp	3.8
Pli-CMvi_085-Ex1-1H-lcwgs-X-1.clmp.r2	6.6%	42%	141 bp	3.8
Pli-CMvi_086-Ex1-2F-lcwgs-X-1.clmp.r1	7.5%	42%	145 bp	3.8
Pli-CMvi_086-Ex1-2F-lcwgs-X-1.clmp.r2	6.9%	43%	145 bp	3.8
Pli-CMvi_087-Ex1-3E-lcwgs-X-1.clmp.r1	7.4%	42%	145 bp	5.3
Pli-CMvi_087-Ex1-3E-lcwgs-X-1.clmp.r2	7.1%	43%	145 bp	5.3
Pli-CMvi_089-Ex1-4H-lcwgs-X-1.clmp.r1	5.9%	42%	142 bp	2.1
Pli-CMvi_089-Ex1-4H-lcwgs-X-1.clmp.r2	5.5%	42%	142 bp	2.1
Pli-CMvi_093-Ex1-7A-lcwgs-X-1.clmp.r1	0.6%	42%	120 bp	0.0
Pli-CMvi_093-Ex1-7A-lcwgs-X-1.clmp.r2	0.4%	42%	120 bp	0.0
Pli-CMvi_095-Ex1-8C-lcwgs-X-1.clmp.r1	0.7%	42%	126 bp	0.0
Pli-CMvi_095-Ex1-8C-lcwgs-X-1.clmp.r2	0.4%	42%	126 bp	0.0
```
  
</p>
</details>

## 10. Second trim.
`sbatch ../../pire_fq_gz_processing/runFASTP_2.sbatch fq_fp1_clmp fq_fp1_clmp_fp2 33`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Pli-AMvi_004-Ex1-1A-lcwgs-X-1.clmp.r1r2_fastp	2.6%	51.0%	96.8%	2.6%
Pli-AMvi_005-Ex1-2A-lcwgs-X-1.clmp.r1r2_fastp	0.3%	44.9%	96.5%	1.8%
Pli-AMvi_006-Ex1-3A-lcwgs-X-1.clmp.r1r2_fastp	0.2%	43.2%	97.4%	2.1%
Pli-AMvi_007-Ex1-4A-lcwgs-X-1.clmp.r1r2_fastp	1.1%	40.1%	98.7%	1.6%
Pli-AMvi_008-Ex1-1B-lcwgs-X-1.clmp.r1r2_fastp	1.5%	41.9%	96.1%	3.1%
Pli-AMvi_009-Ex1-2B-lcwgs-X-1.clmp.r1r2_fastp	0.2%	44.8%	96.7%	2.1%
Pli-AMvi_010-Ex1-7A-lcwgs-X-1.clmp.r1r2_fastp	2.4%	46.6%	98.7%	1.3%
Pli-AMvi_011-Ex1-8A-lcwgs-X-1.clmp.r1r2_fastp	3.6%	46.8%	98.5%	1.3%
Pli-AMvi_012-Ex1-9A-lcwgs-X-1.clmp.r1r2_fastp	3.1%	44.6%	98.7%	1.3%
Pli-AMvi_013-Ex1-10A-lcwgs-X-1.clmp.r1r2_fastp	1.2%	39.1%	97.8%	2.3%
Pli-AMvi_014-Ex1-11A-lcwgs-X-1.clmp.r1r2_fastp	2.6%	45.5%	84.9%	9.7%
Pli-AMvi_015-Ex1-12A-lcwgs-X-1.clmp.r1r2_fastp	0.8%	48.1%	93.9%	1.9%
Pli-AMvi_016-Ex1-3B-lcwgs-X-1.clmp.r1r2_fastp	0.7%	42.3%	99.1%	1.6%
Pli-AMvi_017-Ex1-4B-lcwgs-X-1.clmp.r1r2_fastp	0.7%	41.3%	98.7%	1.5%
Pli-AMvi_018-Ex1-1C-lcwgs-X-1.clmp.r1r2_fastp	0.8%	44.2%	98.2%	1.6%
Pli-AMvi_019-Ex1-2C-lcwgs-X-1.clmp.r1r2_fastp	0.4%	43.8%	98.4%	1.8%
Pli-AMvi_020-Ex1-3C-lcwgs-X-1.clmp.r1r2_fastp	0.4%	44.2%	95.1%	3.9%
Pli-AMvi_021-Ex1-4C-lcwgs-X-1.clmp.r1r2_fastp	0.5%	42.7%	98.7%	2.3%
Pli-AMvi_022-Ex1-7B-lcwgs-X-1.clmp.r1r2_fastp	6.9%	51.6%	97.4%	0.9%
Pli-AMvi_023-Ex1-8B-lcwgs-X-1.clmp.r1r2_fastp	1.9%	44.9%	98.8%	1.4%
Pli-AMvi_024-Ex1-9B-lcwgs-X-1.clmp.r1r2_fastp	8.9%	50.0%	97.8%	0.9%
Pli-AMvi_025-Ex1-10B-lcwgs-X-1.clmp.r1r2_fastp	0.8%	39.9%	98.7%	1.5%
Pli-AMvi_026-Ex1-11B-lcwgs-X-1.clmp.r1r2_fastp	1.0%	41.6%	99.1%	1.6%
Pli-AMvi_027-Ex1-12B-lcwgs-X-1.clmp.r1r2_fastp	0.2%	47.9%	94.9%	2.1%
Pli-AMvi_028-Ex1-1D-lcwgs-X-1.clmp.r1r2_fastp	0.3%	46.3%	97.8%	1.8%
Pli-AMvi_029-Ex1-2D-lcwgs-X-1.clmp.r1r2_fastp	0.9%	41.9%	98.8%	1.7%
Pli-AMvi_030-Ex1-3D-lcwgs-X-1.clmp.r1r2_fastp	0.6%	43.3%	97.4%	2.7%
Pli-AMvi_031-Ex1-4D-lcwgs-X-1.clmp.r1r2_fastp	0.5%	45.6%	97.1%	1.7%
Pli-AMvi_032-Ex1-5C-lcwgs-X-1.clmp.r1r2_fastp	0.8%	42.4%	99.2%	1.7%
Pli-AMvi_033-Ex1-6C-lcwgs-X-1.clmp.r1r2_fastp	0.7%	43.7%	99.3%	1.8%
Pli-AMvi_034-Ex1-7C-lcwgs-X-1.clmp.r1r2_fastp	0.3%	45.5%	97.4%	1.8%
Pli-AMvi_035-Ex1-8C-lcwgs-X-1.clmp.r1r2_fastp	0.5%	42.3%	99.1%	1.6%
Pli-AMvi_036-Ex1-9C-lcwgs-X-1.clmp.r1r2_fastp	12.7%	47.8%	97.3%	0.7%
Pli-AMvi_037-Ex1-10C-lcwgs-X-1.clmp.r1r2_fastp	1.0%	38.6%	99.0%	1.7%
Pli-AMvi_038-Ex1-11C-lcwgs-X-1.clmp.r1r2_fastp	1.1%	43.6%	98.6%	1.7%
Pli-AMvi_039-Ex1-12C-lcwgs-X-1.clmp.r1r2_fastp	17.5%	57.4%	96.3%	0.2%
Pli-AMvi_040-Ex1-5A-lcwgs-X-1.clmp.r1r2_fastp	3.1%	46.7%	98.6%	1.2%
Pli-AMvi_041-Ex1-6A-lcwgs-X-1.clmp.r1r2_fastp	2.1%	43.6%	98.9%	1.4%
Pli-AMvi_042-Ex1-5B-lcwgs-X-1.clmp.r1r2_fastp	0.3%	44.9%	96.7%	1.4%
Pli-AMvi_043-Ex1-6B-lcwgs-X-1.clmp.r1r2_fastp	3.7%	50.1%	98.5%	1.1%
Pli-AMvi_044-Ex1-5D-lcwgs-X-1.clmp.r1r2_fastp	0.5%	44.4%	99.3%	1.6%
Pli-AMvi_045-Ex1-6D-lcwgs-X-1.clmp.r1r2_fastp	0.7%	46.4%	98.1%	1.5%
Pli-AMvi_046-Ex1-1E-lcwgs-X-1.clmp.r1r2_fastp	1.4%	45.2%	99.0%	1.4%
Pli-AMvi_047-Ex1-2E-lcwgs-X-1.clmp.r1r2_fastp	0.8%	40.6%	97.8%	2.4%
Pli-AMvi_048-Ex1-3E-lcwgs-X-1.clmp.r1r2_fastp	0.1%	42.6%	97.9%	1.5%
Pli-AMvi_049-Ex1-4E-lcwgs-X-1.clmp.r1r2_fastp	0.4%	44.7%	97.5%	1.7%
Pli-AMvi_050-Ex1-5E-lcwgs-X-1.clmp.r1r2_fastp	0.1%	44.1%	97.0%	1.2%
Pli-AMvi_051-Ex1-6E-lcwgs-X-1.clmp.r1r2_fastp	0.9%	46.7%	97.9%	1.7%
Pli-AMvi_052-Ex1-7D-lcwgs-X-1.clmp.r1r2_fastp	0.8%	42.7%	99.0%	1.7%
Pli-AMvi_053-Ex1-8D-lcwgs-X-1.clmp.r1r2_fastp	0.4%	43.7%	97.0%	1.7%
Pli-AMvi_054-Ex1-9D-lcwgs-X-1.clmp.r1r2_fastp	0.5%	44.4%	96.9%	3.1%
Pli-AMvi_055-Ex1-10D-lcwgs-X-1.clmp.r1r2_fastp	0.5%	41.8%	97.6%	2.6%
Pli-AMvi_056-Ex1-11D-lcwgs-X-1.clmp.r1r2_fastp	0.2%	43.3%	97.6%	1.9%
Pli-AMvi_057-Ex1-12D-lcwgs-X-1.clmp.r1r2_fastp	0.4%	48.1%	95.5%	1.3%
Pli-AMvi_058-Ex1-1F-lcwgs-X-1.clmp.r1r2_fastp	16.5%	57.9%	96.3%	0.2%
Pli-AMvi_059-Ex1-2F-lcwgs-X-1.clmp.r1r2_fastp	0.2%	44.3%	97.6%	1.5%
Pli-AMvi_060-Ex1-3F-lcwgs-X-1.clmp.r1r2_fastp	0.2%	43.1%	98.1%	1.9%
Pli-AMvi_061-Ex1-4F-lcwgs-X-1.clmp.r1r2_fastp	0.2%	45.0%	97.6%	1.9%
Pli-AMvi_062-Ex1-5F-lcwgs-X-1.clmp.r1r2_fastp	0.3%	44.9%	97.4%	1.8%
Pli-AMvi_063-Ex1-6F-lcwgs-X-1.clmp.r1r2_fastp	0.6%	45.7%	98.2%	1.6%
Pli-AMvi_064-Ex1-7E-lcwgs-X-1.clmp.r1r2_fastp	0.8%	42.4%	99.1%	1.6%
Pli-AMvi_065-Ex1-8E-lcwgs-X-1.clmp.r1r2_fastp	0.7%	39.5%	99.2%	1.7%
Pli-AMvi_066-Ex1-9E-lcwgs-X-1.clmp.r1r2_fastp	0.5%	43.9%	97.9%	1.4%
Pli-AMvi_067-Ex1-10E-lcwgs-X-1.clmp.r1r2_fastp	0.6%	43.1%	96.8%	3.0%
Pli-AMvi_068-Ex1-1E-lcwgs-X-1.clmp.r1r2_fastp	0.7%	45.8%	96.8%	0.7%
Pli-AMvi_069-Ex1-12E-lcwgs-X-1.clmp.r1r2_fastp	11.7%	59.6%	96.9%	0.1%
Pli-AMvi_070-Ex1-1G-lcwgs-X-1.clmp.r1r2_fastp	19.4%	57.3%	96.2%	0.3%
Pli-AMvi_071-Ex1-2G-lcwgs-X-1.clmp.r1r2_fastp	21.6%	56.5%	96.1%	0.2%
Pli-AMvi_072-Ex1-3G-lcwgs-X-1.clmp.r1r2_fastp	0.2%	43.0%	98.0%	2.3%
Pli-AMvi_073-Ex1-4G-lcwgs-X-1.clmp.r1r2_fastp	0.4%	45.3%	98.3%	1.9%
Pli-AMvi_074-Ex1-5G-lcwgs-X-1.clmp.r1r2_fastp	0.5%	44.7%	97.7%	2.0%
Pli-AMvi_075-Ex1-6G-lcwgs-X-1.clmp.r1r2_fastp	5.1%	50.5%	97.7%	1.5%
Pli-AMvi_076-Ex1-7F-lcwgs-X-1.clmp.r1r2_fastp	0.5%	46.1%	99.0%	1.6%
Pli-AMvi_077-Ex1-8F-lcwgs-X-1.clmp.r1r2_fastp	0.4%	44.9%	97.9%	1.9%
Pli-AMvi_078-Ex1-9F-lcwgs-X-1.clmp.r1r2_fastp	0.3%	44.5%	97.7%	1.6%
Pli-AMvi_079-Ex1-10F-lcwgs-X-1.clmp.r1r2_fastp	0.8%	44.6%	97.8%	1.5%
Pli-AMvi_080-Ex1-11F-lcwgs-X-1.clmp.r1r2_fastp	0.4%	42.9%	97.8%	2.0%
Pli-AMvi_081-Ex1-12F-lcwgs-X-1.clmp.r1r2_fastp	11.7%	56.5%	96.4%	0.1%
Pli-AMvi_082-Ex1-1H-lcwgs-X-1.clmp.r1r2_fastp	1.7%	46.4%	98.8%	1.7%
Pli-AMvi_083-Ex1-2H-lcwgs-X-1.clmp.r1r2_fastp	0.6%	41.2%	99.2%	1.8%
Pli-AMvi_084-Ex1-3H-lcwgs-X-1.clmp.r1r2_fastp	1.9%	46.9%	98.6%	1.9%
Pli-AMvi_085-Ex1-4H-lcwgs-X-1.clmp.r1r2_fastp	0.6%	42.6%	98.0%	2.7%
Pli-AMvi_086-Ex1-5H-lcwgs-X-1.clmp.r1r2_fastp	1.1%	43.3%	99.1%	1.5%
Pli-AMvi_087-Ex1-6H-lcwgs-X-1.clmp.r1r2_fastp	2.6%	50.8%	98.6%	1.3%
Pli-AMvi_088-Ex1-7G-lcwgs-X-1.clmp.r1r2_fastp	2.7%	47.9%	98.6%	1.3%
Pli-AMvi_089-Ex1-8G-lcwgs-X-1.clmp.r1r2_fastp	0.2%	44.1%	97.6%	2.0%
Pli-AMvi_090-Ex1-9G-lcwgs-X-1.clmp.r1r2_fastp	0.3%	44.9%	97.5%	1.4%
Pli-AMvi_091-Ex1-10G-lcwgs-X-1.clmp.r1r2_fastp	0.5%	45.1%	97.4%	1.5%
Pli-AMvi_092-Ex1-11G-lcwgs-X-1.clmp.r1r2_fastp	0.2%	43.3%	98.3%	1.6%
Pli-AMvi_093-Ex1-12G-lcwgs-X-1.clmp.r1r2_fastp	21.7%	57.2%	95.9%	0.1%
Pli-AMvi_094-Ex1-7H-lcwgs-X-1.clmp.r1r2_fastp	0.6%	43.7%	99.2%	1.8%
Pli-AMvi_095-Ex1-8H-lcwgs-X-1.clmp.r1r2_fastp	0.5%	47.4%	97.5%	2.9%
Pli-AMvi_096-Ex1-9H-lcwgs-X-1.clmp.r1r2_fastp	0.6%	44.1%	97.3%	2.0%
Pli-AMvi_097-Ex1-10H-lcwgs-X-1.clmp.r1r2_fastp	0.3%	43.4%	97.5%	2.1%
Pli-AMvi_098-Ex1-11H-lcwgs-X-1.clmp.r1r2_fastp	0.2%	42.9%	97.9%	2.2%
Pli-AMvi_099-Ex1-12H-lcwgs-X-1.clmp.r1r2_fastp	26.9%	55.6%	95.7%	0.2%
Pli-CMvi_001-Ex1-1B-lcwgs-1-1.clmp.r1r2_fastp	4.4%	42.7%	97.4%	0.3%
Pli-CMvi_002-Ex1-2A-lcwgs-1-1.clmp.r1r2_fastp	3.7%	42.7%	97.7%	0.4%
Pli-CMvi_003-Ex1-2G-lcwgs-X-1.clmp.r1r2_fastp	2.8%	42.2%	97.8%	0.5%
Pli-CMvi_004-Ex1-3F-lcwgs-1-1.clmp.r1r2_fastp	4.6%	42.4%	97.6%	0.3%
Pli-CMvi_005-Ex1-4C-lcwgs-X-1.clmp.r1r2_fastp	0.2%	42.6%	97.2%	1.2%
Pli-CMvi_006-Ex1-5A-lcwgs-X-1.clmp.r1r2_fastp	0.5%	42.8%	97.3%	1.1%
Pli-CMvi_007-Ex1-5G-lcwgs-1-1.clmp.r1r2_fastp	4.2%	42.4%	97.6%	0.5%
Pli-CMvi_013-Ex1-1C-lcwgs-X-1.clmp.r1r2_fastp	5.8%	43.5%	96.7%	0.2%
Pli-CMvi_014-Ex1-2B-lcwgs-X-1.clmp.r1r2_fastp	0.4%	42.4%	95.7%	2.5%
Pli-CMvi_015-Ex1-2H-lcwgs-X-1.clmp.r1r2_fastp	3.5%	42.8%	97.5%	0.4%
Pli-CMvi_020-Ex1-6D-lcwgs-X-1.clmp.r1r2_fastp	6.1%	43.0%	97.4%	0.5%
Pli-CMvi_021-Ex1-6G-lcwgs-X-1.clmp.r1r2_fastp	3.2%	42.3%	97.5%	0.3%
Pli-CMvi_022-Ex1-7B-lcwgs-X-1.clmp.r1r2_fastp	2.0%	42.1%	98.0%	0.8%
Pli-CMvi_023-Ex1-7F-lcwgs-X-1.clmp.r1r2_fastp	2.9%	42.1%	98.1%	0.6%
Pli-CMvi_025-Ex1-1D-lcwgs-X-1.clmp.r1r2_fastp	2.2%	43.2%	97.4%	0.7%
Pli-CMvi_028-Ex1-3G-lcwgs-X-1.clmp.r1r2_fastp	5.8%	42.8%	97.3%	0.3%
Pli-CMvi_030-Ex1-5B-lcwgs-X-1.clmp.r1r2_fastp	0.3%	42.6%	97.0%	1.0%
Pli-CMvi_031-Ex1-5H-lcwgs-X-1.clmp.r1r2_fastp	5.1%	43.2%	97.4%	0.5%
Pli-CMvi_034-Ex1-7C-lcwgs-X-1.clmp.r1r2_fastp	1.9%	42.2%	98.4%	0.9%
Pli-CMvi_037-Ex1-1E-lcwgs-X-1.clmp.r1r2_fastp	5.9%	42.9%	96.6%	0.2%
Pli-CMvi_038-Ex1-2C-lcwgs-X-1.clmp.r1r2_fastp	2.4%	42.4%	97.5%	0.6%
Pli-CMvi_039-Ex1-3A-lcwgs-X-1.clmp.r1r2_fastp	4.3%	43.2%	97.4%	0.4%
Pli-CMvi_040-Ex1-3H-lcwgs-1-1.clmp.r1r2_fastp	4.3%	42.6%	97.5%	0.3%
Pli-CMvi_041-Ex1-4E-lcwgs-1-1.clmp.r1r2_fastp	3.5%	42.5%	97.6%	0.4%
Pli-CMvi_042-Ex1-5C-lcwgs-X-1.clmp.r1r2_fastp	4.2%	42.7%	97.2%	0.2%
Pli-CMvi_047-Ex1-7G-lcwgs-X-1.clmp.r1r2_fastp	2.9%	42.2%	97.9%	0.5%
Pli-CMvi_049-Ex1-1F-lcwgs-1-1.clmp.r1r2_fastp	4.4%	42.6%	97.5%	0.3%
Pli-CMvi_051-Ex1-3B-lcwgs-X-1.clmp.r1r2_fastp	4.7%	42.9%	97.4%	0.3%
Pli-CMvi_053-Ex1-4F-lcwgs-X-1.clmp.r1r2_fastp	2.6%	42.2%	97.8%	0.5%
Pli-CMvi_054-Ex1-5D-lcwgs-X-1.clmp.r1r2_fastp	3.3%	42.4%	97.7%	0.5%
Pli-CMvi_059-Ex1-7H-lcwgs-X-1.clmp.r1r2_fastp	3.6%	42.6%	97.5%	0.4%
Pli-CMvi_060-Ex1-8F-lcwgs-X-1.clmp.r1r2_fastp	3.0%	42.4%	97.5%	0.4%
Pli-CMvi_062-Ex1-2D-lcwgs-1-1.clmp.r1r2_fastp	3.3%	42.4%	97.8%	0.5%
Pli-CMvi_063-Ex1-3C-lcwgs-1-1.clmp.r1r2_fastp	4.1%	42.6%	97.4%	0.3%
Pli-CMvi_064-Ex1-4A-lcwgs-1-1.clmp.r1r2_fastp	4.6%	43.0%	97.0%	0.2%
Pli-CMvi_065-Ex1-4G-lcwgs-X-1.clmp.r1r2_fastp	2.4%	42.6%	97.8%	0.6%
Pli-CMvi_066-Ex1-5E-lcwgs-1-1.clmp.r1r2_fastp	5.5%	43.1%	97.3%	0.3%
Pli-CMvi_070-Ex1-7D-lcwgs-X-1.clmp.r1r2_fastp	1.6%	42.4%	98.0%	1.0%
Pli-CMvi_071-Ex1-8A-lcwgs-X-1.clmp.r1r2_fastp	1.0%	43.0%	97.4%	1.1%
Pli-CMvi_072-Ex1-8G-lcwgs-X-1.clmp.r1r2_fastp	3.7%	42.6%	97.4%	0.3%
Pli-CMvi_073-Ex1-1G-lcwgs-X-1.clmp.r1r2_fastp	5.3%	43.9%	97.3%	0.3%
Pli-CMvi_074-Ex1-2E-lcwgs-X-1.clmp.r1r2_fastp	2.3%	42.6%	97.4%	0.6%
Pli-CMvi_075-Ex1-3D-lcwgs-X-1.clmp.r1r2_fastp	1.6%	42.4%	98.0%	0.8%
Pli-CMvi_076-Ex1-4B-lcwgs-X-1.clmp.r1r2_fastp	1.0%	42.5%	97.4%	1.0%
Pli-CMvi_078-Ex1-5F-lcwgs-X-1.clmp.r1r2_fastp	0.6%	42.5%	97.2%	0.8%
Pli-CMvi_082-Ex1-7E-lcwgs-X-1.clmp.r1r2_fastp	2.4%	42.1%	97.8%	0.7%
Pli-CMvi_083-Ex1-8B-lcwgs-X-1.clmp.r1r2_fastp	2.8%	42.4%	97.4%	0.6%
Pli-CMvi_084-Ex1-8H-lcwgs-X-1.clmp.r1r2_fastp	2.9%	42.4%	97.7%	0.6%
Pli-CMvi_085-Ex1-1H-lcwgs-X-1.clmp.r1r2_fastp	4.0%	42.6%	97.5%	0.3%
Pli-CMvi_086-Ex1-2F-lcwgs-X-1.clmp.r1r2_fastp	4.8%	42.8%	97.1%	0.2%
Pli-CMvi_087-Ex1-3E-lcwgs-X-1.clmp.r1r2_fastp	4.8%	42.8%	97.0%	0.2%
Pli-CMvi_089-Ex1-4H-lcwgs-X-1.clmp.r1r2_fastp	3.6%	42.7%	97.4%	0.3%
Pli-CMvi_093-Ex1-7A-lcwgs-X-1.clmp.r1r2_fastp	0.3%	42.6%	97.7%	1.4%
Pli-CMvi_095-Ex1-8C-lcwgs-X-1.clmp.r1r2_fastp	0.4%	42.5%	97.3%	1.0%
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
