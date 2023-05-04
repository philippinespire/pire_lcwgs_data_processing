## 1. Download data
Data downloaded from TAMUCC grid.

## 2. Proofread the decode files
160 foward reads, 160 reverse reads. All reads unique.

## 3. Edit the decode file.
No issues, editing not necessary.

## 4. Make a copy of the `fq_raw` files.
Files copied to `/RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/sphyraena_obtusata/fq_raw`

## 5. Perform a renaming dry run.
Dry run successful.

## 6. Rename for real.
Files renamed.

## 7. Check the quality of your data.
`Multi_FASTQC.sh` run. 

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	M Seqs
Sob-APnd_001-Ex1-1A-lcwgs-1-T.1	21.5%	45%	1.2
Sob-APnd_001-Ex1-1A-lcwgs-1-T.2	19.7%	45%	1.2
Sob-APnd_002-Ex1-2A-lcwgs-1-T.1	18.3%	46%	0.3
Sob-APnd_002-Ex1-2A-lcwgs-1-T.2	16.0%	46%	0.3
Sob-APnd_003-Ex1-3A-lcwgs-1-T.1	4.2%	44%	0.6
Sob-APnd_003-Ex1-3A-lcwgs-1-T.2	3.6%	45%	0.6
Sob-APnd_004-Ex1-4A-lcwgs-1-T.1	17.6%	44%	0.8
Sob-APnd_004-Ex1-4A-lcwgs-1-T.2	15.9%	45%	0.8
Sob-APnd_005-Ex1-5A-lcwgs-1-T.1	15.3%	47%	0.2
Sob-APnd_005-Ex1-5A-lcwgs-1-T.2	13.9%	47%	0.2
Sob-APnd_006-Ex1-6A-lcwgs-1-T.1	25.4%	46%	7.3
Sob-APnd_006-Ex1-6A-lcwgs-1-T.2	23.9%	46%	7.3
Sob-APnd_007-Ex1-7A-lcwgs-1-T.1	21.2%	45%	12.3
Sob-APnd_007-Ex1-7A-lcwgs-1-T.2	19.7%	46%	12.3
Sob-APnd_008-Ex1-8A-lcwgs-1-T.1	8.4%	45%	0.4
Sob-APnd_008-Ex1-8A-lcwgs-1-T.2	7.5%	45%	0.4
Sob-APnd_009-Ex1-9A-lcwgs-1-T.1	9.3%	45%	0.3
Sob-APnd_009-Ex1-9A-lcwgs-1-T.2	8.5%	45%	0.3
Sob-APnd_010-Ex1-10A-lcwgs-1-T.1	12.8%	43%	11.4
Sob-APnd_010-Ex1-10A-lcwgs-1-T.2	12.1%	43%	11.4
Sob-APnd_011-Ex1-11A-lcwgs-1-T.1	9.0%	44%	0.3
Sob-APnd_011-Ex1-11A-lcwgs-1-T.2	8.4%	45%	0.3
Sob-APnd_012-Ex1-12A-lcwgs-1-T.1	10.9%	45%	0.8
Sob-APnd_012-Ex1-12A-lcwgs-1-T.2	10.1%	45%	0.8
Sob-APnd_013-Ex1-1B-lcwgs-1-T.1	13.8%	45%	2.0
Sob-APnd_013-Ex1-1B-lcwgs-1-T.2	13.0%	45%	2.0
Sob-APnd_014-Ex1-2B-lcwgs-1-T.1	13.7%	43%	3.7
Sob-APnd_014-Ex1-2B-lcwgs-1-T.2	13.0%	43%	3.7
Sob-APnd_015-Ex1-3B-lcwgs-1-T.1	11.5%	46%	1.3
Sob-APnd_015-Ex1-3B-lcwgs-1-T.2	10.7%	46%	1.3
Sob-APnd_016-Ex1-4B-lcwgs-1-T.1	14.7%	42%	6.4
Sob-APnd_016-Ex1-4B-lcwgs-1-T.2	14.1%	42%	6.4
Sob-APnd_017-Ex1-5B-lcwgs-1-T.1	14.3%	46%	0.3
Sob-APnd_017-Ex1-5B-lcwgs-1-T.2	13.5%	46%	0.3
Sob-APnd_018-Ex1-6B-lcwgs-1-T.1	9.9%	51%	0.5
Sob-APnd_018-Ex1-6B-lcwgs-1-T.2	9.0%	51%	0.5
Sob-APnd_019-Ex1-7B-lcwgs-1-T.1	13.6%	45%	0.8
Sob-APnd_019-Ex1-7B-lcwgs-1-T.2	12.6%	46%	0.8
Sob-APnd_020-Ex1-8B-lcwgs-1-T.1	16.8%	45%	6.1
Sob-APnd_020-Ex1-8B-lcwgs-1-T.2	16.0%	45%	6.1
Sob-APnd_021-Ex1-9B-lcwgs-1-T.1	25.3%	47%	2.8
Sob-APnd_021-Ex1-9B-lcwgs-1-T.2	24.0%	47%	2.8
Sob-APnd_022-Ex1-10B-lcwgs-1-T.1	13.0%	45%	0.5
Sob-APnd_022-Ex1-10B-lcwgs-1-T.2	11.9%	45%	0.5
Sob-APnd_023-Ex1-11B-lcwgs-1-T.1	5.6%	45%	0.1
Sob-APnd_023-Ex1-11B-lcwgs-1-T.2	5.1%	45%	0.1
Sob-APnd_024-Ex1-12B-lcwgs-1-T.1	18.3%	48%	2.1
Sob-APnd_024-Ex1-12B-lcwgs-1-T.2	17.3%	48%	2.1
Sob-APnd_025-Ex1-1C-lcwgs-1-T.1	16.0%	47%	3.1
Sob-APnd_025-Ex1-1C-lcwgs-1-T.2	15.0%	47%	3.1
Sob-APnd_026-Ex1-2C-lcwgs-1-T.1	6.8%	46%	0.1
Sob-APnd_026-Ex1-2C-lcwgs-1-T.2	6.1%	46%	0.1
Sob-APnd_027-Ex1-3C-lcwgs-1-T.1	12.9%	45%	2.1
Sob-APnd_027-Ex1-3C-lcwgs-1-T.2	12.1%	46%	2.1
Sob-APnd_028-Ex1-4C-lcwgs-1-T.1	9.3%	44%	0.5
Sob-APnd_028-Ex1-4C-lcwgs-1-T.2	8.6%	44%	0.5
Sob-APnd_029-Ex1-5C-lcwgs-1-T.1	6.5%	46%	0.1
Sob-APnd_029-Ex1-5C-lcwgs-1-T.2	5.9%	46%	0.1
Sob-APnd_030-Ex1-6C-lcwgs-1-T.1	16.2%	48%	0.8
Sob-APnd_030-Ex1-6C-lcwgs-1-T.2	14.9%	48%	0.8
Sob-APnd_031-Ex1-7C-lcwgs-1-T.1	11.6%	46%	0.3
Sob-APnd_031-Ex1-7C-lcwgs-1-T.2	10.6%	46%	0.3
Sob-APnd_032-Ex1-8C-lcwgs-1-T.1	12.5%	49%	0.2
Sob-APnd_032-Ex1-8C-lcwgs-1-T.2	11.5%	49%	0.2
Sob-APnd_033-Ex1-9C-lcwgs-1-T.1	13.4%	53%	4.2
Sob-APnd_033-Ex1-9C-lcwgs-1-T.2	12.7%	53%	4.2
Sob-APnd_034-Ex1-10C-lcwgs-1-T.1	9.7%	45%	0.5
Sob-APnd_034-Ex1-10C-lcwgs-1-T.2	9.0%	45%	0.5
Sob-APnd_035-Ex1-11C-lcwgs-1-T.1	13.4%	48%	6.3
Sob-APnd_035-Ex1-11C-lcwgs-1-T.2	12.7%	48%	6.3
Sob-APnd_036-Ex1-12C-lcwgs-1-T.1	11.7%	44%	3.8
Sob-APnd_036-Ex1-12C-lcwgs-1-T.2	11.2%	44%	3.8
Sob-APnd_037-Ex1-1D-lcwgs-1-T.1	13.8%	43%	3.5
Sob-APnd_037-Ex1-1D-lcwgs-1-T.2	13.1%	43%	3.5
Sob-APnd_038-Ex1-2D-lcwgs-1-T.1	7.5%	46%	0.1
Sob-APnd_038-Ex1-2D-lcwgs-1-T.2	6.6%	46%	0.1
Sob-APnd_039-Ex1-3D-lcwgs-1-T.1	8.1%	43%	0.6
Sob-APnd_039-Ex1-3D-lcwgs-1-T.2	7.4%	44%	0.6
Sob-APnd_040-Ex1-4D-lcwgs-1-T.1	14.5%	47%	0.5
Sob-APnd_040-Ex1-4D-lcwgs-1-T.2	13.3%	48%	0.5
Sob-APnd_041-Ex1-5D-lcwgs-1-T.1	7.9%	45%	0.1
Sob-APnd_041-Ex1-5D-lcwgs-1-T.2	7.3%	45%	0.1
Sob-APnd_042-Ex1-6D-lcwgs-1-T.1	12.6%	44%	8.5
Sob-APnd_042-Ex1-6D-lcwgs-1-T.2	12.2%	45%	8.5
Sob-APnd_043-Ex1-7D-lcwgs-1-T.1	7.5%	45%	0.1
Sob-APnd_043-Ex1-7D-lcwgs-1-T.2	6.9%	45%	0.1
Sob-APnd_044-Ex1-8D-lcwgs-1-T.1	13.1%	45%	4.3
Sob-APnd_044-Ex1-8D-lcwgs-1-T.2	12.4%	45%	4.3
Sob-APnd_045-Ex1-9D-lcwgs-1-T.1	14.5%	53%	3.8
Sob-APnd_045-Ex1-9D-lcwgs-1-T.2	13.5%	53%	3.8
Sob-APnd_046-Ex1-10D-lcwgs-1-T.1	8.2%	44%	0.4
Sob-APnd_046-Ex1-10D-lcwgs-1-T.2	7.7%	44%	0.4
Sob-APnd_047-Ex1-11D-lcwgs-1-T.1	10.4%	44%	0.8
Sob-APnd_047-Ex1-11D-lcwgs-1-T.2	9.7%	44%	0.8
Sob-APnd_048-Ex1-12D-lcwgs-1-T.1	16.1%	46%	0.1
Sob-APnd_048-Ex1-12D-lcwgs-1-T.2	14.8%	46%	0.1
Sob-APnd_049-Ex1-1E-lcwgs-1-T.1	9.8%	44%	0.3
Sob-APnd_049-Ex1-1E-lcwgs-1-T.2	9.3%	44%	0.3
Sob-APnd_050-Ex1-2E-lcwgs-1-T.1	9.8%	44%	0.0
Sob-APnd_050-Ex1-2E-lcwgs-1-T.2	9.0%	44%	0.0
Sob-APnd_051-Ex1-3E-lcwgs-1-T.1	9.1%	44%	0.3
Sob-APnd_051-Ex1-3E-lcwgs-1-T.2	8.6%	44%	0.3
Sob-APnd_052-Ex1-4E-lcwgs-1-T.1	7.4%	44%	0.0
Sob-APnd_052-Ex1-4E-lcwgs-1-T.2	6.8%	44%	0.0
Sob-APnd_053-Ex1-5E-lcwgs-1-T.1	7.8%	45%	0.0
Sob-APnd_053-Ex1-5E-lcwgs-1-T.2	7.1%	45%	0.0
Sob-APnd_054-Ex1-6E-lcwgs-1-T.1	14.7%	46%	0.9
Sob-APnd_054-Ex1-6E-lcwgs-1-T.2	13.5%	46%	0.9
Sob-APnd_055-Ex1-7E-lcwgs-1-T.1	10.8%	43%	0.3
Sob-APnd_055-Ex1-7E-lcwgs-1-T.2	10.2%	44%	0.3
Sob-APnd_056-Ex1-8E-lcwgs-1-T.1	14.1%	43%	6.3
Sob-APnd_056-Ex1-8E-lcwgs-1-T.2	13.6%	44%	6.3
Sob-APnd_057-Ex1-9E-lcwgs-1-T.1	6.2%	45%	0.0
Sob-APnd_057-Ex1-9E-lcwgs-1-T.2	5.7%	45%	0.0
Sob-APnd_058-Ex1-10E-lcwgs-1-T.1	9.1%	42%	0.3
Sob-APnd_058-Ex1-10E-lcwgs-1-T.2	8.5%	43%	0.3
Sob-APnd_059-Ex1-11E-lcwgs-1-T.1	8.7%	44%	0.0
Sob-APnd_059-Ex1-11E-lcwgs-1-T.2	8.1%	44%	0.0
Sob-APnd_060-Ex1-12E-lcwgs-1-T.1	12.6%	44%	0.1
Sob-APnd_060-Ex1-12E-lcwgs-1-T.2	11.7%	44%	0.1
Sob-APnd_061-Ex1-1F-lcwgs-1-T.1	13.0%	47%	0.4
Sob-APnd_061-Ex1-1F-lcwgs-1-T.2	12.3%	47%	0.4
Sob-APnd_062-Ex1-2F-lcwgs-1-T.1	19.8%	46%	0.2
Sob-APnd_062-Ex1-2F-lcwgs-1-T.2	18.6%	46%	0.2
Sob-APnd_063-Ex1-3F-lcwgs-1-T.1	5.3%	45%	0.2
Sob-APnd_063-Ex1-3F-lcwgs-1-T.2	5.0%	45%	0.2
Sob-APnd_064-Ex1-4F-lcwgs-1-T.1	7.7%	44%	0.1
Sob-APnd_064-Ex1-4F-lcwgs-1-T.2	7.1%	44%	0.1
Sob-APnd_065-Ex1-5F-lcwgs-1-T.1	15.2%	46%	16.1
Sob-APnd_065-Ex1-5F-lcwgs-1-T.2	14.1%	46%	16.1
Sob-APnd_066-Ex1-6F-lcwgs-1-T.1	5.0%	45%	0.1
Sob-APnd_066-Ex1-6F-lcwgs-1-T.2	4.6%	45%	0.1
Sob-APnd_067-Ex1-7F-lcwgs-1-T.1	12.2%	45%	0.3
Sob-APnd_067-Ex1-7F-lcwgs-1-T.2	11.5%	45%	0.3
Sob-APnd_068-Ex1-8F-lcwgs-1-T.1	17.0%	44%	0.2
Sob-APnd_068-Ex1-8F-lcwgs-1-T.2	16.1%	44%	0.2
Sob-APnd_069-Ex1-9F-lcwgs-1-T.1	9.5%	46%	0.1
Sob-APnd_069-Ex1-9F-lcwgs-1-T.2	8.7%	46%	0.1
Sob-APnd_070-Ex1-10F-lcwgs-1-T.1	11.2%	44%	0.9
Sob-APnd_070-Ex1-10F-lcwgs-1-T.2	10.5%	44%	0.9
Sob-APnd_071-Ex1-11F-lcwgs-1-T.1	4.1%	46%	0.0
Sob-APnd_071-Ex1-11F-lcwgs-1-T.2	3.6%	46%	0.0
Sob-APnd_072-Ex1-12F-lcwgs-1-T.1	12.7%	45%	2.2
Sob-APnd_072-Ex1-12F-lcwgs-1-T.2	12.2%	45%	2.2
Sob-APnd_073-Ex1-1G-lcwgs-1-T.1	13.3%	45%	0.4
Sob-APnd_073-Ex1-1G-lcwgs-1-T.2	12.5%	45%	0.4
Sob-APnd_074-Ex1-2G-lcwgs-1-T.1	10.8%	45%	0.0
Sob-APnd_074-Ex1-2G-lcwgs-1-T.2	9.6%	45%	0.0
Sob-APnd_075-Ex1-3G-lcwgs-1-T.1	10.9%	45%	0.2
Sob-APnd_075-Ex1-3G-lcwgs-1-T.2	10.1%	45%	0.2
Sob-APnd_076-Ex1-4G-lcwgs-1-T.1	9.2%	45%	0.0
Sob-APnd_076-Ex1-4G-lcwgs-1-T.2	8.7%	45%	0.0
Sob-APnd_077-Ex1-6G-lcwgs-1-T.1	11.4%	44%	0.1
Sob-APnd_077-Ex1-6G-lcwgs-1-T.2	10.5%	44%	0.1
Sob-APnd_078-Ex1-5G-lcwgs-1-T.1	9.8%	49%	0.0
Sob-APnd_078-Ex1-5G-lcwgs-1-T.2	9.1%	49%	0.0
Sob-APnd_079-Ex1-7G-lcwgs-1-T.1	15.5%	45%	2.3
Sob-APnd_079-Ex1-7G-lcwgs-1-T.2	14.7%	45%	2.3
Sob-APnd_080-Ex1-8G-lcwgs-1-T.1	11.5%	43%	0.8
Sob-APnd_080-Ex1-8G-lcwgs-1-T.2	10.8%	43%	0.8
Sob-APnd_081-Ex1-9G-lcwgs-1-T.1	11.3%	44%	0.3
Sob-APnd_081-Ex1-9G-lcwgs-1-T.2	10.8%	44%	0.3
Sob-APnd_082-Ex1-10G-lcwgs-1-T.1	11.2%	44%	0.4
Sob-APnd_082-Ex1-10G-lcwgs-1-T.2	10.4%	44%	0.4
Sob-APnd_083-Ex1-11G-lcwgs-1-T.1	11.5%	44%	1.2
Sob-APnd_083-Ex1-11G-lcwgs-1-T.2	10.7%	45%	1.2
Sob-APnd_084-Ex1-12G-lcwgs-1-T.1	22.0%	46%	0.9
Sob-APnd_084-Ex1-12G-lcwgs-1-T.2	20.3%	46%	0.9
Sob-APnd_085-Ex1-1H-lcwgs-1-T.1	17.3%	45%	0.1
Sob-APnd_085-Ex1-1H-lcwgs-1-T.2	16.1%	45%	0.1
Sob-APnd_086-Ex1-2H-lcwgs-1-T.1	16.4%	45%	0.2
Sob-APnd_086-Ex1-2H-lcwgs-1-T.2	15.3%	45%	0.2
Sob-APnd_087-Ex1-3H-lcwgs-1-T.1	14.9%	45%	0.6
Sob-APnd_087-Ex1-3H-lcwgs-1-T.2	13.8%	45%	0.6
Sob-APnd_088-Ex1-4H-lcwgs-1-T.1	12.9%	50%	5.2
Sob-APnd_088-Ex1-4H-lcwgs-1-T.2	12.3%	50%	5.2
Sob-APnd_089-Ex1-6H-lcwgs-1-T.1	12.6%	48%	0.1
Sob-APnd_089-Ex1-6H-lcwgs-1-T.2	11.7%	48%	0.1
Sob-APnd_090-Ex1-5H-lcwgs-1-T.1	12.6%	45%	0.3
Sob-APnd_090-Ex1-5H-lcwgs-1-T.2	12.0%	45%	0.3
Sob-APnd_091-Ex1-7H-lcwgs-1-T.1	12.5%	44%	1.1
Sob-APnd_091-Ex1-7H-lcwgs-1-T.2	11.8%	44%	1.1
Sob-APnd_092-Ex1-8H-lcwgs-1-T.1	13.3%	43%	2.9
Sob-APnd_092-Ex1-8H-lcwgs-1-T.2	12.7%	43%	2.9
Sob-APnd_093-Ex1-9H-lcwgs-1-T.1	14.3%	44%	2.8
Sob-APnd_093-Ex1-9H-lcwgs-1-T.2	13.7%	45%	2.8
Sob-APnd_094-Ex1-10H-lcwgs-1-T.1	13.7%	45%	0.4
Sob-APnd_094-Ex1-10H-lcwgs-1-T.2	12.9%	45%	0.4
Sob-APnd_095-Ex1-11H-lcwgs-1-T.1	15.8%	45%	0.1
Sob-APnd_095-Ex1-11H-lcwgs-1-T.2	14.7%	46%	0.1
Sob-APnd_096-Ex1-12H-lcwgs-1-T.1	15.9%	46%	0.9
Sob-APnd_096-Ex1-12H-lcwgs-1-T.2	15.0%	46%	0.9
Sob-CPnd_001-Ex1-12B-lcwgs-1-T.1	14.8%	46%	0.1
Sob-CPnd_001-Ex1-12B-lcwgs-1-T.2	13.7%	47%	0.1
Sob-CPnd_002-Ex1-12E-lcwgs-1-T.1	14.9%	46%	0.2
Sob-CPnd_002-Ex1-12E-lcwgs-1-T.2	13.7%	46%	0.2
Sob-CPnd_003-Ex1-2D-lcwgs-1-T.1	11.1%	47%	1.0
Sob-CPnd_003-Ex1-2D-lcwgs-1-T.2	10.1%	47%	1.0
Sob-CPnd_004-Ex1-12D-lcwgs-1-T.1	9.3%	46%	2.0
Sob-CPnd_004-Ex1-12D-lcwgs-1-T.2	8.6%	47%	2.0
Sob-CPnd_005-Ex1-10D-lcwgs-1-T.1	11.0%	46%	0.1
Sob-CPnd_005-Ex1-10D-lcwgs-1-T.2	10.2%	47%	0.1
Sob-CPnd_006-Ex1-9H-lcwgs-1-T.1	9.7%	47%	0.0
Sob-CPnd_006-Ex1-9H-lcwgs-1-T.2	8.6%	47%	0.0
Sob-CPnd_009-Ex1-11E-lcwgs-1-T.1	12.5%	47%	0.1
Sob-CPnd_009-Ex1-11E-lcwgs-1-T.2	11.2%	47%	0.1
Sob-CPnd_010-Ex1-12A-lcwgs-1-T.1	14.1%	47%	0.0
Sob-CPnd_010-Ex1-12A-lcwgs-1-T.2	12.7%	47%	0.0
Sob-CPnd_011-Ex1-4A-lcwgs-1-T.1	12.1%	46%	1.8
Sob-CPnd_011-Ex1-4A-lcwgs-1-T.2	10.5%	46%	1.8
Sob-CPnd_012-Ex1-1C-lcwgs-1-T.1	9.3%	46%	0.0
Sob-CPnd_012-Ex1-1C-lcwgs-1-T.2	8.4%	47%	0.0
Sob-CPnd_013-Ex1-1D-lcwgs-1-T.1	7.6%	46%	0.3
Sob-CPnd_013-Ex1-1D-lcwgs-1-T.2	6.7%	46%	0.3
Sob-CPnd_014-Ex1-9B-lcwgs-1-T.1	15.6%	47%	0.2
Sob-CPnd_014-Ex1-9B-lcwgs-1-T.2	14.3%	47%	0.2
Sob-CPnd_015-Ex1-1E-lcwgs-1-T.1	8.7%	44%	2.5
Sob-CPnd_015-Ex1-1E-lcwgs-1-T.2	8.1%	45%	2.5
Sob-CPnd_017-Ex1-10A-lcwgs-1-T.1	13.0%	46%	0.1
Sob-CPnd_017-Ex1-10A-lcwgs-1-T.2	11.8%	46%	0.1
Sob-CPnd_018-Ex1-10H-lcwgs-1-T.1	9.7%	46%	10.3
Sob-CPnd_018-Ex1-10H-lcwgs-1-T.2	8.9%	46%	10.3
Sob-CPnd_019-Ex1-11C-lcwgs-1-T.1	15.1%	46%	0.1
Sob-CPnd_019-Ex1-11C-lcwgs-1-T.2	13.6%	46%	0.1
Sob-CPnd_021-Ex1-12G-lcwgs-1-T.1	12.6%	46%	0.1
Sob-CPnd_021-Ex1-12G-lcwgs-1-T.2	11.5%	47%	0.1
Sob-CPnd_022-Ex1-11H-lcwgs-1-T.1	10.4%	46%	0.1
Sob-CPnd_022-Ex1-11H-lcwgs-1-T.2	9.5%	46%	0.1
Sob-CPnd_023-Ex1-9E-lcwgs-1-T.1	13.9%	46%	0.0
Sob-CPnd_023-Ex1-9E-lcwgs-1-T.2	12.4%	47%	0.0
Sob-CPnd_024-Ex1-12C-lcwgs-1-T.1	10.0%	46%	0.3
Sob-CPnd_024-Ex1-12C-lcwgs-1-T.2	9.2%	46%	0.3
Sob-CPnd_025-Ex1-10B-lcwgs-1-T.1	10.8%	46%	0.2
Sob-CPnd_025-Ex1-10B-lcwgs-1-T.2	9.5%	46%	0.2
Sob-CPnd_026-Ex1-12F-lcwgs-1-T.1	11.4%	46%	0.0
Sob-CPnd_026-Ex1-12F-lcwgs-1-T.2	10.6%	46%	0.0
Sob-CPnd_027-Ex1-10F-lcwgs-1-T.1	17.5%	46%	0.0
Sob-CPnd_027-Ex1-10F-lcwgs-1-T.2	15.6%	46%	0.0
Sob-CPnd_028-Ex1-2B-lcwgs-1-T.1	12.0%	47%	5.6
Sob-CPnd_028-Ex1-2B-lcwgs-1-T.2	11.1%	47%	5.6
Sob-CPnd_029-Ex1-10E-lcwgs-1-T.1	8.5%	44%	0.4
Sob-CPnd_029-Ex1-10E-lcwgs-1-T.2	7.8%	44%	0.4
Sob-CPnd_030-Ex1-10G-lcwgs-1-T.1	10.9%	47%	0.0
Sob-CPnd_030-Ex1-10G-lcwgs-1-T.2	9.9%	47%	0.0
Sob-CPnd_031-Ex1-11B-lcwgs-1-T.1	28.0%	47%	0.0
Sob-CPnd_031-Ex1-11B-lcwgs-1-T.2	25.9%	47%	0.0
Sob-CPnd_032-Ex1-2C-lcwgs-1-T.1	19.5%	47%	0.2
Sob-CPnd_032-Ex1-2C-lcwgs-1-T.2	17.8%	47%	0.2
Sob-CPnd_033-Ex1-11G-lcwgs-1-T.1	11.7%	47%	0.1
Sob-CPnd_033-Ex1-11G-lcwgs-1-T.2	10.6%	47%	0.1
Sob-CPnd_034-Ex1-9A-lcwgs-1-T.1	13.0%	46%	0.1
Sob-CPnd_034-Ex1-9A-lcwgs-1-T.2	11.7%	47%	0.1
Sob-CPnd_035-Ex1-9F-lcwgs-1-T.1	12.3%	46%	0.0
Sob-CPnd_035-Ex1-9F-lcwgs-1-T.2	11.1%	46%	0.0
Sob-CPnd_036-Ex1-9D-lcwgs-1-T.1	13.1%	47%	0.1
Sob-CPnd_036-Ex1-9D-lcwgs-1-T.2	12.0%	47%	0.1
Sob-CPnd_037-Ex1-1A-lcwgs-1-T.1	14.5%	45%	16.2
Sob-CPnd_037-Ex1-1A-lcwgs-1-T.2	12.3%	45%	16.2
Sob-CPnd_038-Ex1-1F-lcwgs-1-T.1	10.7%	46%	0.3
Sob-CPnd_038-Ex1-1F-lcwgs-1-T.2	9.9%	46%	0.3
Sob-CPnd_039-Ex1-1G-lcwgs-1-T.1	4.3%	45%	0.1
Sob-CPnd_039-Ex1-1G-lcwgs-1-T.2	3.7%	46%	0.1
Sob-CPnd_040-Ex1-10C-lcwgs-1-T.1	9.6%	46%	0.0
Sob-CPnd_040-Ex1-10C-lcwgs-1-T.2	8.6%	46%	0.0
Sob-CPnd_041-Ex1-1B-lcwgs-1-T.1	9.0%	47%	0.8
Sob-CPnd_041-Ex1-1B-lcwgs-1-T.2	8.0%	47%	0.8
Sob-CPnd_042-Ex1-1H-lcwgs-1-T.1	8.8%	46%	0.4
Sob-CPnd_042-Ex1-1H-lcwgs-1-T.2	8.1%	47%	0.4
Sob-CPnd_043-Ex1-9G-lcwgs-1-T.1	11.8%	46%	0.0
Sob-CPnd_043-Ex1-9G-lcwgs-1-T.2	10.6%	46%	0.0
Sob-CPnd_044-Ex1-11A-lcwgs-1-T.1	19.0%	47%	0.2
Sob-CPnd_044-Ex1-11A-lcwgs-1-T.2	17.1%	47%	0.2
Sob-CPnd_045-Ex1-12H-lcwgs-1-T.1	10.7%	46%	0.1
Sob-CPnd_045-Ex1-12H-lcwgs-1-T.2	9.6%	46%	0.1
Sob-CPnd_046-Ex1-9C-lcwgs-1-T.1	14.0%	46%	0.1
Sob-CPnd_046-Ex1-9C-lcwgs-1-T.2	12.4%	46%	0.1
Sob-CPnd_047-Ex1-11D-lcwgs-1-T.1	12.7%	46%	0.1
Sob-CPnd_047-Ex1-11D-lcwgs-1-T.2	11.6%	46%	0.1
Sob-CPnd_049-Ex1-2A-lcwgs-1-T.1	19.2%	47%	1.7
Sob-CPnd_049-Ex1-2A-lcwgs-1-T.2	17.1%	47%	1.7
Sob-CPnd_050-Ex1-11F-lcwgs-1-T.1	12.0%	46%	0.1
Sob-CPnd_050-Ex1-11F-lcwgs-1-T.2	10.7%	47%	0.1
Sob-CPnd_051-Ex1-4E-lcwgs-1-T.1	10.7%	46%	0.2
Sob-CPnd_051-Ex1-4E-lcwgs-1-T.2	9.8%	46%	0.2
Sob-CPnd_052-Ex1-4H-lcwgs-1-T.1	4.2%	45%	0.1
Sob-CPnd_052-Ex1-4H-lcwgs-1-T.2	3.6%	46%	0.1
Sob-CPnd_053-Ex1-4F-lcwgs-1-T.1	13.8%	47%	0.3
Sob-CPnd_053-Ex1-4F-lcwgs-1-T.2	12.7%	47%	0.3
Sob-CPnd_055-Ex1-4B-lcwgs-1-T.1	11.4%	46%	0.1
Sob-CPnd_055-Ex1-4B-lcwgs-1-T.2	10.1%	46%	0.1
Sob-CPnd_056-Ex1-4G-lcwgs-1-T.1	10.2%	45%	8.7
Sob-CPnd_056-Ex1-4G-lcwgs-1-T.2	9.6%	46%	8.7
Sob-CPnd_057-Ex1-3B-lcwgs-1-T.1	17.3%	45%	0.2
Sob-CPnd_057-Ex1-3B-lcwgs-1-T.2	15.6%	45%	0.2
Sob-CPnd_058-Ex1-2E-lcwgs-1-T.1	10.8%	45%	1.5
Sob-CPnd_058-Ex1-2E-lcwgs-1-T.2	10.0%	46%	1.5
Sob-CPnd_059-Ex1-3C-lcwgs-1-T.1	11.6%	47%	0.9
Sob-CPnd_059-Ex1-3C-lcwgs-1-T.2	10.5%	47%	0.9
Sob-CPnd_062-Ex1-3F-lcwgs-1-T.1	11.6%	45%	0.1
Sob-CPnd_062-Ex1-3F-lcwgs-1-T.2	10.5%	45%	0.1
Sob-CPnd_071-Ex1-2G-lcwgs-1-T.1	16.0%	46%	0.6
Sob-CPnd_071-Ex1-2G-lcwgs-1-T.2	14.3%	46%	0.6
Sob-CPnd_077-Ex1-2F-lcwgs-1-T.1	15.4%	47%	0.1
Sob-CPnd_077-Ex1-2F-lcwgs-1-T.2	13.8%	47%	0.1
Sob-CPnd_078-Ex1-2H-lcwgs-1-T.1	14.3%	46%	1.0
Sob-CPnd_078-Ex1-2H-lcwgs-1-T.2	12.7%	46%	1.0
Sob-CPnd_083-Ex1-3E-lcwgs-1-T.1	14.5%	45%	16.1
Sob-CPnd_083-Ex1-3E-lcwgs-1-T.2	12.8%	45%	16.1
Sob-CPnd_086-Ex1-3A-lcwgs-1-T.1	15.7%	45%	2.8
Sob-CPnd_086-Ex1-3A-lcwgs-1-T.2	14.2%	45%	2.8
Sob-CPnd_087-Ex1-3D-lcwgs-1-T.1	13.5%	45%	9.7
Sob-CPnd_087-Ex1-3D-lcwgs-1-T.2	12.3%	45%	9.7
Sob-CPnd_088-Ex1-4D-lcwgs-1-T.1	17.5%	46%	0.2
Sob-CPnd_088-Ex1-4D-lcwgs-1-T.2	16.3%	46%	0.2
Sob-CPnd_089-Ex1-4C-lcwgs-1-T.1	15.0%	45%	0.0
Sob-CPnd_089-Ex1-4C-lcwgs-1-T.2	13.6%	45%	0.0
Sob-CPnd_090-Ex1-3G-lcwgs-1-T.1	8.8%	47%	0.4
Sob-CPnd_090-Ex1-3G-lcwgs-1-T.2	7.7%	47%	0.4
Sob-CPnd_092-Ex1-3H-lcwgs-1-T.1	16.4%	46%	19.0
Sob-CPnd_092-Ex1-3H-lcwgs-1-T.2	15.0%	46%	19.0
```
</p>
</details>

## 8. First trim.
First trim complete.

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Sob-APnd_001-Ex1-1A-lcwgs-1-T	7.2%	42.2%	89.3%	87.4%
Sob-APnd_002-Ex1-2A-lcwgs-1-T	6.4%	44.2%	93.3%	83.4%
Sob-APnd_003-Ex1-3A-lcwgs-1-T	0.8%	43.4%	91.5%	57.9%
Sob-APnd_004-Ex1-4A-lcwgs-1-T	7.4%	42.1%	94.1%	88.7%
Sob-APnd_005-Ex1-5A-lcwgs-1-T	6.0%	45.9%	93.7%	82.4%
Sob-APnd_006-Ex1-6A-lcwgs-1-T	10.3%	43.8%	94.7%	94.3%
Sob-APnd_007-Ex1-7A-lcwgs-1-T	13.3%	44.0%	96.4%	91.6%
Sob-APnd_008-Ex1-8A-lcwgs-1-T	6.4%	42.9%	94.0%	83.0%
Sob-APnd_009-Ex1-9A-lcwgs-1-T	6.6%	42.8%	94.2%	87.7%
Sob-APnd_010-Ex1-10A-lcwgs-1-T	10.4%	39.2%	97.3%	95.3%
Sob-APnd_011-Ex1-11A-lcwgs-1-T	7.0%	42.0%	95.3%	89.0%
Sob-APnd_012-Ex1-12A-lcwgs-1-T	9.7%	43.1%	95.9%	91.1%
Sob-APnd_013-Ex1-1B-lcwgs-1-T	10.4%	42.6%	96.4%	93.0%
Sob-APnd_014-Ex1-2B-lcwgs-1-T	12.6%	39.8%	96.9%	93.3%
Sob-APnd_015-Ex1-3B-lcwgs-1-T	6.9%	44.2%	93.5%	79.9%
Sob-APnd_016-Ex1-4B-lcwgs-1-T	12.1%	37.5%	95.8%	95.9%
Sob-APnd_017-Ex1-5B-lcwgs-1-T	8.9%	45.1%	93.0%	91.3%
Sob-APnd_018-Ex1-6B-lcwgs-1-T	8.7%	52.0%	94.5%	64.7%
Sob-APnd_019-Ex1-7B-lcwgs-1-T	9.9%	43.9%	95.2%	89.8%
Sob-APnd_020-Ex1-8B-lcwgs-1-T	11.8%	42.8%	96.5%	94.4%
Sob-APnd_021-Ex1-9B-lcwgs-1-T	10.1%	46.7%	92.0%	94.2%
Sob-APnd_022-Ex1-10B-lcwgs-1-T	6.4%	43.7%	92.0%	85.0%
Sob-APnd_023-Ex1-11B-lcwgs-1-T	2.3%	43.0%	93.2%	76.9%
Sob-APnd_024-Ex1-12B-lcwgs-1-T	11.2%	47.9%	94.2%	88.7%
Sob-APnd_025-Ex1-1C-lcwgs-1-T	11.3%	46.4%	97.3%	91.6%
Sob-APnd_026-Ex1-2C-lcwgs-1-T	3.3%	45.1%	92.1%	67.4%
Sob-APnd_027-Ex1-3C-lcwgs-1-T	8.8%	43.8%	95.2%	85.6%
Sob-APnd_028-Ex1-4C-lcwgs-1-T	8.2%	41.1%	95.0%	84.3%
Sob-APnd_029-Ex1-5C-lcwgs-1-T	3.6%	44.5%	89.5%	80.4%
Sob-APnd_030-Ex1-6C-lcwgs-1-T	9.6%	48.0%	95.6%	82.3%
Sob-APnd_031-Ex1-7C-lcwgs-1-T	7.3%	44.7%	95.6%	84.7%
Sob-APnd_032-Ex1-8C-lcwgs-1-T	5.3%	50.1%	93.7%	61.3%
Sob-APnd_033-Ex1-9C-lcwgs-1-T	12.6%	55.8%	96.7%	69.4%
Sob-APnd_034-Ex1-10C-lcwgs-1-T	7.1%	42.5%	94.1%	88.7%
Sob-APnd_035-Ex1-11C-lcwgs-1-T	11.2%	48.7%	95.5%	83.5%
Sob-APnd_036-Ex1-12C-lcwgs-1-T	10.5%	40.9%	96.7%	94.7%
Sob-APnd_037-Ex1-1D-lcwgs-1-T	10.9%	39.5%	96.4%	94.9%
Sob-APnd_038-Ex1-2D-lcwgs-1-T	2.8%	44.4%	92.0%	80.9%
Sob-APnd_039-Ex1-3D-lcwgs-1-T	6.1%	40.7%	95.3%	85.6%
Sob-APnd_040-Ex1-4D-lcwgs-1-T	9.3%	47.7%	90.7%	78.9%
Sob-APnd_041-Ex1-5D-lcwgs-1-T	5.5%	42.2%	95.1%	91.5%
Sob-APnd_042-Ex1-6D-lcwgs-1-T	9.4%	41.4%	96.5%	97.7%
Sob-APnd_043-Ex1-7D-lcwgs-1-T	3.4%	42.3%	94.8%	93.7%
Sob-APnd_044-Ex1-8D-lcwgs-1-T	12.5%	43.1%	97.0%	88.2%
Sob-APnd_045-Ex1-9D-lcwgs-1-T	14.9%	54.9%	97.6%	66.6%
Sob-APnd_046-Ex1-10D-lcwgs-1-T	7.4%	40.6%	96.1%	91.5%
Sob-APnd_047-Ex1-11D-lcwgs-1-T	8.7%	40.5%	96.1%	94.6%
Sob-APnd_048-Ex1-12D-lcwgs-1-T	6.5%	43.8%	92.9%	94.7%
Sob-APnd_049-Ex1-1E-lcwgs-1-T	8.9%	41.1%	96.8%	93.8%
Sob-APnd_050-Ex1-2E-lcwgs-1-T	7.0%	41.1%	95.0%	93.2%
Sob-APnd_051-Ex1-3E-lcwgs-1-T	8.4%	42.0%	96.3%	86.2%
Sob-APnd_052-Ex1-4E-lcwgs-1-T	5.3%	41.7%	94.9%	88.1%
Sob-APnd_053-Ex1-5E-lcwgs-1-T	5.3%	42.1%	93.6%	92.1%
Sob-APnd_054-Ex1-6E-lcwgs-1-T	11.2%	45.2%	97.3%	91.3%
Sob-APnd_055-Ex1-7E-lcwgs-1-T	9.7%	39.8%	96.6%	96.5%
Sob-APnd_056-Ex1-8E-lcwgs-1-T	11.3%	40.0%	96.5%	96.1%
Sob-APnd_057-Ex1-9E-lcwgs-1-T	3.5%	42.8%	93.6%	91.1%
Sob-APnd_058-Ex1-10E-lcwgs-1-T	9.5%	38.5%	97.7%	95.3%
Sob-APnd_059-Ex1-11E-lcwgs-1-T	6.5%	41.3%	95.8%	94.6%
Sob-APnd_060-Ex1-12E-lcwgs-1-T	9.7%	40.8%	96.6%	95.0%
Sob-APnd_061-Ex1-1F-lcwgs-1-T	9.2%	46.0%	95.8%	88.3%
Sob-APnd_062-Ex1-2F-lcwgs-1-T	9.6%	45.2%	94.0%	90.4%
Sob-APnd_063-Ex1-3F-lcwgs-1-T	3.9%	43.3%	94.1%	77.8%
Sob-APnd_064-Ex1-4F-lcwgs-1-T	5.5%	41.5%	94.0%	86.0%
Sob-APnd_065-Ex1-5F-lcwgs-1-T	14.1%	45.1%	97.1%	85.3%
Sob-APnd_066-Ex1-6F-lcwgs-1-T	1.9%	42.4%	94.3%	92.8%
Sob-APnd_067-Ex1-7F-lcwgs-1-T	9.7%	42.4%	95.9%	95.3%
Sob-APnd_068-Ex1-8F-lcwgs-1-T	9.2%	41.6%	95.7%	91.5%
Sob-APnd_069-Ex1-9F-lcwgs-1-T	7.0%	44.1%	94.5%	87.5%
Sob-APnd_070-Ex1-10F-lcwgs-1-T	9.3%	41.0%	96.2%	94.8%
Sob-APnd_071-Ex1-11F-lcwgs-1-T	1.9%	45.0%	92.3%	85.4%
Sob-APnd_072-Ex1-12F-lcwgs-1-T	10.6%	42.1%	96.5%	97.1%
Sob-APnd_073-Ex1-1G-lcwgs-1-T	10.0%	43.3%	95.4%	91.5%
Sob-APnd_074-Ex1-2G-lcwgs-1-T	7.5%	42.5%	94.4%	87.8%
Sob-APnd_075-Ex1-3G-lcwgs-1-T	6.1%	42.5%	94.9%	86.0%
Sob-APnd_076-Ex1-4G-lcwgs-1-T	6.4%	42.5%	94.6%	89.9%
Sob-APnd_077-Ex1-6G-lcwgs-1-T	8.2%	41.3%	96.0%	95.8%
Sob-APnd_078-Ex1-5G-lcwgs-1-T	7.9%	50.1%	95.2%	78.5%
Sob-APnd_079-Ex1-7G-lcwgs-1-T	10.1%	42.0%	93.9%	96.3%
Sob-APnd_080-Ex1-8G-lcwgs-1-T	11.8%	40.3%	97.7%	90.4%
Sob-APnd_081-Ex1-9G-lcwgs-1-T	10.8%	41.4%	96.8%	93.9%
Sob-APnd_082-Ex1-10G-lcwgs-1-T	10.0%	41.7%	97.0%	93.6%
Sob-APnd_083-Ex1-11G-lcwgs-1-T	11.1%	42.2%	97.0%	93.1%
Sob-APnd_084-Ex1-12G-lcwgs-1-T	10.6%	44.6%	91.8%	94.3%
Sob-APnd_085-Ex1-1H-lcwgs-1-T	6.4%	42.9%	92.4%	86.4%
Sob-APnd_086-Ex1-2H-lcwgs-1-T	10.3%	43.1%	96.5%	88.8%
Sob-APnd_087-Ex1-3H-lcwgs-1-T	9.7%	43.2%	91.2%	87.5%
Sob-APnd_088-Ex1-4H-lcwgs-1-T	13.4%	50.7%	97.5%	74.1%
Sob-APnd_089-Ex1-6H-lcwgs-1-T	7.9%	48.2%	96.2%	87.3%
Sob-APnd_090-Ex1-5H-lcwgs-1-T	11.2%	42.5%	96.1%	92.7%
Sob-APnd_091-Ex1-7H-lcwgs-1-T	10.2%	41.1%	95.9%	96.5%
Sob-APnd_092-Ex1-8H-lcwgs-1-T	11.6%	38.6%	96.9%	97.0%
Sob-APnd_093-Ex1-9H-lcwgs-1-T	11.3%	41.9%	96.1%	96.3%
Sob-APnd_094-Ex1-10H-lcwgs-1-T	9.9%	42.8%	95.7%	94.8%
Sob-APnd_095-Ex1-11H-lcwgs-1-T	9.6%	43.5%	95.9%	93.1%
Sob-APnd_096-Ex1-12H-lcwgs-1-T	11.1%	44.3%	94.8%	95.6%
Sob-CPnd_001-Ex1-12B-lcwgs-1-T	12.3%	46.1%	96.3%	55.6%
Sob-CPnd_002-Ex1-12E-lcwgs-1-T	11.3%	45.4%	96.3%	63.0%
Sob-CPnd_003-Ex1-2D-lcwgs-1-T	9.6%	46.2%	92.8%	70.7%
Sob-CPnd_004-Ex1-12D-lcwgs-1-T	11.2%	46.0%	96.2%	66.7%
Sob-CPnd_005-Ex1-10D-lcwgs-1-T	8.6%	45.9%	95.3%	66.3%
Sob-CPnd_006-Ex1-9H-lcwgs-1-T	7.5%	46.6%	94.0%	44.0%
Sob-CPnd_009-Ex1-11E-lcwgs-1-T	10.0%	46.7%	94.9%	52.0%
Sob-CPnd_010-Ex1-12A-lcwgs-1-T	10.7%	46.4%	93.2%	50.7%
Sob-CPnd_011-Ex1-4A-lcwgs-1-T	10.5%	46.1%	95.0%	29.3%
Sob-CPnd_012-Ex1-1C-lcwgs-1-T	7.8%	46.3%	95.8%	52.1%
Sob-CPnd_013-Ex1-1D-lcwgs-1-T	8.4%	45.5%	95.7%	35.1%
Sob-CPnd_014-Ex1-9B-lcwgs-1-T	10.6%	46.3%	94.9%	52.6%
Sob-CPnd_015-Ex1-1E-lcwgs-1-T	9.0%	43.4%	96.6%	63.1%
Sob-CPnd_017-Ex1-10A-lcwgs-1-T	10.6%	45.9%	97.4%	47.7%
Sob-CPnd_018-Ex1-10H-lcwgs-1-T	9.8%	45.3%	96.4%	64.6%
Sob-CPnd_019-Ex1-11C-lcwgs-1-T	10.2%	45.9%	93.8%	41.9%
Sob-CPnd_021-Ex1-12G-lcwgs-1-T	10.8%	46.3%	95.8%	51.4%
Sob-CPnd_022-Ex1-11H-lcwgs-1-T	8.8%	45.4%	95.9%	63.2%
Sob-CPnd_023-Ex1-9E-lcwgs-1-T	9.6%	46.3%	92.5%	39.5%
Sob-CPnd_024-Ex1-12C-lcwgs-1-T	11.6%	45.9%	97.1%	57.5%
Sob-CPnd_025-Ex1-10B-lcwgs-1-T	11.0%	46.2%	96.4%	20.2%
Sob-CPnd_026-Ex1-12F-lcwgs-1-T	10.8%	46.0%	96.8%	62.7%
Sob-CPnd_027-Ex1-10F-lcwgs-1-T	9.0%	44.8%	87.1%	57.9%
Sob-CPnd_028-Ex1-2B-lcwgs-1-T	10.1%	46.5%	93.7%	63.0%
Sob-CPnd_029-Ex1-10E-lcwgs-1-T	9.1%	42.5%	95.9%	70.4%
Sob-CPnd_030-Ex1-10G-lcwgs-1-T	9.1%	46.6%	96.2%	53.6%
Sob-CPnd_031-Ex1-11B-lcwgs-1-T	9.6%	45.5%	76.9%	61.5%
Sob-CPnd_032-Ex1-2C-lcwgs-1-T	9.1%	46.3%	83.7%	66.6%
Sob-CPnd_033-Ex1-11G-lcwgs-1-T	9.8%	46.6%	96.2%	47.0%
Sob-CPnd_034-Ex1-9A-lcwgs-1-T	10.5%	46.2%	95.3%	42.5%
Sob-CPnd_035-Ex1-9F-lcwgs-1-T	9.8%	45.8%	94.9%	39.9%
Sob-CPnd_036-Ex1-9D-lcwgs-1-T	9.2%	46.7%	93.5%	64.1%
Sob-CPnd_037-Ex1-1A-lcwgs-1-T	10.5%	45.1%	95.7%	21.0%
Sob-CPnd_038-Ex1-1F-lcwgs-1-T	9.4%	45.4%	93.4%	66.8%
Sob-CPnd_039-Ex1-1G-lcwgs-1-T	2.3%	44.7%	93.8%	59.6%
Sob-CPnd_040-Ex1-10C-lcwgs-1-T	8.7%	45.7%	95.3%	45.6%
Sob-CPnd_041-Ex1-1B-lcwgs-1-T	9.5%	46.5%	96.6%	62.8%
Sob-CPnd_042-Ex1-1H-lcwgs-1-T	7.0%	45.8%	92.9%	62.9%
Sob-CPnd_043-Ex1-9G-lcwgs-1-T	10.0%	45.7%	94.7%	37.3%
Sob-CPnd_044-Ex1-11A-lcwgs-1-T	10.7%	46.5%	86.5%	50.5%
Sob-CPnd_045-Ex1-12H-lcwgs-1-T	8.9%	45.8%	95.7%	47.7%
Sob-CPnd_046-Ex1-9C-lcwgs-1-T	10.8%	45.7%	94.6%	28.0%
Sob-CPnd_047-Ex1-11D-lcwgs-1-T	10.1%	45.8%	95.2%	57.5%
Sob-CPnd_049-Ex1-2A-lcwgs-1-T	10.2%	46.4%	85.0%	35.8%
Sob-CPnd_050-Ex1-11F-lcwgs-1-T	10.2%	46.4%	96.2%	33.4%
Sob-CPnd_051-Ex1-4E-lcwgs-1-T	5.7%	45.3%	94.3%	68.5%
Sob-CPnd_052-Ex1-4H-lcwgs-1-T	2.3%	44.7%	94.2%	64.9%
Sob-CPnd_053-Ex1-4F-lcwgs-1-T	9.6%	46.3%	91.2%	73.1%
Sob-CPnd_055-Ex1-4B-lcwgs-1-T	8.8%	45.4%	93.8%	43.1%
Sob-CPnd_056-Ex1-4G-lcwgs-1-T	10.0%	44.8%	97.4%	63.2%
Sob-CPnd_057-Ex1-3B-lcwgs-1-T	8.7%	44.9%	93.1%	38.8%
Sob-CPnd_058-Ex1-2E-lcwgs-1-T	9.8%	44.4%	95.9%	71.4%
Sob-CPnd_059-Ex1-3C-lcwgs-1-T	11.7%	46.5%	97.9%	52.9%
Sob-CPnd_062-Ex1-3F-lcwgs-1-T	10.0%	44.9%	97.1%	37.5%
Sob-CPnd_071-Ex1-2G-lcwgs-1-T	10.1%	45.3%	91.2%	50.1%
Sob-CPnd_077-Ex1-2F-lcwgs-1-T	11.5%	46.8%	94.2%	31.2%
Sob-CPnd_078-Ex1-2H-lcwgs-1-T	11.2%	45.7%	93.7%	35.0%
Sob-CPnd_083-Ex1-3E-lcwgs-1-T	11.4%	44.5%	97.4%	35.7%
Sob-CPnd_086-Ex1-3A-lcwgs-1-T	10.6%	44.3%	93.3%	41.4%
Sob-CPnd_087-Ex1-3D-lcwgs-1-T	10.9%	44.5%	97.6%	43.5%
Sob-CPnd_088-Ex1-4D-lcwgs-1-T	7.2%	45.0%	89.6%	69.2%
Sob-CPnd_089-Ex1-4C-lcwgs-1-T	9.5%	44.4%	92.1%	42.4%
Sob-CPnd_090-Ex1-3G-lcwgs-1-T	9.4%	46.6%	96.3%	34.3%
Sob-CPnd_092-Ex1-3H-lcwgs-1-T	11.5%	46.0%	97.6%	47.7%
```
</p>
</details>

## 9. Remove duplicates with clumpify.

### 9a. Remove duplicates.
Running `runCLUMPIFY_r1r2_array.bash`, still running. 5/2

Some samples still running as of this morning. Manually canceled these runs, moved the samples to `fq_fp1_stragglers` and ran again. Completed. 5/3

### 9b. Check duplicate removal success.
Ran `checkClumpify_EG.R`. "Clumpify Successfully worked on all samples"

### 9c. Generate metadata on deduplicated FASTQ files.
Ran `runMULTIQC.sbatch`. Completed.

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	Length	M Seqs
Sob-APnd_001-Ex1-1A-lcwgs-1-T.clmp.r1	2.1%	42%	98 bp	0.9
Sob-APnd_001-Ex1-1A-lcwgs-1-T.clmp.r2	1.7%	42%	98 bp	0.9
Sob-APnd_002-Ex1-2A-lcwgs-1-T.clmp.r1	2.0%	44%	101 bp	0.2
Sob-APnd_002-Ex1-2A-lcwgs-1-T.clmp.r2	1.4%	44%	101 bp	0.2
Sob-APnd_003-Ex1-3A-lcwgs-1-T.clmp.r1	1.2%	43%	118 bp	0.5
Sob-APnd_003-Ex1-3A-lcwgs-1-T.clmp.r2	1.1%	43%	118 bp	0.5
Sob-APnd_004-Ex1-4A-lcwgs-1-T.clmp.r1	1.8%	42%	96 bp	0.6
Sob-APnd_004-Ex1-4A-lcwgs-1-T.clmp.r2	1.4%	42%	96 bp	0.6
Sob-APnd_005-Ex1-5A-lcwgs-1-T.clmp.r1	1.9%	46%	98 bp	0.1
Sob-APnd_005-Ex1-5A-lcwgs-1-T.clmp.r2	1.3%	46%	98 bp	0.1
Sob-APnd_006-Ex1-6A-lcwgs-1-T.clmp.r1	2.0%	44%	89 bp	5.0
Sob-APnd_006-Ex1-6A-lcwgs-1-T.clmp.r2	1.6%	44%	89 bp	5.0
Sob-APnd_007-Ex1-7A-lcwgs-1-T.clmp.r1	2.2%	44%	95 bp	8.8
Sob-APnd_007-Ex1-7A-lcwgs-1-T.clmp.r2	1.8%	44%	95 bp	8.8
Sob-APnd_008-Ex1-8A-lcwgs-1-T.clmp.r1	0.9%	42%	96 bp	0.3
Sob-APnd_008-Ex1-8A-lcwgs-1-T.clmp.r2	0.7%	42%	96 bp	0.3
Sob-APnd_009-Ex1-9A-lcwgs-1-T.clmp.r1	0.8%	43%	89 bp	0.2
Sob-APnd_009-Ex1-9A-lcwgs-1-T.clmp.r2	0.5%	43%	89 bp	0.2
Sob-APnd_010-Ex1-10A-lcwgs-1-T.clmp.r1	1.2%	39%	86 bp	8.9
Sob-APnd_010-Ex1-10A-lcwgs-1-T.clmp.r2	1.0%	39%	86 bp	8.9
Sob-APnd_011-Ex1-11A-lcwgs-1-T.clmp.r1	0.7%	42%	88 bp	0.3
Sob-APnd_011-Ex1-11A-lcwgs-1-T.clmp.r2	0.5%	42%	88 bp	0.3
Sob-APnd_012-Ex1-12A-lcwgs-1-T.clmp.r1	0.9%	43%	83 bp	0.6
Sob-APnd_012-Ex1-12A-lcwgs-1-T.clmp.r2	0.7%	43%	83 bp	0.6
Sob-APnd_013-Ex1-1B-lcwgs-1-T.clmp.r1	1.2%	42%	89 bp	1.6
Sob-APnd_013-Ex1-1B-lcwgs-1-T.clmp.r2	0.8%	42%	89 bp	1.6
Sob-APnd_014-Ex1-2B-lcwgs-1-T.clmp.r1	1.5%	39%	94 bp	2.9
Sob-APnd_014-Ex1-2B-lcwgs-1-T.clmp.r2	1.2%	39%	94 bp	2.9
Sob-APnd_015-Ex1-3B-lcwgs-1-T.clmp.r1	1.3%	44%	100 bp	1.1
Sob-APnd_015-Ex1-3B-lcwgs-1-T.clmp.r2	1.2%	44%	100 bp	1.1
Sob-APnd_016-Ex1-4B-lcwgs-1-T.clmp.r1	1.2%	37%	85 bp	4.9
Sob-APnd_016-Ex1-4B-lcwgs-1-T.clmp.r2	1.0%	37%	85 bp	4.9
Sob-APnd_017-Ex1-5B-lcwgs-1-T.clmp.r1	1.1%	45%	85 bp	0.2
Sob-APnd_017-Ex1-5B-lcwgs-1-T.clmp.r2	0.7%	45%	85 bp	0.2
Sob-APnd_018-Ex1-6B-lcwgs-1-T.clmp.r1	1.4%	51%	109 bp	0.4
Sob-APnd_018-Ex1-6B-lcwgs-1-T.clmp.r2	1.2%	51%	109 bp	0.4
Sob-APnd_019-Ex1-7B-lcwgs-1-T.clmp.r1	1.3%	43%	93 bp	0.6
Sob-APnd_019-Ex1-7B-lcwgs-1-T.clmp.r2	1.1%	43%	93 bp	0.6
Sob-APnd_020-Ex1-8B-lcwgs-1-T.clmp.r1	1.5%	42%	89 bp	4.7
Sob-APnd_020-Ex1-8B-lcwgs-1-T.clmp.r2	1.2%	42%	89 bp	4.7
Sob-APnd_021-Ex1-9B-lcwgs-1-T.clmp.r1	2.0%	47%	87 bp	1.9
Sob-APnd_021-Ex1-9B-lcwgs-1-T.clmp.r2	1.7%	47%	87 bp	1.9
Sob-APnd_022-Ex1-10B-lcwgs-1-T.clmp.r1	1.2%	43%	96 bp	0.4
Sob-APnd_022-Ex1-10B-lcwgs-1-T.clmp.r2	0.9%	43%	96 bp	0.4
Sob-APnd_023-Ex1-11B-lcwgs-1-T.clmp.r1	0.5%	43%	98 bp	0.1
Sob-APnd_023-Ex1-11B-lcwgs-1-T.clmp.r2	0.4%	42%	98 bp	0.1
Sob-APnd_024-Ex1-12B-lcwgs-1-T.clmp.r1	1.6%	48%	89 bp	1.5
Sob-APnd_024-Ex1-12B-lcwgs-1-T.clmp.r2	1.3%	48%	89 bp	1.5
Sob-APnd_025-Ex1-1C-lcwgs-1-T.clmp.r1	1.4%	46%	92 bp	2.3
Sob-APnd_025-Ex1-1C-lcwgs-1-T.clmp.r2	1.1%	46%	92 bp	2.3
Sob-APnd_026-Ex1-2C-lcwgs-1-T.clmp.r1	0.7%	45%	108 bp	0.1
Sob-APnd_026-Ex1-2C-lcwgs-1-T.clmp.r2	0.4%	45%	108 bp	0.1
Sob-APnd_027-Ex1-3C-lcwgs-1-T.clmp.r1	1.5%	43%	95 bp	1.7
Sob-APnd_027-Ex1-3C-lcwgs-1-T.clmp.r2	1.2%	43%	95 bp	1.7
Sob-APnd_028-Ex1-4C-lcwgs-1-T.clmp.r1	0.9%	41%	95 bp	0.4
Sob-APnd_028-Ex1-4C-lcwgs-1-T.clmp.r2	0.7%	41%	95 bp	0.4
Sob-APnd_029-Ex1-5C-lcwgs-1-T.clmp.r1	0.7%	44%	96 bp	0.1
Sob-APnd_029-Ex1-5C-lcwgs-1-T.clmp.r2	0.5%	44%	96 bp	0.1
Sob-APnd_030-Ex1-6C-lcwgs-1-T.clmp.r1	1.9%	48%	100 bp	0.6
Sob-APnd_030-Ex1-6C-lcwgs-1-T.clmp.r2	1.6%	48%	100 bp	0.6
Sob-APnd_031-Ex1-7C-lcwgs-1-T.clmp.r1	1.3%	44%	98 bp	0.2
Sob-APnd_031-Ex1-7C-lcwgs-1-T.clmp.r2	0.9%	44%	98 bp	0.2
Sob-APnd_032-Ex1-8C-lcwgs-1-T.clmp.r1	2.0%	49%	110 bp	0.2
Sob-APnd_032-Ex1-8C-lcwgs-1-T.clmp.r2	1.5%	49%	110 bp	0.2
Sob-APnd_033-Ex1-9C-lcwgs-1-T.clmp.r1	2.2%	55%	109 bp	3.4
Sob-APnd_033-Ex1-9C-lcwgs-1-T.clmp.r2	2.0%	55%	109 bp	3.4
Sob-APnd_034-Ex1-10C-lcwgs-1-T.clmp.r1	0.7%	42%	87 bp	0.4
Sob-APnd_034-Ex1-10C-lcwgs-1-T.clmp.r2	0.5%	42%	87 bp	0.4
Sob-APnd_035-Ex1-11C-lcwgs-1-T.clmp.r1	1.5%	48%	94 bp	4.9
Sob-APnd_035-Ex1-11C-lcwgs-1-T.clmp.r2	1.3%	48%	94 bp	4.9
Sob-APnd_036-Ex1-12C-lcwgs-1-T.clmp.r1	1.0%	40%	81 bp	3.0
Sob-APnd_036-Ex1-12C-lcwgs-1-T.clmp.r2	0.8%	40%	81 bp	3.0
Sob-APnd_037-Ex1-1D-lcwgs-1-T.clmp.r1	1.2%	39%	87 bp	2.7
Sob-APnd_037-Ex1-1D-lcwgs-1-T.clmp.r2	1.0%	39%	87 bp	2.7
Sob-APnd_038-Ex1-2D-lcwgs-1-T.clmp.r1	0.6%	44%	97 bp	0.1
Sob-APnd_038-Ex1-2D-lcwgs-1-T.clmp.r2	0.4%	44%	97 bp	0.1
Sob-APnd_039-Ex1-3D-lcwgs-1-T.clmp.r1	0.9%	40%	94 bp	0.5
Sob-APnd_039-Ex1-3D-lcwgs-1-T.clmp.r2	0.8%	40%	93 bp	0.5
Sob-APnd_040-Ex1-4D-lcwgs-1-T.clmp.r1	1.2%	47%	94 bp	0.4
Sob-APnd_040-Ex1-4D-lcwgs-1-T.clmp.r2	0.9%	47%	94 bp	0.4
Sob-APnd_041-Ex1-5D-lcwgs-1-T.clmp.r1	0.8%	42%	85 bp	0.1
Sob-APnd_041-Ex1-5D-lcwgs-1-T.clmp.r2	0.5%	42%	85 bp	0.1
Sob-APnd_042-Ex1-6D-lcwgs-1-T.clmp.r1	0.8%	41%	74 bp	6.6
Sob-APnd_042-Ex1-6D-lcwgs-1-T.clmp.r2	0.6%	41%	74 bp	6.6
Sob-APnd_043-Ex1-7D-lcwgs-1-T.clmp.r1	0.7%	42%	85 bp	0.1
Sob-APnd_043-Ex1-7D-lcwgs-1-T.clmp.r2	0.5%	42%	85 bp	0.1
Sob-APnd_044-Ex1-8D-lcwgs-1-T.clmp.r1	1.4%	43%	91 bp	3.4
Sob-APnd_044-Ex1-8D-lcwgs-1-T.clmp.r2	1.2%	43%	91 bp	3.4
Sob-APnd_045-Ex1-9D-lcwgs-1-T.clmp.r1	2.4%	54%	112 bp	3.1
Sob-APnd_045-Ex1-9D-lcwgs-1-T.clmp.r2	2.1%	54%	112 bp	3.1
Sob-APnd_046-Ex1-10D-lcwgs-1-T.clmp.r1	0.8%	40%	87 bp	0.3
Sob-APnd_046-Ex1-10D-lcwgs-1-T.clmp.r2	0.6%	40%	87 bp	0.3
Sob-APnd_047-Ex1-11D-lcwgs-1-T.clmp.r1	0.8%	40%	80 bp	0.7
Sob-APnd_047-Ex1-11D-lcwgs-1-T.clmp.r2	0.6%	40%	80 bp	0.7
Sob-APnd_048-Ex1-12D-lcwgs-1-T.clmp.r1	1.2%	43%	80 bp	0.1
Sob-APnd_048-Ex1-12D-lcwgs-1-T.clmp.r2	0.7%	43%	80 bp	0.1
Sob-APnd_049-Ex1-1E-lcwgs-1-T.clmp.r1	0.9%	41%	84 bp	0.2
Sob-APnd_049-Ex1-1E-lcwgs-1-T.clmp.r2	0.7%	41%	84 bp	0.2
Sob-APnd_050-Ex1-2E-lcwgs-1-T.clmp.r1	0.8%	41%	80 bp	0.0
Sob-APnd_050-Ex1-2E-lcwgs-1-T.clmp.r2	0.4%	41%	80 bp	0.0
Sob-APnd_051-Ex1-3E-lcwgs-1-T.clmp.r1	1.0%	41%	93 bp	0.2
Sob-APnd_051-Ex1-3E-lcwgs-1-T.clmp.r2	0.7%	41%	92 bp	0.2
Sob-APnd_052-Ex1-4E-lcwgs-1-T.clmp.r1	0.8%	41%	91 bp	0.0
Sob-APnd_052-Ex1-4E-lcwgs-1-T.clmp.r2	0.5%	41%	91 bp	0.0
Sob-APnd_053-Ex1-5E-lcwgs-1-T.clmp.r1	0.7%	42%	84 bp	0.0
Sob-APnd_053-Ex1-5E-lcwgs-1-T.clmp.r2	0.4%	42%	84 bp	0.0
Sob-APnd_054-Ex1-6E-lcwgs-1-T.clmp.r1	1.5%	45%	90 bp	0.7
Sob-APnd_054-Ex1-6E-lcwgs-1-T.clmp.r2	1.2%	45%	90 bp	0.7
Sob-APnd_055-Ex1-7E-lcwgs-1-T.clmp.r1	0.9%	39%	82 bp	0.2
Sob-APnd_055-Ex1-7E-lcwgs-1-T.clmp.r2	0.6%	39%	82 bp	0.2
Sob-APnd_056-Ex1-8E-lcwgs-1-T.clmp.r1	1.2%	40%	84 bp	4.9
Sob-APnd_056-Ex1-8E-lcwgs-1-T.clmp.r2	0.9%	40%	84 bp	4.9
Sob-APnd_057-Ex1-9E-lcwgs-1-T.clmp.r1	0.5%	43%	86 bp	0.0
Sob-APnd_057-Ex1-9E-lcwgs-1-T.clmp.r2	0.3%	43%	86 bp	0.0
Sob-APnd_058-Ex1-10E-lcwgs-1-T.clmp.r1	1.0%	38%	86 bp	0.3
Sob-APnd_058-Ex1-10E-lcwgs-1-T.clmp.r2	0.7%	38%	86 bp	0.3
Sob-APnd_059-Ex1-11E-lcwgs-1-T.clmp.r1	0.9%	41%	80 bp	0.0
Sob-APnd_059-Ex1-11E-lcwgs-1-T.clmp.r2	0.4%	41%	80 bp	0.0
Sob-APnd_060-Ex1-12E-lcwgs-1-T.clmp.r1	1.3%	40%	84 bp	0.1
Sob-APnd_060-Ex1-12E-lcwgs-1-T.clmp.r2	0.9%	40%	84 bp	0.1
Sob-APnd_061-Ex1-1F-lcwgs-1-T.clmp.r1	1.2%	46%	89 bp	0.3
Sob-APnd_061-Ex1-1F-lcwgs-1-T.clmp.r2	0.9%	46%	89 bp	0.3
Sob-APnd_062-Ex1-2F-lcwgs-1-T.clmp.r1	1.9%	45%	88 bp	0.1
Sob-APnd_062-Ex1-2F-lcwgs-1-T.clmp.r2	1.3%	45%	88 bp	0.1
Sob-APnd_063-Ex1-3F-lcwgs-1-T.clmp.r1	1.2%	43%	98 bp	0.2
Sob-APnd_063-Ex1-3F-lcwgs-1-T.clmp.r2	1.0%	43%	98 bp	0.2
Sob-APnd_064-Ex1-4F-lcwgs-1-T.clmp.r1	1.0%	41%	96 bp	0.1
Sob-APnd_064-Ex1-4F-lcwgs-1-T.clmp.r2	0.6%	41%	95 bp	0.1
Sob-APnd_065-Ex1-5F-lcwgs-1-T.clmp.r1	1.9%	45%	96 bp	12.1
Sob-APnd_065-Ex1-5F-lcwgs-1-T.clmp.r2	1.7%	45%	96 bp	12.1
Sob-APnd_066-Ex1-6F-lcwgs-1-T.clmp.r1	0.5%	42%	83 bp	0.0
Sob-APnd_066-Ex1-6F-lcwgs-1-T.clmp.r2	0.3%	42%	83 bp	0.0
Sob-APnd_067-Ex1-7F-lcwgs-1-T.clmp.r1	1.1%	42%	84 bp	0.3
Sob-APnd_067-Ex1-7F-lcwgs-1-T.clmp.r2	0.7%	42%	84 bp	0.3
Sob-APnd_068-Ex1-8F-lcwgs-1-T.clmp.r1	1.9%	41%	90 bp	0.2
Sob-APnd_068-Ex1-8F-lcwgs-1-T.clmp.r2	1.4%	41%	90 bp	0.2
Sob-APnd_069-Ex1-9F-lcwgs-1-T.clmp.r1	1.0%	44%	89 bp	0.1
Sob-APnd_069-Ex1-9F-lcwgs-1-T.clmp.r2	0.7%	44%	89 bp	0.1
Sob-APnd_070-Ex1-10F-lcwgs-1-T.clmp.r1	1.0%	40%	82 bp	0.7
Sob-APnd_070-Ex1-10F-lcwgs-1-T.clmp.r2	0.8%	40%	82 bp	0.7
Sob-APnd_071-Ex1-11F-lcwgs-1-T.clmp.r1	0.3%	45%	90 bp	0.0
Sob-APnd_071-Ex1-11F-lcwgs-1-T.clmp.r2	0.2%	45%	90 bp	0.0
Sob-APnd_072-Ex1-12F-lcwgs-1-T.clmp.r1	0.9%	41%	76 bp	1.7
Sob-APnd_072-Ex1-12F-lcwgs-1-T.clmp.r2	0.8%	42%	76 bp	1.7
Sob-APnd_073-Ex1-1G-lcwgs-1-T.clmp.r1	1.2%	43%	90 bp	0.3
Sob-APnd_073-Ex1-1G-lcwgs-1-T.clmp.r2	0.9%	43%	90 bp	0.3
Sob-APnd_074-Ex1-2G-lcwgs-1-T.clmp.r1	1.3%	42%	96 bp	0.0
Sob-APnd_074-Ex1-2G-lcwgs-1-T.clmp.r2	0.9%	42%	96 bp	0.0
Sob-APnd_075-Ex1-3G-lcwgs-1-T.clmp.r1	1.0%	42%	89 bp	0.1
Sob-APnd_075-Ex1-3G-lcwgs-1-T.clmp.r2	0.6%	42%	89 bp	0.1
Sob-APnd_076-Ex1-4G-lcwgs-1-T.clmp.r1	0.8%	42%	89 bp	0.0
Sob-APnd_076-Ex1-4G-lcwgs-1-T.clmp.r2	0.6%	42%	89 bp	0.0
Sob-APnd_077-Ex1-6G-lcwgs-1-T.clmp.r1	1.1%	41%	80 bp	0.1
Sob-APnd_077-Ex1-6G-lcwgs-1-T.clmp.r2	0.6%	41%	80 bp	0.1
Sob-APnd_078-Ex1-5G-lcwgs-1-T.clmp.r1	1.4%	49%	99 bp	0.0
Sob-APnd_078-Ex1-5G-lcwgs-1-T.clmp.r2	1.0%	49%	99 bp	0.0
Sob-APnd_079-Ex1-7G-lcwgs-1-T.clmp.r1	1.1%	41%	84 bp	1.8
Sob-APnd_079-Ex1-7G-lcwgs-1-T.clmp.r2	0.9%	41%	84 bp	1.8
Sob-APnd_080-Ex1-8G-lcwgs-1-T.clmp.r1	1.4%	40%	94 bp	0.7
Sob-APnd_080-Ex1-8G-lcwgs-1-T.clmp.r2	1.1%	40%	94 bp	0.7
Sob-APnd_081-Ex1-9G-lcwgs-1-T.clmp.r1	1.0%	41%	79 bp	0.2
Sob-APnd_081-Ex1-9G-lcwgs-1-T.clmp.r2	0.7%	41%	79 bp	0.2
Sob-APnd_082-Ex1-10G-lcwgs-1-T.clmp.r1	1.2%	41%	93 bp	0.4
Sob-APnd_082-Ex1-10G-lcwgs-1-T.clmp.r2	0.9%	41%	93 bp	0.4
Sob-APnd_083-Ex1-11G-lcwgs-1-T.clmp.r1	1.1%	42%	85 bp	0.9
Sob-APnd_083-Ex1-11G-lcwgs-1-T.clmp.r2	0.9%	42%	85 bp	0.9
Sob-APnd_084-Ex1-12G-lcwgs-1-T.clmp.r1	1.9%	44%	89 bp	0.7
Sob-APnd_084-Ex1-12G-lcwgs-1-T.clmp.r2	1.5%	44%	89 bp	0.7
Sob-APnd_085-Ex1-1H-lcwgs-1-T.clmp.r1	2.0%	43%	98 bp	0.1
Sob-APnd_085-Ex1-1H-lcwgs-1-T.clmp.r2	1.5%	42%	98 bp	0.1
Sob-APnd_086-Ex1-2H-lcwgs-1-T.clmp.r1	1.9%	43%	89 bp	0.2
Sob-APnd_086-Ex1-2H-lcwgs-1-T.clmp.r2	1.2%	43%	89 bp	0.2
Sob-APnd_087-Ex1-3H-lcwgs-1-T.clmp.r1	1.1%	43%	92 bp	0.5
Sob-APnd_087-Ex1-3H-lcwgs-1-T.clmp.r2	0.8%	43%	92 bp	0.5
Sob-APnd_088-Ex1-4H-lcwgs-1-T.clmp.r1	1.9%	50%	104 bp	4.2
Sob-APnd_088-Ex1-4H-lcwgs-1-T.clmp.r2	1.7%	50%	104 bp	4.2
Sob-APnd_089-Ex1-6H-lcwgs-1-T.clmp.r1	1.4%	48%	91 bp	0.1
Sob-APnd_089-Ex1-6H-lcwgs-1-T.clmp.r2	1.0%	48%	91 bp	0.1
Sob-APnd_090-Ex1-5H-lcwgs-1-T.clmp.r1	1.1%	42%	81 bp	0.2
Sob-APnd_090-Ex1-5H-lcwgs-1-T.clmp.r2	0.7%	42%	81 bp	0.2
Sob-APnd_091-Ex1-7H-lcwgs-1-T.clmp.r1	0.9%	41%	80 bp	0.9
Sob-APnd_091-Ex1-7H-lcwgs-1-T.clmp.r2	0.7%	41%	80 bp	0.9
Sob-APnd_092-Ex1-8H-lcwgs-1-T.clmp.r1	1.1%	38%	85 bp	2.3
Sob-APnd_092-Ex1-8H-lcwgs-1-T.clmp.r2	0.9%	38%	85 bp	2.3
Sob-APnd_093-Ex1-9H-lcwgs-1-T.clmp.r1	1.1%	41%	83 bp	2.2
Sob-APnd_093-Ex1-9H-lcwgs-1-T.clmp.r2	0.9%	41%	83 bp	2.2
Sob-APnd_094-Ex1-10H-lcwgs-1-T.clmp.r1	1.3%	42%	88 bp	0.3
Sob-APnd_094-Ex1-10H-lcwgs-1-T.clmp.r2	1.0%	42%	88 bp	0.3
Sob-APnd_095-Ex1-11H-lcwgs-1-T.clmp.r1	1.8%	43%	89 bp	0.1
Sob-APnd_095-Ex1-11H-lcwgs-1-T.clmp.r2	1.2%	43%	89 bp	0.1
Sob-APnd_096-Ex1-12H-lcwgs-1-T.clmp.r1	1.5%	44%	83 bp	0.7
Sob-APnd_096-Ex1-12H-lcwgs-1-T.clmp.r2	1.1%	44%	83 bp	0.7
Sob-CPnd_001-Ex1-12B-lcwgs-1-T.clmp.r1	2.9%	46%	123 bp	0.1
Sob-CPnd_001-Ex1-12B-lcwgs-1-T.clmp.r2	2.1%	46%	123 bp	0.1
Sob-CPnd_002-Ex1-12E-lcwgs-1-T.clmp.r1	3.3%	45%	113 bp	0.1
Sob-CPnd_002-Ex1-12E-lcwgs-1-T.clmp.r2	2.6%	45%	114 bp	0.1
Sob-CPnd_003-Ex1-2D-lcwgs-1-T.clmp.r1	1.7%	46%	105 bp	0.8
Sob-CPnd_003-Ex1-2D-lcwgs-1-T.clmp.r2	1.5%	46%	105 bp	0.8
Sob-CPnd_004-Ex1-12D-lcwgs-1-T.clmp.r1	2.0%	45%	108 bp	1.7
Sob-CPnd_004-Ex1-12D-lcwgs-1-T.clmp.r2	1.9%	45%	108 bp	1.7
Sob-CPnd_005-Ex1-10D-lcwgs-1-T.clmp.r1	1.8%	45%	113 bp	0.1
Sob-CPnd_005-Ex1-10D-lcwgs-1-T.clmp.r2	1.4%	45%	113 bp	0.1
Sob-CPnd_006-Ex1-9H-lcwgs-1-T.clmp.r1	2.5%	46%	126 bp	0.0
Sob-CPnd_006-Ex1-9H-lcwgs-1-T.clmp.r2	1.8%	46%	126 bp	0.0
Sob-CPnd_009-Ex1-11E-lcwgs-1-T.clmp.r1	3.0%	46%	123 bp	0.1
Sob-CPnd_009-Ex1-11E-lcwgs-1-T.clmp.r2	2.1%	46%	123 bp	0.1
Sob-CPnd_010-Ex1-12A-lcwgs-1-T.clmp.r1	2.6%	46%	122 bp	0.0
Sob-CPnd_010-Ex1-12A-lcwgs-1-T.clmp.r2	1.9%	46%	122 bp	0.0
Sob-CPnd_011-Ex1-4A-lcwgs-1-T.clmp.r1	3.1%	46%	138 bp	1.5
Sob-CPnd_011-Ex1-4A-lcwgs-1-T.clmp.r2	2.9%	46%	138 bp	1.5
Sob-CPnd_012-Ex1-1C-lcwgs-1-T.clmp.r1	2.1%	46%	122 bp	0.0
Sob-CPnd_012-Ex1-1C-lcwgs-1-T.clmp.r2	1.5%	46%	122 bp	0.0
Sob-CPnd_013-Ex1-1D-lcwgs-1-T.clmp.r1	2.1%	45%	134 bp	0.3
Sob-CPnd_013-Ex1-1D-lcwgs-1-T.clmp.r2	1.7%	45%	134 bp	0.3
Sob-CPnd_014-Ex1-9B-lcwgs-1-T.clmp.r1	3.1%	46%	122 bp	0.1
Sob-CPnd_014-Ex1-9B-lcwgs-1-T.clmp.r2	2.4%	46%	122 bp	0.1
Sob-CPnd_015-Ex1-1E-lcwgs-1-T.clmp.r1	2.1%	43%	115 bp	2.2
Sob-CPnd_015-Ex1-1E-lcwgs-1-T.clmp.r2	1.9%	43%	115 bp	2.2
Sob-CPnd_017-Ex1-10A-lcwgs-1-T.clmp.r1	3.3%	45%	131 bp	0.1
Sob-CPnd_017-Ex1-10A-lcwgs-1-T.clmp.r2	2.6%	45%	131 bp	0.1
Sob-CPnd_018-Ex1-10H-lcwgs-1-T.clmp.r1	3.2%	45%	114 bp	8.5
Sob-CPnd_018-Ex1-10H-lcwgs-1-T.clmp.r2	3.2%	45%	114 bp	8.5
Sob-CPnd_019-Ex1-11C-lcwgs-1-T.clmp.r1	3.2%	45%	131 bp	0.1
Sob-CPnd_019-Ex1-11C-lcwgs-1-T.clmp.r2	2.4%	45%	131 bp	0.1
Sob-CPnd_021-Ex1-12G-lcwgs-1-T.clmp.r1	2.8%	46%	121 bp	0.1
Sob-CPnd_021-Ex1-12G-lcwgs-1-T.clmp.r2	2.1%	46%	121 bp	0.1
Sob-CPnd_022-Ex1-11H-lcwgs-1-T.clmp.r1	2.3%	45%	113 bp	0.1
Sob-CPnd_022-Ex1-11H-lcwgs-1-T.clmp.r2	1.8%	45%	113 bp	0.1
Sob-CPnd_023-Ex1-9E-lcwgs-1-T.clmp.r1	3.0%	46%	130 bp	0.0
Sob-CPnd_023-Ex1-9E-lcwgs-1-T.clmp.r2	2.2%	46%	130 bp	0.0
Sob-CPnd_024-Ex1-12C-lcwgs-1-T.clmp.r1	2.0%	45%	119 bp	0.2
Sob-CPnd_024-Ex1-12C-lcwgs-1-T.clmp.r2	1.6%	45%	119 bp	0.2
Sob-CPnd_025-Ex1-10B-lcwgs-1-T.clmp.r1	5.9%	46%	144 bp	0.2
Sob-CPnd_025-Ex1-10B-lcwgs-1-T.clmp.r2	5.1%	46%	144 bp	0.2
Sob-CPnd_026-Ex1-12F-lcwgs-1-T.clmp.r1	2.2%	46%	112 bp	0.0
Sob-CPnd_026-Ex1-12F-lcwgs-1-T.clmp.r2	1.6%	46%	112 bp	0.0
Sob-CPnd_027-Ex1-10F-lcwgs-1-T.clmp.r1	2.1%	44%	119 bp	0.0
Sob-CPnd_027-Ex1-10F-lcwgs-1-T.clmp.r2	1.6%	44%	119 bp	0.0
Sob-CPnd_028-Ex1-2B-lcwgs-1-T.clmp.r1	1.8%	46%	113 bp	4.6
Sob-CPnd_028-Ex1-2B-lcwgs-1-T.clmp.r2	1.6%	46%	113 bp	4.6
Sob-CPnd_029-Ex1-10E-lcwgs-1-T.clmp.r1	1.5%	42%	110 bp	0.4
Sob-CPnd_029-Ex1-10E-lcwgs-1-T.clmp.r2	1.2%	42%	110 bp	0.4
Sob-CPnd_030-Ex1-10G-lcwgs-1-T.clmp.r1	2.4%	46%	121 bp	0.0
Sob-CPnd_030-Ex1-10G-lcwgs-1-T.clmp.r2	1.8%	46%	121 bp	0.0
Sob-CPnd_031-Ex1-11B-lcwgs-1-T.clmp.r1	2.5%	45%	122 bp	0.0
Sob-CPnd_031-Ex1-11B-lcwgs-1-T.clmp.r2	1.9%	45%	122 bp	0.0
Sob-CPnd_032-Ex1-2C-lcwgs-1-T.clmp.r1	2.9%	46%	111 bp	0.2
Sob-CPnd_032-Ex1-2C-lcwgs-1-T.clmp.r2	2.3%	46%	111 bp	0.2
Sob-CPnd_033-Ex1-11G-lcwgs-1-T.clmp.r1	2.7%	46%	127 bp	0.1
Sob-CPnd_033-Ex1-11G-lcwgs-1-T.clmp.r2	2.0%	46%	127 bp	0.1
Sob-CPnd_034-Ex1-9A-lcwgs-1-T.clmp.r1	3.2%	46%	129 bp	0.1
Sob-CPnd_034-Ex1-9A-lcwgs-1-T.clmp.r2	2.4%	46%	129 bp	0.1
Sob-CPnd_035-Ex1-9F-lcwgs-1-T.clmp.r1	2.9%	45%	130 bp	0.0
Sob-CPnd_035-Ex1-9F-lcwgs-1-T.clmp.r2	2.3%	45%	130 bp	0.0
Sob-CPnd_036-Ex1-9D-lcwgs-1-T.clmp.r1	2.2%	46%	113 bp	0.0
Sob-CPnd_036-Ex1-9D-lcwgs-1-T.clmp.r2	1.6%	46%	113 bp	0.0
Sob-CPnd_037-Ex1-1A-lcwgs-1-T.clmp.r1	4.8%	45%	142 bp	13.9
Sob-CPnd_037-Ex1-1A-lcwgs-1-T.clmp.r2	5.4%	45%	142 bp	13.9
Sob-CPnd_038-Ex1-1F-lcwgs-1-T.clmp.r1	1.7%	45%	110 bp	0.2
Sob-CPnd_038-Ex1-1F-lcwgs-1-T.clmp.r2	1.4%	45%	110 bp	0.2
Sob-CPnd_039-Ex1-1G-lcwgs-1-T.clmp.r1	0.7%	44%	116 bp	0.1
Sob-CPnd_039-Ex1-1G-lcwgs-1-T.clmp.r2	0.5%	44%	116 bp	0.1
Sob-CPnd_040-Ex1-10C-lcwgs-1-T.clmp.r1	2.5%	45%	129 bp	0.0
Sob-CPnd_040-Ex1-10C-lcwgs-1-T.clmp.r2	1.8%	45%	129 bp	0.0
Sob-CPnd_041-Ex1-1B-lcwgs-1-T.clmp.r1	1.9%	46%	114 bp	0.7
Sob-CPnd_041-Ex1-1B-lcwgs-1-T.clmp.r2	1.6%	46%	114 bp	0.7
Sob-CPnd_042-Ex1-1H-lcwgs-1-T.clmp.r1	1.4%	45%	115 bp	0.3
Sob-CPnd_042-Ex1-1H-lcwgs-1-T.clmp.r2	1.1%	45%	115 bp	0.3
Sob-CPnd_043-Ex1-9G-lcwgs-1-T.clmp.r1	3.1%	45%	131 bp	0.0
Sob-CPnd_043-Ex1-9G-lcwgs-1-T.clmp.r2	2.4%	45%	131 bp	0.0
Sob-CPnd_044-Ex1-11A-lcwgs-1-T.clmp.r1	4.1%	46%	126 bp	0.2
Sob-CPnd_044-Ex1-11A-lcwgs-1-T.clmp.r2	3.4%	46%	126 bp	0.2
Sob-CPnd_045-Ex1-12H-lcwgs-1-T.clmp.r1	2.7%	45%	123 bp	0.1
Sob-CPnd_045-Ex1-12H-lcwgs-1-T.clmp.r2	2.0%	45%	123 bp	0.1
Sob-CPnd_046-Ex1-9C-lcwgs-1-T.clmp.r1	4.1%	45%	139 bp	0.1
Sob-CPnd_046-Ex1-9C-lcwgs-1-T.clmp.r2	3.2%	45%	138 bp	0.1
Sob-CPnd_047-Ex1-11D-lcwgs-1-T.clmp.r1	2.5%	45%	119 bp	0.1
Sob-CPnd_047-Ex1-11D-lcwgs-1-T.clmp.r2	2.0%	45%	119 bp	0.1
Sob-CPnd_049-Ex1-2A-lcwgs-1-T.clmp.r1	3.3%	46%	135 bp	1.3
Sob-CPnd_049-Ex1-2A-lcwgs-1-T.clmp.r2	3.1%	46%	135 bp	1.3
Sob-CPnd_050-Ex1-11F-lcwgs-1-T.clmp.r1	3.2%	46%	136 bp	0.1
Sob-CPnd_050-Ex1-11F-lcwgs-1-T.clmp.r2	2.3%	46%	136 bp	0.1
Sob-CPnd_051-Ex1-4E-lcwgs-1-T.clmp.r1	1.7%	45%	109 bp	0.1
Sob-CPnd_051-Ex1-4E-lcwgs-1-T.clmp.r2	1.3%	45%	109 bp	0.1
Sob-CPnd_052-Ex1-4H-lcwgs-1-T.clmp.r1	0.8%	44%	113 bp	0.1
Sob-CPnd_052-Ex1-4H-lcwgs-1-T.clmp.r2	0.6%	44%	113 bp	0.1
Sob-CPnd_053-Ex1-4F-lcwgs-1-T.clmp.r1	1.7%	46%	106 bp	0.3
Sob-CPnd_053-Ex1-4F-lcwgs-1-T.clmp.r2	1.3%	46%	107 bp	0.3
Sob-CPnd_055-Ex1-4B-lcwgs-1-T.clmp.r1	2.7%	45%	127 bp	0.1
Sob-CPnd_055-Ex1-4B-lcwgs-1-T.clmp.r2	2.0%	45%	127 bp	0.1
Sob-CPnd_056-Ex1-4G-lcwgs-1-T.clmp.r1	2.0%	44%	117 bp	7.3
Sob-CPnd_056-Ex1-4G-lcwgs-1-T.clmp.r2	1.9%	44%	117 bp	7.3
Sob-CPnd_057-Ex1-3B-lcwgs-1-T.clmp.r1	4.2%	44%	132 bp	0.2
Sob-CPnd_057-Ex1-3B-lcwgs-1-T.clmp.r2	3.3%	44%	132 bp	0.2
Sob-CPnd_058-Ex1-2E-lcwgs-1-T.clmp.r1	2.7%	44%	113 bp	1.3
Sob-CPnd_058-Ex1-2E-lcwgs-1-T.clmp.r2	2.6%	44%	113 bp	1.3
Sob-CPnd_059-Ex1-3C-lcwgs-1-T.clmp.r1	3.9%	46%	130 bp	0.8
Sob-CPnd_059-Ex1-3C-lcwgs-1-T.clmp.r2	3.6%	46%	130 bp	0.8
Sob-CPnd_062-Ex1-3F-lcwgs-1-T.clmp.r1	3.3%	44%	135 bp	0.1
Sob-CPnd_062-Ex1-3F-lcwgs-1-T.clmp.r2	2.5%	44%	135 bp	0.1
Sob-CPnd_071-Ex1-2G-lcwgs-1-T.clmp.r1	3.4%	45%	130 bp	0.5
Sob-CPnd_071-Ex1-2G-lcwgs-1-T.clmp.r2	3.2%	45%	130 bp	0.5
Sob-CPnd_077-Ex1-2F-lcwgs-1-T.clmp.r1	3.7%	46%	139 bp	0.0
Sob-CPnd_077-Ex1-2F-lcwgs-1-T.clmp.r2	2.8%	46%	139 bp	0.0
Sob-CPnd_078-Ex1-2H-lcwgs-1-T.clmp.r1	4.4%	45%	136 bp	0.8
Sob-CPnd_078-Ex1-2H-lcwgs-1-T.clmp.r2	4.3%	45%	136 bp	0.8
Sob-CPnd_083-Ex1-3E-lcwgs-1-T.clmp.r1	4.6%	44%	139 bp	13.6
Sob-CPnd_083-Ex1-3E-lcwgs-1-T.clmp.r2	5.3%	44%	139 bp	13.6
Sob-CPnd_086-Ex1-3A-lcwgs-1-T.clmp.r1	7.4%	44%	135 bp	2.3
Sob-CPnd_086-Ex1-3A-lcwgs-1-T.clmp.r2	8.3%	44%	135 bp	2.3
Sob-CPnd_087-Ex1-3D-lcwgs-1-T.clmp.r1	4.0%	44%	136 bp	8.2
Sob-CPnd_087-Ex1-3D-lcwgs-1-T.clmp.r2	4.5%	44%	136 bp	8.2
Sob-CPnd_088-Ex1-4D-lcwgs-1-T.clmp.r1	2.1%	45%	110 bp	0.1
Sob-CPnd_088-Ex1-4D-lcwgs-1-T.clmp.r2	1.6%	44%	110 bp	0.1
Sob-CPnd_089-Ex1-4C-lcwgs-1-T.clmp.r1	2.9%	44%	130 bp	0.0
Sob-CPnd_089-Ex1-4C-lcwgs-1-T.clmp.r2	2.2%	44%	130 bp	0.0
Sob-CPnd_090-Ex1-3G-lcwgs-1-T.clmp.r1	3.0%	46%	136 bp	0.4
Sob-CPnd_090-Ex1-3G-lcwgs-1-T.clmp.r2	2.6%	46%	136 bp	0.4
Sob-CPnd_092-Ex1-3H-lcwgs-1-T.clmp.r1	4.3%	45%	131 bp	15.6
Sob-CPnd_092-Ex1-3H-lcwgs-1-T.clmp.r2	4.7%	45%	131 bp	15.6
```
  
</p>
</details>

## 10. Second trim.
Executed `runFASTP_2_cssl.sbatch`, complete.

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Sob-APnd_001-Ex1-1A-lcwgs-1-T.clmp.r1r2_fastp	0.9%	42.2%	98.7%	6.9%
Sob-APnd_002-Ex1-2A-lcwgs-1-T.clmp.r1r2_fastp	0.8%	44.4%	98.2%	6.7%
Sob-APnd_003-Ex1-3A-lcwgs-1-T.clmp.r1r2_fastp	0.2%	43.3%	97.6%	5.2%
Sob-APnd_004-Ex1-4A-lcwgs-1-T.clmp.r1r2_fastp	0.9%	42.2%	98.6%	7.1%
Sob-APnd_005-Ex1-5A-lcwgs-1-T.clmp.r1r2_fastp	0.9%	46.0%	98.3%	6.9%
Sob-APnd_006-Ex1-6A-lcwgs-1-T.clmp.r1r2_fastp	1.2%	44.1%	99.1%	7.5%
Sob-APnd_007-Ex1-7A-lcwgs-1-T.clmp.r1r2_fastp	1.9%	44.4%	99.1%	7.1%
Sob-APnd_008-Ex1-8A-lcwgs-1-T.clmp.r1r2_fastp	0.9%	42.8%	98.4%	6.8%
Sob-APnd_009-Ex1-9A-lcwgs-1-T.clmp.r1r2_fastp	0.7%	42.9%	98.6%	7.3%
Sob-APnd_010-Ex1-10A-lcwgs-1-T.clmp.r1r2_fastp	1.2%	39.2%	99.2%	7.6%
Sob-APnd_011-Ex1-11A-lcwgs-1-T.clmp.r1r2_fastp	0.7%	42.0%	98.9%	7.3%
Sob-APnd_012-Ex1-12A-lcwgs-1-T.clmp.r1r2_fastp	1.0%	43.1%	99.0%	7.3%
Sob-APnd_013-Ex1-1B-lcwgs-1-T.clmp.r1r2_fastp	1.1%	42.6%	99.1%	7.5%
Sob-APnd_014-Ex1-2B-lcwgs-1-T.clmp.r1r2_fastp	1.6%	39.8%	99.2%	7.3%
Sob-APnd_015-Ex1-3B-lcwgs-1-T.clmp.r1r2_fastp	0.8%	44.2%	98.6%	6.4%
Sob-APnd_016-Ex1-4B-lcwgs-1-T.clmp.r1r2_fastp	1.4%	37.6%	99.2%	7.5%
Sob-APnd_017-Ex1-5B-lcwgs-1-T.clmp.r1r2_fastp	0.9%	45.2%	98.8%	7.5%
Sob-APnd_018-Ex1-6B-lcwgs-1-T.clmp.r1r2_fastp	1.6%	51.7%	98.4%	5.3%
Sob-APnd_019-Ex1-7B-lcwgs-1-T.clmp.r1r2_fastp	1.2%	43.9%	98.9%	7.3%
Sob-APnd_020-Ex1-8B-lcwgs-1-T.clmp.r1r2_fastp	1.4%	42.9%	99.2%	7.5%
Sob-APnd_021-Ex1-9B-lcwgs-1-T.clmp.r1r2_fastp	1.1%	47.3%	99.0%	7.6%
Sob-APnd_022-Ex1-10B-lcwgs-1-T.clmp.r1r2_fastp	0.8%	43.6%	98.4%	7.0%
Sob-APnd_023-Ex1-11B-lcwgs-1-T.clmp.r1r2_fastp	0.3%	42.9%	98.2%	6.8%
Sob-APnd_024-Ex1-12B-lcwgs-1-T.clmp.r1r2_fastp	1.4%	48.3%	99.0%	6.9%
Sob-APnd_025-Ex1-1C-lcwgs-1-T.clmp.r1r2_fastp	1.3%	46.5%	99.1%	7.2%
Sob-APnd_026-Ex1-2C-lcwgs-1-T.clmp.r1r2_fastp	0.4%	45.0%	98.1%	5.7%
Sob-APnd_027-Ex1-3C-lcwgs-1-T.clmp.r1r2_fastp	1.0%	43.9%	98.9%	6.6%
Sob-APnd_028-Ex1-4C-lcwgs-1-T.clmp.r1r2_fastp	1.0%	41.0%	98.9%	6.7%
Sob-APnd_029-Ex1-5C-lcwgs-1-T.clmp.r1r2_fastp	0.4%	44.3%	96.7%	6.4%
Sob-APnd_030-Ex1-6C-lcwgs-1-T.clmp.r1r2_fastp	1.4%	48.3%	98.8%	6.5%
Sob-APnd_031-Ex1-7C-lcwgs-1-T.clmp.r1r2_fastp	0.9%	44.8%	98.7%	6.8%
Sob-APnd_032-Ex1-8C-lcwgs-1-T.clmp.r1r2_fastp	1.2%	49.6%	98.2%	5.2%
Sob-APnd_033-Ex1-9C-lcwgs-1-T.clmp.r1r2_fastp	2.1%	55.5%	99.0%	5.3%
Sob-APnd_034-Ex1-10C-lcwgs-1-T.clmp.r1r2_fastp	0.7%	42.4%	98.8%	7.2%
Sob-APnd_035-Ex1-11C-lcwgs-1-T.clmp.r1r2_fastp	1.5%	48.6%	99.2%	6.4%
Sob-APnd_036-Ex1-12C-lcwgs-1-T.clmp.r1r2_fastp	1.1%	40.9%	99.2%	7.3%
Sob-APnd_037-Ex1-1D-lcwgs-1-T.clmp.r1r2_fastp	1.2%	39.5%	99.2%	7.5%
Sob-APnd_038-Ex1-2D-lcwgs-1-T.clmp.r1r2_fastp	0.3%	44.3%	98.5%	6.8%
Sob-APnd_039-Ex1-3D-lcwgs-1-T.clmp.r1r2_fastp	0.7%	40.7%	98.9%	6.9%
Sob-APnd_040-Ex1-4D-lcwgs-1-T.clmp.r1r2_fastp	1.4%	47.4%	98.8%	6.2%
Sob-APnd_041-Ex1-5D-lcwgs-1-T.clmp.r1r2_fastp	0.6%	42.2%	98.7%	7.6%
Sob-APnd_042-Ex1-6D-lcwgs-1-T.clmp.r1r2_fastp	0.8%	41.3%	99.3%	7.8%
Sob-APnd_043-Ex1-7D-lcwgs-1-T.clmp.r1r2_fastp	0.4%	42.4%	98.8%	8.2%
Sob-APnd_044-Ex1-8D-lcwgs-1-T.clmp.r1r2_fastp	1.7%	43.2%	99.2%	6.8%
Sob-APnd_045-Ex1-9D-lcwgs-1-T.clmp.r1r2_fastp	2.6%	54.7%	98.9%	5.1%
Sob-APnd_046-Ex1-10D-lcwgs-1-T.clmp.r1r2_fastp	0.8%	40.6%	98.9%	7.5%
Sob-APnd_047-Ex1-11D-lcwgs-1-T.clmp.r1r2_fastp	0.9%	40.4%	99.3%	7.5%
Sob-APnd_048-Ex1-12D-lcwgs-1-T.clmp.r1r2_fastp	0.6%	43.8%	98.9%	7.8%
Sob-APnd_049-Ex1-1E-lcwgs-1-T.clmp.r1r2_fastp	0.9%	41.0%	99.2%	7.7%
Sob-APnd_050-Ex1-2E-lcwgs-1-T.clmp.r1r2_fastp	0.6%	41.1%	99.1%	7.7%
Sob-APnd_051-Ex1-3E-lcwgs-1-T.clmp.r1r2_fastp	0.9%	41.9%	99.0%	7.1%
Sob-APnd_052-Ex1-4E-lcwgs-1-T.clmp.r1r2_fastp	0.7%	41.6%	98.7%	7.6%
Sob-APnd_053-Ex1-5E-lcwgs-1-T.clmp.r1r2_fastp	0.5%	42.0%	98.6%	8.3%
Sob-APnd_054-Ex1-6E-lcwgs-1-T.clmp.r1r2_fastp	1.4%	45.4%	99.2%	7.3%
Sob-APnd_055-Ex1-7E-lcwgs-1-T.clmp.r1r2_fastp	0.9%	39.7%	99.3%	7.8%
Sob-APnd_056-Ex1-8E-lcwgs-1-T.clmp.r1r2_fastp	1.2%	40.0%	99.3%	7.7%
Sob-APnd_057-Ex1-9E-lcwgs-1-T.clmp.r1r2_fastp	0.5%	42.9%	98.7%	8.0%
Sob-APnd_058-Ex1-10E-lcwgs-1-T.clmp.r1r2_fastp	1.1%	38.5%	99.2%	7.7%
Sob-APnd_059-Ex1-11E-lcwgs-1-T.clmp.r1r2_fastp	0.6%	41.3%	99.0%	8.3%
Sob-APnd_060-Ex1-12E-lcwgs-1-T.clmp.r1r2_fastp	1.0%	40.7%	99.2%	7.8%
Sob-APnd_061-Ex1-1F-lcwgs-1-T.clmp.r1r2_fastp	1.0%	46.2%	99.0%	7.1%
Sob-APnd_062-Ex1-2F-lcwgs-1-T.clmp.r1r2_fastp	1.1%	45.3%	99.0%	7.2%
Sob-APnd_063-Ex1-3F-lcwgs-1-T.clmp.r1r2_fastp	0.4%	43.2%	98.5%	6.6%
Sob-APnd_064-Ex1-4F-lcwgs-1-T.clmp.r1r2_fastp	0.7%	41.5%	98.6%	7.1%
Sob-APnd_065-Ex1-5F-lcwgs-1-T.clmp.r1r2_fastp	2.1%	45.4%	99.1%	6.6%
Sob-APnd_066-Ex1-6F-lcwgs-1-T.clmp.r1r2_fastp	0.2%	42.4%	98.6%	8.2%
Sob-APnd_067-Ex1-7F-lcwgs-1-T.clmp.r1r2_fastp	1.0%	42.4%	99.2%	7.7%
Sob-APnd_068-Ex1-8F-lcwgs-1-T.clmp.r1r2_fastp	1.1%	41.5%	99.0%	7.6%
Sob-APnd_069-Ex1-9F-lcwgs-1-T.clmp.r1r2_fastp	0.8%	44.1%	98.6%	7.3%
Sob-APnd_070-Ex1-10F-lcwgs-1-T.clmp.r1r2_fastp	0.9%	40.9%	99.2%	7.6%
Sob-APnd_071-Ex1-11F-lcwgs-1-T.clmp.r1r2_fastp	0.3%	44.8%	98.2%	7.3%
Sob-APnd_072-Ex1-12F-lcwgs-1-T.clmp.r1r2_fastp	1.0%	41.9%	99.2%	7.7%
Sob-APnd_073-Ex1-1G-lcwgs-1-T.clmp.r1r2_fastp	1.2%	43.4%	99.1%	7.4%
Sob-APnd_074-Ex1-2G-lcwgs-1-T.clmp.r1r2_fastp	0.9%	42.4%	98.7%	7.4%
Sob-APnd_075-Ex1-3G-lcwgs-1-T.clmp.r1r2_fastp	0.5%	42.5%	98.8%	7.1%
Sob-APnd_076-Ex1-4G-lcwgs-1-T.clmp.r1r2_fastp	0.6%	42.4%	98.8%	7.8%
Sob-APnd_077-Ex1-6G-lcwgs-1-T.clmp.r1r2_fastp	0.8%	41.2%	99.0%	7.8%
Sob-APnd_078-Ex1-5G-lcwgs-1-T.clmp.r1r2_fastp	1.2%	49.8%	98.6%	6.6%
Sob-APnd_079-Ex1-7G-lcwgs-1-T.clmp.r1r2_fastp	1.0%	41.9%	99.3%	7.8%
Sob-APnd_080-Ex1-8G-lcwgs-1-T.clmp.r1r2_fastp	1.5%	40.2%	99.2%	7.2%
Sob-APnd_081-Ex1-9G-lcwgs-1-T.clmp.r1r2_fastp	1.2%	41.3%	99.2%	7.7%
Sob-APnd_082-Ex1-10G-lcwgs-1-T.clmp.r1r2_fastp	1.2%	41.6%	99.2%	7.5%
Sob-APnd_083-Ex1-11G-lcwgs-1-T.clmp.r1r2_fastp	1.3%	42.1%	99.2%	7.4%
Sob-APnd_084-Ex1-12G-lcwgs-1-T.clmp.r1r2_fastp	1.2%	44.8%	99.1%	7.5%
Sob-APnd_085-Ex1-1H-lcwgs-1-T.clmp.r1r2_fastp	0.8%	42.9%	98.8%	7.0%
Sob-APnd_086-Ex1-2H-lcwgs-1-T.clmp.r1r2_fastp	1.2%	43.0%	99.1%	7.0%
Sob-APnd_087-Ex1-3H-lcwgs-1-T.clmp.r1r2_fastp	1.2%	43.2%	99.0%	6.9%
Sob-APnd_088-Ex1-4H-lcwgs-1-T.clmp.r1r2_fastp	2.1%	50.7%	99.1%	5.7%
Sob-APnd_089-Ex1-6H-lcwgs-1-T.clmp.r1r2_fastp	1.0%	48.1%	99.0%	7.2%
Sob-APnd_090-Ex1-5H-lcwgs-1-T.clmp.r1r2_fastp	1.2%	42.5%	99.2%	7.4%
Sob-APnd_091-Ex1-7H-lcwgs-1-T.clmp.r1r2_fastp	1.0%	41.0%	99.3%	7.6%
Sob-APnd_092-Ex1-8H-lcwgs-1-T.clmp.r1r2_fastp	1.2%	38.4%	99.3%	7.7%
Sob-APnd_093-Ex1-9H-lcwgs-1-T.clmp.r1r2_fastp	1.2%	41.8%	99.3%	7.7%
Sob-APnd_094-Ex1-10H-lcwgs-1-T.clmp.r1r2_fastp	1.1%	42.8%	99.2%	7.6%
Sob-APnd_095-Ex1-11H-lcwgs-1-T.clmp.r1r2_fastp	1.1%	43.7%	99.1%	7.4%
Sob-APnd_096-Ex1-12H-lcwgs-1-T.clmp.r1r2_fastp	1.1%	44.4%	99.2%	7.5%
Sob-CPnd_001-Ex1-12B-lcwgs-1-T.clmp.r1r2_fastp	2.3%	46.1%	99.0%	4.5%
Sob-CPnd_002-Ex1-12E-lcwgs-1-T.clmp.r1r2_fastp	2.1%	45.3%	98.9%	5.0%
Sob-CPnd_003-Ex1-2D-lcwgs-1-T.clmp.r1r2_fastp	1.7%	46.1%	99.0%	5.5%
Sob-CPnd_004-Ex1-12D-lcwgs-1-T.clmp.r1r2_fastp	2.0%	45.8%	99.0%	5.2%
Sob-CPnd_005-Ex1-10D-lcwgs-1-T.clmp.r1r2_fastp	1.5%	45.8%	99.0%	5.2%
Sob-CPnd_006-Ex1-9H-lcwgs-1-T.clmp.r1r2_fastp	1.9%	46.6%	98.2%	3.5%
Sob-CPnd_009-Ex1-11E-lcwgs-1-T.clmp.r1r2_fastp	2.3%	46.6%	98.8%	4.2%
Sob-CPnd_010-Ex1-12A-lcwgs-1-T.clmp.r1r2_fastp	2.3%	46.3%	98.9%	4.2%
Sob-CPnd_011-Ex1-4A-lcwgs-1-T.clmp.r1r2_fastp	2.8%	46.0%	98.4%	2.3%
Sob-CPnd_012-Ex1-1C-lcwgs-1-T.clmp.r1r2_fastp	1.7%	46.2%	98.6%	4.2%
Sob-CPnd_013-Ex1-1D-lcwgs-1-T.clmp.r1r2_fastp	2.1%	45.4%	98.4%	3.0%
Sob-CPnd_014-Ex1-9B-lcwgs-1-T.clmp.r1r2_fastp	2.1%	46.3%	98.9%	4.2%
Sob-CPnd_015-Ex1-1E-lcwgs-1-T.clmp.r1r2_fastp	1.8%	43.2%	98.9%	5.0%
Sob-CPnd_017-Ex1-10A-lcwgs-1-T.clmp.r1r2_fastp	2.3%	45.8%	98.9%	3.7%
Sob-CPnd_018-Ex1-10H-lcwgs-1-T.clmp.r1r2_fastp	1.9%	45.2%	98.9%	4.9%
Sob-CPnd_019-Ex1-11C-lcwgs-1-T.clmp.r1r2_fastp	2.4%	45.8%	98.6%	3.3%
Sob-CPnd_021-Ex1-12G-lcwgs-1-T.clmp.r1r2_fastp	2.3%	46.2%	98.9%	4.1%
Sob-CPnd_022-Ex1-11H-lcwgs-1-T.clmp.r1r2_fastp	1.8%	45.3%	98.9%	5.1%
Sob-CPnd_023-Ex1-9E-lcwgs-1-T.clmp.r1r2_fastp	2.4%	46.2%	98.6%	3.3%
Sob-CPnd_024-Ex1-12C-lcwgs-1-T.clmp.r1r2_fastp	2.1%	45.8%	99.0%	4.6%
Sob-CPnd_025-Ex1-10B-lcwgs-1-T.clmp.r1r2_fastp	3.0%	46.1%	98.5%	1.6%
Sob-CPnd_026-Ex1-12F-lcwgs-1-T.clmp.r1r2_fastp	2.0%	45.9%	99.0%	4.8%
Sob-CPnd_027-Ex1-10F-lcwgs-1-T.clmp.r1r2_fastp	2.0%	44.7%	98.7%	4.4%
Sob-CPnd_028-Ex1-2B-lcwgs-1-T.clmp.r1r2_fastp	1.8%	46.3%	98.9%	4.8%
Sob-CPnd_029-Ex1-10E-lcwgs-1-T.clmp.r1r2_fastp	1.5%	42.4%	99.0%	5.6%
Sob-CPnd_030-Ex1-10G-lcwgs-1-T.clmp.r1r2_fastp	1.9%	46.5%	98.8%	4.4%
Sob-CPnd_031-Ex1-11B-lcwgs-1-T.clmp.r1r2_fastp	2.2%	45.5%	98.9%	4.1%
Sob-CPnd_032-Ex1-2C-lcwgs-1-T.clmp.r1r2_fastp	1.7%	46.2%	98.9%	4.8%
Sob-CPnd_033-Ex1-11G-lcwgs-1-T.clmp.r1r2_fastp	2.1%	46.5%	98.8%	3.7%
Sob-CPnd_034-Ex1-9A-lcwgs-1-T.clmp.r1r2_fastp	2.5%	46.2%	98.7%	3.3%
Sob-CPnd_035-Ex1-9F-lcwgs-1-T.clmp.r1r2_fastp	2.4%	45.7%	98.5%	3.1%
Sob-CPnd_036-Ex1-9D-lcwgs-1-T.clmp.r1r2_fastp	1.7%	46.6%	98.8%	4.9%
Sob-CPnd_037-Ex1-1A-lcwgs-1-T.clmp.r1r2_fastp	3.1%	45.0%	98.3%	1.7%
Sob-CPnd_038-Ex1-1F-lcwgs-1-T.clmp.r1r2_fastp	1.8%	45.2%	98.9%	5.2%
Sob-CPnd_039-Ex1-1G-lcwgs-1-T.clmp.r1r2_fastp	0.5%	44.6%	98.3%	5.3%
Sob-CPnd_040-Ex1-10C-lcwgs-1-T.clmp.r1r2_fastp	2.0%	45.5%	98.5%	3.8%
Sob-CPnd_041-Ex1-1B-lcwgs-1-T.clmp.r1r2_fastp	1.7%	46.4%	98.9%	5.0%
Sob-CPnd_042-Ex1-1H-lcwgs-1-T.clmp.r1r2_fastp	1.3%	45.7%	98.7%	5.0%
Sob-CPnd_043-Ex1-9G-lcwgs-1-T.clmp.r1r2_fastp	2.8%	45.6%	98.6%	3.1%
Sob-CPnd_044-Ex1-11A-lcwgs-1-T.clmp.r1r2_fastp	2.5%	46.4%	98.8%	3.5%
Sob-CPnd_045-Ex1-12H-lcwgs-1-T.clmp.r1r2_fastp	2.1%	45.8%	98.6%	3.9%
Sob-CPnd_046-Ex1-9C-lcwgs-1-T.clmp.r1r2_fastp	3.0%	45.7%	98.4%	2.2%
Sob-CPnd_047-Ex1-11D-lcwgs-1-T.clmp.r1r2_fastp	2.1%	45.7%	98.9%	4.5%
Sob-CPnd_049-Ex1-2A-lcwgs-1-T.clmp.r1r2_fastp	2.9%	46.2%	98.4%	2.2%
Sob-CPnd_050-Ex1-11F-lcwgs-1-T.clmp.r1r2_fastp	2.5%	46.4%	98.7%	2.7%
Sob-CPnd_051-Ex1-4E-lcwgs-1-T.clmp.r1r2_fastp	0.9%	45.2%	98.6%	5.7%
Sob-CPnd_052-Ex1-4H-lcwgs-1-T.clmp.r1r2_fastp	0.5%	44.5%	98.4%	5.5%
Sob-CPnd_053-Ex1-4F-lcwgs-1-T.clmp.r1r2_fastp	1.6%	46.2%	99.0%	5.7%
Sob-CPnd_055-Ex1-4B-lcwgs-1-T.clmp.r1r2_fastp	2.2%	45.3%	98.5%	3.5%
Sob-CPnd_056-Ex1-4G-lcwgs-1-T.clmp.r1r2_fastp	1.8%	44.7%	99.0%	4.9%
Sob-CPnd_057-Ex1-3B-lcwgs-1-T.clmp.r1r2_fastp	2.1%	44.8%	98.4%	3.3%
Sob-CPnd_058-Ex1-2E-lcwgs-1-T.clmp.r1r2_fastp	1.5%	44.3%	99.1%	5.7%
Sob-CPnd_059-Ex1-3C-lcwgs-1-T.clmp.r1r2_fastp	2.3%	46.4%	98.9%	4.2%
Sob-CPnd_062-Ex1-3F-lcwgs-1-T.clmp.r1r2_fastp	2.3%	44.9%	98.7%	3.2%
Sob-CPnd_071-Ex1-2G-lcwgs-1-T.clmp.r1r2_fastp	2.1%	45.2%	98.8%	3.9%
Sob-CPnd_077-Ex1-2F-lcwgs-1-T.clmp.r1r2_fastp	2.8%	46.7%	98.6%	2.9%
Sob-CPnd_078-Ex1-2H-lcwgs-1-T.clmp.r1r2_fastp	2.6%	45.6%	98.6%	2.8%
Sob-CPnd_083-Ex1-3E-lcwgs-1-T.clmp.r1r2_fastp	2.6%	44.4%	98.7%	2.9%
Sob-CPnd_086-Ex1-3A-lcwgs-1-T.clmp.r1r2_fastp	2.5%	44.2%	98.7%	3.3%
Sob-CPnd_087-Ex1-3D-lcwgs-1-T.clmp.r1r2_fastp	2.4%	44.4%	98.8%	3.5%
Sob-CPnd_088-Ex1-4D-lcwgs-1-T.clmp.r1r2_fastp	1.2%	44.9%	98.8%	5.6%
Sob-CPnd_089-Ex1-4C-lcwgs-1-T.clmp.r1r2_fastp	2.3%	44.4%	98.7%	3.3%
Sob-CPnd_090-Ex1-3G-lcwgs-1-T.clmp.r1r2_fastp	2.4%	46.5%	98.5%	3.0%
Sob-CPnd_092-Ex1-3H-lcwgs-1-T.clmp.r1r2_fastp	2.5%	45.8%	98.8%	3.8%
```

</p>
</details>

## 11. Decontaminate files.
Executed `runFQSCRN_6.bash`. In the queue to start running.
Still running. 5/3

Finished running. 5/4

320 files for each file type, matching number of `fq.gz` files. No errors found by grep.

`runMULTIQC.sbatch` executed.

<details><summary>Expand for MultiQC Output.</summary>

```bash

```

</p>
</details>

