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
Pli-CMvi_001-Ex1-1B-lcwgs-X-1.1	16.7%	43%	4.8
Pli-CMvi_002-Ex1-2A-lcwgs-X-1.1	10.2%	43%	1.5
Pli-CMvi_003-Ex1-2G-lcwgs-X-1.1	23.0%	43%	0.8
Pli-CMvi_003-Ex1-2G-lcwgs-X-1.2	21.8%	44%	0.8
Pli-CMvi_004-Ex1-3F-lcwgs-X-1.1	13.6%	42%	6.1
Pli-CMvi_005-Ex1-4C-lcwgs-X-1.1	4.9%	43%	0.0
Pli-CMvi_005-Ex1-4C-lcwgs-X-1.2	4.5%	44%	0.0
Pli-CMvi_006-Ex1-5A-lcwgs-X-1.1	7.6%	44%	0.1
Pli-CMvi_006-Ex1-5A-lcwgs-X-1.2	7.1%	44%	0.1
Pli-CMvi_007-Ex1-5G-lcwgs-X-1.1	17.6%	43%	3.4
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
Pli-CMvi_040-Ex1-3H-lcwgs-X-1.1	13.7%	43%	4.7
Pli-CMvi_041-Ex1-4E-lcwgs-X-1.1	13.7%	43%	4.2
Pli-CMvi_042-Ex1-5C-lcwgs-X-1.1	13.5%	43%	5.4
Pli-CMvi_042-Ex1-5C-lcwgs-X-1.2	11.1%	43%	5.4
Pli-CMvi_047-Ex1-7G-lcwgs-X-1.1	11.1%	43%	1.1
Pli-CMvi_047-Ex1-7G-lcwgs-X-1.2	9.7%	43%	1.1
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
Pli-CMvi_064-Ex1-4A-lcwgs-X-1.2	14.8%	43%	5.9
Pli-CMvi_065-Ex1-4G-lcwgs-X-1.1	18.0%	43%	0.3
Pli-CMvi_065-Ex1-4G-lcwgs-X-1.2	16.7%	44%	0.3
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
Pli-CMvi_001-Ex1-1B-lcwgs-X-1	12.9%	38.3%	92.6%	13.7%
Pli-CMvi_002-Ex1-2A-lcwgs-X-1	8.1%	42.9%	93.8%	23.4%
Pli-CMvi_003-Ex1-2G-lcwgs-X-1	8.9%	42.4%	81.2%	41.5%
Pli-CMvi_004-Ex1-3F-lcwgs-X-1	8.8%	42.6%	95.5%	19.1%
Pli-CMvi_005-Ex1-4C-lcwgs-X-1	0.4%	42.8%	89.7%	45.1%
Pli-CMvi_006-Ex1-5A-lcwgs-X-1	1.5%	43.0%	87.7%	42.4%
Pli-CMvi_007-Ex1-5G-lcwgs-X-1	8.0%	42.6%	87.9%	31.7%
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
Pli-CMvi_040-Ex1-3H-lcwgs-X-1	9.0%	42.7%	94.3%	18.7%
Pli-CMvi_041-Ex1-4E-lcwgs-X-1	7.8%	42.6%	92.6%	22.8%
Pli-CMvi_042-Ex1-5C-lcwgs-X-1	10.5%	42.9%	93.7%	11.4%
Pli-CMvi_047-Ex1-7G-lcwgs-X-1	8.6%	42.3%	93.1%	33.3%
Pli-CMvi_049-Ex1-1F-lcwgs-X-1	9.0%	42.2%	91.8%	17.3%
Pli-CMvi_051-Ex1-3B-lcwgs-X-1	12.2%	43.0%	94.0%	17.5%
Pli-CMvi_053-Ex1-4F-lcwgs-X-1	7.0%	42.4%	92.7%	28.8%
Pli-CMvi_054-Ex1-5D-lcwgs-X-1	9.2%	42.5%	93.2%	24.4%
Pli-CMvi_059-Ex1-7H-lcwgs-X-1	9.6%	42.8%	94.5%	20.5%
Pli-CMvi_060-Ex1-8F-lcwgs-X-1	8.0%	42.5%	93.1%	23.1%
Pli-CMvi_062-Ex1-2D-lcwgs-X-1	7.4%	42.6%	91.3%	28.7%
Pli-CMvi_063-Ex1-3C-lcwgs-X-1	8.4%	42.8%	93.9%	15.0%
Pli-CMvi_064-Ex1-4A-lcwgs-X-1	7.9%	43.1%	89.8%	12.4%
Pli-CMvi_065-Ex1-4G-lcwgs-X-1	7.0%	42.7%	84.1%	38.6%
Pli-CMvi_066-Ex1-5E-lcwgs-X-1	10.0%	43.3%	94.2%	14.8%
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
TBD

### 9b. Check duplicate removal success.
TBD

### 9c. Generate metadata on deduplicated FASTQ files.
TBD

<details><summary>Expand for MultiQC Output.</summary>

```bash
TBD
```
  
</p>
</details>

## 10. Second trim.
TBD

<details><summary>Expand for MultiQC Output.</summary>

```bash
TBD
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
TBD
```

</p>
</details>

## 14. Clean Up
TBD
