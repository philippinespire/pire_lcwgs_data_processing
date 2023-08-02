## 1. Download data
Data downloaded from TAMUCC grid.

## 2. Proofread the decode files
Decode file has "\_" between Individual ID and Extraction# instead of a "-", and no header.

There are 92 forward and reverse reads, and all reads are unique.

## 3. Edit the decode file
Made a copy of the decode file, added "\_original_depracated" to the old one, and edited the new one. New one now has a header, and has "-" instead of "_" between the individual ID and the extraction #.

## 4. Make a copy of the fq_raw files
`screen cp ./* /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/2nd_sequencing_run/fq_raw/`

## 5. Perform a renaming dry run.
`bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Sne_LCWGS-testlane_SequenceNameDecode.tsv`

<details><summary>Expand for output.</summary>

```bash
Parallel module is no longer necessary, please feel free to
not load it, parallel
command will still be available to you.

decode file read into memory
rename not specified, original and new file names will be printed to screen
bash renameFQGZ.bash Sne_LCWGS-testlane_SequenceNameDecode.tsv

if you want to rename then bash renameFQGZ.bash Sne_LCWGS-testlane_SequenceNameDecode.tsv rename

writing original file names to file, origFileNames.txt...
writing newFileNames.txt...
editing newFileNames.txt...
preview of orig and new R1 file names...
SnA0500109A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_001-Ex1-9A-lcwgs-1-1.1.fq.gz
SnA0500209B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_002-Ex1-9B-lcwgs-1-1.1.fq.gz
SnA0500309C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_003-Ex1-9C-lcwgs-1-1.1.fq.gz
SnA0500409D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_004-Ex1-9D-lcwgs-1-1.1.fq.gz
SnA0500509E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_005-Ex1-9E-lcwgs-1-1.1.fq.gz
SnA0500609F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_006-Ex1-9F-lcwgs-1-1.1.fq.gz
SnA0500709G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_007-Ex1-9G-lcwgs-1-1.1.fq.gz
SnA0500809H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_008-Ex1-9H-lcwgs-1-1.1.fq.gz
SnA0500910A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_009-Ex1-10A-lcwgs-1-1.1.fq.gz
SnA0501010B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_010-Ex1-10B-lcwgs-1-1.1.fq.gz
SnA0501110C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_011-Ex1-10C-lcwgs-1-1.1.fq.gz
SnA0501210D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_012-Ex1-10D-lcwgs-1-1.1.fq.gz
SnA0501310E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_013-Ex1-10E-lcwgs-1-1.1.fq.gz
SnA0501410F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_014-Ex1-10F-lcwgs-1-1.1.fq.gz
SnA0501510G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_015-Ex1-10G-lcwgs-1-1.1.fq.gz
SnA0501610H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_016-Ex1-10H-lcwgs-1-1.1.fq.gz
SnA0501711A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_017-Ex1-11A-lcwgs-1-1.1.fq.gz
SnA0501811B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_018-Ex1-11B-lcwgs-1-1.1.fq.gz
SnA0501911C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_019-Ex1-11C-lcwgs-1-1.1.fq.gz
SnA0502011D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_020-Ex1-11D-lcwgs-1-1.1.fq.gz
SnA0502111E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_021-Ex1-11E-lcwgs-1-1.1.fq.gz
SnA0502211F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_022-Ex1-11F-lcwgs-1-1.1.fq.gz
SnA0502311G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_023-Ex1-11G-lcwgs-1-1.1.fq.gz
SnA0502411H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_024-Ex1-11H-lcwgs-1-1.1.fq.gz
SnA0502512A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_025-Ex1-12A-lcwgs-1-1.1.fq.gz
SnA0502612B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_026-Ex1-12B-lcwgs-1-1.1.fq.gz
SnA0502712C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_027-Ex1-12C-lcwgs-1-1.1.fq.gz
SnA0502812D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_028-Ex1-12D-lcwgs-1-1.1.fq.gz
SnC0301601A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_016-Ex1-1A-lcwgs-1-1.1.fq.gz
SnC0301701B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_017-Ex1-1B-lcwgs-1-1.1.fq.gz
SnC0301801C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_018-Ex1-1C-lcwgs-1-1.1.fq.gz
SnC0301901D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_019-Ex1-1D-lcwgs-1-1.1.fq.gz
SnC0302001E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_020-Ex1-1E-lcwgs-1-1.1.fq.gz
SnC0302101F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_021-Ex1-1F-lcwgs-1-1.1.fq.gz
SnC0302201G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_022-Ex1-1G-lcwgs-1-1.1.fq.gz
SnC0302301H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_023-Ex1-1H-lcwgs-1-1.1.fq.gz
SnC0302402A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_024-Ex1-2A-lcwgs-1-1.1.fq.gz
SnC0302502B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_025-Ex1-2B-lcwgs-1-1.1.fq.gz
SnC0302602C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_026-Ex1-2C-lcwgs-1-1.1.fq.gz
SnC0302702D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_027-Ex1-2D-lcwgs-1-1.1.fq.gz
SnC0302802E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_028-Ex1-2E-lcwgs-1-1.1.fq.gz
SnC0302902F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_029-Ex1-2F-lcwgs-1-1.1.fq.gz
SnC0303002G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_030-Ex1-2G-lcwgs-1-1.1.fq.gz
SnC0303102H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_031-Ex1-2H-lcwgs-1-1.1.fq.gz
SnC0303203A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_032-Ex1-3A-lcwgs-1-1.1.fq.gz
SnC0303303B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_033-Ex1-3B-lcwgs-1-1.1.fq.gz
SnC0303403C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_034-Ex1-3C-lcwgs-1-1.1.fq.gz
SnC0303503D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_035-Ex1-3D-lcwgs-1-1.1.fq.gz
SnC0303603E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_036-Ex1-3E-lcwgs-1-1.1.fq.gz
SnC0303703F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_037-Ex1-3F-lcwgs-1-1.1.fq.gz
SnC0303803G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_038-Ex1-3G-lcwgs-1-1.1.fq.gz
SnC0303903H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_039-Ex1-3H-lcwgs-1-1.1.fq.gz
SnC0304004A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_040-Ex1-4A-lcwgs-1-1.1.fq.gz
SnC0304104B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_041-Ex1-4B-lcwgs-1-1.1.fq.gz
SnC0304204C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_042-Ex1-4C-lcwgs-1-1.1.fq.gz
SnC0304304D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_043-Ex1-4D-lcwgs-1-1.1.fq.gz
SnC0304404E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_044-Ex1-4E-lcwgs-1-1.1.fq.gz
SnC0304504F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_045-Ex1-4F-lcwgs-1-1.1.fq.gz
SnC0304604G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_046-Ex1-4G-lcwgs-1-1.1.fq.gz
SnC0304704H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_047-Ex1-4H-lcwgs-1-1.1.fq.gz
SnC0304805A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_048-Ex1-5A-lcwgs-1-1.1.fq.gz
SnC0304905B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_049-Ex1-5B-lcwgs-1-1.1.fq.gz
SnC0305005C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_050-Ex1-5C-lcwgs-1-1.1.fq.gz
SnC0305105D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_051-Ex1-5D-lcwgs-1-1.1.fq.gz
SnC0305205E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_052-Ex1-5E-lcwgs-1-1.1.fq.gz
SnC0305305F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_053-Ex1-5F-lcwgs-1-1.1.fq.gz
SnC0305405G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_054-Ex1-5G-lcwgs-1-1.1.fq.gz
SnC0305505H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_055-Ex1-5H-lcwgs-1-1.1.fq.gz
SnC0305606A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_056-Ex1-6A-lcwgs-1-1.1.fq.gz
SnC0305706B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_057-Ex1-6B-lcwgs-1-1.1.fq.gz
SnC0305806C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_058-Ex1-6C-lcwgs-1-1.1.fq.gz
SnC0305906D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_059-Ex1-6D-lcwgs-1-1.1.fq.gz
SnC0306006E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_060-Ex1-6E-lcwgs-1-1.1.fq.gz
SnC0306106F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_061-Ex1-6F-lcwgs-1-1.1.fq.gz
SnC0306206G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_062-Ex1-6G-lcwgs-1-1.1.fq.gz
SnC0306306H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_063-Ex1-6H-lcwgs-1-1.1.fq.gz
SnC0306407A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_064-Ex1-7A-lcwgs-1-1.1.fq.gz
SnC0306507B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_065-Ex1-7B-lcwgs-1-1.1.fq.gz
SnC0306607C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_066-Ex1-7C-lcwgs-1-1.1.fq.gz
SnC0306707D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_067-Ex1-7D-lcwgs-1-1.1.fq.gz
SnC0306807E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_068-Ex1-7E-lcwgs-1-1.1.fq.gz
SnC0306907F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_069-Ex1-7F-lcwgs-1-1.1.fq.gz
SnC0307007G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_070-Ex1-7G-lcwgs-1-1.1.fq.gz
SnC0307107H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_071-Ex1-7H-lcwgs-1-1.1.fq.gz
SnC0307208A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_072-Ex1-8A-lcwgs-1-1.1.fq.gz
SnC0307308B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_073-Ex1-8B-lcwgs-1-1.1.fq.gz
SnC0307408C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_074-Ex1-8C-lcwgs-1-1.1.fq.gz
SnC0307508D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_075-Ex1-8D-lcwgs-1-1.1.fq.gz
SnC0307608E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_076-Ex1-8E-lcwgs-1-1.1.fq.gz
SnC0307708F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_077-Ex1-8F-lcwgs-1-1.1.fq.gz
SnC0307808G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_078-Ex1-8G-lcwgs-1-1.1.fq.gz
SnC0307908H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_079-Ex1-8H-lcwgs-1-1.1.fq.gz
preview of orig and new R2 file names...
SnA0500109A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_001-Ex1-9A-lcwgs-1-1.2.fq.gz
SnA0500209B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_002-Ex1-9B-lcwgs-1-1.2.fq.gz
SnA0500309C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_003-Ex1-9C-lcwgs-1-1.2.fq.gz
SnA0500409D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_004-Ex1-9D-lcwgs-1-1.2.fq.gz
SnA0500509E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_005-Ex1-9E-lcwgs-1-1.2.fq.gz
SnA0500609F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_006-Ex1-9F-lcwgs-1-1.2.fq.gz
SnA0500709G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_007-Ex1-9G-lcwgs-1-1.2.fq.gz
SnA0500809H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_008-Ex1-9H-lcwgs-1-1.2.fq.gz
SnA0500910A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_009-Ex1-10A-lcwgs-1-1.2.fq.gz
SnA0501010B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_010-Ex1-10B-lcwgs-1-1.2.fq.gz
SnA0501110C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_011-Ex1-10C-lcwgs-1-1.2.fq.gz
SnA0501210D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_012-Ex1-10D-lcwgs-1-1.2.fq.gz
SnA0501310E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_013-Ex1-10E-lcwgs-1-1.2.fq.gz
SnA0501410F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_014-Ex1-10F-lcwgs-1-1.2.fq.gz
SnA0501510G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_015-Ex1-10G-lcwgs-1-1.2.fq.gz
SnA0501610H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_016-Ex1-10H-lcwgs-1-1.2.fq.gz
SnA0501711A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_017-Ex1-11A-lcwgs-1-1.2.fq.gz
SnA0501811B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_018-Ex1-11B-lcwgs-1-1.2.fq.gz
SnA0501911C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_019-Ex1-11C-lcwgs-1-1.2.fq.gz
SnA0502011D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_020-Ex1-11D-lcwgs-1-1.2.fq.gz
SnA0502111E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_021-Ex1-11E-lcwgs-1-1.2.fq.gz
SnA0502211F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_022-Ex1-11F-lcwgs-1-1.2.fq.gz
SnA0502311G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_023-Ex1-11G-lcwgs-1-1.2.fq.gz
SnA0502411H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_024-Ex1-11H-lcwgs-1-1.2.fq.gz
SnA0502512A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_025-Ex1-12A-lcwgs-1-1.2.fq.gz
SnA0502612B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_026-Ex1-12B-lcwgs-1-1.2.fq.gz
SnA0502712C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_027-Ex1-12C-lcwgs-1-1.2.fq.gz
SnA0502812D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_028-Ex1-12D-lcwgs-1-1.2.fq.gz
SnC0301601A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_016-Ex1-1A-lcwgs-1-1.2.fq.gz
SnC0301701B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_017-Ex1-1B-lcwgs-1-1.2.fq.gz
SnC0301801C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_018-Ex1-1C-lcwgs-1-1.2.fq.gz
SnC0301901D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_019-Ex1-1D-lcwgs-1-1.2.fq.gz
SnC0302001E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_020-Ex1-1E-lcwgs-1-1.2.fq.gz
SnC0302101F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_021-Ex1-1F-lcwgs-1-1.2.fq.gz
SnC0302201G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_022-Ex1-1G-lcwgs-1-1.2.fq.gz
SnC0302301H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_023-Ex1-1H-lcwgs-1-1.2.fq.gz
SnC0302402A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_024-Ex1-2A-lcwgs-1-1.2.fq.gz
SnC0302502B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_025-Ex1-2B-lcwgs-1-1.2.fq.gz
SnC0302602C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_026-Ex1-2C-lcwgs-1-1.2.fq.gz
SnC0302702D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_027-Ex1-2D-lcwgs-1-1.2.fq.gz
SnC0302802E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_028-Ex1-2E-lcwgs-1-1.2.fq.gz
SnC0302902F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_029-Ex1-2F-lcwgs-1-1.2.fq.gz
SnC0303002G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_030-Ex1-2G-lcwgs-1-1.2.fq.gz
SnC0303102H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_031-Ex1-2H-lcwgs-1-1.2.fq.gz
SnC0303203A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_032-Ex1-3A-lcwgs-1-1.2.fq.gz
SnC0303303B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_033-Ex1-3B-lcwgs-1-1.2.fq.gz
SnC0303403C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_034-Ex1-3C-lcwgs-1-1.2.fq.gz
SnC0303503D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_035-Ex1-3D-lcwgs-1-1.2.fq.gz
SnC0303603E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_036-Ex1-3E-lcwgs-1-1.2.fq.gz
SnC0303703F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_037-Ex1-3F-lcwgs-1-1.2.fq.gz
SnC0303803G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_038-Ex1-3G-lcwgs-1-1.2.fq.gz
SnC0303903H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_039-Ex1-3H-lcwgs-1-1.2.fq.gz
SnC0304004A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_040-Ex1-4A-lcwgs-1-1.2.fq.gz
SnC0304104B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_041-Ex1-4B-lcwgs-1-1.2.fq.gz
SnC0304204C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_042-Ex1-4C-lcwgs-1-1.2.fq.gz
SnC0304304D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_043-Ex1-4D-lcwgs-1-1.2.fq.gz
SnC0304404E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_044-Ex1-4E-lcwgs-1-1.2.fq.gz
SnC0304504F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_045-Ex1-4F-lcwgs-1-1.2.fq.gz
SnC0304604G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_046-Ex1-4G-lcwgs-1-1.2.fq.gz
SnC0304704H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_047-Ex1-4H-lcwgs-1-1.2.fq.gz
SnC0304805A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_048-Ex1-5A-lcwgs-1-1.2.fq.gz
SnC0304905B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_049-Ex1-5B-lcwgs-1-1.2.fq.gz
SnC0305005C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_050-Ex1-5C-lcwgs-1-1.2.fq.gz
SnC0305105D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_051-Ex1-5D-lcwgs-1-1.2.fq.gz
SnC0305205E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_052-Ex1-5E-lcwgs-1-1.2.fq.gz
SnC0305305F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_053-Ex1-5F-lcwgs-1-1.2.fq.gz
SnC0305405G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_054-Ex1-5G-lcwgs-1-1.2.fq.gz
SnC0305505H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_055-Ex1-5H-lcwgs-1-1.2.fq.gz
SnC0305606A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_056-Ex1-6A-lcwgs-1-1.2.fq.gz
SnC0305706B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_057-Ex1-6B-lcwgs-1-1.2.fq.gz
SnC0305806C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_058-Ex1-6C-lcwgs-1-1.2.fq.gz
SnC0305906D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_059-Ex1-6D-lcwgs-1-1.2.fq.gz
SnC0306006E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_060-Ex1-6E-lcwgs-1-1.2.fq.gz
SnC0306106F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_061-Ex1-6F-lcwgs-1-1.2.fq.gz
SnC0306206G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_062-Ex1-6G-lcwgs-1-1.2.fq.gz
SnC0306306H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_063-Ex1-6H-lcwgs-1-1.2.fq.gz
SnC0306407A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_064-Ex1-7A-lcwgs-1-1.2.fq.gz
SnC0306507B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_065-Ex1-7B-lcwgs-1-1.2.fq.gz
SnC0306607C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_066-Ex1-7C-lcwgs-1-1.2.fq.gz
SnC0306707D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_067-Ex1-7D-lcwgs-1-1.2.fq.gz
SnC0306807E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_068-Ex1-7E-lcwgs-1-1.2.fq.gz
SnC0306907F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_069-Ex1-7F-lcwgs-1-1.2.fq.gz
SnC0307007G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_070-Ex1-7G-lcwgs-1-1.2.fq.gz
SnC0307107H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_071-Ex1-7H-lcwgs-1-1.2.fq.gz
SnC0307208A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_072-Ex1-8A-lcwgs-1-1.2.fq.gz
SnC0307308B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_073-Ex1-8B-lcwgs-1-1.2.fq.gz
SnC0307408C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_074-Ex1-8C-lcwgs-1-1.2.fq.gz
SnC0307508D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_075-Ex1-8D-lcwgs-1-1.2.fq.gz
SnC0307608E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_076-Ex1-8E-lcwgs-1-1.2.fq.gz
SnC0307708F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_077-Ex1-8F-lcwgs-1-1.2.fq.gz
SnC0307808G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_078-Ex1-8G-lcwgs-1-1.2.fq.gz
SnC0307908H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_079-Ex1-8H-lcwgs-1-1.2.fq.gz
```
</p>
</details>

## 6. Rename the files for real
`bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Sne_LCWGS-testlane_SequenceNameDecode.tsv rename`

## 7. Check the quality of your data.
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report"  "fq.gz"`

<details><summary>Expand for MultiQC Output.</summary>

```bash

```
</p>
</details>

## 8. First trim.
`sbatch ../../../pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Sne-ABir_001-Ex1-9A-lcwgs-1-1	21.6%	44.9%	98.5%	53.4%
Sne-ABir_002-Ex1-9B-lcwgs-1-1	17.3%	49.4%	97.3%	80.8%
Sne-ABir_003-Ex1-9C-lcwgs-1-1	28.9%	53.1%	96.8%	29.2%
Sne-ABir_004-Ex1-9D-lcwgs-1-1	17.4%	47.9%	86.7%	30.4%
Sne-ABir_005-Ex1-9E-lcwgs-1-1	27.0%	53.8%	90.0%	48.3%
Sne-ABir_006-Ex1-9F-lcwgs-1-1	18.6%	54.3%	95.8%	15.7%
Sne-ABir_007-Ex1-9G-lcwgs-1-1	20.9%	53.7%	97.1%	31.2%
Sne-ABir_008-Ex1-9H-lcwgs-1-1	21.6%	55.3%	47.0%	63.4%
Sne-ABir_009-Ex1-10A-lcwgs-1-1	22.2%	53.9%	96.9%	30.5%
Sne-ABir_010-Ex1-10B-lcwgs-1-1	19.5%	54.5%	95.5%	27.7%
Sne-ABir_011-Ex1-10C-lcwgs-1-1	13.7%	34.6%	94.0%	81.3%
Sne-ABir_012-Ex1-10D-lcwgs-1-1	12.7%	36.1%	44.5%	86.5%
Sne-ABir_013-Ex1-10E-lcwgs-1-1	13.1%	34.3%	94.5%	81.9%
Sne-ABir_014-Ex1-10F-lcwgs-1-1	14.7%	33.8%	95.6%	74.5%
Sne-ABir_015-Ex1-10G-lcwgs-1-1	13.4%	34.3%	94.5%	82.7%
Sne-ABir_016-Ex1-10H-lcwgs-1-1	14.2%	32.5%	95.2%	69.1%
Sne-ABir_017-Ex1-11A-lcwgs-1-1	16.7%	33.8%	96.5%	77.6%
Sne-ABir_018-Ex1-11B-lcwgs-1-1	18.1%	33.1%	97.4%	75.5%
Sne-ABir_019-Ex1-11C-lcwgs-1-1	15.5%	34.4%	95.3%	79.7%
Sne-ABir_020-Ex1-11D-lcwgs-1-1	13.0%	33.9%	97.4%	93.7%
Sne-ABir_021-Ex1-11E-lcwgs-1-1	15.2%	33.6%	89.4%	81.1%
Sne-ABir_022-Ex1-11F-lcwgs-1-1	15.6%	33.7%	93.8%	76.5%
Sne-ABir_023-Ex1-11G-lcwgs-1-1	14.8%	33.3%	91.6%	78.8%
Sne-ABir_024-Ex1-11H-lcwgs-1-1	14.9%	34.1%	95.8%	76.6%
Sne-ABir_025-Ex1-12A-lcwgs-1-1	17.3%	34.4%	94.0%	80.7%
Sne-ABir_026-Ex1-12B-lcwgs-1-1	16.7%	33.7%	95.9%	81.6%
Sne-ABir_027-Ex1-12C-lcwgs-1-1	18.5%	35.8%	94.2%	73.0%
Sne-ABir_028-Ex1-12D-lcwgs-1-1	22.0%	40.7%	62.7%	70.1%
Sne-CCab_016-Ex1-1A-lcwgs-1-1	16.7%	38.9%	96.7%	25.6%
Sne-CCab_017-Ex1-1B-lcwgs-1-1	16.5%	39.6%	95.9%	25.6%
Sne-CCab_018-Ex1-1C-lcwgs-1-1	16.1%	39.6%	96.0%	30.7%
Sne-CCab_019-Ex1-1D-lcwgs-1-1	18.1%	39.8%	96.1%	11.3%
Sne-CCab_020-Ex1-1E-lcwgs-1-1	18.0%	39.4%	96.1%	17.3%
Sne-CCab_021-Ex1-1F-lcwgs-1-1	21.4%	38.1%	97.0%	7.7%
Sne-CCab_022-Ex1-1G-lcwgs-1-1	18.7%	39.1%	97.1%	14.3%
Sne-CCab_023-Ex1-1H-lcwgs-1-1	18.2%	38.8%	97.3%	16.6%
Sne-CCab_024-Ex1-2A-lcwgs-1-1	15.4%	38.8%	97.3%	25.3%
Sne-CCab_025-Ex1-2B-lcwgs-1-1	15.9%	39.0%	96.9%	21.3%
Sne-CCab_026-Ex1-2C-lcwgs-1-1	17.0%	38.6%	97.0%	12.1%
Sne-CCab_027-Ex1-2D-lcwgs-1-1	15.7%	38.8%	96.6%	17.7%
Sne-CCab_028-Ex1-2E-lcwgs-1-1	17.1%	38.6%	96.0%	14.5%
Sne-CCab_029-Ex1-2F-lcwgs-1-1	17.2%	39.0%	96.6%	17.3%
Sne-CCab_030-Ex1-2G-lcwgs-1-1	16.8%	38.9%	96.5%	14.7%
Sne-CCab_031-Ex1-2H-lcwgs-1-1	15.2%	39.2%	96.3%	29.2%
Sne-CCab_032-Ex1-3A-lcwgs-1-1	16.9%	38.4%	96.4%	21.7%
Sne-CCab_033-Ex1-3B-lcwgs-1-1	17.1%	38.6%	96.3%	21.3%
Sne-CCab_034-Ex1-3C-lcwgs-1-1	18.5%	38.0%	97.4%	14.8%
Sne-CCab_035-Ex1-3D-lcwgs-1-1	17.9%	38.6%	96.7%	12.3%
Sne-CCab_036-Ex1-3E-lcwgs-1-1	18.3%	39.1%	96.3%	12.7%
Sne-CCab_037-Ex1-3F-lcwgs-1-1	17.9%	39.0%	96.4%	21.0%
Sne-CCab_038-Ex1-3G-lcwgs-1-1	18.3%	38.9%	97.1%	13.1%
Sne-CCab_039-Ex1-3H-lcwgs-1-1	17.7%	38.7%	97.1%	16.6%
Sne-CCab_040-Ex1-4A-lcwgs-1-1	15.5%	38.5%	97.2%	25.6%
Sne-CCab_041-Ex1-4B-lcwgs-1-1	15.6%	38.8%	97.0%	23.0%
Sne-CCab_042-Ex1-4C-lcwgs-1-1	15.6%	38.7%	97.2%	19.3%
Sne-CCab_043-Ex1-4D-lcwgs-1-1	16.6%	39.3%	96.6%	12.2%
Sne-CCab_044-Ex1-4E-lcwgs-1-1	16.1%	39.2%	94.7%	23.2%
Sne-CCab_045-Ex1-4F-lcwgs-1-1	17.1%	38.8%	96.4%	17.6%
Sne-CCab_046-Ex1-4G-lcwgs-1-1	14.6%	39.1%	96.7%	37.0%
Sne-CCab_047-Ex1-4H-lcwgs-1-1	16.1%	39.7%	96.6%	17.3%
Sne-CCab_048-Ex1-5A-lcwgs-1-1	16.3%	39.1%	96.9%	20.6%
Sne-CCab_049-Ex1-5B-lcwgs-1-1	15.3%	39.3%	96.9%	28.6%
Sne-CCab_050-Ex1-5C-lcwgs-1-1	16.6%	39.2%	97.0%	15.0%
Sne-CCab_051-Ex1-5D-lcwgs-1-1	15.2%	39.2%	95.0%	27.7%
Sne-CCab_052-Ex1-5E-lcwgs-1-1	16.5%	39.4%	96.2%	19.9%
Sne-CCab_053-Ex1-5F-lcwgs-1-1	16.7%	39.2%	96.4%	25.0%
Sne-CCab_054-Ex1-5G-lcwgs-1-1	16.4%	39.1%	94.2%	23.7%
Sne-CCab_055-Ex1-5H-lcwgs-1-1	15.5%	39.2%	93.8%	31.4%
Sne-CCab_056-Ex1-6A-lcwgs-1-1	15.5%	38.9%	96.9%	26.5%
Sne-CCab_057-Ex1-6B-lcwgs-1-1	15.7%	39.2%	96.6%	22.1%
Sne-CCab_058-Ex1-6C-lcwgs-1-1	16.1%	38.7%	97.3%	18.6%
Sne-CCab_059-Ex1-6D-lcwgs-1-1	15.6%	39.3%	96.6%	16.3%
Sne-CCab_060-Ex1-6E-lcwgs-1-1	17.2%	38.8%	97.0%	11.1%
Sne-CCab_061-Ex1-6F-lcwgs-1-1	17.1%	38.8%	96.5%	15.6%
Sne-CCab_062-Ex1-6G-lcwgs-1-1	15.1%	39.1%	95.8%	27.4%
Sne-CCab_063-Ex1-6H-lcwgs-1-1	15.6%	39.5%	97.0%	25.4%
Sne-CCab_064-Ex1-7A-lcwgs-1-1	15.9%	38.4%	97.0%	22.1%
Sne-CCab_065-Ex1-7B-lcwgs-1-1	14.8%	38.9%	94.9%	33.6%
Sne-CCab_066-Ex1-7C-lcwgs-1-1	16.6%	39.0%	96.2%	14.5%
Sne-CCab_067-Ex1-7D-lcwgs-1-1	16.4%	39.3%	96.5%	14.3%
Sne-CCab_068-Ex1-7E-lcwgs-1-1	17.0%	39.0%	95.2%	15.2%
Sne-CCab_069-Ex1-7F-lcwgs-1-1	17.4%	38.6%	96.6%	16.4%
Sne-CCab_070-Ex1-7G-lcwgs-1-1	16.8%	38.2%	97.0%	13.7%
Sne-CCab_071-Ex1-7H-lcwgs-1-1	15.0%	38.9%	97.1%	30.1%
Sne-CCab_072-Ex1-8A-lcwgs-1-1	14.2%	39.5%	94.2%	37.0%
Sne-CCab_073-Ex1-8B-lcwgs-1-1	14.4%	39.6%	95.2%	35.9%
Sne-CCab_074-Ex1-8C-lcwgs-1-1	0.9%	39.2%	93.4%	24.2%
Sne-CCab_075-Ex1-8D-lcwgs-1-1	15.1%	39.5%	94.7%	24.6%
Sne-CCab_076-Ex1-8E-lcwgs-1-1	16.9%	39.2%	96.8%	11.7%
Sne-CCab_077-Ex1-8F-lcwgs-1-1	17.7%	38.0%	96.5%	12.8%
Sne-CCab_078-Ex1-8G-lcwgs-1-1	16.8%	38.6%	93.2%	16.6%
Sne-CCab_079-Ex1-8H-lcwgs-1-1	16.3%	38.7%	94.3%	19.3%
```
</p>
</details>

## 9. Remove duplicates with clumpify.
### 9a. Remove duplicates.
`bash ../../../pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/hpc-0351 20`

### 9b. Check duplicate removal success.
```bash
[hpc-0351@d1-w6420a-11 2nd_sequencing_run]$ enable_lmod
[hpc-0351@d1-w6420a-11 2nd_sequencing_run]$ module load container_env R/4.2
[hpc-0351@d1-w6420a-11 2nd_sequencing_run]$ crun R < /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkClumpify_EG.R --no-save
```

"Clumpify Successfully worked on all samples"

### 9c. Generate metadata on deduplicated FASTQ files.
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report"  "fq.gz"`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	Length	M Seqs
Sne-ABir_001-Ex1-9A-lcwgs-1-1.clmp.r1	8.2%	44%	135 bp	1.3
Sne-ABir_001-Ex1-9A-lcwgs-1-1.clmp.r2	8.5%	44%	135 bp	1.3
Sne-ABir_002-Ex1-9B-lcwgs-1-1.clmp.r1	2.2%	49%	114 bp	0.0
Sne-ABir_002-Ex1-9B-lcwgs-1-1.clmp.r2	1.4%	49%	114 bp	0.0
Sne-ABir_003-Ex1-9C-lcwgs-1-1.clmp.r1	5.5%	53%	139 bp	0.7
Sne-ABir_003-Ex1-9C-lcwgs-1-1.clmp.r2	4.3%	53%	139 bp	0.7
Sne-ABir_004-Ex1-9D-lcwgs-1-1.clmp.r1	11.3%	47%	143 bp	0.2
Sne-ABir_004-Ex1-9D-lcwgs-1-1.clmp.r2	10.7%	47%	143 bp	0.2
Sne-ABir_005-Ex1-9E-lcwgs-1-1.clmp.r1	5.5%	53%	131 bp	0.1
Sne-ABir_005-Ex1-9E-lcwgs-1-1.clmp.r2	3.6%	53%	131 bp	0.1
Sne-ABir_006-Ex1-9F-lcwgs-1-1.clmp.r1	4.7%	53%	144 bp	0.0
Sne-ABir_006-Ex1-9F-lcwgs-1-1.clmp.r2	3.0%	54%	144 bp	0.0
Sne-ABir_007-Ex1-9G-lcwgs-1-1.clmp.r1	6.0%	53%	138 bp	0.2
Sne-ABir_007-Ex1-9G-lcwgs-1-1.clmp.r2	4.4%	53%	138 bp	0.2
Sne-ABir_008-Ex1-9H-lcwgs-1-1.clmp.r1	3.8%	55%	138 bp	0.2
Sne-ABir_008-Ex1-9H-lcwgs-1-1.clmp.r2	2.7%	55%	138 bp	0.2
Sne-ABir_009-Ex1-10A-lcwgs-1-1.clmp.r1	3.8%	53%	139 bp	0.4
Sne-ABir_009-Ex1-10A-lcwgs-1-1.clmp.r2	2.9%	53%	138 bp	0.4
Sne-ABir_010-Ex1-10B-lcwgs-1-1.clmp.r1	3.2%	54%	139 bp	0.3
Sne-ABir_010-Ex1-10B-lcwgs-1-1.clmp.r2	2.4%	54%	139 bp	0.3
Sne-ABir_011-Ex1-10C-lcwgs-1-1.clmp.r1	2.3%	34%	106 bp	1.5
Sne-ABir_011-Ex1-10C-lcwgs-1-1.clmp.r2	1.9%	34%	106 bp	1.5
Sne-ABir_012-Ex1-10D-lcwgs-1-1.clmp.r1	3.5%	36%	109 bp	0.8
Sne-ABir_012-Ex1-10D-lcwgs-1-1.clmp.r2	2.8%	36%	109 bp	0.8
Sne-ABir_013-Ex1-10E-lcwgs-1-1.clmp.r1	2.0%	34%	106 bp	1.8
Sne-ABir_013-Ex1-10E-lcwgs-1-1.clmp.r2	1.5%	34%	106 bp	1.8
Sne-ABir_014-Ex1-10F-lcwgs-1-1.clmp.r1	3.3%	33%	113 bp	1.6
Sne-ABir_014-Ex1-10F-lcwgs-1-1.clmp.r2	2.8%	33%	113 bp	1.6
Sne-ABir_015-Ex1-10G-lcwgs-1-1.clmp.r1	2.4%	34%	105 bp	2.4
Sne-ABir_015-Ex1-10G-lcwgs-1-1.clmp.r2	2.1%	34%	105 bp	2.4
Sne-ABir_017-Ex1-11A-lcwgs-1-1.clmp.r1	5.4%	33%	114 bp	1.3
Sne-ABir_017-Ex1-11A-lcwgs-1-1.clmp.r2	4.8%	33%	114 bp	1.3
Sne-ABir_018-Ex1-11B-lcwgs-1-1.clmp.r1	5.5%	33%	115 bp	3.2
Sne-ABir_018-Ex1-11B-lcwgs-1-1.clmp.r2	5.1%	33%	115 bp	3.2
Sne-ABir_019-Ex1-11C-lcwgs-1-1.clmp.r1	4.3%	34%	110 bp	2.2
Sne-ABir_019-Ex1-11C-lcwgs-1-1.clmp.r2	3.8%	34%	110 bp	2.2
Sne-ABir_020-Ex1-11D-lcwgs-1-1.clmp.r1	1.2%	33%	86 bp	2.6
Sne-ABir_020-Ex1-11D-lcwgs-1-1.clmp.r2	1.0%	33%	86 bp	2.6
Sne-ABir_021-Ex1-11E-lcwgs-1-1.clmp.r1	3.7%	33%	109 bp	2.2
Sne-ABir_021-Ex1-11E-lcwgs-1-1.clmp.r2	3.2%	33%	109 bp	2.2
Sne-ABir_022-Ex1-11F-lcwgs-1-1.clmp.r1	3.0%	33%	113 bp	2.1
Sne-ABir_022-Ex1-11F-lcwgs-1-1.clmp.r2	2.6%	33%	113 bp	2.1
Sne-ABir_023-Ex1-11G-lcwgs-1-1.clmp.r1	5.5%	33%	114 bp	1.8
Sne-ABir_023-Ex1-11G-lcwgs-1-1.clmp.r2	4.8%	33%	114 bp	1.8
Sne-ABir_024-Ex1-11H-lcwgs-1-1.clmp.r1	2.9%	34%	111 bp	1.8
Sne-ABir_024-Ex1-11H-lcwgs-1-1.clmp.r2	2.4%	34%	111 bp	1.8
Sne-ABir_025-Ex1-12A-lcwgs-1-1.clmp.r1	3.5%	34%	108 bp	3.0
Sne-ABir_025-Ex1-12A-lcwgs-1-1.clmp.r2	3.0%	34%	108 bp	3.0
Sne-ABir_026-Ex1-12B-lcwgs-1-1.clmp.r1	2.5%	33%	107 bp	2.7
Sne-ABir_026-Ex1-12B-lcwgs-1-1.clmp.r2	2.1%	33%	107 bp	2.7
Sne-ABir_027-Ex1-12C-lcwgs-1-1.clmp.r1	5.1%	35%	116 bp	1.7
Sne-ABir_027-Ex1-12C-lcwgs-1-1.clmp.r2	4.5%	35%	116 bp	1.7
Sne-ABir_028-Ex1-12D-lcwgs-1-1.clmp.r1	4.3%	40%	127 bp	0.7
Sne-ABir_028-Ex1-12D-lcwgs-1-1.clmp.r2	3.5%	40%	127 bp	0.7
Sne-CCab_016-Ex1-1A-lcwgs-1-1.clmp.r1	3.4%	38%	138 bp	1.7
Sne-CCab_016-Ex1-1A-lcwgs-1-1.clmp.r2	2.8%	39%	138 bp	1.7
Sne-CCab_017-Ex1-1B-lcwgs-1-1.clmp.r1	3.3%	39%	138 bp	1.2
Sne-CCab_017-Ex1-1B-lcwgs-1-1.clmp.r2	2.6%	39%	138 bp	1.2
Sne-CCab_018-Ex1-1C-lcwgs-1-1.clmp.r1	3.0%	39%	135 bp	1.4
Sne-CCab_018-Ex1-1C-lcwgs-1-1.clmp.r2	2.5%	39%	134 bp	1.4
Sne-CCab_019-Ex1-1D-lcwgs-1-1.clmp.r1	4.3%	39%	145 bp	2.2
Sne-CCab_019-Ex1-1D-lcwgs-1-1.clmp.r2	3.6%	39%	145 bp	2.2
Sne-CCab_020-Ex1-1E-lcwgs-1-1.clmp.r1	3.9%	39%	142 bp	1.9
Sne-CCab_020-Ex1-1E-lcwgs-1-1.clmp.r2	3.2%	39%	142 bp	1.9
Sne-CCab_021-Ex1-1F-lcwgs-1-1.clmp.r1	5.3%	38%	147 bp	2.7
Sne-CCab_021-Ex1-1F-lcwgs-1-1.clmp.r2	4.4%	38%	147 bp	2.7
Sne-CCab_022-Ex1-1G-lcwgs-1-1.clmp.r1	4.2%	39%	144 bp	2.7
Sne-CCab_022-Ex1-1G-lcwgs-1-1.clmp.r2	3.6%	39%	144 bp	2.7
Sne-CCab_023-Ex1-1H-lcwgs-1-1.clmp.r1	4.1%	38%	143 bp	2.2
Sne-CCab_023-Ex1-1H-lcwgs-1-1.clmp.r2	3.4%	38%	143 bp	2.2
Sne-CCab_024-Ex1-2A-lcwgs-1-1.clmp.r1	3.3%	38%	139 bp	2.1
Sne-CCab_024-Ex1-2A-lcwgs-1-1.clmp.r2	2.8%	38%	139 bp	2.1
Sne-CCab_025-Ex1-2B-lcwgs-1-1.clmp.r1	3.5%	39%	141 bp	1.9
Sne-CCab_025-Ex1-2B-lcwgs-1-1.clmp.r2	2.9%	39%	140 bp	1.9
Sne-CCab_026-Ex1-2C-lcwgs-1-1.clmp.r1	4.3%	38%	145 bp	2.8
Sne-CCab_026-Ex1-2C-lcwgs-1-1.clmp.r2	3.7%	38%	145 bp	2.8
Sne-CCab_027-Ex1-2D-lcwgs-1-1.clmp.r1	3.4%	38%	142 bp	1.5
Sne-CCab_027-Ex1-2D-lcwgs-1-1.clmp.r2	2.8%	38%	142 bp	1.5
Sne-CCab_028-Ex1-2E-lcwgs-1-1.clmp.r1	3.9%	38%	144 bp	1.8
Sne-CCab_028-Ex1-2E-lcwgs-1-1.clmp.r2	3.3%	38%	144 bp	1.8
Sne-CCab_029-Ex1-2F-lcwgs-1-1.clmp.r1	3.7%	39%	143 bp	2.1
Sne-CCab_029-Ex1-2F-lcwgs-1-1.clmp.r2	3.2%	39%	143 bp	2.1
Sne-CCab_030-Ex1-2G-lcwgs-1-1.clmp.r1	3.8%	38%	144 bp	1.6
Sne-CCab_030-Ex1-2G-lcwgs-1-1.clmp.r2	3.1%	39%	144 bp	1.6
Sne-CCab_031-Ex1-2H-lcwgs-1-1.clmp.r1	2.8%	39%	136 bp	0.9
Sne-CCab_031-Ex1-2H-lcwgs-1-1.clmp.r2	2.3%	39%	135 bp	0.9
Sne-CCab_032-Ex1-3A-lcwgs-1-1.clmp.r1	3.8%	38%	141 bp	2.3
Sne-CCab_032-Ex1-3A-lcwgs-1-1.clmp.r2	3.3%	38%	140 bp	2.3
Sne-CCab_033-Ex1-3B-lcwgs-1-1.clmp.r1	3.6%	38%	141 bp	2.0
Sne-CCab_033-Ex1-3B-lcwgs-1-1.clmp.r2	3.0%	38%	141 bp	2.0
Sne-CCab_034-Ex1-3C-lcwgs-1-1.clmp.r1	4.6%	37%	145 bp	3.7
Sne-CCab_034-Ex1-3C-lcwgs-1-1.clmp.r2	4.0%	38%	144 bp	3.7
Sne-CCab_035-Ex1-3D-lcwgs-1-1.clmp.r1	4.4%	38%	145 bp	2.7
Sne-CCab_035-Ex1-3D-lcwgs-1-1.clmp.r2	3.7%	38%	145 bp	2.7
Sne-CCab_036-Ex1-3E-lcwgs-1-1.clmp.r1	4.3%	39%	145 bp	2.2
Sne-CCab_036-Ex1-3E-lcwgs-1-1.clmp.r2	3.4%	39%	145 bp	2.2
Sne-CCab_037-Ex1-3F-lcwgs-1-1.clmp.r1	3.9%	39%	141 bp	2.0
Sne-CCab_037-Ex1-3F-lcwgs-1-1.clmp.r2	3.1%	39%	140 bp	2.0
Sne-CCab_038-Ex1-3G-lcwgs-1-1.clmp.r1	4.3%	38%	145 bp	2.6
Sne-CCab_038-Ex1-3G-lcwgs-1-1.clmp.r2	3.6%	39%	145 bp	2.6
Sne-CCab_039-Ex1-3H-lcwgs-1-1.clmp.r1	3.8%	38%	143 bp	1.8
Sne-CCab_039-Ex1-3H-lcwgs-1-1.clmp.r2	3.1%	38%	143 bp	1.8
Sne-CCab_040-Ex1-4A-lcwgs-1-1.clmp.r1	3.4%	38%	139 bp	2.1
Sne-CCab_040-Ex1-4A-lcwgs-1-1.clmp.r2	2.9%	38%	139 bp	2.1
Sne-CCab_041-Ex1-4B-lcwgs-1-1.clmp.r1	3.2%	38%	140 bp	1.3
Sne-CCab_041-Ex1-4B-lcwgs-1-1.clmp.r2	2.6%	38%	140 bp	1.3
Sne-CCab_042-Ex1-4C-lcwgs-1-1.clmp.r1	3.2%	38%	142 bp	1.2
Sne-CCab_042-Ex1-4C-lcwgs-1-1.clmp.r2	2.6%	38%	142 bp	1.2
Sne-CCab_043-Ex1-4D-lcwgs-1-1.clmp.r1	3.9%	39%	145 bp	1.9
Sne-CCab_043-Ex1-4D-lcwgs-1-1.clmp.r2	3.1%	39%	145 bp	1.9
Sne-CCab_044-Ex1-4E-lcwgs-1-1.clmp.r1	3.4%	39%	140 bp	1.1
Sne-CCab_044-Ex1-4E-lcwgs-1-1.clmp.r2	2.7%	39%	140 bp	1.1
Sne-CCab_045-Ex1-4F-lcwgs-1-1.clmp.r1	3.7%	38%	142 bp	1.5
Sne-CCab_045-Ex1-4F-lcwgs-1-1.clmp.r2	3.0%	38%	142 bp	1.5
Sne-CCab_046-Ex1-4G-lcwgs-1-1.clmp.r1	2.6%	39%	132 bp	0.7
Sne-CCab_046-Ex1-4G-lcwgs-1-1.clmp.r2	2.1%	39%	132 bp	0.7
Sne-CCab_047-Ex1-4H-lcwgs-1-1.clmp.r1	3.2%	39%	143 bp	1.0
Sne-CCab_047-Ex1-4H-lcwgs-1-1.clmp.r2	2.5%	39%	143 bp	1.0
Sne-CCab_048-Ex1-5A-lcwgs-1-1.clmp.r1	3.5%	39%	142 bp	2.2
Sne-CCab_048-Ex1-5A-lcwgs-1-1.clmp.r2	3.0%	39%	142 bp	2.2
Sne-CCab_049-Ex1-5B-lcwgs-1-1.clmp.r1	2.9%	39%	137 bp	1.1
Sne-CCab_049-Ex1-5B-lcwgs-1-1.clmp.r2	2.4%	39%	137 bp	1.1
Sne-CCab_050-Ex1-5C-lcwgs-1-1.clmp.r1	3.8%	39%	144 bp	1.9
Sne-CCab_050-Ex1-5C-lcwgs-1-1.clmp.r2	3.1%	39%	144 bp	1.9
Sne-CCab_051-Ex1-5D-lcwgs-1-1.clmp.r1	3.0%	39%	138 bp	1.0
Sne-CCab_051-Ex1-5D-lcwgs-1-1.clmp.r2	2.4%	39%	138 bp	1.0
Sne-CCab_052-Ex1-5E-lcwgs-1-1.clmp.r1	3.3%	39%	141 bp	1.1
Sne-CCab_052-Ex1-5E-lcwgs-1-1.clmp.r2	2.6%	39%	141 bp	1.1
Sne-CCab_053-Ex1-5F-lcwgs-1-1.clmp.r1	3.2%	39%	139 bp	1.1
Sne-CCab_053-Ex1-5F-lcwgs-1-1.clmp.r2	2.5%	39%	138 bp	1.1
Sne-CCab_054-Ex1-5G-lcwgs-1-1.clmp.r1	3.3%	39%	140 bp	1.3
Sne-CCab_054-Ex1-5G-lcwgs-1-1.clmp.r2	2.6%	39%	140 bp	1.3
Sne-CCab_055-Ex1-5H-lcwgs-1-1.clmp.r1	2.8%	39%	135 bp	0.7
Sne-CCab_055-Ex1-5H-lcwgs-1-1.clmp.r2	2.2%	39%	135 bp	0.7
Sne-CCab_056-Ex1-6A-lcwgs-1-1.clmp.r1	3.2%	38%	138 bp	1.9
Sne-CCab_056-Ex1-6A-lcwgs-1-1.clmp.r2	2.7%	38%	138 bp	1.9
Sne-CCab_057-Ex1-6B-lcwgs-1-1.clmp.r1	3.3%	39%	140 bp	1.6
Sne-CCab_057-Ex1-6B-lcwgs-1-1.clmp.r2	2.7%	39%	140 bp	1.6
Sne-CCab_058-Ex1-6C-lcwgs-1-1.clmp.r1	3.6%	38%	142 bp	2.1
Sne-CCab_058-Ex1-6C-lcwgs-1-1.clmp.r2	3.1%	38%	142 bp	2.1
Sne-CCab_059-Ex1-6D-lcwgs-1-1.clmp.r1	3.5%	39%	143 bp	1.3
Sne-CCab_059-Ex1-6D-lcwgs-1-1.clmp.r2	2.8%	39%	143 bp	1.3
Sne-CCab_060-Ex1-6E-lcwgs-1-1.clmp.r1	3.9%	38%	146 bp	1.8
Sne-CCab_060-Ex1-6E-lcwgs-1-1.clmp.r2	3.3%	38%	145 bp	1.8
Sne-CCab_061-Ex1-6F-lcwgs-1-1.clmp.r1	3.6%	38%	144 bp	1.6
Sne-CCab_061-Ex1-6F-lcwgs-1-1.clmp.r2	3.0%	38%	143 bp	1.6
Sne-CCab_062-Ex1-6G-lcwgs-1-1.clmp.r1	2.8%	39%	137 bp	0.7
Sne-CCab_062-Ex1-6G-lcwgs-1-1.clmp.r2	2.2%	39%	137 bp	0.7
Sne-CCab_063-Ex1-6H-lcwgs-1-1.clmp.r1	3.0%	39%	138 bp	1.2
Sne-CCab_063-Ex1-6H-lcwgs-1-1.clmp.r2	2.5%	39%	138 bp	1.2
Sne-CCab_064-Ex1-7A-lcwgs-1-1.clmp.r1	3.5%	38%	140 bp	2.3
Sne-CCab_064-Ex1-7A-lcwgs-1-1.clmp.r2	3.0%	38%	140 bp	2.3
Sne-CCab_065-Ex1-7B-lcwgs-1-1.clmp.r1	2.8%	38%	134 bp	1.1
Sne-CCab_065-Ex1-7B-lcwgs-1-1.clmp.r2	2.3%	39%	134 bp	1.1
Sne-CCab_066-Ex1-7C-lcwgs-1-1.clmp.r1	3.9%	39%	144 bp	2.1
Sne-CCab_066-Ex1-7C-lcwgs-1-1.clmp.r2	3.2%	39%	144 bp	2.1
Sne-CCab_067-Ex1-7D-lcwgs-1-1.clmp.r1	3.9%	39%	144 bp	2.8
Sne-CCab_067-Ex1-7D-lcwgs-1-1.clmp.r2	3.3%	39%	144 bp	2.8
Sne-CCab_068-Ex1-7E-lcwgs-1-1.clmp.r1	3.8%	39%	144 bp	1.7
Sne-CCab_068-Ex1-7E-lcwgs-1-1.clmp.r2	3.1%	39%	144 bp	1.7
Sne-CCab_069-Ex1-7F-lcwgs-1-1.clmp.r1	3.8%	38%	143 bp	1.9
Sne-CCab_069-Ex1-7F-lcwgs-1-1.clmp.r2	3.2%	38%	143 bp	1.9
Sne-CCab_070-Ex1-7G-lcwgs-1-1.clmp.r1	3.8%	38%	144 bp	1.5
Sne-CCab_070-Ex1-7G-lcwgs-1-1.clmp.r2	3.2%	38%	144 bp	1.5
Sne-CCab_071-Ex1-7H-lcwgs-1-1.clmp.r1	2.7%	38%	137 bp	0.8
Sne-CCab_071-Ex1-7H-lcwgs-1-1.clmp.r2	2.2%	38%	136 bp	0.8
Sne-CCab_072-Ex1-8A-lcwgs-1-1.clmp.r1	2.6%	39%	133 bp	1.0
Sne-CCab_072-Ex1-8A-lcwgs-1-1.clmp.r2	2.1%	39%	133 bp	1.0
Sne-CCab_073-Ex1-8B-lcwgs-1-1.clmp.r1	2.6%	39%	132 bp	0.8
Sne-CCab_073-Ex1-8B-lcwgs-1-1.clmp.r2	2.0%	39%	132 bp	0.8
Sne-CCab_074-Ex1-8C-lcwgs-1-1.clmp.r1	0.3%	39%	139 bp	0.0
Sne-CCab_074-Ex1-8C-lcwgs-1-1.clmp.r2	0.2%	39%	139 bp	0.0
Sne-CCab_075-Ex1-8D-lcwgs-1-1.clmp.r1	3.0%	39%	139 bp	1.1
Sne-CCab_075-Ex1-8D-lcwgs-1-1.clmp.r2	2.4%	39%	139 bp	1.1
Sne-CCab_076-Ex1-8E-lcwgs-1-1.clmp.r1	3.8%	39%	145 bp	1.6
Sne-CCab_076-Ex1-8E-lcwgs-1-1.clmp.r2	3.1%	39%	145 bp	1.6
Sne-CCab_077-Ex1-8F-lcwgs-1-1.clmp.r1	4.0%	38%	145 bp	1.8
Sne-CCab_077-Ex1-8F-lcwgs-1-1.clmp.r2	3.4%	38%	145 bp	1.8
Sne-CCab_078-Ex1-8G-lcwgs-1-1.clmp.r1	3.7%	38%	144 bp	1.7
Sne-CCab_078-Ex1-8G-lcwgs-1-1.clmp.r2	3.1%	38%	144 bp	1.7
Sne-CCab_079-Ex1-8H-lcwgs-1-1.clmp.r1	3.4%	38%	142 bp	1.4
Sne-CCab_079-Ex1-8H-lcwgs-1-1.clmp.r2	2.8%	38%	142 bp	1.4
```
  
</p>
</details>

## 10. Second trim.
`sbatch ../../../pire_fq_gz_processing/runFASTP_2.sbatch fq_fp1_clmp fq_fp1_clmp_fp2 33`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Sne-ABir_001-Ex1-9A-lcwgs-1-1.clmp.r1r2_fastp	3.3%	44.9%	98.7%	0.9%
Sne-ABir_002-Ex1-9B-lcwgs-1-1.clmp.r1r2_fastp	1.6%	49.4%	99.1%	1.7%
Sne-ABir_003-Ex1-9C-lcwgs-1-1.clmp.r1r2_fastp	5.5%	53.0%	98.4%	0.6%
Sne-ABir_004-Ex1-9D-lcwgs-1-1.clmp.r1r2_fastp	2.9%	47.8%	98.4%	0.4%
Sne-ABir_005-Ex1-9E-lcwgs-1-1.clmp.r1r2_fastp	4.3%	53.3%	98.6%	0.9%
Sne-ABir_006-Ex1-9F-lcwgs-1-1.clmp.r1r2_fastp	3.6%	54.0%	98.1%	0.4%
Sne-ABir_007-Ex1-9G-lcwgs-1-1.clmp.r1r2_fastp	3.6%	53.5%	98.5%	0.6%
Sne-ABir_008-Ex1-9H-lcwgs-1-1.clmp.r1r2_fastp	3.7%	55.1%	98.4%	0.6%
Sne-ABir_009-Ex1-10A-lcwgs-1-1.clmp.r1r2_fastp	3.9%	53.7%	98.5%	0.6%
Sne-ABir_010-Ex1-10B-lcwgs-1-1.clmp.r1r2_fastp	3.3%	54.2%	98.4%	0.6%
Sne-ABir_011-Ex1-10C-lcwgs-1-1.clmp.r1r2_fastp	1.8%	34.6%	99.1%	1.6%
Sne-ABir_012-Ex1-10D-lcwgs-1-1.clmp.r1r2_fastp	1.4%	36.2%	98.8%	1.4%
Sne-ABir_013-Ex1-10E-lcwgs-1-1.clmp.r1r2_fastp	1.4%	34.3%	98.8%	1.5%
Sne-ABir_014-Ex1-10F-lcwgs-1-1.clmp.r1r2_fastp	2.1%	33.8%	99.1%	1.5%
Sne-ABir_015-Ex1-10G-lcwgs-1-1.clmp.r1r2_fastp	1.8%	34.3%	99.1%	1.7%
Sne-ABir_017-Ex1-11A-lcwgs-1-1.clmp.r1r2_fastp	2.2%	33.8%	99.1%	1.5%
Sne-ABir_018-Ex1-11B-lcwgs-1-1.clmp.r1r2_fastp	2.5%	33.0%	99.1%	1.4%
Sne-ABir_019-Ex1-11C-lcwgs-1-1.clmp.r1r2_fastp	2.0%	34.4%	99.1%	1.5%
Sne-ABir_020-Ex1-11D-lcwgs-1-1.clmp.r1r2_fastp	1.2%	33.9%	99.2%	1.8%
Sne-ABir_021-Ex1-11E-lcwgs-1-1.clmp.r1r2_fastp	2.1%	33.5%	99.1%	1.5%
Sne-ABir_022-Ex1-11F-lcwgs-1-1.clmp.r1r2_fastp	2.1%	33.6%	99.1%	1.5%
Sne-ABir_023-Ex1-11G-lcwgs-1-1.clmp.r1r2_fastp	2.0%	33.3%	99.0%	1.6%
Sne-ABir_024-Ex1-11H-lcwgs-1-1.clmp.r1r2_fastp	1.9%	34.0%	99.1%	1.5%
Sne-ABir_025-Ex1-12A-lcwgs-1-1.clmp.r1r2_fastp	2.1%	34.3%	99.1%	1.5%
Sne-ABir_026-Ex1-12B-lcwgs-1-1.clmp.r1r2_fastp	1.9%	33.7%	99.2%	1.6%
Sne-ABir_027-Ex1-12C-lcwgs-1-1.clmp.r1r2_fastp	2.8%	35.9%	99.0%	1.4%
Sne-ABir_028-Ex1-12D-lcwgs-1-1.clmp.r1r2_fastp	3.7%	40.6%	98.9%	1.1%
Sne-CCab_016-Ex1-1A-lcwgs-1-1.clmp.r1r2_fastp	3.3%	38.9%	98.5%	0.6%
Sne-CCab_017-Ex1-1B-lcwgs-1-1.clmp.r1r2_fastp	3.3%	39.5%	98.5%	0.6%
Sne-CCab_018-Ex1-1C-lcwgs-1-1.clmp.r1r2_fastp	3.1%	39.5%	98.6%	0.7%
Sne-CCab_019-Ex1-1D-lcwgs-1-1.clmp.r1r2_fastp	4.1%	39.7%	98.2%	0.3%
Sne-CCab_020-Ex1-1E-lcwgs-1-1.clmp.r1r2_fastp	3.8%	39.4%	98.3%	0.4%
Sne-CCab_021-Ex1-1F-lcwgs-1-1.clmp.r1r2_fastp	5.0%	38.1%	98.2%	0.2%
Sne-CCab_022-Ex1-1G-lcwgs-1-1.clmp.r1r2_fastp	3.8%	39.0%	98.4%	0.4%
Sne-CCab_023-Ex1-1H-lcwgs-1-1.clmp.r1r2_fastp	3.8%	38.7%	98.5%	0.4%
Sne-CCab_024-Ex1-2A-lcwgs-1-1.clmp.r1r2_fastp	3.0%	38.8%	98.6%	0.6%
Sne-CCab_025-Ex1-2B-lcwgs-1-1.clmp.r1r2_fastp	3.2%	39.0%	98.5%	0.5%
Sne-CCab_026-Ex1-2C-lcwgs-1-1.clmp.r1r2_fastp	3.7%	38.5%	98.3%	0.3%
Sne-CCab_027-Ex1-2D-lcwgs-1-1.clmp.r1r2_fastp	3.3%	38.8%	98.3%	0.4%
Sne-CCab_028-Ex1-2E-lcwgs-1-1.clmp.r1r2_fastp	3.7%	38.6%	98.3%	0.3%
Sne-CCab_029-Ex1-2F-lcwgs-1-1.clmp.r1r2_fastp	3.5%	39.0%	98.4%	0.4%
Sne-CCab_030-Ex1-2G-lcwgs-1-1.clmp.r1r2_fastp	3.5%	38.9%	98.4%	0.4%
Sne-CCab_031-Ex1-2H-lcwgs-1-1.clmp.r1r2_fastp	2.9%	39.1%	98.6%	0.6%
Sne-CCab_032-Ex1-3A-lcwgs-1-1.clmp.r1r2_fastp	3.4%	38.4%	98.4%	0.5%
Sne-CCab_033-Ex1-3B-lcwgs-1-1.clmp.r1r2_fastp	3.4%	38.6%	98.4%	0.5%
Sne-CCab_034-Ex1-3C-lcwgs-1-1.clmp.r1r2_fastp	3.9%	37.9%	98.4%	0.4%
Sne-CCab_035-Ex1-3D-lcwgs-1-1.clmp.r1r2_fastp	3.9%	38.5%	98.3%	0.3%
Sne-CCab_036-Ex1-3E-lcwgs-1-1.clmp.r1r2_fastp	4.0%	39.0%	98.2%	0.3%
Sne-CCab_037-Ex1-3F-lcwgs-1-1.clmp.r1r2_fastp	3.6%	39.0%	98.4%	0.4%
Sne-CCab_038-Ex1-3G-lcwgs-1-1.clmp.r1r2_fastp	3.8%	38.9%	98.4%	0.3%
Sne-CCab_039-Ex1-3H-lcwgs-1-1.clmp.r1r2_fastp	3.6%	38.7%	98.4%	0.4%
Sne-CCab_040-Ex1-4A-lcwgs-1-1.clmp.r1r2_fastp	3.0%	38.4%	98.5%	0.6%
Sne-CCab_041-Ex1-4B-lcwgs-1-1.clmp.r1r2_fastp	3.0%	38.8%	98.5%	0.5%
Sne-CCab_042-Ex1-4C-lcwgs-1-1.clmp.r1r2_fastp	3.1%	38.6%	98.5%	0.4%
Sne-CCab_043-Ex1-4D-lcwgs-1-1.clmp.r1r2_fastp	3.6%	39.2%	98.2%	0.3%
Sne-CCab_044-Ex1-4E-lcwgs-1-1.clmp.r1r2_fastp	3.3%	39.2%	98.4%	0.5%
Sne-CCab_045-Ex1-4F-lcwgs-1-1.clmp.r1r2_fastp	3.5%	38.7%	98.4%	0.4%
Sne-CCab_046-Ex1-4G-lcwgs-1-1.clmp.r1r2_fastp	2.6%	39.0%	98.7%	0.8%
Sne-CCab_047-Ex1-4H-lcwgs-1-1.clmp.r1r2_fastp	3.3%	39.6%	98.4%	0.4%
Sne-CCab_048-Ex1-5A-lcwgs-1-1.clmp.r1r2_fastp	3.3%	39.0%	98.5%	0.5%
Sne-CCab_049-Ex1-5B-lcwgs-1-1.clmp.r1r2_fastp	3.0%	39.2%	98.5%	0.6%
Sne-CCab_050-Ex1-5C-lcwgs-1-1.clmp.r1r2_fastp	3.4%	39.2%	98.4%	0.4%
Sne-CCab_051-Ex1-5D-lcwgs-1-1.clmp.r1r2_fastp	2.9%	39.2%	98.5%	0.6%
Sne-CCab_052-Ex1-5E-lcwgs-1-1.clmp.r1r2_fastp	3.3%	39.4%	98.4%	0.5%
Sne-CCab_053-Ex1-5F-lcwgs-1-1.clmp.r1r2_fastp	3.2%	39.1%	98.5%	0.5%
Sne-CCab_054-Ex1-5G-lcwgs-1-1.clmp.r1r2_fastp	3.3%	39.1%	98.5%	0.5%
Sne-CCab_055-Ex1-5H-lcwgs-1-1.clmp.r1r2_fastp	3.0%	39.2%	98.5%	0.6%
Sne-CCab_056-Ex1-6A-lcwgs-1-1.clmp.r1r2_fastp	3.0%	38.8%	98.5%	0.6%
Sne-CCab_057-Ex1-6B-lcwgs-1-1.clmp.r1r2_fastp	3.1%	39.2%	98.5%	0.5%
Sne-CCab_058-Ex1-6C-lcwgs-1-1.clmp.r1r2_fastp	3.3%	38.6%	98.5%	0.4%
Sne-CCab_059-Ex1-6D-lcwgs-1-1.clmp.r1r2_fastp	3.3%	39.3%	98.4%	0.4%
Sne-CCab_060-Ex1-6E-lcwgs-1-1.clmp.r1r2_fastp	3.8%	38.8%	98.3%	0.3%
Sne-CCab_061-Ex1-6F-lcwgs-1-1.clmp.r1r2_fastp	3.6%	38.8%	98.4%	0.4%
Sne-CCab_062-Ex1-6G-lcwgs-1-1.clmp.r1r2_fastp	2.8%	39.0%	98.6%	0.6%
Sne-CCab_063-Ex1-6H-lcwgs-1-1.clmp.r1r2_fastp	3.0%	39.5%	98.5%	0.6%
Sne-CCab_064-Ex1-7A-lcwgs-1-1.clmp.r1r2_fastp	3.1%	38.3%	98.5%	0.5%
Sne-CCab_065-Ex1-7B-lcwgs-1-1.clmp.r1r2_fastp	2.8%	38.9%	98.6%	0.7%
Sne-CCab_066-Ex1-7C-lcwgs-1-1.clmp.r1r2_fastp	3.5%	39.0%	98.3%	0.3%
Sne-CCab_067-Ex1-7D-lcwgs-1-1.clmp.r1r2_fastp	3.4%	39.3%	98.3%	0.4%
Sne-CCab_068-Ex1-7E-lcwgs-1-1.clmp.r1r2_fastp	3.6%	39.0%	98.3%	0.3%
Sne-CCab_069-Ex1-7F-lcwgs-1-1.clmp.r1r2_fastp	3.6%	38.6%	98.4%	0.4%
Sne-CCab_070-Ex1-7G-lcwgs-1-1.clmp.r1r2_fastp	3.6%	38.2%	98.4%	0.3%
Sne-CCab_071-Ex1-7H-lcwgs-1-1.clmp.r1r2_fastp	2.8%	38.8%	98.6%	0.6%
Sne-CCab_072-Ex1-8A-lcwgs-1-1.clmp.r1r2_fastp	2.6%	39.4%	98.6%	0.7%
Sne-CCab_073-Ex1-8B-lcwgs-1-1.clmp.r1r2_fastp	2.6%	39.5%	98.6%	0.7%
Sne-CCab_074-Ex1-8C-lcwgs-1-1.clmp.r1r2_fastp	0.2%	39.1%	97.7%	0.8%
Sne-CCab_075-Ex1-8D-lcwgs-1-1.clmp.r1r2_fastp	3.0%	39.5%	98.4%	0.5%
Sne-CCab_076-Ex1-8E-lcwgs-1-1.clmp.r1r2_fastp	3.7%	39.2%	98.2%	0.3%
Sne-CCab_077-Ex1-8F-lcwgs-1-1.clmp.r1r2_fastp	3.8%	38.0%	98.3%	0.3%
Sne-CCab_078-Ex1-8G-lcwgs-1-1.clmp.r1r2_fastp	3.6%	38.6%	98.3%	0.3%
Sne-CCab_079-Ex1-8H-lcwgs-1-1.clmp.r1r2_fastp	3.4%	38.6%	98.4%	0.4%
```

</p>
</details>

## 11. Decontaminate files.
`bash ../../../pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn 20`

```bash
[hpc-0351@wahab-01 2nd_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*tagged.fastq.gz | wc -l
182
[hpc-0351@wahab-01 2nd_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*tagged_filter.fastq.gz | wc -l
182
[hpc-0351@wahab-01 2nd_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*screen.txt | wc -l
182
[hpc-0351@wahab-01 2nd_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*screen.png | wc -l
182
[hpc-0351@wahab-01 2nd_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*screen.html | wc -l
182
[hpc-0351@wahab-01 2nd_sequencing_run]$ grep 'error' slurm-fqscrn.*out
[hpc-0351@wahab-01 2nd_sequencing_run]$ grep 'No reads in' slurm-fqscrn.*out
```

`sbatch ../../../pire_fq_gz_processing/runMULTIQC.sbatch fq_fp1_clmp_fp2_fqscrn fastq_screen_report`

<details><summary>Expand for MultiQC Output.</summary>

```bash
insert multiqc output here
```

</p>
</details>

## 12. Execute RePair
`sbatch ../../../pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 40`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	Length	M Seqs
Sne-ABir_001-Ex1-9A-lcwgs-1-1.clmp.fp2_repr.R1	3.9%	39%	125 bp	0.2
Sne-ABir_001-Ex1-9A-lcwgs-1-1.clmp.fp2_repr.R2	3.2%	39%	123 bp	0.2
Sne-ABir_002-Ex1-9B-lcwgs-1-1.clmp.fp2_repr.R1	1.7%	48%	111 bp	0.0
Sne-ABir_002-Ex1-9B-lcwgs-1-1.clmp.fp2_repr.R2	1.3%	48%	110 bp	0.0
Sne-ABir_003-Ex1-9C-lcwgs-1-1.clmp.fp2_repr.R1	5.3%	49%	139 bp	0.5
Sne-ABir_003-Ex1-9C-lcwgs-1-1.clmp.fp2_repr.R2	4.3%	49%	136 bp	0.5
Sne-ABir_004-Ex1-9D-lcwgs-1-1.clmp.fp2_repr.R1	3.8%	49%	141 bp	0.0
Sne-ABir_004-Ex1-9D-lcwgs-1-1.clmp.fp2_repr.R2	2.4%	48%	137 bp	0.0
Sne-ABir_005-Ex1-9E-lcwgs-1-1.clmp.fp2_repr.R1	4.5%	48%	129 bp	0.0
Sne-ABir_005-Ex1-9E-lcwgs-1-1.clmp.fp2_repr.R2	3.1%	48%	127 bp	0.0
Sne-ABir_006-Ex1-9F-lcwgs-1-1.clmp.fp2_repr.R1	3.8%	49%	143 bp	0.0
Sne-ABir_006-Ex1-9F-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	49%	140 bp	0.0
Sne-ABir_007-Ex1-9G-lcwgs-1-1.clmp.fp2_repr.R1	4.3%	49%	138 bp	0.1
Sne-ABir_007-Ex1-9G-lcwgs-1-1.clmp.fp2_repr.R2	3.1%	49%	135 bp	0.1
Sne-ABir_008-Ex1-9H-lcwgs-1-1.clmp.fp2_repr.R1	4.8%	50%	138 bp	0.1
Sne-ABir_008-Ex1-9H-lcwgs-1-1.clmp.fp2_repr.R2	3.4%	50%	135 bp	0.1
Sne-ABir_009-Ex1-10A-lcwgs-1-1.clmp.fp2_repr.R1	3.6%	49%	138 bp	0.3
Sne-ABir_009-Ex1-10A-lcwgs-1-1.clmp.fp2_repr.R2	2.8%	49%	135 bp	0.3
Sne-ABir_010-Ex1-10B-lcwgs-1-1.clmp.fp2_repr.R1	5.3%	49%	138 bp	0.2
Sne-ABir_010-Ex1-10B-lcwgs-1-1.clmp.fp2_repr.R2	4.1%	49%	135 bp	0.2
Sne-ABir_011-Ex1-10C-lcwgs-1-1.clmp.fp2_repr.R1	2.1%	34%	105 bp	1.4
Sne-ABir_011-Ex1-10C-lcwgs-1-1.clmp.fp2_repr.R2	1.8%	34%	104 bp	1.4
Sne-ABir_012-Ex1-10D-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	35%	108 bp	0.7
Sne-ABir_012-Ex1-10D-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	35%	107 bp	0.7
Sne-ABir_013-Ex1-10E-lcwgs-1-1.clmp.fp2_repr.R1	1.7%	34%	105 bp	1.7
Sne-ABir_013-Ex1-10E-lcwgs-1-1.clmp.fp2_repr.R2	1.4%	34%	103 bp	1.7
Sne-ABir_014-Ex1-10F-lcwgs-1-1.clmp.fp2_repr.R1	3.0%	33%	112 bp	1.4
Sne-ABir_014-Ex1-10F-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	33%	111 bp	1.4
Sne-ABir_015-Ex1-10G-lcwgs-1-1.clmp.fp2_repr.R1	2.1%	34%	104 bp	2.2
Sne-ABir_015-Ex1-10G-lcwgs-1-1.clmp.fp2_repr.R2	1.9%	34%	103 bp	2.2
Sne-ABir_017-Ex1-11A-lcwgs-1-1.clmp.fp2_repr.R1	5.2%	33%	113 bp	1.2
Sne-ABir_017-Ex1-11A-lcwgs-1-1.clmp.fp2_repr.R2	4.8%	33%	112 bp	1.2
Sne-ABir_018-Ex1-11B-lcwgs-1-1.clmp.fp2_repr.R1	5.1%	33%	114 bp	2.9
Sne-ABir_018-Ex1-11B-lcwgs-1-1.clmp.fp2_repr.R2	4.9%	33%	113 bp	2.9
Sne-ABir_019-Ex1-11C-lcwgs-1-1.clmp.fp2_repr.R1	4.0%	34%	109 bp	2.0
Sne-ABir_019-Ex1-11C-lcwgs-1-1.clmp.fp2_repr.R2	3.7%	34%	107 bp	2.0
Sne-ABir_020-Ex1-11D-lcwgs-1-1.clmp.fp2_repr.R1	1.1%	34%	85 bp	2.4
Sne-ABir_020-Ex1-11D-lcwgs-1-1.clmp.fp2_repr.R2	1.0%	34%	84 bp	2.4
Sne-ABir_021-Ex1-11E-lcwgs-1-1.clmp.fp2_repr.R1	3.3%	33%	108 bp	2.0
Sne-ABir_021-Ex1-11E-lcwgs-1-1.clmp.fp2_repr.R2	2.9%	33%	107 bp	2.0
Sne-ABir_022-Ex1-11F-lcwgs-1-1.clmp.fp2_repr.R1	2.7%	33%	112 bp	1.9
Sne-ABir_022-Ex1-11F-lcwgs-1-1.clmp.fp2_repr.R2	2.4%	33%	111 bp	1.9
Sne-ABir_023-Ex1-11G-lcwgs-1-1.clmp.fp2_repr.R1	5.3%	33%	113 bp	1.6
Sne-ABir_023-Ex1-11G-lcwgs-1-1.clmp.fp2_repr.R2	4.8%	33%	112 bp	1.6
Sne-ABir_024-Ex1-11H-lcwgs-1-1.clmp.fp2_repr.R1	2.6%	34%	110 bp	1.6
Sne-ABir_024-Ex1-11H-lcwgs-1-1.clmp.fp2_repr.R2	2.3%	34%	109 bp	1.6
Sne-ABir_025-Ex1-12A-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	34%	107 bp	2.7
Sne-ABir_025-Ex1-12A-lcwgs-1-1.clmp.fp2_repr.R2	2.9%	34%	106 bp	2.7
Sne-ABir_026-Ex1-12B-lcwgs-1-1.clmp.fp2_repr.R1	2.2%	33%	106 bp	2.5
Sne-ABir_026-Ex1-12B-lcwgs-1-1.clmp.fp2_repr.R2	2.0%	33%	105 bp	2.5
Sne-ABir_027-Ex1-12C-lcwgs-1-1.clmp.fp2_repr.R1	4.6%	35%	115 bp	1.5
Sne-ABir_027-Ex1-12C-lcwgs-1-1.clmp.fp2_repr.R2	4.2%	35%	113 bp	1.5
Sne-ABir_028-Ex1-12D-lcwgs-1-1.clmp.fp2_repr.R1	3.8%	37%	124 bp	0.6
Sne-ABir_028-Ex1-12D-lcwgs-1-1.clmp.fp2_repr.R2	3.2%	37%	123 bp	0.6
Sne-CCab_016-Ex1-1A-lcwgs-1-1.clmp.fp2_repr.R1	2.8%	38%	137 bp	1.5
Sne-CCab_016-Ex1-1A-lcwgs-1-1.clmp.fp2_repr.R2	2.3%	38%	134 bp	1.5
Sne-CCab_017-Ex1-1B-lcwgs-1-1.clmp.fp2_repr.R1	2.8%	39%	137 bp	1.1
Sne-CCab_017-Ex1-1B-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	39%	133 bp	1.1
Sne-CCab_018-Ex1-1C-lcwgs-1-1.clmp.fp2_repr.R1	2.5%	39%	133 bp	1.2
Sne-CCab_018-Ex1-1C-lcwgs-1-1.clmp.fp2_repr.R2	2.1%	39%	130 bp	1.2
Sne-CCab_019-Ex1-1D-lcwgs-1-1.clmp.fp2_repr.R1	3.7%	39%	144 bp	2.0
Sne-CCab_019-Ex1-1D-lcwgs-1-1.clmp.fp2_repr.R2	3.0%	39%	140 bp	2.0
Sne-CCab_020-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R1	3.3%	39%	141 bp	1.7
Sne-CCab_020-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	39%	137 bp	1.7
Sne-CCab_021-Ex1-1F-lcwgs-1-1.clmp.fp2_repr.R1	4.5%	38%	146 bp	2.4
Sne-CCab_021-Ex1-1F-lcwgs-1-1.clmp.fp2_repr.R2	3.8%	38%	142 bp	2.4
Sne-CCab_022-Ex1-1G-lcwgs-1-1.clmp.fp2_repr.R1	3.6%	39%	143 bp	2.5
Sne-CCab_022-Ex1-1G-lcwgs-1-1.clmp.fp2_repr.R2	3.1%	39%	140 bp	2.5
Sne-CCab_023-Ex1-1H-lcwgs-1-1.clmp.fp2_repr.R1	3.5%	38%	142 bp	2.0
Sne-CCab_023-Ex1-1H-lcwgs-1-1.clmp.fp2_repr.R2	2.9%	38%	139 bp	2.0
Sne-CCab_024-Ex1-2A-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	38%	138 bp	1.9
Sne-CCab_024-Ex1-2A-lcwgs-1-1.clmp.fp2_repr.R2	2.4%	38%	135 bp	1.9
Sne-CCab_025-Ex1-2B-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	38%	139 bp	1.7
Sne-CCab_025-Ex1-2B-lcwgs-1-1.clmp.fp2_repr.R2	2.4%	38%	136 bp	1.7
Sne-CCab_026-Ex1-2C-lcwgs-1-1.clmp.fp2_repr.R1	3.7%	38%	144 bp	2.5
Sne-CCab_026-Ex1-2C-lcwgs-1-1.clmp.fp2_repr.R2	3.3%	38%	141 bp	2.5
Sne-CCab_027-Ex1-2D-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	38%	141 bp	1.4
Sne-CCab_027-Ex1-2D-lcwgs-1-1.clmp.fp2_repr.R2	2.4%	38%	137 bp	1.4
Sne-CCab_028-Ex1-2E-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	38%	143 bp	1.7
Sne-CCab_028-Ex1-2E-lcwgs-1-1.clmp.fp2_repr.R2	2.8%	38%	139 bp	1.7
Sne-CCab_029-Ex1-2F-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	38%	142 bp	1.9
Sne-CCab_029-Ex1-2F-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	38%	138 bp	1.9
Sne-CCab_030-Ex1-2G-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	38%	143 bp	1.4
Sne-CCab_030-Ex1-2G-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	38%	139 bp	1.4
Sne-CCab_031-Ex1-2H-lcwgs-1-1.clmp.fp2_repr.R1	2.4%	39%	134 bp	0.8
Sne-CCab_031-Ex1-2H-lcwgs-1-1.clmp.fp2_repr.R2	1.9%	39%	132 bp	0.8
Sne-CCab_032-Ex1-3A-lcwgs-1-1.clmp.fp2_repr.R1	3.3%	38%	139 bp	2.1
Sne-CCab_032-Ex1-3A-lcwgs-1-1.clmp.fp2_repr.R2	2.8%	38%	136 bp	2.1
Sne-CCab_033-Ex1-3B-lcwgs-1-1.clmp.fp2_repr.R1	3.0%	38%	140 bp	1.8
Sne-CCab_033-Ex1-3B-lcwgs-1-1.clmp.fp2_repr.R2	2.5%	38%	136 bp	1.8
Sne-CCab_034-Ex1-3C-lcwgs-1-1.clmp.fp2_repr.R1	4.0%	37%	143 bp	3.3
Sne-CCab_034-Ex1-3C-lcwgs-1-1.clmp.fp2_repr.R2	3.5%	37%	140 bp	3.3
Sne-CCab_035-Ex1-3D-lcwgs-1-1.clmp.fp2_repr.R1	3.7%	38%	144 bp	2.5
Sne-CCab_035-Ex1-3D-lcwgs-1-1.clmp.fp2_repr.R2	3.2%	38%	140 bp	2.5
Sne-CCab_036-Ex1-3E-lcwgs-1-1.clmp.fp2_repr.R1	3.6%	38%	144 bp	2.0
Sne-CCab_036-Ex1-3E-lcwgs-1-1.clmp.fp2_repr.R2	2.9%	38%	140 bp	2.0
Sne-CCab_037-Ex1-3F-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	38%	139 bp	1.8
Sne-CCab_037-Ex1-3F-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	38%	136 bp	1.8
Sne-CCab_038-Ex1-3G-lcwgs-1-1.clmp.fp2_repr.R1	3.7%	38%	144 bp	2.4
Sne-CCab_038-Ex1-3G-lcwgs-1-1.clmp.fp2_repr.R2	3.2%	38%	140 bp	2.4
Sne-CCab_039-Ex1-3H-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	38%	142 bp	1.6
Sne-CCab_039-Ex1-3H-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	38%	138 bp	1.6
Sne-CCab_040-Ex1-4A-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	38%	138 bp	1.9
Sne-CCab_040-Ex1-4A-lcwgs-1-1.clmp.fp2_repr.R2	2.5%	38%	135 bp	1.9
Sne-CCab_041-Ex1-4B-lcwgs-1-1.clmp.fp2_repr.R1	2.7%	38%	139 bp	1.2
Sne-CCab_041-Ex1-4B-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	38%	136 bp	1.2
Sne-CCab_042-Ex1-4C-lcwgs-1-1.clmp.fp2_repr.R1	2.7%	38%	141 bp	1.1
Sne-CCab_042-Ex1-4C-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	38%	138 bp	1.1
Sne-CCab_043-Ex1-4D-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	39%	144 bp	1.7
Sne-CCab_043-Ex1-4D-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	39%	140 bp	1.7
Sne-CCab_044-Ex1-4E-lcwgs-1-1.clmp.fp2_repr.R1	2.8%	39%	139 bp	1.0
Sne-CCab_044-Ex1-4E-lcwgs-1-1.clmp.fp2_repr.R2	2.3%	39%	135 bp	1.0
Sne-CCab_045-Ex1-4F-lcwgs-1-1.clmp.fp2_repr.R1	3.1%	38%	141 bp	1.4
Sne-CCab_045-Ex1-4F-lcwgs-1-1.clmp.fp2_repr.R2	2.5%	38%	138 bp	1.4
Sne-CCab_046-Ex1-4G-lcwgs-1-1.clmp.fp2_repr.R1	2.1%	39%	131 bp	0.6
Sne-CCab_046-Ex1-4G-lcwgs-1-1.clmp.fp2_repr.R2	1.7%	39%	129 bp	0.6
Sne-CCab_047-Ex1-4H-lcwgs-1-1.clmp.fp2_repr.R1	2.6%	39%	142 bp	0.9
Sne-CCab_047-Ex1-4H-lcwgs-1-1.clmp.fp2_repr.R2	2.1%	39%	138 bp	0.9
Sne-CCab_048-Ex1-5A-lcwgs-1-1.clmp.fp2_repr.R1	3.0%	38%	141 bp	2.0
Sne-CCab_048-Ex1-5A-lcwgs-1-1.clmp.fp2_repr.R2	2.5%	38%	138 bp	2.0
Sne-CCab_049-Ex1-5B-lcwgs-1-1.clmp.fp2_repr.R1	2.5%	39%	136 bp	1.0
Sne-CCab_049-Ex1-5B-lcwgs-1-1.clmp.fp2_repr.R2	2.0%	39%	133 bp	1.0
Sne-CCab_050-Ex1-5C-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	39%	143 bp	1.8
Sne-CCab_050-Ex1-5C-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	39%	139 bp	1.8
Sne-CCab_051-Ex1-5D-lcwgs-1-1.clmp.fp2_repr.R1	2.5%	39%	137 bp	0.9
Sne-CCab_051-Ex1-5D-lcwgs-1-1.clmp.fp2_repr.R2	2.0%	39%	134 bp	0.9
Sne-CCab_052-Ex1-5E-lcwgs-1-1.clmp.fp2_repr.R1	2.8%	39%	140 bp	1.0
Sne-CCab_052-Ex1-5E-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	39%	137 bp	1.0
Sne-CCab_053-Ex1-5F-lcwgs-1-1.clmp.fp2_repr.R1	2.6%	39%	137 bp	1.0
Sne-CCab_053-Ex1-5F-lcwgs-1-1.clmp.fp2_repr.R2	2.1%	39%	134 bp	1.0
Sne-CCab_054-Ex1-5G-lcwgs-1-1.clmp.fp2_repr.R1	2.8%	39%	139 bp	1.2
Sne-CCab_054-Ex1-5G-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	39%	136 bp	1.2
Sne-CCab_055-Ex1-5H-lcwgs-1-1.clmp.fp2_repr.R1	2.3%	39%	134 bp	0.6
Sne-CCab_055-Ex1-5H-lcwgs-1-1.clmp.fp2_repr.R2	1.8%	39%	131 bp	0.6
Sne-CCab_056-Ex1-6A-lcwgs-1-1.clmp.fp2_repr.R1	2.7%	38%	137 bp	1.7
Sne-CCab_056-Ex1-6A-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	38%	134 bp	1.7
Sne-CCab_057-Ex1-6B-lcwgs-1-1.clmp.fp2_repr.R1	2.8%	39%	139 bp	1.5
Sne-CCab_057-Ex1-6B-lcwgs-1-1.clmp.fp2_repr.R2	2.3%	39%	136 bp	1.5
Sne-CCab_058-Ex1-6C-lcwgs-1-1.clmp.fp2_repr.R1	3.1%	38%	141 bp	2.0
Sne-CCab_058-Ex1-6C-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	38%	137 bp	2.0
Sne-CCab_059-Ex1-6D-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	39%	142 bp	1.2
Sne-CCab_059-Ex1-6D-lcwgs-1-1.clmp.fp2_repr.R2	2.4%	39%	139 bp	1.2
Sne-CCab_060-Ex1-6E-lcwgs-1-1.clmp.fp2_repr.R1	3.3%	38%	144 bp	1.6
Sne-CCab_060-Ex1-6E-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	38%	141 bp	1.6
Sne-CCab_061-Ex1-6F-lcwgs-1-1.clmp.fp2_repr.R1	3.1%	38%	142 bp	1.5
Sne-CCab_061-Ex1-6F-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	38%	139 bp	1.5
Sne-CCab_062-Ex1-6G-lcwgs-1-1.clmp.fp2_repr.R1	2.3%	39%	136 bp	0.6
Sne-CCab_062-Ex1-6G-lcwgs-1-1.clmp.fp2_repr.R2	1.8%	38%	133 bp	0.6
Sne-CCab_063-Ex1-6H-lcwgs-1-1.clmp.fp2_repr.R1	2.5%	39%	137 bp	1.1
Sne-CCab_063-Ex1-6H-lcwgs-1-1.clmp.fp2_repr.R2	2.1%	39%	134 bp	1.1
Sne-CCab_064-Ex1-7A-lcwgs-1-1.clmp.fp2_repr.R1	3.0%	38%	139 bp	2.1
Sne-CCab_064-Ex1-7A-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	38%	136 bp	2.1
Sne-CCab_065-Ex1-7B-lcwgs-1-1.clmp.fp2_repr.R1	2.3%	38%	133 bp	1.0
Sne-CCab_065-Ex1-7B-lcwgs-1-1.clmp.fp2_repr.R2	1.9%	38%	130 bp	1.0
Sne-CCab_066-Ex1-7C-lcwgs-1-1.clmp.fp2_repr.R1	3.3%	38%	143 bp	1.9
Sne-CCab_066-Ex1-7C-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	38%	139 bp	1.9
Sne-CCab_067-Ex1-7D-lcwgs-1-1.clmp.fp2_repr.R1	3.4%	39%	143 bp	2.5
Sne-CCab_067-Ex1-7D-lcwgs-1-1.clmp.fp2_repr.R2	2.9%	39%	139 bp	2.5
Sne-CCab_068-Ex1-7E-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	38%	143 bp	1.6
Sne-CCab_068-Ex1-7E-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	38%	139 bp	1.6
Sne-CCab_069-Ex1-7F-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	38%	142 bp	1.8
Sne-CCab_069-Ex1-7F-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	38%	138 bp	1.8
Sne-CCab_070-Ex1-7G-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	38%	143 bp	1.3
Sne-CCab_070-Ex1-7G-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	38%	140 bp	1.3
Sne-CCab_071-Ex1-7H-lcwgs-1-1.clmp.fp2_repr.R1	2.2%	38%	135 bp	0.7
Sne-CCab_071-Ex1-7H-lcwgs-1-1.clmp.fp2_repr.R2	1.8%	38%	133 bp	0.7
Sne-CCab_072-Ex1-8A-lcwgs-1-1.clmp.fp2_repr.R1	2.1%	39%	132 bp	0.9
Sne-CCab_072-Ex1-8A-lcwgs-1-1.clmp.fp2_repr.R2	1.8%	39%	129 bp	0.9
Sne-CCab_073-Ex1-8B-lcwgs-1-1.clmp.fp2_repr.R1	2.1%	39%	131 bp	0.7
Sne-CCab_073-Ex1-8B-lcwgs-1-1.clmp.fp2_repr.R2	1.7%	39%	129 bp	0.7
Sne-CCab_074-Ex1-8C-lcwgs-1-1.clmp.fp2_repr.R1	0.2%	38%	137 bp	0.0
Sne-CCab_074-Ex1-8C-lcwgs-1-1.clmp.fp2_repr.R2	0.1%	39%	134 bp	0.0
Sne-CCab_075-Ex1-8D-lcwgs-1-1.clmp.fp2_repr.R1	2.5%	39%	138 bp	1.0
Sne-CCab_075-Ex1-8D-lcwgs-1-1.clmp.fp2_repr.R2	2.1%	39%	134 bp	1.0
Sne-CCab_076-Ex1-8E-lcwgs-1-1.clmp.fp2_repr.R1	3.3%	39%	144 bp	1.5
Sne-CCab_076-Ex1-8E-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	39%	140 bp	1.5
Sne-CCab_077-Ex1-8F-lcwgs-1-1.clmp.fp2_repr.R1	3.4%	38%	144 bp	1.6
Sne-CCab_077-Ex1-8F-lcwgs-1-1.clmp.fp2_repr.R2	2.8%	38%	140 bp	1.6
Sne-CCab_078-Ex1-8G-lcwgs-1-1.clmp.fp2_repr.R1	3.1%	38%	143 bp	1.6
Sne-CCab_078-Ex1-8G-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	38%	139 bp	1.6
Sne-CCab_079-Ex1-8H-lcwgs-1-1.clmp.fp2_repr.R1	2.8%	38%	141 bp	1.2
Sne-CCab_079-Ex1-8H-lcwgs-1-1.clmp.fp2_repr.R2	2.3%	38%	138 bp	1.2
```

</p>
</details>

## 14. Clean up
```bash
mkdir logs
mv *out logs/
```
