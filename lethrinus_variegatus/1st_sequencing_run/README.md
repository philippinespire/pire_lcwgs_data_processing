## 1. Download data
Data downloaded from TAMUCC grid.

## 2. Proofread the decode files
Decode file formatting is correct. 95 forward reads, 95 reverse reads, all reads unique.

## 3. Edit the decode file
N/A

## 4. Make a copy of the fq_raw files
`screen cp */. /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/lethrinus_variegatus/1st_sequencing_run/fq_raw`

## 5. Perform a renaming dry run.
`bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Lva-LCWGS-test_SequenceNameDecode.txt`

## 6. Rename the files for real
`bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Lva-LCWGS-test_SequenceNameDecode.txt rename`

## 7. Check the quality of your data.
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report"  "fq.gz"`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	M Seqs
Lva-APnd_001-Ex1-9D-lcwgs-1-1.1	2.0%	43%	0.0
Lva-APnd_001-Ex1-9D-lcwgs-1-1.2	1.8%	43%	0.0
Lva-APnd_002-Ex1-9E-lcwgs-1-1.1	1.8%	43%	0.0
Lva-APnd_002-Ex1-9E-lcwgs-1-1.2	1.5%	43%	0.0
Lva-APnd_003-Ex1-9F-lcwgs-1-1.1	1.8%	43%	0.0
Lva-APnd_003-Ex1-9F-lcwgs-1-1.2	1.6%	43%	0.0
Lva-APnd_004-Ex1-9G-lcwgs-1-1.1	1.8%	43%	0.0
Lva-APnd_004-Ex1-9G-lcwgs-1-1.2	1.7%	43%	0.0
Lva-APnd_005-Ex1-9H-lcwgs-1-1.1	2.0%	43%	0.0
Lva-APnd_005-Ex1-9H-lcwgs-1-1.2	1.6%	43%	0.0
Lva-APnd_006-Ex1-10A-lcwgs-1-1.1	1.0%	42%	0.0
Lva-APnd_006-Ex1-10A-lcwgs-1-1.2	1.0%	43%	0.0
Lva-APnd_007-Ex1-10B-lcwgs-1-1.1	1.5%	42%	0.0
Lva-APnd_007-Ex1-10B-lcwgs-1-1.2	1.3%	43%	0.0
Lva-APnd_008-Ex1-10C-lcwgs-1-1.1	1.4%	42%	0.0
Lva-APnd_008-Ex1-10C-lcwgs-1-1.2	1.3%	43%	0.0
Lva-APnd_009-Ex1-10D-lcwgs-1-1.1	1.6%	42%	0.0
Lva-APnd_009-Ex1-10D-lcwgs-1-1.2	1.3%	43%	0.0
Lva-APnd_010-Ex1-10E-lcwgs-1-1.1	1.1%	42%	0.0
Lva-APnd_010-Ex1-10E-lcwgs-1-1.2	1.0%	43%	0.0
Lva-APnd_011-Ex1-10F-lcwgs-1-1.1	1.6%	42%	0.0
Lva-APnd_011-Ex1-10F-lcwgs-1-1.2	1.7%	43%	0.0
Lva-APnd_012-Ex1-10G-lcwgs-1-1.1	1.4%	42%	0.0
Lva-APnd_012-Ex1-10G-lcwgs-1-1.2	1.2%	43%	0.0
Lva-APnd_013-Ex1-10H-lcwgs-1-1.1	1.9%	42%	0.0
Lva-APnd_013-Ex1-10H-lcwgs-1-1.2	1.5%	43%	0.0
Lva-APnd_014-Ex1-11A-lcwgs-1-1.1	1.6%	42%	0.0
Lva-APnd_014-Ex1-11A-lcwgs-1-1.2	1.4%	42%	0.0
Lva-APnd_015-Ex1-11B-lcwgs-1-1.1	3.0%	42%	0.0
Lva-APnd_015-Ex1-11B-lcwgs-1-1.2	2.8%	43%	0.0
Lva-APnd_016-Ex1-11C-lcwgs-1-1.1	1.1%	42%	0.0
Lva-APnd_016-Ex1-11C-lcwgs-1-1.2	1.0%	42%	0.0
Lva-APnd_017-Ex1-11D-lcwgs-1-1.1	1.6%	42%	0.0
Lva-APnd_017-Ex1-11D-lcwgs-1-1.2	1.7%	42%	0.0
Lva-APnd_018-Ex1-11E-lcwgs-1-1.1	1.2%	42%	0.0
Lva-APnd_018-Ex1-11E-lcwgs-1-1.2	0.9%	42%	0.0
Lva-APnd_019-Ex1-11F-lcwgs-1-1.1	1.4%	42%	0.0
Lva-APnd_019-Ex1-11F-lcwgs-1-1.2	1.2%	42%	0.0
Lva-APnd_020-Ex1-11G-lcwgs-1-1.1	1.1%	42%	0.0
Lva-APnd_020-Ex1-11G-lcwgs-1-1.2	0.9%	42%	0.0
Lva-APnd_021-Ex1-11H-lcwgs-1-1.1	1.0%	42%	0.0
Lva-APnd_021-Ex1-11H-lcwgs-1-1.2	0.7%	42%	0.0
Lva-APnd_022-Ex1-12A-lcwgs-1-1.1	1.3%	42%	0.0
Lva-APnd_022-Ex1-12A-lcwgs-1-1.2	1.1%	43%	0.0
Lva-APnd_023-Ex1-12B-lcwgs-1-1.1	3.3%	42%	0.0
Lva-APnd_023-Ex1-12B-lcwgs-1-1.2	3.1%	43%	0.0
Lva-APnd_024-Ex1-12C-lcwgs-1-1.1	1.1%	42%	0.0
Lva-APnd_024-Ex1-12C-lcwgs-1-1.2	1.0%	43%	0.0
Lva-APnd_025-Ex1-12D-lcwgs-1-1.1	1.1%	42%	0.0
Lva-APnd_025-Ex1-12D-lcwgs-1-1.2	1.2%	43%	0.0
Lva-APnd_026-Ex1-12E-lcwgs-1-1.1	1.1%	42%	0.0
Lva-APnd_026-Ex1-12E-lcwgs-1-1.2	0.7%	42%	0.0
Lva-APnd_027-Ex1-12F-lcwgs-1-1.1	2.0%	42%	0.0
Lva-APnd_027-Ex1-12F-lcwgs-1-1.2	2.1%	43%	0.0
Lva-APnd_028-Ex1-12G-lcwgs-1-1.1	1.2%	42%	0.0
Lva-APnd_028-Ex1-12G-lcwgs-1-1.2	1.2%	42%	0.0
Lva-APnd_029-Ex1-12H-lcwgs-1-1.1	1.0%	42%	0.0
Lva-APnd_029-Ex1-12H-lcwgs-1-1.2	0.7%	42%	0.0
Lva-APnd_030-Ex1-1A-lcwgs-1-1.1	1.1%	41%	0.0
Lva-APnd_030-Ex1-1A-lcwgs-1-1.2	1.2%	41%	0.0
Lva-APnd_031-Ex1-1B-lcwgs-1-1.1	5.1%	41%	0.0
Lva-APnd_031-Ex1-1B-lcwgs-1-1.2	4.4%	41%	0.0
Lva-APnd_032-Ex1-1C-lcwgs-1-1.1	1.4%	41%	0.0
Lva-APnd_032-Ex1-1C-lcwgs-1-1.2	1.1%	42%	0.0
Lva-APnd_033-Ex1-1D-lcwgs-1-1.1	1.8%	41%	0.0
Lva-APnd_033-Ex1-1D-lcwgs-1-1.2	1.7%	41%	0.0
Lva-APnd_034-Ex1-1E-lcwgs-1-1.1	0.7%	41%	0.0
Lva-APnd_034-Ex1-1E-lcwgs-1-1.2	0.7%	42%	0.0
Lva-APnd_035-Ex1-1F-lcwgs-1-1.1	2.5%	41%	0.0
Lva-APnd_035-Ex1-1F-lcwgs-1-1.2	2.5%	42%	0.0
Lva-APnd_036-Ex1-1G-lcwgs-1-1.1	1.0%	41%	0.0
Lva-APnd_036-Ex1-1G-lcwgs-1-1.2	0.8%	41%	0.0
Lva-APnd_037-Ex1-1H-lcwgs-1-1.1	1.3%	41%	0.0
Lva-APnd_037-Ex1-1H-lcwgs-1-1.2	1.3%	41%	0.0
Lva-APnd_038-Ex1-2A-lcwgs-1-1.1	1.2%	41%	0.0
Lva-APnd_038-Ex1-2A-lcwgs-1-1.2	1.0%	41%	0.0
Lva-APnd_039-Ex1-2B-lcwgs-1-1.1	6.1%	41%	0.0
Lva-APnd_039-Ex1-2B-lcwgs-1-1.2	4.7%	41%	0.0
Lva-APnd_040-Ex1-2C-lcwgs-1-1.1	1.4%	41%	0.0
Lva-APnd_040-Ex1-2C-lcwgs-1-1.2	1.0%	41%	0.0
Lva-APnd_041-Ex1-2D-lcwgs-1-1.1	1.8%	41%	0.0
Lva-APnd_041-Ex1-2D-lcwgs-1-1.2	1.2%	41%	0.0
Lva-APnd_042-Ex1-2E-lcwgs-1-1.1	1.5%	40%	0.0
Lva-APnd_042-Ex1-2E-lcwgs-1-1.2	1.1%	40%	0.0
Lva-APnd_043-Ex1-2F-lcwgs-1-1.1	2.1%	41%	0.0
Lva-APnd_043-Ex1-2F-lcwgs-1-1.2	2.4%	41%	0.0
Lva-APnd_044-Ex1-2G-lcwgs-1-1.1	0.9%	40%	0.0
Lva-APnd_044-Ex1-2G-lcwgs-1-1.2	0.8%	40%	0.0
Lva-APnd_045-Ex1-2H-lcwgs-1-1.1	1.4%	41%	0.0
Lva-APnd_045-Ex1-2H-lcwgs-1-1.2	1.4%	41%	0.0
Lva-APnd_046-Ex1-3A-lcwgs-1-1.1	0.8%	40%	0.0
Lva-APnd_046-Ex1-3A-lcwgs-1-1.2	0.7%	41%	0.0
Lva-APnd_047-Ex1-3B-lcwgs-1-1.1	1.5%	40%	0.0
Lva-APnd_047-Ex1-3B-lcwgs-1-1.2	1.1%	41%	0.0
Lva-CPnd_001-Ex1-1A-lcwgs-2-1.1	9.6%	43%	2.7
Lva-CPnd_001-Ex1-1A-lcwgs-2-1.2	9.1%	44%	2.7
Lva-CPnd_002-Ex1-2A-lcwgs-2-1.1	12.4%	44%	1.8
Lva-CPnd_002-Ex1-2A-lcwgs-2-1.2	11.7%	45%	1.8
Lva-CPnd_003-Ex1-3A-lcwgs-2-1.1	9.9%	43%	3.1
Lva-CPnd_003-Ex1-3A-lcwgs-2-1.2	9.0%	44%	3.1
Lva-CPnd_004-Ex1-4A-lcwgs-2-1.1	13.1%	45%	3.3
Lva-CPnd_004-Ex1-4A-lcwgs-2-1.2	12.2%	45%	3.3
Lva-CPnd_005-Ex1-5A-lcwgs-2-1.1	8.5%	43%	2.2
Lva-CPnd_005-Ex1-5A-lcwgs-2-1.2	7.6%	43%	2.2
Lva-CPnd_006-Ex1-6A-lcwgs-2-1.1	13.1%	58%	0.3
Lva-CPnd_006-Ex1-6A-lcwgs-2-1.2	12.0%	58%	0.3
Lva-CPnd_007-Ex1-7A-lcwgs-2-1.1	9.4%	43%	1.3
Lva-CPnd_007-Ex1-7A-lcwgs-2-1.2	8.2%	44%	1.3
Lva-CPnd_008-Ex1-8A-lcwgs-2-1.1	13.2%	44%	1.1
Lva-CPnd_008-Ex1-8A-lcwgs-2-1.2	11.7%	44%	1.1
Lva-CPnd_009-Ex1-9A-lcwgs-2-1.1	10.5%	43%	2.2
Lva-CPnd_009-Ex1-9A-lcwgs-2-1.2	9.3%	43%	2.2
Lva-CPnd_010-Ex1-10A-lcwgs-2-1.1	10.4%	44%	1.9
Lva-CPnd_010-Ex1-10A-lcwgs-2-1.2	9.2%	44%	1.9
Lva-CPnd_011-Ex1-11A-lcwgs-2-1.1	8.9%	43%	3.1
Lva-CPnd_011-Ex1-11A-lcwgs-2-1.2	8.1%	43%	3.1
Lva-CPnd_012-Ex1-12A-lcwgs-2-1.1	15.4%	44%	1.6
Lva-CPnd_012-Ex1-12A-lcwgs-2-1.2	14.3%	44%	1.6
Lva-CPnd_013-Ex1-1B-lcwgs-2-1.1	11.0%	43%	3.6
Lva-CPnd_013-Ex1-1B-lcwgs-2-1.2	10.1%	44%	3.6
Lva-CPnd_014-Ex1-2B-lcwgs-2-1.1	9.2%	43%	5.1
Lva-CPnd_014-Ex1-2B-lcwgs-2-1.2	8.4%	44%	5.1
Lva-CPnd_015-Ex1-3B-lcwgs-2-1.1	8.7%	43%	5.1
Lva-CPnd_015-Ex1-3B-lcwgs-2-1.2	7.8%	43%	5.1
Lva-CPnd_016-Ex1-4B-lcwgs-2-1.1	8.4%	43%	5.4
Lva-CPnd_016-Ex1-4B-lcwgs-2-1.2	7.7%	43%	5.4
Lva-CPnd_017-Ex1-5B-lcwgs-2-1.1	11.4%	43%	4.4
Lva-CPnd_017-Ex1-5B-lcwgs-2-1.2	10.4%	44%	4.4
Lva-CPnd_018-Ex1-6B-lcwgs-2-1.1	10.4%	43%	5.7
Lva-CPnd_018-Ex1-6B-lcwgs-2-1.2	9.3%	44%	5.7
Lva-CPnd_019-Ex1-7B-lcwgs-2-1.1	11.1%	44%	4.2
Lva-CPnd_019-Ex1-7B-lcwgs-2-1.2	10.1%	44%	4.2
Lva-CPnd_020-Ex1-8B-lcwgs-2-1.1	12.1%	43%	3.4
Lva-CPnd_020-Ex1-8B-lcwgs-2-1.2	10.8%	43%	3.4
Lva-CPnd_021-Ex1-9B-lcwgs-2-1.1	12.1%	44%	4.0
Lva-CPnd_021-Ex1-9B-lcwgs-2-1.2	10.8%	44%	4.0
Lva-CPnd_022-Ex1-10B-lcwgs-2-1.1	8.3%	43%	4.2
Lva-CPnd_022-Ex1-10B-lcwgs-2-1.2	7.4%	43%	4.2
Lva-CPnd_023-Ex1-11B-lcwgs-2-1.1	10.0%	43%	5.1
Lva-CPnd_023-Ex1-11B-lcwgs-2-1.2	8.9%	44%	5.1
Lva-CPnd_024-Ex1-12B-lcwgs-2-1.1	9.4%	43%	5.1
Lva-CPnd_024-Ex1-12B-lcwgs-2-1.2	8.5%	43%	5.1
Lva-CPnd_025-Ex1-1C-lcwgs-2-1.1	8.4%	43%	2.6
Lva-CPnd_025-Ex1-1C-lcwgs-2-1.2	7.7%	44%	2.6
Lva-CPnd_026-Ex1-2C-lcwgs-2-1.1	10.0%	44%	3.0
Lva-CPnd_026-Ex1-2C-lcwgs-2-1.2	9.2%	44%	3.0
Lva-CPnd_027-Ex1-3C-lcwgs-2-1.1	9.0%	43%	2.1
Lva-CPnd_027-Ex1-3C-lcwgs-2-1.2	7.9%	43%	2.1
Lva-CPnd_028-Ex1-4C-lcwgs-2-1.1	7.9%	43%	3.4
Lva-CPnd_028-Ex1-4C-lcwgs-2-1.2	7.3%	43%	3.4
Lva-CPnd_029-Ex1-5C-lcwgs-2-1.1	7.1%	43%	2.8
Lva-CPnd_029-Ex1-5C-lcwgs-2-1.2	6.2%	43%	2.8
Lva-CPnd_030-Ex1-6C-lcwgs-2-1.1	14.0%	43%	4.6
Lva-CPnd_030-Ex1-6C-lcwgs-2-1.2	12.5%	43%	4.6
Lva-CPnd_031-Ex1-7C-lcwgs-2-1.1	7.7%	43%	2.1
Lva-CPnd_031-Ex1-7C-lcwgs-2-1.2	7.0%	44%	2.1
Lva-CPnd_032-Ex1-8C-lcwgs-2-1.1	10.7%	43%	4.1
Lva-CPnd_032-Ex1-8C-lcwgs-2-1.2	8.9%	43%	4.1
Lva-CPnd_033-Ex1-9C-lcwgs-2-1.1	9.1%	42%	2.6
Lva-CPnd_033-Ex1-9C-lcwgs-2-1.2	7.9%	43%	2.6
Lva-CPnd_034-Ex1-10C-lcwgs-2-1.1	7.9%	43%	3.7
Lva-CPnd_034-Ex1-10C-lcwgs-2-1.2	7.0%	44%	3.7
Lva-CPnd_035-Ex1-11C-lcwgs-2-1.1	10.7%	43%	3.4
Lva-CPnd_035-Ex1-11C-lcwgs-2-1.2	9.0%	43%	3.4
Lva-CPnd_036-Ex1-12C-lcwgs-2-1.1	15.9%	43%	1.5
Lva-CPnd_036-Ex1-12C-lcwgs-2-1.2	13.9%	43%	1.5
Lva-CPnd_037-Ex1-1D-lcwgs-2-1.1	15.6%	45%	0.7
Lva-CPnd_037-Ex1-1D-lcwgs-2-1.2	14.9%	45%	0.7
Lva-CPnd_038-Ex1-2D-lcwgs-2-1.1	7.0%	43%	5.2
Lva-CPnd_038-Ex1-2D-lcwgs-2-1.2	6.4%	43%	5.2
Lva-CPnd_039-Ex1-3D-lcwgs-2-1.1	8.2%	43%	4.8
Lva-CPnd_039-Ex1-3D-lcwgs-2-1.2	7.2%	43%	4.8
Lva-CPnd_040-Ex1-4D-lcwgs-2-1.1	8.0%	43%	4.4
Lva-CPnd_040-Ex1-4D-lcwgs-2-1.2	7.2%	43%	4.4
Lva-CPnd_041-Ex1-5D-lcwgs-2-1.1	8.0%	43%	3.6
Lva-CPnd_041-Ex1-5D-lcwgs-2-1.2	7.2%	43%	3.6
Lva-CPnd_042-Ex1-6D-lcwgs-2-1.1	10.9%	43%	5.7
Lva-CPnd_042-Ex1-6D-lcwgs-2-1.2	9.8%	44%	5.7
Lva-CPnd_043-Ex1-7D-lcwgs-2-1.1	7.9%	42%	4.1
Lva-CPnd_043-Ex1-7D-lcwgs-2-1.2	7.1%	42%	4.1
Lva-CPnd_044-Ex1-8D-lcwgs-2-1.1	20.2%	44%	2.2
Lva-CPnd_044-Ex1-8D-lcwgs-2-1.2	18.1%	44%	2.2
Lva-CPnd_045-Ex1-9D-lcwgs-2-1.1	9.5%	43%	6.3
Lva-CPnd_045-Ex1-9D-lcwgs-2-1.2	8.5%	43%	6.3
Lva-CPnd_046-Ex1-10D-lcwgs-2-1.1	12.1%	44%	4.5
Lva-CPnd_046-Ex1-10D-lcwgs-2-1.2	11.1%	44%	4.5
Lva-CPnd_047-Ex1-11D-lcwgs-2-1.1	10.8%	43%	5.4
Lva-CPnd_047-Ex1-11D-lcwgs-2-1.2	9.2%	43%	5.4
Lva-CPnd_048-Ex1-12D-lcwgs-2-1.1	12.5%	43%	3.2
Lva-CPnd_048-Ex1-12D-lcwgs-2-1.2	11.2%	44%	3.2
```
</p>
</details>

## 8. First trim.
`sbatch ../../../pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Lva-APnd_001-Ex1-9D-lcwgs-1-1	0.5%	40.5%	94.6%	78.9%
Lva-APnd_002-Ex1-9E-lcwgs-1-1	0.5%	39.9%	95.7%	87.4%
Lva-APnd_003-Ex1-9F-lcwgs-1-1	0.4%	40.3%	94.8%	83.7%
Lva-APnd_004-Ex1-9G-lcwgs-1-1	0.7%	39.9%	95.7%	87.8%
Lva-APnd_005-Ex1-9H-lcwgs-1-1	0.7%	40.5%	95.2%	82.3%
Lva-APnd_006-Ex1-10A-lcwgs-1-1	0.3%	39.4%	95.6%	84.3%
Lva-APnd_007-Ex1-10B-lcwgs-1-1	0.4%	39.5%	95.4%	84.6%
Lva-APnd_008-Ex1-10C-lcwgs-1-1	0.8%	39.5%	95.6%	86.0%
Lva-APnd_009-Ex1-10D-lcwgs-1-1	0.4%	40.0%	95.4%	80.9%
Lva-APnd_010-Ex1-10E-lcwgs-1-1	0.3%	39.4%	96.1%	87.9%
Lva-APnd_011-Ex1-10F-lcwgs-1-1	0.7%	39.6%	95.1%	84.1%
Lva-APnd_012-Ex1-10G-lcwgs-1-1	0.5%	39.4%	96.0%	88.0%
Lva-APnd_013-Ex1-10H-lcwgs-1-1	0.8%	39.8%	95.8%	83.4%
Lva-APnd_014-Ex1-11A-lcwgs-1-1	0.9%	39.0%	95.6%	84.2%
Lva-APnd_015-Ex1-11B-lcwgs-1-1	2.1%	39.6%	96.0%	83.9%
Lva-APnd_016-Ex1-11C-lcwgs-1-1	0.5%	39.0%	95.7%	86.2%
Lva-APnd_017-Ex1-11D-lcwgs-1-1	0.8%	39.3%	94.8%	79.6%
Lva-APnd_018-Ex1-11E-lcwgs-1-1	0.6%	38.9%	97.4%	87.3%
Lva-APnd_019-Ex1-11F-lcwgs-1-1	0.5%	39.4%	95.8%	83.9%
Lva-APnd_020-Ex1-11G-lcwgs-1-1	0.6%	38.8%	96.3%	86.7%
Lva-APnd_021-Ex1-11H-lcwgs-1-1	0.4%	39.3%	96.1%	81.7%
Lva-APnd_022-Ex1-12A-lcwgs-1-1	0.6%	39.5%	95.9%	84.9%
Lva-APnd_023-Ex1-12B-lcwgs-1-1	2.6%	39.5%	96.4%	84.9%
Lva-APnd_024-Ex1-12C-lcwgs-1-1	0.5%	39.2%	95.2%	87.3%
Lva-APnd_025-Ex1-12D-lcwgs-1-1	0.3%	39.7%	95.7%	81.1%
Lva-APnd_026-Ex1-12E-lcwgs-1-1	0.5%	38.9%	96.4%	87.9%
Lva-APnd_027-Ex1-12F-lcwgs-1-1	0.9%	39.6%	95.0%	85.7%
Lva-APnd_028-Ex1-12G-lcwgs-1-1	0.6%	39.2%	96.1%	88.7%
Lva-APnd_029-Ex1-12H-lcwgs-1-1	0.9%	39.4%	96.1%	83.5%
Lva-APnd_030-Ex1-1A-lcwgs-1-1	0.4%	39.6%	91.4%	53.1%
Lva-APnd_031-Ex1-1B-lcwgs-1-1	3.9%	40.2%	93.5%	45.0%
Lva-APnd_032-Ex1-1C-lcwgs-1-1	0.6%	39.9%	95.4%	61.0%
Lva-APnd_033-Ex1-1D-lcwgs-1-1	0.6%	40.2%	92.8%	45.7%
Lva-APnd_034-Ex1-1E-lcwgs-1-1	0.2%	39.9%	93.9%	57.6%
Lva-APnd_035-Ex1-1F-lcwgs-1-1	3.0%	40.2%	90.5%	55.8%
Lva-APnd_036-Ex1-1G-lcwgs-1-1	1.0%	39.3%	95.4%	57.2%
Lva-APnd_037-Ex1-1H-lcwgs-1-1	1.4%	40.0%	92.9%	49.4%
Lva-APnd_038-Ex1-2A-lcwgs-1-1	0.8%	39.9%	93.3%	43.6%
Lva-APnd_039-Ex1-2B-lcwgs-1-1	5.1%	40.4%	95.1%	31.5%
Lva-APnd_040-Ex1-2C-lcwgs-1-1	1.1%	39.7%	94.9%	51.6%
Lva-APnd_041-Ex1-2D-lcwgs-1-1	0.6%	40.1%	91.6%	37.1%
Lva-APnd_042-Ex1-2E-lcwgs-1-1	1.1%	39.0%	94.7%	48.2%
Lva-APnd_043-Ex1-2F-lcwgs-1-1	0.2%	39.2%	89.3%	43.8%
Lva-APnd_044-Ex1-2G-lcwgs-1-1	0.8%	38.9%	92.3%	50.1%
Lva-APnd_045-Ex1-2H-lcwgs-1-1	1.4%	40.5%	94.1%	43.1%
Lva-APnd_046-Ex1-3A-lcwgs-1-1	0.7%	39.4%	94.3%	47.6%
Lva-APnd_047-Ex1-3B-lcwgs-1-1	1.1%	39.3%	92.4%	46.3%
Lva-CPnd_001-Ex1-1A-lcwgs-2-1	9.9%	42.1%	96.1%	68.1%
Lva-CPnd_002-Ex1-2A-lcwgs-2-1	10.3%	43.3%	93.2%	64.2%
Lva-CPnd_003-Ex1-3A-lcwgs-2-1	11.3%	42.8%	95.7%	43.4%
Lva-CPnd_004-Ex1-4A-lcwgs-2-1	9.8%	44.2%	95.8%	57.2%
Lva-CPnd_005-Ex1-5A-lcwgs-2-1	10.3%	42.4%	95.7%	38.4%
Lva-CPnd_006-Ex1-6A-lcwgs-2-1	12.8%	60.3%	95.0%	43.7%
Lva-CPnd_007-Ex1-7A-lcwgs-2-1	11.6%	43.3%	96.0%	32.6%
Lva-CPnd_008-Ex1-8A-lcwgs-2-1	11.8%	43.8%	92.3%	32.6%
Lva-CPnd_009-Ex1-9A-lcwgs-2-1	10.4%	42.9%	93.9%	31.9%
Lva-CPnd_010-Ex1-10A-lcwgs-2-1	9.6%	43.3%	93.6%	37.4%
Lva-CPnd_011-Ex1-11A-lcwgs-2-1	10.1%	42.4%	95.2%	42.6%
Lva-CPnd_012-Ex1-12A-lcwgs-2-1	10.6%	43.2%	89.9%	50.6%
Lva-CPnd_013-Ex1-1B-lcwgs-2-1	10.3%	42.7%	94.9%	52.5%
Lva-CPnd_014-Ex1-2B-lcwgs-2-1	10.0%	42.4%	95.9%	52.6%
Lva-CPnd_015-Ex1-3B-lcwgs-2-1	10.6%	41.9%	96.6%	49.9%
Lva-CPnd_016-Ex1-4B-lcwgs-2-1	9.9%	42.1%	96.6%	56.2%
Lva-CPnd_017-Ex1-5B-lcwgs-2-1	10.4%	42.8%	95.0%	46.5%
Lva-CPnd_018-Ex1-6B-lcwgs-2-1	9.6%	43.0%	94.4%	43.7%
Lva-CPnd_019-Ex1-7B-lcwgs-2-1	10.1%	43.1%	95.5%	49.4%
Lva-CPnd_020-Ex1-8B-lcwgs-2-1	10.5%	42.8%	93.1%	36.1%
Lva-CPnd_021-Ex1-9B-lcwgs-2-1	10.0%	43.5%	93.5%	36.9%
Lva-CPnd_022-Ex1-10B-lcwgs-2-1	9.5%	42.6%	96.2%	44.7%
Lva-CPnd_023-Ex1-11B-lcwgs-2-1	10.1%	43.1%	94.3%	35.6%
Lva-CPnd_024-Ex1-12B-lcwgs-2-1	10.7%	42.0%	96.4%	51.3%
Lva-CPnd_025-Ex1-1C-lcwgs-2-1	9.9%	42.7%	96.1%	52.7%
Lva-CPnd_026-Ex1-2C-lcwgs-2-1	9.9%	43.0%	95.0%	52.2%
Lva-CPnd_027-Ex1-3C-lcwgs-2-1	10.4%	42.4%	94.8%	37.1%
Lva-CPnd_028-Ex1-4C-lcwgs-2-1	9.6%	42.2%	96.2%	54.4%
Lva-CPnd_029-Ex1-5C-lcwgs-2-1	9.9%	42.2%	96.7%	41.6%
Lva-CPnd_030-Ex1-6C-lcwgs-2-1	10.7%	42.6%	92.4%	33.9%
Lva-CPnd_031-Ex1-7C-lcwgs-2-1	9.9%	42.6%	97.0%	57.4%
Lva-CPnd_032-Ex1-8C-lcwgs-2-1	11.4%	42.8%	93.6%	22.8%
Lva-CPnd_033-Ex1-9C-lcwgs-2-1	10.1%	42.2%	94.5%	31.5%
Lva-CPnd_034-Ex1-10C-lcwgs-2-1	9.5%	42.8%	95.7%	41.9%
Lva-CPnd_035-Ex1-11C-lcwgs-2-1	10.8%	42.7%	93.6%	24.3%
Lva-CPnd_036-Ex1-12C-lcwgs-2-1	11.1%	42.4%	87.6%	24.8%
Lva-CPnd_037-Ex1-1D-lcwgs-2-1	9.5%	44.3%	88.5%	63.8%
Lva-CPnd_038-Ex1-2D-lcwgs-2-1	9.9%	41.5%	97.7%	58.4%
Lva-CPnd_039-Ex1-3D-lcwgs-2-1	10.5%	42.4%	96.1%	40.4%
Lva-CPnd_040-Ex1-4D-lcwgs-2-1	9.6%	42.4%	95.9%	44.2%
Lva-CPnd_041-Ex1-5D-lcwgs-2-1	10.0%	42.0%	96.2%	44.5%
Lva-CPnd_042-Ex1-6D-lcwgs-2-1	9.8%	42.9%	93.9%	42.0%
Lva-CPnd_043-Ex1-7D-lcwgs-2-1	10.2%	41.6%	96.4%	43.1%
Lva-CPnd_044-Ex1-8D-lcwgs-2-1	10.3%	43.2%	83.7%	31.8%
Lva-CPnd_045-Ex1-9D-lcwgs-2-1	10.9%	42.2%	95.6%	40.4%
Lva-CPnd_046-Ex1-10D-lcwgs-2-1	9.4%	43.1%	94.7%	51.0%
Lva-CPnd_047-Ex1-11D-lcwgs-2-1	11.5%	42.9%	94.3%	28.9%
Lva-CPnd_048-Ex1-12D-lcwgs-2-1	10.9%	43.1%	94.4%	39.7%
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
