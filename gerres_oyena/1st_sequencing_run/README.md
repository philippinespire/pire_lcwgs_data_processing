## 1. Download data
Data downloaded from TAMUCC grid.

## 2. Proofread the decode files
131 foward reads, 131 reverse reads. All reads unique.

## 3. Edit the decode file.
No issues, editing not necessary.

## 4. Make a copy of the `fq_raw` files.
Files copied to `/RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/fq_raw`

## 5. Perform a renaming dry run.
Dry run successful.

## 6. Rename for real.
Files renamed.

## 7. Check the quality of your data.
`Multi_FASTQC.sh` run.

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	M Seqs
Goy-APnd_001-Ex1-1A-lcwgs-1-T.1	21.3%	44%	0.7
Goy-APnd_001-Ex1-1A-lcwgs-1-T.2	19.7%	44%	0.7
Goy-APnd_002-Ex1-1B-lcwgs-1-T.1	13.9%	42%	1.7
Goy-APnd_002-Ex1-1B-lcwgs-1-T.2	13.0%	42%	1.7
Goy-APnd_003-Ex1-1C-lcwgs-1-T.1	17.2%	43%	2.9
Goy-APnd_003-Ex1-1C-lcwgs-1-T.2	16.2%	43%	2.9
Goy-APnd_004-Ex1-1D-lcwgs-1-T.1	13.5%	44%	2.4
Goy-APnd_004-Ex1-1D-lcwgs-1-T.2	12.9%	44%	2.4
Goy-APnd_005-Ex1-1E-lcwgs-1-T.1	17.0%	42%	1.1
Goy-APnd_005-Ex1-1E-lcwgs-1-T.2	15.8%	42%	1.1
Goy-APnd_006-Ex1-1F-lcwgs-1-T.1	16.2%	44%	1.8
Goy-APnd_006-Ex1-1F-lcwgs-1-T.2	15.2%	44%	1.8
Goy-APnd_007-Ex1-1G-lcwgs-1-T.1	14.7%	45%	1.5
Goy-APnd_007-Ex1-1G-lcwgs-1-T.2	13.9%	45%	1.5
Goy-APnd_008-Ex1-1H-lcwgs-1-T.1	15.1%	46%	0.6
Goy-APnd_008-Ex1-1H-lcwgs-1-T.2	14.4%	45%	0.6
Goy-APnd_009-Ex1-2A-lcwgs-1-T.1	12.6%	43%	0.5
Goy-APnd_009-Ex1-2A-lcwgs-1-T.2	11.8%	43%	0.5
Goy-APnd_010-Ex1-2B-lcwgs-1-T.1	11.8%	45%	2.0
Goy-APnd_010-Ex1-2B-lcwgs-1-T.2	11.2%	45%	2.0
Goy-APnd_011-Ex1-2C-lcwgs-1-T.1	15.8%	44%	2.0
Goy-APnd_011-Ex1-2C-lcwgs-1-T.2	14.9%	44%	2.0
Goy-APnd_012-Ex1-2D-lcwgs-1-T.1	10.4%	44%	2.1
Goy-APnd_012-Ex1-2D-lcwgs-1-T.2	10.0%	44%	2.1
Goy-APnd_013-Ex1-2E-lcwgs-1-T.1	21.2%	45%	0.7
Goy-APnd_013-Ex1-2E-lcwgs-1-T.2	20.3%	45%	0.7
Goy-APnd_014-Ex1-2F-lcwgs-1-T.1	19.7%	45%	2.5
Goy-APnd_014-Ex1-2F-lcwgs-1-T.2	18.8%	45%	2.5
Goy-APnd_015-Ex1-2G-lcwgs-1-T.1	16.8%	45%	1.9
Goy-APnd_015-Ex1-2G-lcwgs-1-T.2	16.1%	45%	1.9
Goy-APnd_016-Ex1-2H-lcwgs-1-T.1	16.7%	46%	2.1
Goy-APnd_016-Ex1-2H-lcwgs-1-T.2	15.9%	46%	2.1
Goy-APnd_017-Ex1-3A-lcwgs-1-T.1	15.2%	44%	1.0
Goy-APnd_017-Ex1-3A-lcwgs-1-T.2	14.4%	44%	1.0
Goy-APnd_018-Ex1-3B-lcwgs-1-T.1	13.6%	43%	0.6
Goy-APnd_018-Ex1-3B-lcwgs-1-T.2	12.9%	42%	0.6
Goy-APnd_019-Ex1-3C-lcwgs-1-T.1	15.8%	44%	2.3
Goy-APnd_019-Ex1-3C-lcwgs-1-T.2	15.0%	44%	2.3
Goy-APnd_020-Ex1-3D-lcwgs-1-T.1	10.5%	43%	2.2
Goy-APnd_020-Ex1-3D-lcwgs-1-T.2	10.0%	43%	2.2
Goy-APnd_021-Ex1-3E-lcwgs-1-T.1	10.9%	44%	2.3
Goy-APnd_021-Ex1-3E-lcwgs-1-T.2	10.4%	44%	2.3
Goy-APnd_022-Ex1-3F-lcwgs-1-T.1	11.3%	45%	3.3
Goy-APnd_022-Ex1-3F-lcwgs-1-T.2	10.9%	45%	3.3
Goy-APnd_023-Ex1-3G-lcwgs-1-T.1	15.9%	44%	2.0
Goy-APnd_023-Ex1-3G-lcwgs-1-T.2	15.1%	44%	2.0
Goy-APnd_024-Ex1-3H-lcwgs-1-T.1	10.7%	45%	3.0
Goy-APnd_024-Ex1-3H-lcwgs-1-T.2	10.3%	44%	3.0
Goy-APnd_025-Ex1-4A-lcwgs-1-T.1	19.7%	44%	1.0
Goy-APnd_025-Ex1-4A-lcwgs-1-T.2	18.3%	44%	1.0
Goy-APnd_026-Ex1-4B-lcwgs-1-T.1	13.4%	43%	0.6
Goy-APnd_026-Ex1-4B-lcwgs-1-T.2	12.6%	43%	0.6
Goy-APnd_027-Ex1-4C-lcwgs-1-T.1	10.4%	44%	2.2
Goy-APnd_027-Ex1-4C-lcwgs-1-T.2	9.9%	44%	2.2
Goy-APnd_028-Ex1-4D-lcwgs-1-T.1	13.8%	43%	2.7
Goy-APnd_028-Ex1-4D-lcwgs-1-T.2	13.0%	43%	2.7
Goy-APnd_029-Ex1-4E-lcwgs-1-T.1	17.1%	45%	1.2
Goy-APnd_029-Ex1-4E-lcwgs-1-T.2	16.0%	45%	1.2
Goy-APnd_030-Ex1-4F-lcwgs-1-T.1	22.8%	47%	1.7
Goy-APnd_030-Ex1-4F-lcwgs-1-T.2	20.8%	47%	1.7
Goy-APnd_031-Ex1-4G-lcwgs-1-T.1	20.1%	49%	0.3
Goy-APnd_031-Ex1-4G-lcwgs-1-T.2	18.2%	49%	0.3
Goy-APnd_032-Ex1-4H-lcwgs-1-T.1	13.5%	45%	0.5
Goy-APnd_032-Ex1-4H-lcwgs-1-T.2	12.9%	45%	0.5
Goy-APnd_033-Ex1-5A-lcwgs-1-T.1	16.2%	44%	2.5
Goy-APnd_033-Ex1-5A-lcwgs-1-T.2	15.2%	44%	2.5
Goy-APnd_034-Ex1-5B-lcwgs-1-T.1	23.0%	54%	0.4
Goy-APnd_034-Ex1-5B-lcwgs-1-T.2	20.7%	54%	0.4
Goy-APnd_035-Ex1-5C-lcwgs-1-T.1	21.3%	46%	0.9
Goy-APnd_035-Ex1-5C-lcwgs-1-T.2	19.9%	46%	0.9
Goy-APnd_036-Ex1-5D-lcwgs-1-T.1	15.3%	46%	0.5
Goy-APnd_036-Ex1-5D-lcwgs-1-T.2	14.4%	45%	0.5
Goy-APnd_037-Ex1-5E-lcwgs-1-T.1	21.3%	47%	0.9
Goy-APnd_037-Ex1-5E-lcwgs-1-T.2	19.7%	46%	0.9
Goy-APnd_038-Ex1-5F-lcwgs-1-T.1	17.6%	46%	1.9
Goy-APnd_038-Ex1-5F-lcwgs-1-T.2	16.4%	46%	1.9
Goy-APnd_039-Ex1-5G-lcwgs-1-T.1	14.3%	45%	0.7
Goy-APnd_039-Ex1-5G-lcwgs-1-T.2	13.6%	45%	0.7
Goy-APnd_040-Ex1-5H-lcwgs-1-T.1	14.9%	46%	1.1
Goy-APnd_040-Ex1-5H-lcwgs-1-T.2	14.2%	45%	1.1
Goy-APnd_041-Ex1-6A-lcwgs-1-T.1	19.1%	45%	1.7
Goy-APnd_041-Ex1-6A-lcwgs-1-T.2	18.2%	45%	1.7
Goy-APnd_042-Ex1-6B-lcwgs-1-T.1	15.3%	44%	0.7
Goy-APnd_042-Ex1-6B-lcwgs-1-T.2	14.6%	44%	0.7
Goy-APnd_043-Ex1-6C-lcwgs-1-T.1	20.2%	46%	2.0
Goy-APnd_043-Ex1-6C-lcwgs-1-T.2	18.9%	46%	2.0
Goy-APnd_044-Ex1-6D-lcwgs-1-T.1	12.6%	45%	1.9
Goy-APnd_044-Ex1-6D-lcwgs-1-T.2	11.8%	45%	1.9
Goy-APnd_045-Ex1-6E-lcwgs-1-T.1	15.6%	44%	4.3
Goy-APnd_045-Ex1-6E-lcwgs-1-T.2	14.9%	44%	4.3
Goy-APnd_046-Ex1-6F-lcwgs-1-T.1	14.8%	45%	3.5
Goy-APnd_046-Ex1-6F-lcwgs-1-T.2	14.0%	45%	3.5
Goy-APnd_047-Ex1-6G-lcwgs-1-T.1	11.1%	46%	0.2
Goy-APnd_047-Ex1-6G-lcwgs-1-T.2	10.6%	45%	0.2
Goy-APnd_048-Ex1-6H-lcwgs-1-T.1	12.3%	44%	4.0
Goy-APnd_048-Ex1-6H-lcwgs-1-T.2	11.7%	44%	4.0
Goy-APnd_049-Ex1-7A-lcwgs-1-T.1	33.5%	46%	1.5
Goy-APnd_049-Ex1-7A-lcwgs-1-T.2	30.9%	46%	1.5
Goy-APnd_050-Ex1-7B-lcwgs-1-T.1	13.0%	43%	1.2
Goy-APnd_050-Ex1-7B-lcwgs-1-T.2	12.3%	43%	1.2
Goy-APnd_051-Ex1-7C-lcwgs-1-T.1	14.7%	44%	1.9
Goy-APnd_051-Ex1-7C-lcwgs-1-T.2	14.0%	44%	1.9
Goy-APnd_052-Ex1-7D-lcwgs-1-T.1	13.2%	44%	2.5
Goy-APnd_052-Ex1-7D-lcwgs-1-T.2	12.6%	44%	2.5
Goy-APnd_053-Ex1-7E-lcwgs-1-T.1	19.2%	45%	1.3
Goy-APnd_053-Ex1-7E-lcwgs-1-T.2	18.3%	45%	1.3
Goy-APnd_054-Ex1-7F-lcwgs-1-T.1	17.0%	45%	1.6
Goy-APnd_054-Ex1-7F-lcwgs-1-T.2	16.2%	45%	1.6
Goy-APnd_055-Ex1-7G-lcwgs-1-T.1	16.7%	46%	2.7
Goy-APnd_055-Ex1-7G-lcwgs-1-T.2	15.8%	46%	2.7
Goy-APnd_056-Ex1-7H-lcwgs-1-T.1	14.8%	46%	3.1
Goy-APnd_056-Ex1-7H-lcwgs-1-T.2	14.1%	46%	3.1
Goy-APnd_057-Ex1-8A-lcwgs-1-T.1	13.6%	45%	0.7
Goy-APnd_057-Ex1-8A-lcwgs-1-T.2	12.8%	45%	0.7
Goy-APnd_058-Ex1-8B-lcwgs-1-T.1	13.6%	45%	0.6
Goy-APnd_058-Ex1-8B-lcwgs-1-T.2	13.0%	44%	0.6
Goy-APnd_059-Ex1-8C-lcwgs-1-T.1	10.7%	45%	1.8
Goy-APnd_059-Ex1-8C-lcwgs-1-T.2	10.1%	44%	1.8
Goy-APnd_060-Ex1-8D-lcwgs-1-T.1	10.8%	44%	0.8
Goy-APnd_060-Ex1-8D-lcwgs-1-T.2	10.2%	44%	0.8
Goy-APnd_061-Ex1-8E-lcwgs-1-T.1	11.3%	44%	0.6
Goy-APnd_061-Ex1-8E-lcwgs-1-T.2	10.9%	44%	0.6
Goy-APnd_062-Ex1-8F-lcwgs-1-T.1	11.9%	45%	0.9
Goy-APnd_062-Ex1-8F-lcwgs-1-T.2	11.3%	45%	0.9
Goy-APnd_063-Ex1-8G-lcwgs-1-T.1	10.8%	45%	1.0
Goy-APnd_063-Ex1-8G-lcwgs-1-T.2	10.4%	45%	1.0
Goy-APnd_064-Ex1-8H-lcwgs-1-T.1	15.1%	45%	2.3
Goy-APnd_064-Ex1-8H-lcwgs-1-T.2	14.2%	45%	2.3
Goy-APnd_065-Ex1-9A-lcwgs-1-T.1	11.9%	45%	0.5
Goy-APnd_065-Ex1-9A-lcwgs-1-T.2	11.2%	45%	0.5
Goy-APnd_066-Ex1-9B-lcwgs-1-T.1	14.9%	44%	0.5
Goy-APnd_066-Ex1-9B-lcwgs-1-T.2	14.0%	44%	0.5
Goy-APnd_067-Ex1-9C-lcwgs-1-T.1	11.6%	45%	0.3
Goy-APnd_067-Ex1-9C-lcwgs-1-T.2	11.1%	45%	0.3
Goy-CPnd_001-Ex1-7F-lcwgs-1-T.1	13.2%	45%	3.9
Goy-CPnd_001-Ex1-7F-lcwgs-1-T.2	11.4%	45%	3.9
Goy-CPnd_002-Ex1-5C-lcwgs-1-T.1	12.2%	46%	0.4
Goy-CPnd_002-Ex1-5C-lcwgs-1-T.2	10.8%	45%	0.4
Goy-CPnd_003-Ex1-7G-lcwgs-1-T.1	12.4%	45%	1.9
Goy-CPnd_003-Ex1-7G-lcwgs-1-T.2	10.7%	45%	1.9
Goy-CPnd_004-Ex1-2D-lcwgs-1-T.1	12.7%	44%	4.4
Goy-CPnd_004-Ex1-2D-lcwgs-1-T.2	10.9%	44%	4.4
Goy-CPnd_005-Ex1-6A-lcwgs-1-T.1	12.9%	44%	1.8
Goy-CPnd_005-Ex1-6A-lcwgs-1-T.2	10.9%	44%	1.8
Goy-CPnd_006-Ex1-2C-lcwgs-1-T.1	13.3%	44%	3.0
Goy-CPnd_006-Ex1-2C-lcwgs-1-T.2	11.6%	44%	3.0
Goy-CPnd_007-Ex1-8E-lcwgs-1-T.1	12.9%	45%	3.0
Goy-CPnd_007-Ex1-8E-lcwgs-1-T.2	11.2%	45%	3.0
Goy-CPnd_008-Ex1-4B-lcwgs-1-T.1	15.7%	44%	4.3
Goy-CPnd_008-Ex1-4B-lcwgs-1-T.2	12.9%	44%	4.3
Goy-CPnd_009-Ex1-8H-lcwgs-1-T.1	11.6%	44%	1.6
Goy-CPnd_009-Ex1-8H-lcwgs-1-T.2	10.1%	44%	1.6
Goy-CPnd_010-Ex1-6D-lcwgs-1-T.1	14.3%	45%	6.1
Goy-CPnd_010-Ex1-6D-lcwgs-1-T.2	12.6%	45%	6.1
Goy-CPnd_012-Ex1-1H-lcwgs-1-T.1	8.0%	48%	0.0
Goy-CPnd_012-Ex1-1H-lcwgs-1-T.2	7.1%	48%	0.0
Goy-CPnd_013-Ex1-7H-lcwgs-1-T.1	9.8%	45%	0.4
Goy-CPnd_013-Ex1-7H-lcwgs-1-T.2	8.7%	45%	0.4
Goy-CPnd_014-Ex1-4H-lcwgs-1-T.1	10.9%	45%	0.5
Goy-CPnd_014-Ex1-4H-lcwgs-1-T.2	9.5%	45%	0.5
Goy-CPnd_015-Ex1-1E-lcwgs-1-T.1	12.4%	44%	4.0
Goy-CPnd_015-Ex1-1E-lcwgs-1-T.2	10.1%	44%	4.0
Goy-CPnd_016-Ex1-7C-lcwgs-1-T.1	12.0%	44%	2.6
Goy-CPnd_016-Ex1-7C-lcwgs-1-T.2	10.4%	44%	2.6
Goy-CPnd_017-Ex1-5H-lcwgs-1-T.1	11.0%	47%	0.4
Goy-CPnd_017-Ex1-5H-lcwgs-1-T.2	10.4%	47%	0.4
Goy-CPnd_020-Ex1-5B-lcwgs-1-T.1	11.7%	45%	0.8
Goy-CPnd_020-Ex1-5B-lcwgs-1-T.2	10.4%	45%	0.8
Goy-CPnd_025-Ex1-5D-lcwgs-1-T.1	12.0%	44%	2.9
Goy-CPnd_025-Ex1-5D-lcwgs-1-T.2	10.8%	44%	2.9
Goy-CPnd_026-Ex1-2F-lcwgs-1-T.1	12.9%	44%	3.3
Goy-CPnd_026-Ex1-2F-lcwgs-1-T.2	11.0%	44%	3.3
Goy-CPnd_027-Ex1-2H-lcwgs-1-T.1	11.7%	44%	4.0
Goy-CPnd_027-Ex1-2H-lcwgs-1-T.2	10.3%	44%	4.0
Goy-CPnd_031-Ex1-1F-lcwgs-1-T.1	14.6%	45%	0.7
Goy-CPnd_031-Ex1-1F-lcwgs-1-T.2	11.9%	45%	0.7
Goy-CPnd_032-Ex1-1D-lcwgs-1-T.1	12.8%	44%	0.4
Goy-CPnd_032-Ex1-1D-lcwgs-1-T.2	10.7%	44%	0.4
Goy-CPnd_033-Ex1-2B-lcwgs-1-T.1	11.2%	44%	0.6
Goy-CPnd_033-Ex1-2B-lcwgs-1-T.2	10.1%	44%	0.6
Goy-CPnd_035-Ex1-3A-lcwgs-1-T.1	10.5%	44%	0.9
Goy-CPnd_035-Ex1-3A-lcwgs-1-T.2	9.4%	44%	0.9
Goy-CPnd_036-Ex1-7B-lcwgs-1-T.1	18.0%	57%	0.3
Goy-CPnd_036-Ex1-7B-lcwgs-1-T.2	15.2%	57%	0.3
Goy-CPnd_037-Ex1-3H-lcwgs-1-T.1	11.8%	44%	2.7
Goy-CPnd_037-Ex1-3H-lcwgs-1-T.2	10.3%	44%	2.7
Goy-CPnd_038-Ex1-6F-lcwgs-1-T.1	14.8%	45%	4.2
Goy-CPnd_038-Ex1-6F-lcwgs-1-T.2	12.2%	44%	4.2
Goy-CPnd_039-Ex1-8A-lcwgs-1-T.1	13.7%	43%	2.7
Goy-CPnd_039-Ex1-8A-lcwgs-1-T.2	11.2%	43%	2.7
Goy-CPnd_040-Ex1-7A-lcwgs-1-T.1	9.1%	44%	0.3
Goy-CPnd_040-Ex1-7A-lcwgs-1-T.2	8.5%	44%	0.3
Goy-CPnd_041-Ex1-3C-lcwgs-1-T.1	14.0%	44%	7.0
Goy-CPnd_041-Ex1-3C-lcwgs-1-T.2	11.4%	44%	7.0
Goy-CPnd_042-Ex1-3B-lcwgs-1-T.1	12.0%	44%	2.5
Goy-CPnd_042-Ex1-3B-lcwgs-1-T.2	10.5%	44%	2.5
Goy-CPnd_044-Ex1-4E-lcwgs-1-T.1	6.8%	44%	0.1
Goy-CPnd_044-Ex1-4E-lcwgs-1-T.2	5.9%	44%	0.1
Goy-CPnd_047-Ex1-6E-lcwgs-1-T.1	16.1%	45%	2.9
Goy-CPnd_047-Ex1-6E-lcwgs-1-T.2	13.3%	44%	2.9
Goy-CPnd_048-Ex1-8B-lcwgs-1-T.1	11.5%	44%	1.2
Goy-CPnd_048-Ex1-8B-lcwgs-1-T.2	9.8%	44%	1.2
Goy-CPnd_049-Ex1-8C-lcwgs-1-T.1	11.3%	45%	0.5
Goy-CPnd_049-Ex1-8C-lcwgs-1-T.2	10.0%	45%	0.5
Goy-CPnd_050-Ex1-8F-lcwgs-1-T.1	11.5%	45%	0.4
Goy-CPnd_050-Ex1-8F-lcwgs-1-T.2	9.9%	44%	0.4
Goy-CPnd_052-Ex1-3D-lcwgs-1-T.1	12.3%	44%	3.4
Goy-CPnd_052-Ex1-3D-lcwgs-1-T.2	10.6%	44%	3.4
Goy-CPnd_053-Ex1-2E-lcwgs-1-T.1	12.3%	44%	3.3
Goy-CPnd_053-Ex1-2E-lcwgs-1-T.2	10.8%	44%	3.3
Goy-CPnd_054-Ex1-1B-lcwgs-1-T.1	13.2%	45%	0.2
Goy-CPnd_054-Ex1-1B-lcwgs-1-T.2	11.1%	45%	0.2
Goy-CPnd_056-Ex1-3G-lcwgs-1-T.1	14.2%	44%	5.1
Goy-CPnd_056-Ex1-3G-lcwgs-1-T.2	11.4%	44%	5.1
Goy-CPnd_057-Ex1-4F-lcwgs-1-T.1	14.4%	44%	4.7
Goy-CPnd_057-Ex1-4F-lcwgs-1-T.2	11.9%	44%	4.7
Goy-CPnd_058-Ex1-1G-lcwgs-1-T.1	13.8%	44%	0.1
Goy-CPnd_058-Ex1-1G-lcwgs-1-T.2	11.5%	44%	0.1
Goy-CPnd_059-Ex1-8G-lcwgs-1-T.1	11.3%	44%	1.4
Goy-CPnd_059-Ex1-8G-lcwgs-1-T.2	9.8%	44%	1.4
Goy-CPnd_060-Ex1-7D-lcwgs-1-T.1	11.6%	45%	3.3
Goy-CPnd_060-Ex1-7D-lcwgs-1-T.2	10.3%	45%	3.3
Goy-CPnd_061-Ex1-7E-lcwgs-1-T.1	11.4%	44%	4.5
Goy-CPnd_061-Ex1-7E-lcwgs-1-T.2	10.1%	44%	4.5
Goy-CPnd_062-Ex1-3F-lcwgs-1-T.1	13.1%	44%	3.6
Goy-CPnd_062-Ex1-3F-lcwgs-1-T.2	11.1%	43%	3.6
Goy-CPnd_063-Ex1-2G-lcwgs-1-T.1	14.7%	45%	5.0
Goy-CPnd_063-Ex1-2G-lcwgs-1-T.2	12.4%	44%	5.0
Goy-CPnd_064-Ex1-8D-lcwgs-1-T.1	12.9%	44%	3.8
Goy-CPnd_064-Ex1-8D-lcwgs-1-T.2	11.2%	44%	3.8
Goy-CPnd_068-Ex1-2A-lcwgs-1-T.1	13.9%	44%	4.4
Goy-CPnd_068-Ex1-2A-lcwgs-1-T.2	11.8%	44%	4.4
Goy-CPnd_070-Ex1-1A-lcwgs-1-T.1	14.5%	44%	5.3
Goy-CPnd_070-Ex1-1A-lcwgs-1-T.2	11.7%	44%	5.3
Goy-CPnd_071-Ex1-3E-lcwgs-1-T.1	11.8%	44%	3.4
Goy-CPnd_071-Ex1-3E-lcwgs-1-T.2	10.1%	44%	3.4
Goy-CPnd_072-Ex1-4D-lcwgs-1-T.1	11.1%	44%	2.0
Goy-CPnd_072-Ex1-4D-lcwgs-1-T.2	9.5%	44%	2.0
Goy-CPnd_073-Ex1-4C-lcwgs-1-T.1	11.4%	44%	1.4
Goy-CPnd_073-Ex1-4C-lcwgs-1-T.2	9.9%	44%	1.4
Goy-CPnd_074-Ex1-1C-lcwgs-1-T.1	12.1%	44%	1.4
Goy-CPnd_074-Ex1-1C-lcwgs-1-T.2	10.2%	44%	1.4
Goy-CPnd_084-Ex1-5E-lcwgs-1-T.1	14.1%	44%	7.1
Goy-CPnd_084-Ex1-5E-lcwgs-1-T.2	11.7%	44%	7.1
Goy-CPnd_085-Ex1-6G-lcwgs-1-T.1	13.2%	45%	2.2
Goy-CPnd_085-Ex1-6G-lcwgs-1-T.2	11.3%	45%	2.2
Goy-CPnd_086-Ex1-5F-lcwgs-1-T.1	12.0%	45%	0.6
Goy-CPnd_086-Ex1-5F-lcwgs-1-T.2	10.5%	45%	0.6
Goy-CPnd_087-Ex1-6C-lcwgs-1-T.1	12.7%	45%	1.0
Goy-CPnd_087-Ex1-6C-lcwgs-1-T.2	11.3%	45%	1.0
Goy-CPnd_088-Ex1-6H-lcwgs-1-T.1	14.0%	44%	3.5
Goy-CPnd_088-Ex1-6H-lcwgs-1-T.2	12.0%	44%	3.5
Goy-CPnd_089-Ex1-6B-lcwgs-1-T.1	13.3%	45%	0.5
Goy-CPnd_089-Ex1-6B-lcwgs-1-T.2	11.6%	45%	0.5
Goy-CPnd_090-Ex1-5G-lcwgs-1-T.1	12.5%	44%	1.0
Goy-CPnd_090-Ex1-5G-lcwgs-1-T.2	10.5%	44%	1.0
Goy-CPnd_091-Ex1-4G-lcwgs-1-T.1	13.0%	44%	4.5
Goy-CPnd_091-Ex1-4G-lcwgs-1-T.2	10.6%	44%	4.5
Goy-CPnd_092-Ex1-4A-lcwgs-1-T.1	13.7%	46%	1.6
Goy-CPnd_092-Ex1-4A-lcwgs-1-T.2	11.7%	46%	1.6
Goy-CPnd_095-Ex1-5A-lcwgs-1-T.1	13.7%	45%	1.9
Goy-CPnd_095-Ex1-5A-lcwgs-1-T.2	12.0%	45%	1.9
```

</p>
</details>

## 8. First trim.
First trim complete.

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Goy-APnd_001-Ex1-1A-lcwgs-1-T	13.1%	41.4%	97.3%	83.2%
Goy-APnd_002-Ex1-1B-lcwgs-1-T	14.1%	40.2%	97.7%	77.2%
Goy-APnd_003-Ex1-1C-lcwgs-1-T	13.9%	41.2%	97.6%	77.6%
Goy-APnd_004-Ex1-1D-lcwgs-1-T	13.0%	41.5%	97.5%	87.3%
Goy-APnd_005-Ex1-1E-lcwgs-1-T	16.0%	40.0%	97.7%	67.1%
Goy-APnd_006-Ex1-1F-lcwgs-1-T	13.1%	41.2%	97.1%	90.3%
Goy-APnd_007-Ex1-1G-lcwgs-1-T	12.9%	42.3%	96.0%	91.5%
Goy-APnd_008-Ex1-1H-lcwgs-1-T	12.0%	43.1%	93.9%	92.4%
Goy-APnd_009-Ex1-2A-lcwgs-1-T	12.7%	40.1%	97.2%	85.5%
Goy-APnd_010-Ex1-2B-lcwgs-1-T	12.7%	42.2%	97.2%	92.0%
Goy-APnd_011-Ex1-2C-lcwgs-1-T	13.2%	41.6%	95.4%	88.5%
Goy-APnd_012-Ex1-2D-lcwgs-1-T	12.9%	41.3%	97.7%	89.5%
Goy-APnd_013-Ex1-2E-lcwgs-1-T	12.7%	42.2%	90.6%	96.1%
Goy-APnd_014-Ex1-2F-lcwgs-1-T	12.9%	42.7%	91.8%	92.8%
Goy-APnd_015-Ex1-2G-lcwgs-1-T	13.0%	41.7%	91.7%	93.4%
Goy-APnd_016-Ex1-2H-lcwgs-1-T	12.5%	43.8%	92.0%	95.3%
Goy-APnd_017-Ex1-3A-lcwgs-1-T	14.5%	41.2%	97.6%	84.9%
Goy-APnd_018-Ex1-3B-lcwgs-1-T	13.6%	40.2%	98.0%	79.8%
Goy-APnd_019-Ex1-3C-lcwgs-1-T	14.0%	41.8%	98.0%	81.9%
Goy-APnd_020-Ex1-3D-lcwgs-1-T	13.8%	40.8%	98.7%	82.5%
Goy-APnd_021-Ex1-3E-lcwgs-1-T	13.6%	41.6%	98.3%	88.7%
Goy-APnd_022-Ex1-3F-lcwgs-1-T	13.7%	42.8%	97.6%	87.1%
Goy-APnd_023-Ex1-3G-lcwgs-1-T	13.7%	41.4%	96.1%	89.6%
Goy-APnd_024-Ex1-3H-lcwgs-1-T	13.6%	42.0%	97.9%	91.1%
Goy-APnd_025-Ex1-4A-lcwgs-1-T	14.5%	43.0%	97.7%	76.9%
Goy-APnd_026-Ex1-4B-lcwgs-1-T	15.0%	41.3%	98.0%	68.2%
Goy-APnd_027-Ex1-4C-lcwgs-1-T	11.7%	41.7%	98.0%	91.4%
Goy-APnd_028-Ex1-4D-lcwgs-1-T	14.5%	41.7%	98.2%	72.0%
Goy-APnd_029-Ex1-4E-lcwgs-1-T	13.8%	43.6%	97.8%	75.9%
Goy-APnd_030-Ex1-4F-lcwgs-1-T	18.3%	47.0%	97.5%	60.0%
Goy-APnd_031-Ex1-4G-lcwgs-1-T	15.7%	48.6%	97.3%	68.8%
Goy-APnd_032-Ex1-4H-lcwgs-1-T	11.9%	43.2%	97.4%	93.9%
Goy-APnd_033-Ex1-5A-lcwgs-1-T	14.6%	42.0%	97.4%	78.4%
Goy-APnd_034-Ex1-5B-lcwgs-1-T	20.7%	55.5%	96.2%	39.6%
Goy-APnd_035-Ex1-5C-lcwgs-1-T	12.4%	44.4%	96.6%	89.9%
Goy-APnd_036-Ex1-5D-lcwgs-1-T	11.9%	43.9%	97.0%	90.0%
Goy-APnd_037-Ex1-5E-lcwgs-1-T	13.9%	45.6%	95.8%	79.0%
Goy-APnd_038-Ex1-5F-lcwgs-1-T	12.9%	44.9%	96.3%	89.0%
Goy-APnd_039-Ex1-5G-lcwgs-1-T	12.1%	42.2%	95.4%	94.1%
Goy-APnd_040-Ex1-5H-lcwgs-1-T	12.6%	43.6%	95.5%	92.8%
Goy-APnd_041-Ex1-6A-lcwgs-1-T	10.9%	43.2%	92.3%	86.4%
Goy-APnd_042-Ex1-6B-lcwgs-1-T	11.6%	41.4%	94.6%	85.6%
Goy-APnd_043-Ex1-6C-lcwgs-1-T	11.8%	44.3%	94.7%	79.4%
Goy-APnd_044-Ex1-6D-lcwgs-1-T	12.1%	43.1%	97.0%	81.5%
Goy-APnd_045-Ex1-6E-lcwgs-1-T	12.5%	41.7%	94.7%	81.9%
Goy-APnd_046-Ex1-6F-lcwgs-1-T	12.2%	43.0%	96.3%	82.2%
Goy-APnd_047-Ex1-6G-lcwgs-1-T	7.1%	43.7%	96.3%	90.6%
Goy-APnd_048-Ex1-6H-lcwgs-1-T	12.6%	42.4%	97.5%	82.2%
Goy-APnd_049-Ex1-7A-lcwgs-1-T	15.3%	45.1%	91.0%	65.4%
Goy-APnd_050-Ex1-7B-lcwgs-1-T	13.6%	41.2%	97.9%	81.5%
Goy-APnd_051-Ex1-7C-lcwgs-1-T	12.7%	41.9%	95.9%	85.2%
Goy-APnd_052-Ex1-7D-lcwgs-1-T	12.4%	41.2%	95.7%	86.5%
Goy-APnd_053-Ex1-7E-lcwgs-1-T	12.7%	42.7%	92.6%	86.4%
Goy-APnd_054-Ex1-7F-lcwgs-1-T	12.2%	42.4%	92.7%	86.4%
Goy-APnd_055-Ex1-7G-lcwgs-1-T	13.5%	44.7%	94.4%	80.7%
Goy-APnd_056-Ex1-7H-lcwgs-1-T	13.6%	44.5%	96.4%	78.3%
Goy-APnd_057-Ex1-8A-lcwgs-1-T	13.8%	43.4%	95.6%	76.8%
Goy-APnd_058-Ex1-8B-lcwgs-1-T	13.6%	42.8%	95.5%	79.1%
Goy-APnd_059-Ex1-8C-lcwgs-1-T	13.0%	42.4%	97.2%	85.5%
Goy-APnd_060-Ex1-8D-lcwgs-1-T	13.5%	42.0%	97.9%	82.8%
Goy-APnd_061-Ex1-8E-lcwgs-1-T	13.3%	41.3%	96.7%	91.3%
Goy-APnd_062-Ex1-8F-lcwgs-1-T	13.8%	43.5%	97.1%	83.8%
Goy-APnd_063-Ex1-8G-lcwgs-1-T	13.5%	42.6%	97.5%	86.9%
Goy-APnd_064-Ex1-8H-lcwgs-1-T	14.4%	44.0%	95.8%	72.4%
Goy-APnd_065-Ex1-9A-lcwgs-1-T	13.5%	43.0%	97.2%	78.7%
Goy-APnd_066-Ex1-9B-lcwgs-1-T	13.3%	42.4%	95.8%	79.6%
Goy-APnd_067-Ex1-9C-lcwgs-1-T	13.5%	43.7%	98.1%	81.4%
Goy-CPnd_001-Ex1-7F-lcwgs-1-T	14.5%	45.2%	95.8%	22.6%
Goy-CPnd_002-Ex1-5C-lcwgs-1-T	13.8%	45.3%	96.2%	36.1%
Goy-CPnd_003-Ex1-7G-lcwgs-1-T	13.5%	44.9%	96.0%	30.0%
Goy-CPnd_004-Ex1-2D-lcwgs-1-T	14.7%	43.8%	96.2%	20.9%
Goy-CPnd_005-Ex1-6A-lcwgs-1-T	16.3%	43.7%	95.9%	19.8%
Goy-CPnd_006-Ex1-2C-lcwgs-1-T	15.1%	44.0%	96.2%	24.3%
Goy-CPnd_007-Ex1-8E-lcwgs-1-T	14.9%	44.4%	96.1%	25.5%
Goy-CPnd_008-Ex1-4B-lcwgs-1-T	16.9%	43.9%	95.1%	7.2%
Goy-CPnd_009-Ex1-8H-lcwgs-1-T	14.0%	43.9%	96.1%	30.9%
Goy-CPnd_010-Ex1-6D-lcwgs-1-T	16.9%	45.2%	96.9%	23.1%
Goy-CPnd_012-Ex1-1H-lcwgs-1-T	5.7%	48.1%	92.0%	25.2%
Goy-CPnd_013-Ex1-7H-lcwgs-1-T	11.2%	44.4%	96.4%	40.5%
Goy-CPnd_014-Ex1-4H-lcwgs-1-T	12.6%	44.6%	95.7%	27.8%
Goy-CPnd_015-Ex1-1E-lcwgs-1-T	14.8%	44.1%	94.8%	8.8%
Goy-CPnd_016-Ex1-7C-lcwgs-1-T	14.5%	44.2%	96.3%	26.6%
Goy-CPnd_017-Ex1-5H-lcwgs-1-T	12.3%	46.6%	97.2%	69.5%
Goy-CPnd_020-Ex1-5B-lcwgs-1-T	14.3%	44.4%	96.6%	42.5%
Goy-CPnd_025-Ex1-5D-lcwgs-1-T	14.3%	43.8%	96.8%	32.0%
Goy-CPnd_026-Ex1-2F-lcwgs-1-T	15.7%	43.8%	95.6%	13.1%
Goy-CPnd_027-Ex1-2H-lcwgs-1-T	14.5%	43.8%	96.0%	24.1%
Goy-CPnd_031-Ex1-1F-lcwgs-1-T	16.2%	44.8%	94.5%	6.1%
Goy-CPnd_032-Ex1-1D-lcwgs-1-T	13.6%	44.5%	94.7%	10.0%
Goy-CPnd_033-Ex1-2B-lcwgs-1-T	13.5%	43.9%	96.7%	41.1%
Goy-CPnd_035-Ex1-3A-lcwgs-1-T	13.3%	43.7%	96.4%	44.3%
Goy-CPnd_036-Ex1-7B-lcwgs-1-T	18.6%	57.3%	94.5%	9.6%
Goy-CPnd_037-Ex1-3H-lcwgs-1-T	14.5%	44.1%	96.2%	28.1%
Goy-CPnd_038-Ex1-6F-lcwgs-1-T	17.7%	44.7%	95.2%	9.0%
Goy-CPnd_039-Ex1-8A-lcwgs-1-T	16.2%	43.5%	94.9%	5.4%
Goy-CPnd_040-Ex1-7A-lcwgs-1-T	9.8%	43.2%	95.6%	55.7%
Goy-CPnd_041-Ex1-3C-lcwgs-1-T	16.1%	44.3%	95.1%	10.8%
Goy-CPnd_042-Ex1-3B-lcwgs-1-T	15.1%	43.6%	96.3%	26.7%
Goy-CPnd_044-Ex1-4E-lcwgs-1-T	5.3%	43.5%	91.8%	34.9%
Goy-CPnd_047-Ex1-6E-lcwgs-1-T	17.7%	44.6%	93.6%	6.1%
Goy-CPnd_048-Ex1-8B-lcwgs-1-T	14.7%	43.8%	96.2%	22.4%
Goy-CPnd_049-Ex1-8C-lcwgs-1-T	13.5%	44.5%	96.6%	38.9%
Goy-CPnd_050-Ex1-8F-lcwgs-1-T	13.5%	44.3%	96.3%	28.9%
Goy-CPnd_052-Ex1-3D-lcwgs-1-T	14.6%	44.0%	96.0%	20.5%
Goy-CPnd_053-Ex1-2E-lcwgs-1-T	14.7%	43.9%	96.1%	25.8%
Goy-CPnd_054-Ex1-1B-lcwgs-1-T	13.1%	44.7%	95.3%	20.8%
Goy-CPnd_056-Ex1-3G-lcwgs-1-T	16.2%	44.0%	94.8%	6.4%
Goy-CPnd_057-Ex1-4F-lcwgs-1-T	17.2%	43.9%	95.6%	11.5%
Goy-CPnd_058-Ex1-1G-lcwgs-1-T	10.7%	44.2%	92.8%	12.6%
Goy-CPnd_059-Ex1-8G-lcwgs-1-T	13.8%	44.2%	96.2%	28.6%
Goy-CPnd_060-Ex1-7D-lcwgs-1-T	13.5%	44.6%	96.7%	32.9%
Goy-CPnd_061-Ex1-7E-lcwgs-1-T	13.8%	44.1%	96.4%	31.1%
Goy-CPnd_062-Ex1-3F-lcwgs-1-T	15.9%	43.6%	95.8%	17.0%
Goy-CPnd_063-Ex1-2G-lcwgs-1-T	15.1%	44.5%	95.6%	14.9%
Goy-CPnd_064-Ex1-8D-lcwgs-1-T	15.0%	44.3%	96.5%	22.4%
Goy-CPnd_068-Ex1-2A-lcwgs-1-T	16.2%	44.0%	95.9%	15.0%
Goy-CPnd_070-Ex1-1A-lcwgs-1-T	16.0%	43.8%	95.0%	5.5%
Goy-CPnd_071-Ex1-3E-lcwgs-1-T	15.1%	43.9%	95.6%	20.9%
Goy-CPnd_072-Ex1-4D-lcwgs-1-T	13.5%	43.9%	96.2%	22.5%
Goy-CPnd_073-Ex1-4C-lcwgs-1-T	14.1%	44.2%	96.5%	32.5%
Goy-CPnd_074-Ex1-1C-lcwgs-1-T	14.6%	44.1%	95.8%	19.5%
Goy-CPnd_084-Ex1-5E-lcwgs-1-T	16.8%	44.0%	95.5%	11.0%
Goy-CPnd_085-Ex1-6G-lcwgs-1-T	15.6%	44.6%	96.3%	29.7%
Goy-CPnd_086-Ex1-5F-lcwgs-1-T	14.2%	44.4%	96.3%	29.9%
Goy-CPnd_087-Ex1-6C-lcwgs-1-T	15.1%	44.3%	96.2%	36.2%
Goy-CPnd_088-Ex1-6H-lcwgs-1-T	16.6%	44.0%	95.9%	18.5%
Goy-CPnd_089-Ex1-6B-lcwgs-1-T	14.6%	44.6%	96.4%	38.9%
Goy-CPnd_090-Ex1-5G-lcwgs-1-T	14.4%	43.8%	95.4%	16.5%
Goy-CPnd_091-Ex1-4G-lcwgs-1-T	15.0%	43.8%	94.9%	5.8%
Goy-CPnd_092-Ex1-4A-lcwgs-1-T	14.7%	45.9%	95.9%	27.2%
Goy-CPnd_095-Ex1-5A-lcwgs-1-T	15.2%	44.9%	96.5%	30.7%
```

</p>
</details>

## 9. Remove duplicates with clumpify.

### 9a. Remove duplicates.
Executed `runCLUMPIFY_r1r2_array.bash`, running. 5/2

As of this morning, 4 samples still running. Manually canceled these runs, put those samples into fp_fq_stragglers and ran again. Successfully completed. 5/3

### 9b. Check duplicate removal sucess.
Ran `checkClumpify_EG.R`. "Clumpify Successfully worked on all samples"

### 9c. Generate metadata on deduplicated FASTQ files.
Ran `runMULTIQC.sbatch`. Completed.

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	Length	M Seqs
Goy-APnd_001-Ex1-1A-lcwgs-1-T.clmp.r1	5.8%	40%	102 bp	0.5
Goy-APnd_001-Ex1-1A-lcwgs-1-T.clmp.r2	5.1%	40%	102 bp	0.5
Goy-APnd_002-Ex1-1B-lcwgs-1-T.clmp.r1	3.5%	40%	109 bp	1.4
Goy-APnd_002-Ex1-1B-lcwgs-1-T.clmp.r2	3.2%	40%	109 bp	1.4
Goy-APnd_003-Ex1-1C-lcwgs-1-T.clmp.r1	4.3%	40%	107 bp	2.3
Goy-APnd_003-Ex1-1C-lcwgs-1-T.clmp.r2	3.9%	40%	107 bp	2.3
Goy-APnd_004-Ex1-1D-lcwgs-1-T.clmp.r1	2.5%	41%	93 bp	1.9
Goy-APnd_004-Ex1-1D-lcwgs-1-T.clmp.r2	2.3%	41%	93 bp	1.9
Goy-APnd_005-Ex1-1E-lcwgs-1-T.clmp.r1	5.5%	39%	118 bp	0.9
Goy-APnd_005-Ex1-1E-lcwgs-1-T.clmp.r2	5.0%	39%	118 bp	0.9
Goy-APnd_006-Ex1-1F-lcwgs-1-T.clmp.r1	2.7%	40%	90 bp	1.4
Goy-APnd_006-Ex1-1F-lcwgs-1-T.clmp.r2	2.5%	40%	90 bp	1.4
Goy-APnd_007-Ex1-1G-lcwgs-1-T.clmp.r1	2.1%	41%	86 bp	1.2
Goy-APnd_007-Ex1-1G-lcwgs-1-T.clmp.r2	2.0%	41%	86 bp	1.2
Goy-APnd_008-Ex1-1H-lcwgs-1-T.clmp.r1	1.8%	42%	84 bp	0.5
Goy-APnd_008-Ex1-1H-lcwgs-1-T.clmp.r2	1.7%	42%	84 bp	0.5
Goy-APnd_009-Ex1-2A-lcwgs-1-T.clmp.r1	2.2%	40%	96 bp	0.4
Goy-APnd_009-Ex1-2A-lcwgs-1-T.clmp.r2	2.0%	40%	96 bp	0.4
Goy-APnd_010-Ex1-2B-lcwgs-1-T.clmp.r1	1.6%	41%	85 bp	1.7
Goy-APnd_010-Ex1-2B-lcwgs-1-T.clmp.r2	1.6%	41%	86 bp	1.7
Goy-APnd_011-Ex1-2C-lcwgs-1-T.clmp.r1	2.3%	41%	90 bp	1.5
Goy-APnd_011-Ex1-2C-lcwgs-1-T.clmp.r2	2.2%	41%	90 bp	1.5
Goy-APnd_012-Ex1-2D-lcwgs-1-T.clmp.r1	1.6%	41%	90 bp	1.8
Goy-APnd_012-Ex1-2D-lcwgs-1-T.clmp.r2	1.6%	41%	90 bp	1.8
Goy-APnd_013-Ex1-2E-lcwgs-1-T.clmp.r1	1.9%	41%	80 bp	0.5
Goy-APnd_013-Ex1-2E-lcwgs-1-T.clmp.r2	1.7%	41%	80 bp	0.5
Goy-APnd_014-Ex1-2F-lcwgs-1-T.clmp.r1	2.1%	42%	83 bp	1.9
Goy-APnd_014-Ex1-2F-lcwgs-1-T.clmp.r2	2.1%	42%	83 bp	1.9
Goy-APnd_015-Ex1-2G-lcwgs-1-T.clmp.r1	1.6%	41%	81 bp	1.5
Goy-APnd_015-Ex1-2G-lcwgs-1-T.clmp.r2	1.5%	41%	81 bp	1.5
Goy-APnd_016-Ex1-2H-lcwgs-1-T.clmp.r1	1.5%	43%	78 bp	1.6
Goy-APnd_016-Ex1-2H-lcwgs-1-T.clmp.r2	1.4%	43%	78 bp	1.6
Goy-APnd_017-Ex1-3A-lcwgs-1-T.clmp.r1	3.1%	40%	98 bp	0.8
Goy-APnd_017-Ex1-3A-lcwgs-1-T.clmp.r2	2.9%	40%	98 bp	0.8
Goy-APnd_018-Ex1-3B-lcwgs-1-T.clmp.r1	3.3%	40%	107 bp	0.5
Goy-APnd_018-Ex1-3B-lcwgs-1-T.clmp.r2	3.0%	39%	107 bp	0.5
Goy-APnd_019-Ex1-3C-lcwgs-1-T.clmp.r1	3.6%	41%	102 bp	1.8
Goy-APnd_019-Ex1-3C-lcwgs-1-T.clmp.r2	3.3%	41%	102 bp	1.8
Goy-APnd_020-Ex1-3D-lcwgs-1-T.clmp.r1	2.3%	40%	103 bp	1.9
Goy-APnd_020-Ex1-3D-lcwgs-1-T.clmp.r2	2.2%	40%	103 bp	1.9
Goy-APnd_021-Ex1-3E-lcwgs-1-T.clmp.r1	1.9%	41%	92 bp	1.9
Goy-APnd_021-Ex1-3E-lcwgs-1-T.clmp.r2	1.8%	41%	92 bp	1.9
Goy-APnd_022-Ex1-3F-lcwgs-1-T.clmp.r1	2.0%	42%	91 bp	2.7
Goy-APnd_022-Ex1-3F-lcwgs-1-T.clmp.r2	1.9%	42%	91 bp	2.7
Goy-APnd_023-Ex1-3G-lcwgs-1-T.clmp.r1	2.3%	41%	88 bp	1.6
Goy-APnd_023-Ex1-3G-lcwgs-1-T.clmp.r2	2.2%	41%	88 bp	1.6
Goy-APnd_024-Ex1-3H-lcwgs-1-T.clmp.r1	1.7%	41%	87 bp	2.5
Goy-APnd_024-Ex1-3H-lcwgs-1-T.clmp.r2	1.6%	41%	87 bp	2.5
Goy-APnd_025-Ex1-4A-lcwgs-1-T.clmp.r1	6.1%	42%	113 bp	0.8
Goy-APnd_025-Ex1-4A-lcwgs-1-T.clmp.r2	5.4%	42%	113 bp	0.8
Goy-APnd_026-Ex1-4B-lcwgs-1-T.clmp.r1	4.2%	41%	119 bp	0.5
Goy-APnd_026-Ex1-4B-lcwgs-1-T.clmp.r2	3.9%	41%	120 bp	0.5
Goy-APnd_027-Ex1-4C-lcwgs-1-T.clmp.r1	1.7%	41%	93 bp	1.8
Goy-APnd_027-Ex1-4C-lcwgs-1-T.clmp.r2	1.6%	41%	93 bp	1.8
Goy-APnd_028-Ex1-4D-lcwgs-1-T.clmp.r1	4.3%	41%	120 bp	2.3
Goy-APnd_028-Ex1-4D-lcwgs-1-T.clmp.r2	4.0%	41%	120 bp	2.3
Goy-APnd_029-Ex1-4E-lcwgs-1-T.clmp.r1	5.2%	43%	115 bp	0.9
Goy-APnd_029-Ex1-4E-lcwgs-1-T.clmp.r2	4.7%	43%	115 bp	0.9
Goy-APnd_030-Ex1-4F-lcwgs-1-T.clmp.r1	8.8%	47%	128 bp	1.4
Goy-APnd_030-Ex1-4F-lcwgs-1-T.clmp.r2	7.9%	46%	128 bp	1.4
Goy-APnd_031-Ex1-4G-lcwgs-1-T.clmp.r1	6.7%	48%	119 bp	0.2
Goy-APnd_031-Ex1-4G-lcwgs-1-T.clmp.r2	5.6%	48%	119 bp	0.2
Goy-APnd_032-Ex1-4H-lcwgs-1-T.clmp.r1	1.9%	42%	88 bp	0.4
Goy-APnd_032-Ex1-4H-lcwgs-1-T.clmp.r2	1.8%	42%	88 bp	0.4
Goy-APnd_033-Ex1-5A-lcwgs-1-T.clmp.r1	4.1%	41%	107 bp	2.0
Goy-APnd_033-Ex1-5A-lcwgs-1-T.clmp.r2	3.7%	41%	107 bp	2.0
Goy-APnd_034-Ex1-5B-lcwgs-1-T.clmp.r1	8.4%	55%	132 bp	0.3
Goy-APnd_034-Ex1-5B-lcwgs-1-T.clmp.r2	7.0%	55%	132 bp	0.3
Goy-APnd_035-Ex1-5C-lcwgs-1-T.clmp.r1	3.9%	43%	92 bp	0.7
Goy-APnd_035-Ex1-5C-lcwgs-1-T.clmp.r2	3.5%	43%	92 bp	0.7
Goy-APnd_036-Ex1-5D-lcwgs-1-T.clmp.r1	2.6%	43%	91 bp	0.4
Goy-APnd_036-Ex1-5D-lcwgs-1-T.clmp.r2	2.4%	43%	91 bp	0.4
Goy-APnd_037-Ex1-5E-lcwgs-1-T.clmp.r1	5.9%	45%	110 bp	0.7
Goy-APnd_037-Ex1-5E-lcwgs-1-T.clmp.r2	5.3%	45%	110 bp	0.7
Goy-APnd_038-Ex1-5F-lcwgs-1-T.clmp.r1	3.0%	44%	92 bp	1.5
Goy-APnd_038-Ex1-5F-lcwgs-1-T.clmp.r2	2.7%	44%	92 bp	1.5
Goy-APnd_039-Ex1-5G-lcwgs-1-T.clmp.r1	1.9%	41%	82 bp	0.6
Goy-APnd_039-Ex1-5G-lcwgs-1-T.clmp.r2	1.7%	41%	83 bp	0.6
Goy-APnd_040-Ex1-5H-lcwgs-1-T.clmp.r1	2.1%	43%	86 bp	0.9
Goy-APnd_040-Ex1-5H-lcwgs-1-T.clmp.r2	2.0%	43%	86 bp	0.9
Goy-APnd_041-Ex1-6A-lcwgs-1-T.clmp.r1	2.6%	42%	93 bp	1.3
Goy-APnd_041-Ex1-6A-lcwgs-1-T.clmp.r2	2.4%	42%	93 bp	1.3
Goy-APnd_042-Ex1-6B-lcwgs-1-T.clmp.r1	2.7%	41%	98 bp	0.6
Goy-APnd_042-Ex1-6B-lcwgs-1-T.clmp.r2	2.5%	41%	98 bp	0.6
Goy-APnd_043-Ex1-6C-lcwgs-1-T.clmp.r1	4.1%	44%	104 bp	1.5
Goy-APnd_043-Ex1-6C-lcwgs-1-T.clmp.r2	3.9%	43%	104 bp	1.5
Goy-APnd_044-Ex1-6D-lcwgs-1-T.clmp.r1	2.5%	42%	101 bp	1.5
Goy-APnd_044-Ex1-6D-lcwgs-1-T.clmp.r2	2.3%	42%	101 bp	1.5
Goy-APnd_045-Ex1-6E-lcwgs-1-T.clmp.r1	2.8%	41%	99 bp	3.5
Goy-APnd_045-Ex1-6E-lcwgs-1-T.clmp.r2	2.6%	41%	99 bp	3.5
Goy-APnd_046-Ex1-6F-lcwgs-1-T.clmp.r1	2.9%	42%	100 bp	2.8
Goy-APnd_046-Ex1-6F-lcwgs-1-T.clmp.r2	2.8%	42%	100 bp	2.8
Goy-APnd_047-Ex1-6G-lcwgs-1-T.clmp.r1	1.1%	43%	85 bp	0.1
Goy-APnd_047-Ex1-6G-lcwgs-1-T.clmp.r2	1.0%	43%	85 bp	0.1
Goy-APnd_048-Ex1-6H-lcwgs-1-T.clmp.r1	2.6%	42%	100 bp	3.3
Goy-APnd_048-Ex1-6H-lcwgs-1-T.clmp.r2	2.5%	42%	100 bp	3.3
Goy-APnd_049-Ex1-7A-lcwgs-1-T.clmp.r1	11.4%	44%	121 bp	1.0
Goy-APnd_049-Ex1-7A-lcwgs-1-T.clmp.r2	10.2%	44%	121 bp	1.0
Goy-APnd_050-Ex1-7B-lcwgs-1-T.clmp.r1	2.8%	41%	103 bp	1.0
Goy-APnd_050-Ex1-7B-lcwgs-1-T.clmp.r2	2.6%	40%	103 bp	1.0
Goy-APnd_051-Ex1-7C-lcwgs-1-T.clmp.r1	2.4%	41%	96 bp	1.6
Goy-APnd_051-Ex1-7C-lcwgs-1-T.clmp.r2	2.3%	41%	96 bp	1.6
Goy-APnd_052-Ex1-7D-lcwgs-1-T.clmp.r1	2.1%	41%	93 bp	2.1
Goy-APnd_052-Ex1-7D-lcwgs-1-T.clmp.r2	2.0%	41%	93 bp	2.1
Goy-APnd_053-Ex1-7E-lcwgs-1-T.clmp.r1	3.0%	42%	95 bp	1.0
Goy-APnd_053-Ex1-7E-lcwgs-1-T.clmp.r2	2.9%	42%	95 bp	1.0
Goy-APnd_054-Ex1-7F-lcwgs-1-T.clmp.r1	2.4%	42%	93 bp	1.2
Goy-APnd_054-Ex1-7F-lcwgs-1-T.clmp.r2	2.3%	42%	93 bp	1.2
Goy-APnd_055-Ex1-7G-lcwgs-1-T.clmp.r1	3.1%	44%	99 bp	2.1
Goy-APnd_055-Ex1-7G-lcwgs-1-T.clmp.r2	2.9%	44%	99 bp	2.1
Goy-APnd_056-Ex1-7H-lcwgs-1-T.clmp.r1	3.1%	44%	103 bp	2.5
Goy-APnd_056-Ex1-7H-lcwgs-1-T.clmp.r2	2.9%	44%	103 bp	2.5
Goy-APnd_057-Ex1-8A-lcwgs-1-T.clmp.r1	2.7%	43%	103 bp	0.6
Goy-APnd_057-Ex1-8A-lcwgs-1-T.clmp.r2	2.5%	43%	103 bp	0.6
Goy-APnd_058-Ex1-8B-lcwgs-1-T.clmp.r1	2.6%	42%	102 bp	0.5
Goy-APnd_058-Ex1-8B-lcwgs-1-T.clmp.r2	2.4%	42%	102 bp	0.5
Goy-APnd_059-Ex1-8C-lcwgs-1-T.clmp.r1	1.9%	42%	93 bp	1.5
Goy-APnd_059-Ex1-8C-lcwgs-1-T.clmp.r2	1.8%	42%	93 bp	1.5
Goy-APnd_060-Ex1-8D-lcwgs-1-T.clmp.r1	2.1%	42%	98 bp	0.7
Goy-APnd_060-Ex1-8D-lcwgs-1-T.clmp.r2	2.0%	41%	98 bp	0.7
Goy-APnd_061-Ex1-8E-lcwgs-1-T.clmp.r1	1.5%	41%	86 bp	0.5
Goy-APnd_061-Ex1-8E-lcwgs-1-T.clmp.r2	1.4%	41%	86 bp	0.5
Goy-APnd_062-Ex1-8F-lcwgs-1-T.clmp.r1	2.2%	43%	97 bp	0.7
Goy-APnd_062-Ex1-8F-lcwgs-1-T.clmp.r2	2.1%	43%	97 bp	0.7
Goy-APnd_063-Ex1-8G-lcwgs-1-T.clmp.r1	1.9%	42%	92 bp	0.9
Goy-APnd_063-Ex1-8G-lcwgs-1-T.clmp.r2	1.8%	42%	92 bp	0.9
Goy-APnd_064-Ex1-8H-lcwgs-1-T.clmp.r1	3.5%	43%	109 bp	1.8
Goy-APnd_064-Ex1-8H-lcwgs-1-T.clmp.r2	3.3%	43%	109 bp	1.8
Goy-APnd_065-Ex1-9A-lcwgs-1-T.clmp.r1	2.5%	42%	99 bp	0.4
Goy-APnd_065-Ex1-9A-lcwgs-1-T.clmp.r2	2.3%	42%	100 bp	0.4
Goy-APnd_066-Ex1-9B-lcwgs-1-T.clmp.r1	3.1%	42%	103 bp	0.4
Goy-APnd_066-Ex1-9B-lcwgs-1-T.clmp.r2	2.9%	42%	103 bp	0.4
Goy-APnd_067-Ex1-9C-lcwgs-1-T.clmp.r1	2.4%	43%	102 bp	0.2
Goy-APnd_067-Ex1-9C-lcwgs-1-T.clmp.r2	2.1%	43%	102 bp	0.2
Goy-CPnd_001-Ex1-7F-lcwgs-1-T.clmp.r1	5.9%	45%	139 bp	3.3
Goy-CPnd_001-Ex1-7F-lcwgs-1-T.clmp.r2	5.2%	45%	139 bp	3.3
Goy-CPnd_002-Ex1-5C-lcwgs-1-T.clmp.r1	4.7%	45%	131 bp	0.4
Goy-CPnd_002-Ex1-5C-lcwgs-1-T.clmp.r2	4.0%	45%	131 bp	0.4
Goy-CPnd_003-Ex1-7G-lcwgs-1-T.clmp.r1	5.3%	44%	135 bp	1.6
Goy-CPnd_003-Ex1-7G-lcwgs-1-T.clmp.r2	4.6%	44%	135 bp	1.6
Goy-CPnd_004-Ex1-2D-lcwgs-1-T.clmp.r1	5.9%	43%	140 bp	3.8
Goy-CPnd_004-Ex1-2D-lcwgs-1-T.clmp.r2	5.2%	43%	140 bp	3.8
Goy-CPnd_005-Ex1-6A-lcwgs-1-T.clmp.r1	6.0%	43%	140 bp	1.5
Goy-CPnd_005-Ex1-6A-lcwgs-1-T.clmp.r2	4.9%	43%	140 bp	1.5
Goy-CPnd_006-Ex1-2C-lcwgs-1-T.clmp.r1	6.0%	44%	138 bp	2.6
Goy-CPnd_006-Ex1-2C-lcwgs-1-T.clmp.r2	5.3%	43%	139 bp	2.6
Goy-CPnd_007-Ex1-8E-lcwgs-1-T.clmp.r1	5.9%	44%	137 bp	2.5
Goy-CPnd_007-Ex1-8E-lcwgs-1-T.clmp.r2	5.2%	44%	138 bp	2.5
Goy-CPnd_008-Ex1-4B-lcwgs-1-T.clmp.r1	7.8%	43%	147 bp	3.6
Goy-CPnd_008-Ex1-4B-lcwgs-1-T.clmp.r2	6.4%	43%	147 bp	3.6
Goy-CPnd_009-Ex1-8H-lcwgs-1-T.clmp.r1	5.1%	43%	135 bp	1.4
Goy-CPnd_009-Ex1-8H-lcwgs-1-T.clmp.r2	4.3%	43%	135 bp	1.4
Goy-CPnd_010-Ex1-6D-lcwgs-1-T.clmp.r1	6.4%	45%	139 bp	5.2
Goy-CPnd_010-Ex1-6D-lcwgs-1-T.clmp.r2	5.7%	45%	140 bp	5.2
Goy-CPnd_012-Ex1-1H-lcwgs-1-T.clmp.r1	2.7%	47%	138 bp	0.0
Goy-CPnd_012-Ex1-1H-lcwgs-1-T.clmp.r2	2.1%	47%	138 bp	0.0
Goy-CPnd_013-Ex1-7H-lcwgs-1-T.clmp.r1	3.7%	44%	129 bp	0.3
Goy-CPnd_013-Ex1-7H-lcwgs-1-T.clmp.r2	3.1%	44%	129 bp	0.3
Goy-CPnd_014-Ex1-4H-lcwgs-1-T.clmp.r1	4.4%	44%	136 bp	0.4
Goy-CPnd_014-Ex1-4H-lcwgs-1-T.clmp.r2	3.7%	44%	136 bp	0.4
Goy-CPnd_015-Ex1-1E-lcwgs-1-T.clmp.r1	6.3%	44%	145 bp	3.5
Goy-CPnd_015-Ex1-1E-lcwgs-1-T.clmp.r2	5.1%	44%	146 bp	3.5
Goy-CPnd_016-Ex1-7C-lcwgs-1-T.clmp.r1	5.5%	44%	137 bp	2.2
Goy-CPnd_016-Ex1-7C-lcwgs-1-T.clmp.r2	4.7%	44%	137 bp	2.2
Goy-CPnd_017-Ex1-5H-lcwgs-1-T.clmp.r1	2.8%	46%	115 bp	0.4
Goy-CPnd_017-Ex1-5H-lcwgs-1-T.clmp.r2	2.6%	46%	115 bp	0.4
Goy-CPnd_020-Ex1-5B-lcwgs-1-T.clmp.r1	4.4%	44%	128 bp	0.7
Goy-CPnd_020-Ex1-5B-lcwgs-1-T.clmp.r2	3.9%	44%	128 bp	0.7
Goy-CPnd_025-Ex1-5D-lcwgs-1-T.clmp.r1	5.0%	43%	134 bp	2.5
Goy-CPnd_025-Ex1-5D-lcwgs-1-T.clmp.r2	4.5%	43%	135 bp	2.5
Goy-CPnd_026-Ex1-2F-lcwgs-1-T.clmp.r1	6.3%	43%	144 bp	2.8
Goy-CPnd_026-Ex1-2F-lcwgs-1-T.clmp.r2	5.2%	43%	144 bp	2.8
Goy-CPnd_027-Ex1-2H-lcwgs-1-T.clmp.r1	5.5%	43%	138 bp	3.4
Goy-CPnd_027-Ex1-2H-lcwgs-1-T.clmp.r2	4.7%	43%	138 bp	3.4
Goy-CPnd_031-Ex1-1F-lcwgs-1-T.clmp.r1	7.4%	44%	147 bp	0.6
Goy-CPnd_031-Ex1-1F-lcwgs-1-T.clmp.r2	6.0%	44%	148 bp	0.6
Goy-CPnd_032-Ex1-1D-lcwgs-1-T.clmp.r1	6.1%	44%	145 bp	0.3
Goy-CPnd_032-Ex1-1D-lcwgs-1-T.clmp.r2	4.9%	44%	146 bp	0.3
Goy-CPnd_033-Ex1-2B-lcwgs-1-T.clmp.r1	4.3%	43%	129 bp	0.5
Goy-CPnd_033-Ex1-2B-lcwgs-1-T.clmp.r2	3.8%	43%	129 bp	0.5
Goy-CPnd_035-Ex1-3A-lcwgs-1-T.clmp.r1	4.0%	43%	127 bp	0.8
Goy-CPnd_035-Ex1-3A-lcwgs-1-T.clmp.r2	3.3%	43%	127 bp	0.8
Goy-CPnd_036-Ex1-7B-lcwgs-1-T.clmp.r1	8.5%	57%	145 bp	0.2
Goy-CPnd_036-Ex1-7B-lcwgs-1-T.clmp.r2	6.6%	57%	145 bp	0.2
Goy-CPnd_037-Ex1-3H-lcwgs-1-T.clmp.r1	5.2%	44%	136 bp	2.3
Goy-CPnd_037-Ex1-3H-lcwgs-1-T.clmp.r2	4.4%	44%	136 bp	2.3
Goy-CPnd_038-Ex1-6F-lcwgs-1-T.clmp.r1	7.4%	44%	146 bp	3.5
Goy-CPnd_038-Ex1-6F-lcwgs-1-T.clmp.r2	6.0%	44%	146 bp	3.5
Goy-CPnd_039-Ex1-8A-lcwgs-1-T.clmp.r1	7.2%	43%	147 bp	2.3
Goy-CPnd_039-Ex1-8A-lcwgs-1-T.clmp.r2	5.8%	43%	147 bp	2.3
Goy-CPnd_040-Ex1-7A-lcwgs-1-T.clmp.r1	2.6%	43%	119 bp	0.3
Goy-CPnd_040-Ex1-7A-lcwgs-1-T.clmp.r2	2.2%	43%	119 bp	0.3
Goy-CPnd_041-Ex1-3C-lcwgs-1-T.clmp.r1	7.2%	44%	145 bp	5.9
Goy-CPnd_041-Ex1-3C-lcwgs-1-T.clmp.r2	6.1%	44%	145 bp	5.9
Goy-CPnd_042-Ex1-3B-lcwgs-1-T.clmp.r1	5.6%	43%	137 bp	2.1
Goy-CPnd_042-Ex1-3B-lcwgs-1-T.clmp.r2	4.8%	43%	137 bp	2.1
Goy-CPnd_044-Ex1-4E-lcwgs-1-T.clmp.r1	2.6%	43%	130 bp	0.1
Goy-CPnd_044-Ex1-4E-lcwgs-1-T.clmp.r2	2.0%	43%	131 bp	0.1
Goy-CPnd_047-Ex1-6E-lcwgs-1-T.clmp.r1	8.6%	44%	147 bp	2.4
Goy-CPnd_047-Ex1-6E-lcwgs-1-T.clmp.r2	7.0%	44%	147 bp	2.4
Goy-CPnd_048-Ex1-8B-lcwgs-1-T.clmp.r1	5.2%	43%	139 bp	1.0
Goy-CPnd_048-Ex1-8B-lcwgs-1-T.clmp.r2	4.3%	43%	139 bp	1.0
Goy-CPnd_049-Ex1-8C-lcwgs-1-T.clmp.r1	4.4%	44%	130 bp	0.4
Goy-CPnd_049-Ex1-8C-lcwgs-1-T.clmp.r2	3.7%	44%	130 bp	0.4
Goy-CPnd_050-Ex1-8F-lcwgs-1-T.clmp.r1	4.8%	44%	135 bp	0.3
Goy-CPnd_050-Ex1-8F-lcwgs-1-T.clmp.r2	4.0%	44%	136 bp	0.3
Goy-CPnd_052-Ex1-3D-lcwgs-1-T.clmp.r1	5.9%	44%	140 bp	2.9
Goy-CPnd_052-Ex1-3D-lcwgs-1-T.clmp.r2	5.0%	43%	140 bp	2.9
Goy-CPnd_053-Ex1-2E-lcwgs-1-T.clmp.r1	5.6%	43%	137 bp	2.8
Goy-CPnd_053-Ex1-2E-lcwgs-1-T.clmp.r2	4.9%	43%	138 bp	2.8
Goy-CPnd_054-Ex1-1B-lcwgs-1-T.clmp.r1	6.0%	44%	140 bp	0.2
Goy-CPnd_054-Ex1-1B-lcwgs-1-T.clmp.r2	4.8%	44%	140 bp	0.2
Goy-CPnd_056-Ex1-3G-lcwgs-1-T.clmp.r1	7.5%	44%	147 bp	4.3
Goy-CPnd_056-Ex1-3G-lcwgs-1-T.clmp.r2	6.1%	43%	147 bp	4.3
Goy-CPnd_057-Ex1-4F-lcwgs-1-T.clmp.r1	7.4%	43%	144 bp	4.0
Goy-CPnd_057-Ex1-4F-lcwgs-1-T.clmp.r2	6.3%	43%	145 bp	4.0
Goy-CPnd_058-Ex1-1G-lcwgs-1-T.clmp.r1	6.4%	44%	144 bp	0.1
Goy-CPnd_058-Ex1-1G-lcwgs-1-T.clmp.r2	4.7%	44%	144 bp	0.1
Goy-CPnd_059-Ex1-8G-lcwgs-1-T.clmp.r1	5.1%	44%	136 bp	1.2
Goy-CPnd_059-Ex1-8G-lcwgs-1-T.clmp.r2	4.3%	44%	136 bp	1.2
Goy-CPnd_060-Ex1-7D-lcwgs-1-T.clmp.r1	5.0%	44%	134 bp	2.9
Goy-CPnd_060-Ex1-7D-lcwgs-1-T.clmp.r2	4.4%	44%	134 bp	2.9
Goy-CPnd_061-Ex1-7E-lcwgs-1-T.clmp.r1	4.9%	44%	134 bp	3.9
Goy-CPnd_061-Ex1-7E-lcwgs-1-T.clmp.r2	4.4%	44%	135 bp	3.9
Goy-CPnd_062-Ex1-3F-lcwgs-1-T.clmp.r1	6.1%	43%	142 bp	3.0
Goy-CPnd_062-Ex1-3F-lcwgs-1-T.clmp.r2	5.1%	43%	142 bp	3.0
Goy-CPnd_063-Ex1-2G-lcwgs-1-T.clmp.r1	7.1%	44%	143 bp	4.2
Goy-CPnd_063-Ex1-2G-lcwgs-1-T.clmp.r2	6.4%	44%	143 bp	4.2
Goy-CPnd_064-Ex1-8D-lcwgs-1-T.clmp.r1	5.7%	44%	139 bp	3.3
Goy-CPnd_064-Ex1-8D-lcwgs-1-T.clmp.r2	4.9%	44%	140 bp	3.3
Goy-CPnd_068-Ex1-2A-lcwgs-1-T.clmp.r1	6.7%	44%	143 bp	3.7
Goy-CPnd_068-Ex1-2A-lcwgs-1-T.clmp.r2	5.6%	43%	143 bp	3.7
Goy-CPnd_070-Ex1-1A-lcwgs-1-T.clmp.r1	7.5%	43%	147 bp	4.5
Goy-CPnd_070-Ex1-1A-lcwgs-1-T.clmp.r2	6.1%	43%	147 bp	4.5
Goy-CPnd_071-Ex1-3E-lcwgs-1-T.clmp.r1	5.8%	43%	139 bp	2.9
Goy-CPnd_071-Ex1-3E-lcwgs-1-T.clmp.r2	4.7%	43%	140 bp	2.9
Goy-CPnd_072-Ex1-4D-lcwgs-1-T.clmp.r1	4.9%	43%	139 bp	1.8
Goy-CPnd_072-Ex1-4D-lcwgs-1-T.clmp.r2	4.2%	43%	139 bp	1.8
Goy-CPnd_073-Ex1-4C-lcwgs-1-T.clmp.r1	4.7%	44%	133 bp	1.2
Goy-CPnd_073-Ex1-4C-lcwgs-1-T.clmp.r2	4.0%	44%	134 bp	1.2
Goy-CPnd_074-Ex1-1C-lcwgs-1-T.clmp.r1	5.7%	44%	140 bp	1.2
Goy-CPnd_074-Ex1-1C-lcwgs-1-T.clmp.r2	4.7%	44%	140 bp	1.2
Goy-CPnd_084-Ex1-5E-lcwgs-1-T.clmp.r1	7.2%	44%	145 bp	6.0
Goy-CPnd_084-Ex1-5E-lcwgs-1-T.clmp.r2	6.1%	43%	145 bp	6.0
Goy-CPnd_085-Ex1-6G-lcwgs-1-T.clmp.r1	5.7%	44%	135 bp	1.9
Goy-CPnd_085-Ex1-6G-lcwgs-1-T.clmp.r2	4.9%	44%	135 bp	1.9
Goy-CPnd_086-Ex1-5F-lcwgs-1-T.clmp.r1	5.3%	44%	135 bp	0.5
Goy-CPnd_086-Ex1-5F-lcwgs-1-T.clmp.r2	4.5%	44%	135 bp	0.5
Goy-CPnd_087-Ex1-6C-lcwgs-1-T.clmp.r1	5.1%	44%	131 bp	0.9
Goy-CPnd_087-Ex1-6C-lcwgs-1-T.clmp.r2	4.4%	44%	131 bp	0.9
Goy-CPnd_088-Ex1-6H-lcwgs-1-T.clmp.r1	6.5%	44%	141 bp	2.9
Goy-CPnd_088-Ex1-6H-lcwgs-1-T.clmp.r2	5.5%	43%	141 bp	2.9
Goy-CPnd_089-Ex1-6B-lcwgs-1-T.clmp.r1	5.2%	44%	130 bp	0.5
Goy-CPnd_089-Ex1-6B-lcwgs-1-T.clmp.r2	4.5%	44%	131 bp	0.5
Goy-CPnd_090-Ex1-5G-lcwgs-1-T.clmp.r1	5.7%	43%	142 bp	0.9
Goy-CPnd_090-Ex1-5G-lcwgs-1-T.clmp.r2	4.7%	43%	142 bp	0.9
Goy-CPnd_091-Ex1-4G-lcwgs-1-T.clmp.r1	6.9%	43%	147 bp	3.8
Goy-CPnd_091-Ex1-4G-lcwgs-1-T.clmp.r2	5.8%	43%	147 bp	3.8
Goy-CPnd_092-Ex1-4A-lcwgs-1-T.clmp.r1	5.8%	45%	136 bp	1.4
Goy-CPnd_092-Ex1-4A-lcwgs-1-T.clmp.r2	5.1%	45%	136 bp	1.4
Goy-CPnd_095-Ex1-5A-lcwgs-1-T.clmp.r1	5.7%	44%	135 bp	1.6
Goy-CPnd_095-Ex1-5A-lcwgs-1-T.clmp.r2	5.0%	44%	135 bp	1.6
```

</p>
</details>

## 10. Second trim.
Executed `runFASTP_2_cssl.sbatch`, complete.

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Goy-APnd_001-Ex1-1A-lcwgs-1-T.clmp.r1r2_fastp	2.7%	40.8%	99.0%	1.4%
Goy-APnd_002-Ex1-1B-lcwgs-1-T.clmp.r1r2_fastp	3.4%	40.0%	99.1%	1.2%
Goy-APnd_003-Ex1-1C-lcwgs-1-T.clmp.r1r2_fastp	3.3%	40.8%	99.0%	1.3%
Goy-APnd_004-Ex1-1D-lcwgs-1-T.clmp.r1r2_fastp	2.4%	41.2%	99.2%	1.4%
Goy-APnd_005-Ex1-1E-lcwgs-1-T.clmp.r1r2_fastp	4.6%	39.7%	99.0%	1.1%
Goy-APnd_006-Ex1-1F-lcwgs-1-T.clmp.r1r2_fastp	2.2%	40.7%	99.1%	1.5%
Goy-APnd_007-Ex1-1G-lcwgs-1-T.clmp.r1r2_fastp	2.0%	41.9%	99.2%	1.5%
Goy-APnd_008-Ex1-1H-lcwgs-1-T.clmp.r1r2_fastp	1.8%	42.7%	99.2%	1.5%
Goy-APnd_009-Ex1-2A-lcwgs-1-T.clmp.r1r2_fastp	2.3%	39.9%	99.1%	1.5%
Goy-APnd_010-Ex1-2B-lcwgs-1-T.clmp.r1r2_fastp	1.9%	41.9%	99.2%	1.5%
Goy-APnd_011-Ex1-2C-lcwgs-1-T.clmp.r1r2_fastp	2.3%	41.2%	99.2%	1.4%
Goy-APnd_012-Ex1-2D-lcwgs-1-T.clmp.r1r2_fastp	2.1%	41.2%	99.3%	1.4%
Goy-APnd_013-Ex1-2E-lcwgs-1-T.clmp.r1r2_fastp	1.6%	41.8%	99.3%	1.5%
Goy-APnd_014-Ex1-2F-lcwgs-1-T.clmp.r1r2_fastp	1.9%	42.2%	99.2%	1.5%
Goy-APnd_015-Ex1-2G-lcwgs-1-T.clmp.r1r2_fastp	1.8%	41.4%	99.3%	1.5%
Goy-APnd_016-Ex1-2H-lcwgs-1-T.clmp.r1r2_fastp	1.6%	43.5%	99.3%	1.5%
Goy-APnd_017-Ex1-3A-lcwgs-1-T.clmp.r1r2_fastp	2.8%	40.8%	98.9%	1.4%
Goy-APnd_018-Ex1-3B-lcwgs-1-T.clmp.r1r2_fastp	3.1%	39.9%	99.1%	1.2%
Goy-APnd_019-Ex1-3C-lcwgs-1-T.clmp.r1r2_fastp	2.9%	41.5%	99.1%	1.3%
Goy-APnd_020-Ex1-3D-lcwgs-1-T.clmp.r1r2_fastp	2.8%	40.6%	99.2%	1.2%
Goy-APnd_021-Ex1-3E-lcwgs-1-T.clmp.r1r2_fastp	2.3%	41.4%	99.2%	1.4%
Goy-APnd_022-Ex1-3F-lcwgs-1-T.clmp.r1r2_fastp	2.4%	42.6%	99.1%	1.4%
Goy-APnd_023-Ex1-3G-lcwgs-1-T.clmp.r1r2_fastp	2.3%	41.0%	99.2%	1.4%
Goy-APnd_024-Ex1-3H-lcwgs-1-T.clmp.r1r2_fastp	2.1%	41.8%	99.3%	1.4%
Goy-APnd_025-Ex1-4A-lcwgs-1-T.clmp.r1r2_fastp	3.7%	42.6%	99.0%	1.2%
Goy-APnd_026-Ex1-4B-lcwgs-1-T.clmp.r1r2_fastp	4.2%	41.1%	99.0%	1.1%
Goy-APnd_027-Ex1-4C-lcwgs-1-T.clmp.r1r2_fastp	2.0%	41.5%	99.2%	1.5%
Goy-APnd_028-Ex1-4D-lcwgs-1-T.clmp.r1r2_fastp	4.0%	41.5%	99.1%	1.1%
Goy-APnd_029-Ex1-4E-lcwgs-1-T.clmp.r1r2_fastp	3.5%	43.3%	99.0%	1.2%
Goy-APnd_030-Ex1-4F-lcwgs-1-T.clmp.r1r2_fastp	6.4%	46.8%	98.8%	0.9%
Goy-APnd_031-Ex1-4G-lcwgs-1-T.clmp.r1r2_fastp	4.7%	48.4%	97.6%	1.9%
Goy-APnd_032-Ex1-4H-lcwgs-1-T.clmp.r1r2_fastp	1.8%	42.9%	99.2%	1.5%
Goy-APnd_033-Ex1-5A-lcwgs-1-T.clmp.r1r2_fastp	3.6%	41.6%	99.0%	1.3%
Goy-APnd_034-Ex1-5B-lcwgs-1-T.clmp.r1r2_fastp	8.4%	55.3%	97.6%	1.1%
Goy-APnd_035-Ex1-5C-lcwgs-1-T.clmp.r1r2_fastp	2.2%	43.7%	99.1%	1.5%
Goy-APnd_036-Ex1-5D-lcwgs-1-T.clmp.r1r2_fastp	2.1%	43.5%	99.1%	1.5%
Goy-APnd_037-Ex1-5E-lcwgs-1-T.clmp.r1r2_fastp	3.5%	45.3%	98.9%	1.2%
Goy-APnd_038-Ex1-5F-lcwgs-1-T.clmp.r1r2_fastp	2.3%	44.4%	99.0%	1.4%
Goy-APnd_039-Ex1-5G-lcwgs-1-T.clmp.r1r2_fastp	1.7%	41.8%	99.2%	1.5%
Goy-APnd_040-Ex1-5H-lcwgs-1-T.clmp.r1r2_fastp	1.9%	43.2%	99.2%	1.5%
Goy-APnd_041-Ex1-6A-lcwgs-1-T.clmp.r1r2_fastp	1.9%	42.7%	98.9%	1.5%
Goy-APnd_042-Ex1-6B-lcwgs-1-T.clmp.r1r2_fastp	2.3%	41.1%	99.0%	1.5%
Goy-APnd_043-Ex1-6C-lcwgs-1-T.clmp.r1r2_fastp	2.7%	43.8%	98.9%	1.3%
Goy-APnd_044-Ex1-6D-lcwgs-1-T.clmp.r1r2_fastp	2.5%	42.8%	99.1%	1.3%
Goy-APnd_045-Ex1-6E-lcwgs-1-T.clmp.r1r2_fastp	2.6%	41.4%	99.0%	1.3%
Goy-APnd_046-Ex1-6F-lcwgs-1-T.clmp.r1r2_fastp	2.5%	42.7%	99.0%	1.3%
Goy-APnd_047-Ex1-6G-lcwgs-1-T.clmp.r1r2_fastp	0.8%	43.4%	98.9%	1.8%
Goy-APnd_048-Ex1-6H-lcwgs-1-T.clmp.r1r2_fastp	2.6%	42.1%	99.1%	1.3%
Goy-APnd_049-Ex1-7A-lcwgs-1-T.clmp.r1r2_fastp	4.8%	44.6%	98.6%	1.2%
Goy-APnd_050-Ex1-7B-lcwgs-1-T.clmp.r1r2_fastp	2.8%	40.9%	99.1%	1.3%
Goy-APnd_051-Ex1-7C-lcwgs-1-T.clmp.r1r2_fastp	2.4%	41.5%	99.1%	1.4%
Goy-APnd_052-Ex1-7D-lcwgs-1-T.clmp.r1r2_fastp	2.2%	41.0%	99.2%	1.4%
Goy-APnd_053-Ex1-7E-lcwgs-1-T.clmp.r1r2_fastp	2.3%	42.4%	99.1%	1.4%
Goy-APnd_054-Ex1-7F-lcwgs-1-T.clmp.r1r2_fastp	2.2%	42.0%	99.0%	1.4%
Goy-APnd_055-Ex1-7G-lcwgs-1-T.clmp.r1r2_fastp	2.8%	44.4%	99.0%	1.3%
Goy-APnd_056-Ex1-7H-lcwgs-1-T.clmp.r1r2_fastp	2.9%	44.1%	99.1%	1.3%
Goy-APnd_057-Ex1-8A-lcwgs-1-T.clmp.r1r2_fastp	3.0%	43.2%	99.0%	1.3%
Goy-APnd_058-Ex1-8B-lcwgs-1-T.clmp.r1r2_fastp	2.9%	42.6%	99.1%	1.3%
Goy-APnd_059-Ex1-8C-lcwgs-1-T.clmp.r1r2_fastp	2.3%	42.3%	99.2%	1.4%
Goy-APnd_060-Ex1-8D-lcwgs-1-T.clmp.r1r2_fastp	2.6%	41.9%	99.2%	1.3%
Goy-APnd_061-Ex1-8E-lcwgs-1-T.clmp.r1r2_fastp	2.0%	41.1%	99.3%	1.5%
Goy-APnd_062-Ex1-8F-lcwgs-1-T.clmp.r1r2_fastp	2.6%	43.3%	99.1%	1.3%
Goy-APnd_063-Ex1-8G-lcwgs-1-T.clmp.r1r2_fastp	2.3%	42.4%	99.2%	1.4%
Goy-APnd_064-Ex1-8H-lcwgs-1-T.clmp.r1r2_fastp	3.4%	43.7%	99.0%	1.2%
Goy-APnd_065-Ex1-9A-lcwgs-1-T.clmp.r1r2_fastp	2.8%	42.8%	99.1%	1.3%
Goy-APnd_066-Ex1-9B-lcwgs-1-T.clmp.r1r2_fastp	2.9%	42.2%	99.1%	1.3%
Goy-APnd_067-Ex1-9C-lcwgs-1-T.clmp.r1r2_fastp	2.7%	43.6%	99.1%	1.4%
Goy-CPnd_001-Ex1-7F-lcwgs-1-T.clmp.r1r2_fastp	5.9%	44.9%	97.8%	0.5%
Goy-CPnd_002-Ex1-5C-lcwgs-1-T.clmp.r1r2_fastp	4.9%	45.1%	98.2%	0.7%
Goy-CPnd_003-Ex1-7G-lcwgs-1-T.clmp.r1r2_fastp	5.2%	44.6%	97.9%	0.6%
Goy-CPnd_004-Ex1-2D-lcwgs-1-T.clmp.r1r2_fastp	6.0%	43.6%	97.8%	0.4%
Goy-CPnd_005-Ex1-6A-lcwgs-1-T.clmp.r1r2_fastp	6.7%	43.5%	97.8%	0.4%
Goy-CPnd_006-Ex1-2C-lcwgs-1-T.clmp.r1r2_fastp	6.0%	43.7%	97.9%	0.5%
Goy-CPnd_007-Ex1-8E-lcwgs-1-T.clmp.r1r2_fastp	5.9%	44.2%	97.8%	0.6%
Goy-CPnd_008-Ex1-4B-lcwgs-1-T.clmp.r1r2_fastp	7.9%	43.7%	97.2%	0.3%
Goy-CPnd_009-Ex1-8H-lcwgs-1-T.clmp.r1r2_fastp	5.3%	43.7%	98.0%	0.6%
Goy-CPnd_010-Ex1-6D-lcwgs-1-T.clmp.r1r2_fastp	6.6%	44.9%	98.1%	0.5%
Goy-CPnd_012-Ex1-1H-lcwgs-1-T.clmp.r1r2_fastp	2.3%	47.6%	97.4%	0.6%
Goy-CPnd_013-Ex1-7H-lcwgs-1-T.clmp.r1r2_fastp	3.8%	44.1%	98.2%	0.7%
Goy-CPnd_014-Ex1-4H-lcwgs-1-T.clmp.r1r2_fastp	4.7%	44.4%	98.0%	0.6%
Goy-CPnd_015-Ex1-1E-lcwgs-1-T.clmp.r1r2_fastp	6.8%	43.9%	97.2%	0.2%
Goy-CPnd_016-Ex1-7C-lcwgs-1-T.clmp.r1r2_fastp	5.6%	43.9%	97.9%	0.5%
Goy-CPnd_017-Ex1-5H-lcwgs-1-T.clmp.r1r2_fastp	3.0%	46.3%	98.9%	1.1%
Goy-CPnd_020-Ex1-5B-lcwgs-1-T.clmp.r1r2_fastp	4.8%	44.1%	98.3%	0.8%
Goy-CPnd_025-Ex1-5D-lcwgs-1-T.clmp.r1r2_fastp	5.2%	43.6%	98.2%	0.6%
Goy-CPnd_026-Ex1-2F-lcwgs-1-T.clmp.r1r2_fastp	6.8%	43.6%	97.5%	0.3%
Goy-CPnd_027-Ex1-2H-lcwgs-1-T.clmp.r1r2_fastp	5.8%	43.6%	97.9%	0.5%
Goy-CPnd_031-Ex1-1F-lcwgs-1-T.clmp.r1r2_fastp	7.8%	44.6%	97.2%	0.3%
Goy-CPnd_032-Ex1-1D-lcwgs-1-T.clmp.r1r2_fastp	6.1%	44.3%	97.5%	0.4%
Goy-CPnd_033-Ex1-2B-lcwgs-1-T.clmp.r1r2_fastp	4.6%	43.7%	98.3%	0.8%
Goy-CPnd_035-Ex1-3A-lcwgs-1-T.clmp.r1r2_fastp	4.4%	43.5%	98.3%	0.8%
Goy-CPnd_036-Ex1-7B-lcwgs-1-T.clmp.r1r2_fastp	8.8%	56.8%	97.3%	0.2%
Goy-CPnd_037-Ex1-3H-lcwgs-1-T.clmp.r1r2_fastp	5.6%	43.9%	97.9%	0.6%
Goy-CPnd_038-Ex1-6F-lcwgs-1-T.clmp.r1r2_fastp	8.0%	44.5%	97.3%	0.2%
Goy-CPnd_039-Ex1-8A-lcwgs-1-T.clmp.r1r2_fastp	7.6%	43.3%	97.1%	0.2%
Goy-CPnd_040-Ex1-7A-lcwgs-1-T.clmp.r1r2_fastp	2.6%	43.1%	98.5%	1.1%
Goy-CPnd_041-Ex1-3C-lcwgs-1-T.clmp.r1r2_fastp	7.3%	44.1%	97.3%	0.3%
Goy-CPnd_042-Ex1-3B-lcwgs-1-T.clmp.r1r2_fastp	5.9%	43.4%	97.9%	0.5%
Goy-CPnd_044-Ex1-4E-lcwgs-1-T.clmp.r1r2_fastp	2.0%	43.2%	97.2%	1.0%
Goy-CPnd_047-Ex1-6E-lcwgs-1-T.clmp.r1r2_fastp	8.9%	44.3%	97.0%	0.2%
Goy-CPnd_048-Ex1-8B-lcwgs-1-T.clmp.r1r2_fastp	5.8%	43.6%	97.9%	0.4%
Goy-CPnd_049-Ex1-8C-lcwgs-1-T.clmp.r1r2_fastp	4.6%	44.2%	98.2%	0.7%
Goy-CPnd_050-Ex1-8F-lcwgs-1-T.clmp.r1r2_fastp	5.2%	44.1%	98.0%	0.6%
Goy-CPnd_052-Ex1-3D-lcwgs-1-T.clmp.r1r2_fastp	6.0%	43.8%	97.8%	0.4%
Goy-CPnd_053-Ex1-2E-lcwgs-1-T.clmp.r1r2_fastp	5.8%	43.7%	97.9%	0.5%
Goy-CPnd_054-Ex1-1B-lcwgs-1-T.clmp.r1r2_fastp	5.4%	44.4%	97.6%	0.5%
Goy-CPnd_056-Ex1-3G-lcwgs-1-T.clmp.r1r2_fastp	7.8%	43.8%	97.1%	0.2%
Goy-CPnd_057-Ex1-4F-lcwgs-1-T.clmp.r1r2_fastp	7.7%	43.7%	97.4%	0.3%
Goy-CPnd_058-Ex1-1G-lcwgs-1-T.clmp.r1r2_fastp	5.1%	43.9%	97.1%	0.4%
Goy-CPnd_059-Ex1-8G-lcwgs-1-T.clmp.r1r2_fastp	5.3%	44.0%	98.0%	0.6%
Goy-CPnd_060-Ex1-7D-lcwgs-1-T.clmp.r1r2_fastp	5.0%	44.3%	98.2%	0.6%
Goy-CPnd_061-Ex1-7E-lcwgs-1-T.clmp.r1r2_fastp	5.2%	43.9%	98.0%	0.6%
Goy-CPnd_062-Ex1-3F-lcwgs-1-T.clmp.r1r2_fastp	6.8%	43.4%	97.6%	0.4%
Goy-CPnd_063-Ex1-2G-lcwgs-1-T.clmp.r1r2_fastp	6.7%	44.2%	97.5%	0.4%
Goy-CPnd_064-Ex1-8D-lcwgs-1-T.clmp.r1r2_fastp	6.0%	44.0%	98.0%	0.5%
Goy-CPnd_068-Ex1-2A-lcwgs-1-T.clmp.r1r2_fastp	6.9%	43.7%	97.7%	0.4%
Goy-CPnd_070-Ex1-1A-lcwgs-1-T.clmp.r1r2_fastp	7.6%	43.6%	97.2%	0.2%
Goy-CPnd_071-Ex1-3E-lcwgs-1-T.clmp.r1r2_fastp	6.2%	43.7%	97.7%	0.4%
Goy-CPnd_072-Ex1-4D-lcwgs-1-T.clmp.r1r2_fastp	5.3%	43.7%	98.0%	0.5%
Goy-CPnd_073-Ex1-4C-lcwgs-1-T.clmp.r1r2_fastp	5.1%	44.0%	98.1%	0.6%
Goy-CPnd_074-Ex1-1C-lcwgs-1-T.clmp.r1r2_fastp	6.0%	43.9%	97.7%	0.4%
Goy-CPnd_084-Ex1-5E-lcwgs-1-T.clmp.r1r2_fastp	7.3%	43.8%	97.5%	0.3%
Goy-CPnd_085-Ex1-6G-lcwgs-1-T.clmp.r1r2_fastp	6.0%	44.3%	98.0%	0.6%
Goy-CPnd_086-Ex1-5F-lcwgs-1-T.clmp.r1r2_fastp	5.4%	44.2%	98.0%	0.6%
Goy-CPnd_087-Ex1-6C-lcwgs-1-T.clmp.r1r2_fastp	5.4%	44.1%	98.2%	0.6%
Goy-CPnd_088-Ex1-6H-lcwgs-1-T.clmp.r1r2_fastp	7.0%	43.8%	97.7%	0.4%
Goy-CPnd_089-Ex1-6B-lcwgs-1-T.clmp.r1r2_fastp	5.1%	44.3%	98.1%	0.8%
Goy-CPnd_090-Ex1-5G-lcwgs-1-T.clmp.r1r2_fastp	6.1%	43.6%	97.6%	0.4%
Goy-CPnd_091-Ex1-4G-lcwgs-1-T.clmp.r1r2_fastp	7.1%	43.6%	97.1%	0.2%
Goy-CPnd_092-Ex1-4A-lcwgs-1-T.clmp.r1r2_fastp	5.8%	45.5%	97.9%	0.6%
Goy-CPnd_095-Ex1-5A-lcwgs-1-T.clmp.r1r2_fastp	5.7%	44.6%	98.1%	0.7%
```

</p>
</details>

## 11. Decontaminate files.
Executed `runFQSCRN_6.bash`. In the queue to start running. 
Still running. 5/3

Finished running. 5/4

261 files for each file type, matching number of `fq.gz` files. No errors found by grep.

`runMULTIQC.sbatch` executed.

<details><summary>Expand for MultiQC Output.</summary>

```bash
insert multiqc output here
```

</p>
</details>

## 12. Execute RePair
Executed `runREPAIR.sbatch`, complete.

`Multi_FASTQC.sh` executed.

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	Length	M Seqs
Goy-APnd_001-Ex1-1A-lcwgs-1-T.clmp.fp2_repr.R1	5.5%	40%	98 bp	0.5
Goy-APnd_001-Ex1-1A-lcwgs-1-T.clmp.fp2_repr.R2	5.3%	40%	100 bp	0.5
Goy-APnd_002-Ex1-1B-lcwgs-1-T.clmp.fp2_repr.R1	3.0%	39%	104 bp	1.4
Goy-APnd_002-Ex1-1B-lcwgs-1-T.clmp.fp2_repr.R2	3.1%	39%	107 bp	1.4
Goy-APnd_003-Ex1-1C-lcwgs-1-T.clmp.fp2_repr.R1	3.9%	40%	102 bp	2.2
Goy-APnd_003-Ex1-1C-lcwgs-1-T.clmp.fp2_repr.R2	3.8%	40%	105 bp	2.2
Goy-APnd_004-Ex1-1D-lcwgs-1-T.clmp.fp2_repr.R1	2.4%	41%	90 bp	1.8
Goy-APnd_004-Ex1-1D-lcwgs-1-T.clmp.fp2_repr.R2	2.4%	41%	92 bp	1.8
Goy-APnd_005-Ex1-1E-lcwgs-1-T.clmp.fp2_repr.R1	5.0%	39%	112 bp	0.8
Goy-APnd_005-Ex1-1E-lcwgs-1-T.clmp.fp2_repr.R2	5.0%	39%	116 bp	0.8
Goy-APnd_006-Ex1-1F-lcwgs-1-T.clmp.fp2_repr.R1	2.6%	40%	87 bp	1.3
Goy-APnd_006-Ex1-1F-lcwgs-1-T.clmp.fp2_repr.R2	2.6%	40%	88 bp	1.3
Goy-APnd_007-Ex1-1G-lcwgs-1-T.clmp.fp2_repr.R1	2.1%	41%	83 bp	1.2
Goy-APnd_007-Ex1-1G-lcwgs-1-T.clmp.fp2_repr.R2	2.1%	41%	85 bp	1.2
Goy-APnd_008-Ex1-1H-lcwgs-1-T.clmp.fp2_repr.R1	1.8%	42%	82 bp	0.5
Goy-APnd_008-Ex1-1H-lcwgs-1-T.clmp.fp2_repr.R2	1.8%	42%	83 bp	0.5
Goy-APnd_009-Ex1-2A-lcwgs-1-T.clmp.fp2_repr.R1	2.1%	39%	93 bp	0.4
Goy-APnd_009-Ex1-2A-lcwgs-1-T.clmp.fp2_repr.R2	2.1%	39%	95 bp	0.4
Goy-APnd_010-Ex1-2B-lcwgs-1-T.clmp.fp2_repr.R1	1.6%	41%	83 bp	1.6
Goy-APnd_010-Ex1-2B-lcwgs-1-T.clmp.fp2_repr.R2	1.7%	41%	85 bp	1.6
Goy-APnd_011-Ex1-2C-lcwgs-1-T.clmp.fp2_repr.R1	2.2%	41%	87 bp	1.5
Goy-APnd_011-Ex1-2C-lcwgs-1-T.clmp.fp2_repr.R2	2.2%	41%	89 bp	1.5
Goy-APnd_012-Ex1-2D-lcwgs-1-T.clmp.fp2_repr.R1	1.6%	41%	87 bp	1.7
Goy-APnd_012-Ex1-2D-lcwgs-1-T.clmp.fp2_repr.R2	1.7%	41%	89 bp	1.7
Goy-APnd_013-Ex1-2E-lcwgs-1-T.clmp.fp2_repr.R1	1.8%	41%	79 bp	0.5
Goy-APnd_013-Ex1-2E-lcwgs-1-T.clmp.fp2_repr.R2	1.8%	41%	79 bp	0.5
Goy-APnd_014-Ex1-2F-lcwgs-1-T.clmp.fp2_repr.R1	2.0%	42%	81 bp	1.8
Goy-APnd_014-Ex1-2F-lcwgs-1-T.clmp.fp2_repr.R2	2.1%	42%	82 bp	1.8
Goy-APnd_015-Ex1-2G-lcwgs-1-T.clmp.fp2_repr.R1	1.5%	41%	79 bp	1.4
Goy-APnd_015-Ex1-2G-lcwgs-1-T.clmp.fp2_repr.R2	1.6%	41%	80 bp	1.4
Goy-APnd_016-Ex1-2H-lcwgs-1-T.clmp.fp2_repr.R1	1.4%	43%	76 bp	1.5
Goy-APnd_016-Ex1-2H-lcwgs-1-T.clmp.fp2_repr.R2	1.5%	43%	77 bp	1.5
Goy-APnd_017-Ex1-3A-lcwgs-1-T.clmp.fp2_repr.R1	2.9%	40%	94 bp	0.8
Goy-APnd_017-Ex1-3A-lcwgs-1-T.clmp.fp2_repr.R2	3.0%	40%	96 bp	0.8
Goy-APnd_018-Ex1-3B-lcwgs-1-T.clmp.fp2_repr.R1	3.1%	39%	102 bp	0.5
Goy-APnd_018-Ex1-3B-lcwgs-1-T.clmp.fp2_repr.R2	3.1%	39%	105 bp	0.5
Goy-APnd_019-Ex1-3C-lcwgs-1-T.clmp.fp2_repr.R1	3.3%	41%	98 bp	1.8
Goy-APnd_019-Ex1-3C-lcwgs-1-T.clmp.fp2_repr.R2	3.3%	41%	100 bp	1.8
Goy-APnd_020-Ex1-3D-lcwgs-1-T.clmp.fp2_repr.R1	2.1%	40%	99 bp	1.8
Goy-APnd_020-Ex1-3D-lcwgs-1-T.clmp.fp2_repr.R2	2.2%	40%	101 bp	1.8
Goy-APnd_021-Ex1-3E-lcwgs-1-T.clmp.fp2_repr.R1	1.8%	41%	89 bp	1.8
Goy-APnd_021-Ex1-3E-lcwgs-1-T.clmp.fp2_repr.R2	1.8%	41%	91 bp	1.8
Goy-APnd_022-Ex1-3F-lcwgs-1-T.clmp.fp2_repr.R1	1.9%	42%	88 bp	2.6
Goy-APnd_022-Ex1-3F-lcwgs-1-T.clmp.fp2_repr.R2	1.9%	42%	90 bp	2.6
Goy-APnd_023-Ex1-3G-lcwgs-1-T.clmp.fp2_repr.R1	2.2%	40%	85 bp	1.5
Goy-APnd_023-Ex1-3G-lcwgs-1-T.clmp.fp2_repr.R2	2.2%	40%	87 bp	1.5
Goy-APnd_024-Ex1-3H-lcwgs-1-T.clmp.fp2_repr.R1	1.6%	41%	85 bp	2.4
Goy-APnd_024-Ex1-3H-lcwgs-1-T.clmp.fp2_repr.R2	1.6%	41%	86 bp	2.4
Goy-APnd_025-Ex1-4A-lcwgs-1-T.clmp.fp2_repr.R1	5.4%	42%	107 bp	0.7
Goy-APnd_025-Ex1-4A-lcwgs-1-T.clmp.fp2_repr.R2	5.3%	42%	110 bp	0.7
Goy-APnd_026-Ex1-4B-lcwgs-1-T.clmp.fp2_repr.R1	3.6%	40%	113 bp	0.4
Goy-APnd_026-Ex1-4B-lcwgs-1-T.clmp.fp2_repr.R2	3.7%	40%	117 bp	0.4
Goy-APnd_027-Ex1-4C-lcwgs-1-T.clmp.fp2_repr.R1	1.6%	41%	90 bp	1.8
Goy-APnd_027-Ex1-4C-lcwgs-1-T.clmp.fp2_repr.R2	1.6%	41%	92 bp	1.8
Goy-APnd_028-Ex1-4D-lcwgs-1-T.clmp.fp2_repr.R1	3.7%	41%	114 bp	2.2
Goy-APnd_028-Ex1-4D-lcwgs-1-T.clmp.fp2_repr.R2	3.8%	41%	118 bp	2.2
Goy-APnd_029-Ex1-4E-lcwgs-1-T.clmp.fp2_repr.R1	4.6%	43%	109 bp	0.9
Goy-APnd_029-Ex1-4E-lcwgs-1-T.clmp.fp2_repr.R2	4.7%	43%	113 bp	0.9
Goy-APnd_030-Ex1-4F-lcwgs-1-T.clmp.fp2_repr.R1	7.9%	45%	120 bp	1.2
Goy-APnd_030-Ex1-4F-lcwgs-1-T.clmp.fp2_repr.R2	7.8%	45%	124 bp	1.2
Goy-APnd_031-Ex1-4G-lcwgs-1-T.clmp.fp2_repr.R1	9.5%	46%	111 bp	0.2
Goy-APnd_031-Ex1-4G-lcwgs-1-T.clmp.fp2_repr.R2	9.1%	46%	114 bp	0.2
Goy-APnd_032-Ex1-4H-lcwgs-1-T.clmp.fp2_repr.R1	1.8%	42%	86 bp	0.4
Goy-APnd_032-Ex1-4H-lcwgs-1-T.clmp.fp2_repr.R2	1.9%	42%	87 bp	0.4
Goy-APnd_033-Ex1-5A-lcwgs-1-T.clmp.fp2_repr.R1	3.6%	41%	102 bp	1.9
Goy-APnd_033-Ex1-5A-lcwgs-1-T.clmp.fp2_repr.R2	3.6%	41%	105 bp	1.9
Goy-APnd_034-Ex1-5B-lcwgs-1-T.clmp.fp2_repr.R1	11.1%	51%	119 bp	0.2
Goy-APnd_034-Ex1-5B-lcwgs-1-T.clmp.fp2_repr.R2	10.3%	51%	124 bp	0.2
Goy-APnd_035-Ex1-5C-lcwgs-1-T.clmp.fp2_repr.R1	3.8%	43%	88 bp	0.6
Goy-APnd_035-Ex1-5C-lcwgs-1-T.clmp.fp2_repr.R2	3.7%	43%	90 bp	0.6
Goy-APnd_036-Ex1-5D-lcwgs-1-T.clmp.fp2_repr.R1	2.4%	43%	88 bp	0.4
Goy-APnd_036-Ex1-5D-lcwgs-1-T.clmp.fp2_repr.R2	2.5%	43%	90 bp	0.4
Goy-APnd_037-Ex1-5E-lcwgs-1-T.clmp.fp2_repr.R1	5.6%	44%	104 bp	0.6
Goy-APnd_037-Ex1-5E-lcwgs-1-T.clmp.fp2_repr.R2	5.4%	44%	107 bp	0.6
Goy-APnd_038-Ex1-5F-lcwgs-1-T.clmp.fp2_repr.R1	2.8%	44%	88 bp	1.4
Goy-APnd_038-Ex1-5F-lcwgs-1-T.clmp.fp2_repr.R2	2.7%	44%	90 bp	1.4
Goy-APnd_039-Ex1-5G-lcwgs-1-T.clmp.fp2_repr.R1	1.8%	41%	80 bp	0.5
Goy-APnd_039-Ex1-5G-lcwgs-1-T.clmp.fp2_repr.R2	1.8%	41%	81 bp	0.5
Goy-APnd_040-Ex1-5H-lcwgs-1-T.clmp.fp2_repr.R1	1.9%	43%	84 bp	0.8
Goy-APnd_040-Ex1-5H-lcwgs-1-T.clmp.fp2_repr.R2	2.0%	43%	85 bp	0.8
Goy-APnd_041-Ex1-6A-lcwgs-1-T.clmp.fp2_repr.R1	2.4%	42%	89 bp	1.2
Goy-APnd_041-Ex1-6A-lcwgs-1-T.clmp.fp2_repr.R2	2.4%	42%	91 bp	1.2
Goy-APnd_042-Ex1-6B-lcwgs-1-T.clmp.fp2_repr.R1	2.6%	40%	94 bp	0.5
Goy-APnd_042-Ex1-6B-lcwgs-1-T.clmp.fp2_repr.R2	2.6%	40%	96 bp	0.5
Goy-APnd_043-Ex1-6C-lcwgs-1-T.clmp.fp2_repr.R1	3.9%	43%	99 bp	1.4
Goy-APnd_043-Ex1-6C-lcwgs-1-T.clmp.fp2_repr.R2	4.0%	43%	102 bp	1.4
Goy-APnd_044-Ex1-6D-lcwgs-1-T.clmp.fp2_repr.R1	2.3%	42%	97 bp	1.5
Goy-APnd_044-Ex1-6D-lcwgs-1-T.clmp.fp2_repr.R2	2.3%	42%	99 bp	1.5
Goy-APnd_045-Ex1-6E-lcwgs-1-T.clmp.fp2_repr.R1	2.6%	41%	95 bp	3.3
Goy-APnd_045-Ex1-6E-lcwgs-1-T.clmp.fp2_repr.R2	2.7%	41%	98 bp	3.3
Goy-APnd_046-Ex1-6F-lcwgs-1-T.clmp.fp2_repr.R1	2.7%	42%	96 bp	2.7
Goy-APnd_046-Ex1-6F-lcwgs-1-T.clmp.fp2_repr.R2	2.8%	42%	98 bp	2.7
Goy-APnd_047-Ex1-6G-lcwgs-1-T.clmp.fp2_repr.R1	1.1%	43%	82 bp	0.1
Goy-APnd_047-Ex1-6G-lcwgs-1-T.clmp.fp2_repr.R2	1.1%	43%	83 bp	0.1
Goy-APnd_048-Ex1-6H-lcwgs-1-T.clmp.fp2_repr.R1	2.5%	42%	96 bp	3.1
Goy-APnd_048-Ex1-6H-lcwgs-1-T.clmp.fp2_repr.R2	2.6%	42%	98 bp	3.1
Goy-APnd_049-Ex1-7A-lcwgs-1-T.clmp.fp2_repr.R1	11.0%	43%	113 bp	0.9
Goy-APnd_049-Ex1-7A-lcwgs-1-T.clmp.fp2_repr.R2	10.7%	43%	117 bp	0.9
Goy-APnd_050-Ex1-7B-lcwgs-1-T.clmp.fp2_repr.R1	2.6%	40%	99 bp	0.9
Goy-APnd_050-Ex1-7B-lcwgs-1-T.clmp.fp2_repr.R2	2.6%	40%	102 bp	0.9
Goy-APnd_051-Ex1-7C-lcwgs-1-T.clmp.fp2_repr.R1	2.2%	41%	92 bp	1.5
Goy-APnd_051-Ex1-7C-lcwgs-1-T.clmp.fp2_repr.R2	2.3%	41%	94 bp	1.5
Goy-APnd_052-Ex1-7D-lcwgs-1-T.clmp.fp2_repr.R1	2.0%	40%	90 bp	2.0
Goy-APnd_052-Ex1-7D-lcwgs-1-T.clmp.fp2_repr.R2	2.0%	40%	92 bp	2.0
Goy-APnd_053-Ex1-7E-lcwgs-1-T.clmp.fp2_repr.R1	2.9%	42%	92 bp	0.9
Goy-APnd_053-Ex1-7E-lcwgs-1-T.clmp.fp2_repr.R2	3.0%	42%	94 bp	0.9
Goy-APnd_054-Ex1-7F-lcwgs-1-T.clmp.fp2_repr.R1	2.2%	41%	90 bp	1.2
Goy-APnd_054-Ex1-7F-lcwgs-1-T.clmp.fp2_repr.R2	2.3%	41%	91 bp	1.2
Goy-APnd_055-Ex1-7G-lcwgs-1-T.clmp.fp2_repr.R1	2.9%	44%	95 bp	2.0
Goy-APnd_055-Ex1-7G-lcwgs-1-T.clmp.fp2_repr.R2	2.9%	44%	97 bp	2.0
Goy-APnd_056-Ex1-7H-lcwgs-1-T.clmp.fp2_repr.R1	2.9%	44%	99 bp	2.4
Goy-APnd_056-Ex1-7H-lcwgs-1-T.clmp.fp2_repr.R2	2.9%	44%	101 bp	2.4
Goy-APnd_057-Ex1-8A-lcwgs-1-T.clmp.fp2_repr.R1	2.5%	43%	99 bp	0.6
Goy-APnd_057-Ex1-8A-lcwgs-1-T.clmp.fp2_repr.R2	2.5%	43%	101 bp	0.6
Goy-APnd_058-Ex1-8B-lcwgs-1-T.clmp.fp2_repr.R1	2.3%	42%	98 bp	0.5
Goy-APnd_058-Ex1-8B-lcwgs-1-T.clmp.fp2_repr.R2	2.4%	42%	101 bp	0.5
Goy-APnd_059-Ex1-8C-lcwgs-1-T.clmp.fp2_repr.R1	1.8%	42%	90 bp	1.5
Goy-APnd_059-Ex1-8C-lcwgs-1-T.clmp.fp2_repr.R2	1.8%	42%	92 bp	1.5
Goy-APnd_060-Ex1-8D-lcwgs-1-T.clmp.fp2_repr.R1	2.0%	41%	95 bp	0.6
Goy-APnd_060-Ex1-8D-lcwgs-1-T.clmp.fp2_repr.R2	2.1%	41%	97 bp	0.6
Goy-APnd_061-Ex1-8E-lcwgs-1-T.clmp.fp2_repr.R1	1.5%	41%	84 bp	0.5
Goy-APnd_061-Ex1-8E-lcwgs-1-T.clmp.fp2_repr.R2	1.5%	41%	85 bp	0.5
Goy-APnd_062-Ex1-8F-lcwgs-1-T.clmp.fp2_repr.R1	2.0%	43%	93 bp	0.7
Goy-APnd_062-Ex1-8F-lcwgs-1-T.clmp.fp2_repr.R2	2.1%	43%	95 bp	0.7
Goy-APnd_063-Ex1-8G-lcwgs-1-T.clmp.fp2_repr.R1	1.9%	42%	89 bp	0.8
Goy-APnd_063-Ex1-8G-lcwgs-1-T.clmp.fp2_repr.R2	1.9%	42%	91 bp	0.8
Goy-APnd_064-Ex1-8H-lcwgs-1-T.clmp.fp2_repr.R1	3.2%	43%	104 bp	1.8
Goy-APnd_064-Ex1-8H-lcwgs-1-T.clmp.fp2_repr.R2	3.2%	43%	107 bp	1.8
Goy-APnd_065-Ex1-9A-lcwgs-1-T.clmp.fp2_repr.R1	2.3%	42%	96 bp	0.4
Goy-APnd_065-Ex1-9A-lcwgs-1-T.clmp.fp2_repr.R2	2.3%	42%	98 bp	0.4
Goy-APnd_066-Ex1-9B-lcwgs-1-T.clmp.fp2_repr.R1	2.9%	42%	98 bp	0.4
Goy-APnd_066-Ex1-9B-lcwgs-1-T.clmp.fp2_repr.R2	2.9%	42%	101 bp	0.4
Goy-APnd_067-Ex1-9C-lcwgs-1-T.clmp.fp2_repr.R1	2.2%	43%	98 bp	0.2
Goy-APnd_067-Ex1-9C-lcwgs-1-T.clmp.fp2_repr.R2	2.2%	43%	100 bp	0.2
Goy-CPnd_001-Ex1-7F-lcwgs-1-T.clmp.fp2_repr.R1	5.0%	44%	129 bp	3.1
Goy-CPnd_001-Ex1-7F-lcwgs-1-T.clmp.fp2_repr.R2	4.7%	44%	133 bp	3.1
Goy-CPnd_002-Ex1-5C-lcwgs-1-T.clmp.fp2_repr.R1	3.9%	44%	122 bp	0.3
Goy-CPnd_002-Ex1-5C-lcwgs-1-T.clmp.fp2_repr.R2	3.6%	44%	127 bp	0.3
Goy-CPnd_003-Ex1-7G-lcwgs-1-T.clmp.fp2_repr.R1	4.4%	44%	125 bp	1.5
Goy-CPnd_003-Ex1-7G-lcwgs-1-T.clmp.fp2_repr.R2	4.1%	44%	130 bp	1.5
Goy-CPnd_004-Ex1-2D-lcwgs-1-T.clmp.fp2_repr.R1	4.9%	43%	130 bp	3.5
Goy-CPnd_004-Ex1-2D-lcwgs-1-T.clmp.fp2_repr.R2	4.6%	43%	135 bp	3.5
Goy-CPnd_005-Ex1-6A-lcwgs-1-T.clmp.fp2_repr.R1	5.0%	43%	130 bp	1.4
Goy-CPnd_005-Ex1-6A-lcwgs-1-T.clmp.fp2_repr.R2	4.4%	43%	135 bp	1.4
Goy-CPnd_006-Ex1-2C-lcwgs-1-T.clmp.fp2_repr.R1	5.0%	43%	129 bp	2.4
Goy-CPnd_006-Ex1-2C-lcwgs-1-T.clmp.fp2_repr.R2	4.7%	43%	133 bp	2.4
Goy-CPnd_007-Ex1-8E-lcwgs-1-T.clmp.fp2_repr.R1	4.9%	43%	128 bp	2.4
Goy-CPnd_007-Ex1-8E-lcwgs-1-T.clmp.fp2_repr.R2	4.6%	44%	132 bp	2.4
Goy-CPnd_008-Ex1-4B-lcwgs-1-T.clmp.fp2_repr.R1	6.5%	43%	136 bp	3.3
Goy-CPnd_008-Ex1-4B-lcwgs-1-T.clmp.fp2_repr.R2	5.7%	43%	140 bp	3.3
Goy-CPnd_009-Ex1-8H-lcwgs-1-T.clmp.fp2_repr.R1	4.3%	43%	126 bp	1.3
Goy-CPnd_009-Ex1-8H-lcwgs-1-T.clmp.fp2_repr.R2	3.9%	43%	130 bp	1.3
Goy-CPnd_010-Ex1-6D-lcwgs-1-T.clmp.fp2_repr.R1	5.3%	44%	130 bp	4.8
Goy-CPnd_010-Ex1-6D-lcwgs-1-T.clmp.fp2_repr.R2	5.2%	44%	135 bp	4.8
Goy-CPnd_012-Ex1-1H-lcwgs-1-T.clmp.fp2_repr.R1	1.8%	45%	127 bp	0.0
Goy-CPnd_012-Ex1-1H-lcwgs-1-T.clmp.fp2_repr.R2	1.5%	45%	132 bp	0.0
Goy-CPnd_013-Ex1-7H-lcwgs-1-T.clmp.fp2_repr.R1	3.1%	43%	121 bp	0.3
Goy-CPnd_013-Ex1-7H-lcwgs-1-T.clmp.fp2_repr.R2	2.9%	44%	125 bp	0.3
Goy-CPnd_014-Ex1-4H-lcwgs-1-T.clmp.fp2_repr.R1	3.7%	44%	127 bp	0.4
Goy-CPnd_014-Ex1-4H-lcwgs-1-T.clmp.fp2_repr.R2	3.4%	44%	131 bp	0.4
Goy-CPnd_015-Ex1-1E-lcwgs-1-T.clmp.fp2_repr.R1	5.3%	43%	135 bp	3.2
Goy-CPnd_015-Ex1-1E-lcwgs-1-T.clmp.fp2_repr.R2	4.6%	43%	139 bp	3.2
Goy-CPnd_016-Ex1-7C-lcwgs-1-T.clmp.fp2_repr.R1	4.5%	43%	128 bp	2.1
Goy-CPnd_016-Ex1-7C-lcwgs-1-T.clmp.fp2_repr.R2	4.2%	43%	132 bp	2.1
Goy-CPnd_017-Ex1-5H-lcwgs-1-T.clmp.fp2_repr.R1	2.5%	46%	109 bp	0.4
Goy-CPnd_017-Ex1-5H-lcwgs-1-T.clmp.fp2_repr.R2	2.6%	46%	113 bp	0.4
Goy-CPnd_020-Ex1-5B-lcwgs-1-T.clmp.fp2_repr.R1	3.8%	44%	120 bp	0.7
Goy-CPnd_020-Ex1-5B-lcwgs-1-T.clmp.fp2_repr.R2	3.7%	44%	124 bp	0.7
Goy-CPnd_025-Ex1-5D-lcwgs-1-T.clmp.fp2_repr.R1	4.3%	43%	126 bp	2.4
Goy-CPnd_025-Ex1-5D-lcwgs-1-T.clmp.fp2_repr.R2	4.1%	43%	130 bp	2.4
Goy-CPnd_026-Ex1-2F-lcwgs-1-T.clmp.fp2_repr.R1	5.3%	43%	133 bp	2.6
Goy-CPnd_026-Ex1-2F-lcwgs-1-T.clmp.fp2_repr.R2	4.8%	43%	138 bp	2.6
Goy-CPnd_027-Ex1-2H-lcwgs-1-T.clmp.fp2_repr.R1	4.7%	43%	128 bp	3.2
Goy-CPnd_027-Ex1-2H-lcwgs-1-T.clmp.fp2_repr.R2	4.3%	43%	133 bp	3.2
Goy-CPnd_031-Ex1-1F-lcwgs-1-T.clmp.fp2_repr.R1	6.2%	44%	136 bp	0.5
Goy-CPnd_031-Ex1-1F-lcwgs-1-T.clmp.fp2_repr.R2	5.3%	44%	140 bp	0.5
Goy-CPnd_032-Ex1-1D-lcwgs-1-T.clmp.fp2_repr.R1	5.2%	44%	135 bp	0.3
Goy-CPnd_032-Ex1-1D-lcwgs-1-T.clmp.fp2_repr.R2	4.5%	44%	139 bp	0.3
Goy-CPnd_033-Ex1-2B-lcwgs-1-T.clmp.fp2_repr.R1	3.7%	43%	121 bp	0.5
Goy-CPnd_033-Ex1-2B-lcwgs-1-T.clmp.fp2_repr.R2	3.5%	43%	125 bp	0.5
Goy-CPnd_035-Ex1-3A-lcwgs-1-T.clmp.fp2_repr.R1	3.4%	43%	119 bp	0.7
Goy-CPnd_035-Ex1-3A-lcwgs-1-T.clmp.fp2_repr.R2	3.1%	43%	123 bp	0.7
Goy-CPnd_036-Ex1-7B-lcwgs-1-T.clmp.fp2_repr.R1	9.7%	53%	133 bp	0.2
Goy-CPnd_036-Ex1-7B-lcwgs-1-T.clmp.fp2_repr.R2	8.2%	53%	138 bp	0.2
Goy-CPnd_037-Ex1-3H-lcwgs-1-T.clmp.fp2_repr.R1	4.4%	43%	127 bp	2.1
Goy-CPnd_037-Ex1-3H-lcwgs-1-T.clmp.fp2_repr.R2	4.1%	43%	131 bp	2.1
Goy-CPnd_038-Ex1-6F-lcwgs-1-T.clmp.fp2_repr.R1	6.2%	44%	135 bp	3.2
Goy-CPnd_038-Ex1-6F-lcwgs-1-T.clmp.fp2_repr.R2	5.4%	44%	139 bp	3.2
Goy-CPnd_039-Ex1-8A-lcwgs-1-T.clmp.fp2_repr.R1	5.9%	43%	136 bp	2.1
Goy-CPnd_039-Ex1-8A-lcwgs-1-T.clmp.fp2_repr.R2	5.0%	43%	140 bp	2.1
Goy-CPnd_040-Ex1-7A-lcwgs-1-T.clmp.fp2_repr.R1	2.2%	42%	112 bp	0.3
Goy-CPnd_040-Ex1-7A-lcwgs-1-T.clmp.fp2_repr.R2	2.1%	42%	116 bp	0.3
Goy-CPnd_041-Ex1-3C-lcwgs-1-T.clmp.fp2_repr.R1	6.0%	43%	134 bp	5.5
Goy-CPnd_041-Ex1-3C-lcwgs-1-T.clmp.fp2_repr.R2	5.4%	43%	138 bp	5.5
Goy-CPnd_042-Ex1-3B-lcwgs-1-T.clmp.fp2_repr.R1	4.7%	43%	128 bp	2.0
Goy-CPnd_042-Ex1-3B-lcwgs-1-T.clmp.fp2_repr.R2	4.3%	43%	132 bp	2.0
Goy-CPnd_044-Ex1-4E-lcwgs-1-T.clmp.fp2_repr.R1	2.1%	43%	121 bp	0.1
Goy-CPnd_044-Ex1-4E-lcwgs-1-T.clmp.fp2_repr.R2	1.8%	42%	125 bp	0.1
Goy-CPnd_047-Ex1-6E-lcwgs-1-T.clmp.fp2_repr.R1	7.1%	44%	135 bp	2.2
Goy-CPnd_047-Ex1-6E-lcwgs-1-T.clmp.fp2_repr.R2	6.1%	44%	139 bp	2.2
Goy-CPnd_048-Ex1-8B-lcwgs-1-T.clmp.fp2_repr.R1	4.4%	43%	129 bp	1.0
Goy-CPnd_048-Ex1-8B-lcwgs-1-T.clmp.fp2_repr.R2	3.9%	43%	134 bp	1.0
Goy-CPnd_049-Ex1-8C-lcwgs-1-T.clmp.fp2_repr.R1	3.7%	44%	121 bp	0.4
Goy-CPnd_049-Ex1-8C-lcwgs-1-T.clmp.fp2_repr.R2	3.5%	44%	126 bp	0.4
Goy-CPnd_050-Ex1-8F-lcwgs-1-T.clmp.fp2_repr.R1	4.1%	43%	126 bp	0.3
Goy-CPnd_050-Ex1-8F-lcwgs-1-T.clmp.fp2_repr.R2	3.6%	43%	131 bp	0.3
Goy-CPnd_052-Ex1-3D-lcwgs-1-T.clmp.fp2_repr.R1	4.9%	43%	130 bp	2.7
Goy-CPnd_052-Ex1-3D-lcwgs-1-T.clmp.fp2_repr.R2	4.6%	43%	135 bp	2.7
Goy-CPnd_053-Ex1-2E-lcwgs-1-T.clmp.fp2_repr.R1	4.7%	43%	128 bp	2.6
Goy-CPnd_053-Ex1-2E-lcwgs-1-T.clmp.fp2_repr.R2	4.5%	43%	132 bp	2.6
Goy-CPnd_054-Ex1-1B-lcwgs-1-T.clmp.fp2_repr.R1	8.4%	44%	130 bp	0.2
Goy-CPnd_054-Ex1-1B-lcwgs-1-T.clmp.fp2_repr.R2	7.3%	44%	134 bp	0.2
Goy-CPnd_056-Ex1-3G-lcwgs-1-T.clmp.fp2_repr.R1	6.3%	43%	136 bp	4.0
Goy-CPnd_056-Ex1-3G-lcwgs-1-T.clmp.fp2_repr.R2	5.5%	43%	140 bp	4.0
Goy-CPnd_057-Ex1-4F-lcwgs-1-T.clmp.fp2_repr.R1	6.1%	43%	134 bp	3.7
Goy-CPnd_057-Ex1-4F-lcwgs-1-T.clmp.fp2_repr.R2	5.4%	43%	138 bp	3.7
Goy-CPnd_058-Ex1-1G-lcwgs-1-T.clmp.fp2_repr.R1	5.4%	43%	133 bp	0.1
Goy-CPnd_058-Ex1-1G-lcwgs-1-T.clmp.fp2_repr.R2	4.2%	43%	137 bp	0.1
Goy-CPnd_059-Ex1-8G-lcwgs-1-T.clmp.fp2_repr.R1	4.2%	43%	126 bp	1.1
Goy-CPnd_059-Ex1-8G-lcwgs-1-T.clmp.fp2_repr.R2	3.8%	43%	131 bp	1.1
Goy-CPnd_060-Ex1-7D-lcwgs-1-T.clmp.fp2_repr.R1	4.2%	44%	125 bp	2.6
Goy-CPnd_060-Ex1-7D-lcwgs-1-T.clmp.fp2_repr.R2	4.0%	44%	129 bp	2.6
Goy-CPnd_061-Ex1-7E-lcwgs-1-T.clmp.fp2_repr.R1	4.1%	43%	125 bp	3.6
Goy-CPnd_061-Ex1-7E-lcwgs-1-T.clmp.fp2_repr.R2	3.9%	43%	130 bp	3.6
Goy-CPnd_062-Ex1-3F-lcwgs-1-T.clmp.fp2_repr.R1	5.2%	43%	132 bp	2.8
Goy-CPnd_062-Ex1-3F-lcwgs-1-T.clmp.fp2_repr.R2	4.7%	43%	136 bp	2.8
Goy-CPnd_063-Ex1-2G-lcwgs-1-T.clmp.fp2_repr.R1	5.8%	44%	132 bp	3.9
Goy-CPnd_063-Ex1-2G-lcwgs-1-T.clmp.fp2_repr.R2	5.5%	44%	137 bp	3.9
Goy-CPnd_064-Ex1-8D-lcwgs-1-T.clmp.fp2_repr.R1	4.8%	43%	130 bp	3.1
Goy-CPnd_064-Ex1-8D-lcwgs-1-T.clmp.fp2_repr.R2	4.5%	43%	135 bp	3.1
Goy-CPnd_068-Ex1-2A-lcwgs-1-T.clmp.fp2_repr.R1	5.6%	43%	132 bp	3.5
Goy-CPnd_068-Ex1-2A-lcwgs-1-T.clmp.fp2_repr.R2	5.1%	43%	137 bp	3.5
Goy-CPnd_070-Ex1-1A-lcwgs-1-T.clmp.fp2_repr.R1	6.2%	43%	136 bp	4.2
Goy-CPnd_070-Ex1-1A-lcwgs-1-T.clmp.fp2_repr.R2	5.4%	43%	140 bp	4.2
Goy-CPnd_071-Ex1-3E-lcwgs-1-T.clmp.fp2_repr.R1	4.8%	43%	130 bp	2.7
Goy-CPnd_071-Ex1-3E-lcwgs-1-T.clmp.fp2_repr.R2	4.3%	43%	134 bp	2.7
Goy-CPnd_072-Ex1-4D-lcwgs-1-T.clmp.fp2_repr.R1	4.1%	43%	129 bp	1.6
Goy-CPnd_072-Ex1-4D-lcwgs-1-T.clmp.fp2_repr.R2	3.8%	43%	134 bp	1.6
Goy-CPnd_073-Ex1-4C-lcwgs-1-T.clmp.fp2_repr.R1	4.0%	43%	125 bp	1.1
Goy-CPnd_073-Ex1-4C-lcwgs-1-T.clmp.fp2_repr.R2	3.7%	43%	129 bp	1.1
Goy-CPnd_074-Ex1-1C-lcwgs-1-T.clmp.fp2_repr.R1	4.7%	43%	130 bp	1.1
Goy-CPnd_074-Ex1-1C-lcwgs-1-T.clmp.fp2_repr.R2	4.2%	43%	135 bp	1.1
Goy-CPnd_084-Ex1-5E-lcwgs-1-T.clmp.fp2_repr.R1	6.0%	43%	134 bp	5.6
Goy-CPnd_084-Ex1-5E-lcwgs-1-T.clmp.fp2_repr.R2	5.5%	43%	139 bp	5.6
Goy-CPnd_085-Ex1-6G-lcwgs-1-T.clmp.fp2_repr.R1	4.7%	44%	126 bp	1.7
Goy-CPnd_085-Ex1-6G-lcwgs-1-T.clmp.fp2_repr.R2	4.4%	44%	130 bp	1.7
Goy-CPnd_086-Ex1-5F-lcwgs-1-T.clmp.fp2_repr.R1	4.4%	44%	125 bp	0.5
Goy-CPnd_086-Ex1-5F-lcwgs-1-T.clmp.fp2_repr.R2	4.1%	43%	130 bp	0.5
Goy-CPnd_087-Ex1-6C-lcwgs-1-T.clmp.fp2_repr.R1	4.2%	43%	122 bp	0.8
Goy-CPnd_087-Ex1-6C-lcwgs-1-T.clmp.fp2_repr.R2	3.8%	43%	126 bp	0.8
Goy-CPnd_088-Ex1-6H-lcwgs-1-T.clmp.fp2_repr.R1	5.5%	43%	131 bp	2.7
Goy-CPnd_088-Ex1-6H-lcwgs-1-T.clmp.fp2_repr.R2	5.0%	43%	136 bp	2.7
Goy-CPnd_089-Ex1-6B-lcwgs-1-T.clmp.fp2_repr.R1	4.5%	44%	122 bp	0.4
Goy-CPnd_089-Ex1-6B-lcwgs-1-T.clmp.fp2_repr.R2	4.1%	44%	126 bp	0.4
Goy-CPnd_090-Ex1-5G-lcwgs-1-T.clmp.fp2_repr.R1	4.7%	43%	132 bp	0.8
Goy-CPnd_090-Ex1-5G-lcwgs-1-T.clmp.fp2_repr.R2	4.2%	43%	136 bp	0.8
Goy-CPnd_091-Ex1-4G-lcwgs-1-T.clmp.fp2_repr.R1	5.7%	43%	136 bp	3.5
Goy-CPnd_091-Ex1-4G-lcwgs-1-T.clmp.fp2_repr.R2	5.0%	43%	140 bp	3.5
Goy-CPnd_092-Ex1-4A-lcwgs-1-T.clmp.fp2_repr.R1	4.8%	45%	126 bp	1.3
Goy-CPnd_092-Ex1-4A-lcwgs-1-T.clmp.fp2_repr.R2	4.6%	45%	131 bp	1.3
Goy-CPnd_095-Ex1-5A-lcwgs-1-T.clmp.fp2_repr.R1	4.6%	44%	126 bp	1.5
Goy-CPnd_095-Ex1-5A-lcwgs-1-T.clmp.fp2_repr.R2	4.4%	44%	131 bp	1.5
```

</p>
</details>

## 14. Clean up
`logs` directory created, `*out` files moved to `logs`.

### Cleaning up to increase space in e1garcia
1. Check initial file size.\
`du -h | sort -rh > Goy_lcwgs_beforeDeleting_InterimFiles`

    * 324G

2. Make a copy of important files in RC
```bash
# use interactive node
salloc

# contaminated files
cp -R fq_fp1_clmp_fp2 /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/1st_sequencing_run

# decontaminated files
cp -R fq_fp1_clmp_fp2_fqscrn_rprd /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/1st_sequencing_run/

# check file sizes
du -sh *
du -sh /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/1st_sequencing_run/gerres_oyena/1st_sequencing_run/*
```

</p>
</details>

    * file sizes are equal

3. Delete unneeded files.
```bash
# create log file before removing
ls -ltrh *raw*/*fq.gz > deleted_files_log
ls -ltrh *fp1/*fq.gz >> deleted_files_log
ls -ltrh *clmp/*fq.gz >> deleted_files_log
ls -ltrh *fqscrn/*fastq.gz >> deleted_files_log

# remove files
rm *raw*/*fq.gz
rm *fp1/*fq.gz
rm *clmp/*fq.gz
rm *fqscrn/*fastq.gz
```

</p>
</details>

4. Find new size of directories
`du -h | sort -rh > Goy_lcwgs_afterDeleting_InterimFiles`

    * 91G
    * 324 - 91 = 233G of freed space
  
5. Move cleaning files into logs dir
`mv deleted_files_log logs`
