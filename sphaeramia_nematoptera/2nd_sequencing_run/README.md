## 1. Download data
Data downloaded from TAMUCC grid.

## 2. Proofread the decode files
Decode file format is correct. There are 92 forward reads and 92 reverse reads, all libraries are unique.

## 3. Edit the decode file
N/A, no formatting issue.

## 4. Make a copy of the fq_raw files
Used `screen` to copy the raw files to `/RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_nematoptera/2nd_sequencing_run/fq_raw`

## 5. Perform a renaming dry run.
<details><summary>Expand for output.</summary>

```bash
decode file read into memory
rename not specified, original and new file names will be printed to screen
bash renameFQGZ.bash Sne_LCWGS-testlane_SequenceNameDecode.tsv

if you want to rename then bash renameFQGZ.bash Sne_LCWGS-testlane_SequenceNameDecode.tsv rename

writing original file names to file, origFileNames.txt...
writing newFileNames.txt...
editing newFileNames.txt...
preview of orig and new R1 file names...
SnA0500109A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_001_Ex1-9A-lcwgs-1-1.1.fq.gz
SnA0500209B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_002_Ex1-9B-lcwgs-1-1.1.fq.gz
SnA0500309C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_003_Ex1-9C-lcwgs-1-1.1.fq.gz
SnA0500409D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_004_Ex1-9D-lcwgs-1-1.1.fq.gz
SnA0500509E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_005_Ex1-9E-lcwgs-1-1.1.fq.gz
SnA0500609F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_006_Ex1-9F-lcwgs-1-1.1.fq.gz
SnA0500709G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_007_Ex1-9G-lcwgs-1-1.1.fq.gz
SnA0500809H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_008_Ex1-9H-lcwgs-1-1.1.fq.gz
SnA0500910A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_009_Ex1-10A-lcwgs-1-1.1.fq.gz
SnA0501010B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_010_Ex1-10B-lcwgs-1-1.1.fq.gz
SnA0501110C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_011_Ex1-10C-lcwgs-1-1.1.fq.gz
SnA0501210D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_012_Ex1-10D-lcwgs-1-1.1.fq.gz
SnA0501310E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_013_Ex1-10E-lcwgs-1-1.1.fq.gz
SnA0501410F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_014_Ex1-10F-lcwgs-1-1.1.fq.gz
SnA0501510G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_015_Ex1-10G-lcwgs-1-1.1.fq.gz
SnA0501610H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_016_Ex1-10H-lcwgs-1-1.1.fq.gz
SnA0501711A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_017_Ex1-11A-lcwgs-1-1.1.fq.gz
SnA0501811B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_018_Ex1-11B-lcwgs-1-1.1.fq.gz
SnA0501911C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_019_Ex1-11C-lcwgs-1-1.1.fq.gz
SnA0502011D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_020_Ex1-11D-lcwgs-1-1.1.fq.gz
SnA0502111E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_021_Ex1-11E-lcwgs-1-1.1.fq.gz
SnA0502211F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_022_Ex1-11F-lcwgs-1-1.1.fq.gz
SnA0502311G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_023_Ex1-11G-lcwgs-1-1.1.fq.gz
SnA0502411H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_024_Ex1-11H-lcwgs-1-1.1.fq.gz
SnA0502512A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_025_Ex1-12A-lcwgs-1-1.1.fq.gz
SnA0502612B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_026_Ex1-12B-lcwgs-1-1.1.fq.gz
SnA0502712C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_027_Ex1-12C-lcwgs-1-1.1.fq.gz
SnA0502812D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-ABir_028_Ex1-12D-lcwgs-1-1.1.fq.gz
SnC0301601A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_016_Ex1-1A-lcwgs-1-1.1.fq.gz
SnC0301701B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_017_Ex1-1B-lcwgs-1-1.1.fq.gz
SnC0301801C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_018_Ex1-1C-lcwgs-1-1.1.fq.gz
SnC0301901D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_019_Ex1-1D-lcwgs-1-1.1.fq.gz
SnC0302001E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_020_Ex1-1E-lcwgs-1-1.1.fq.gz
SnC0302101F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_021_Ex1-1F-lcwgs-1-1.1.fq.gz
SnC0302201G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_022_Ex1-1G-lcwgs-1-1.1.fq.gz
SnC0302301H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_023_Ex1-1H-lcwgs-1-1.1.fq.gz
SnC0302402A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_024_Ex1-2A-lcwgs-1-1.1.fq.gz
SnC0302502B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_025_Ex1-2B-lcwgs-1-1.1.fq.gz
SnC0302602C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_026_Ex1-2C-lcwgs-1-1.1.fq.gz
SnC0302702D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_027_Ex1-2D-lcwgs-1-1.1.fq.gz
SnC0302802E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_028_Ex1-2E-lcwgs-1-1.1.fq.gz
SnC0302902F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_029_Ex1-2F-lcwgs-1-1.1.fq.gz
SnC0303002G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_030_Ex1-2G-lcwgs-1-1.1.fq.gz
SnC0303102H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_031_Ex1-2H-lcwgs-1-1.1.fq.gz
SnC0303203A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_032_Ex1-3A-lcwgs-1-1.1.fq.gz
SnC0303303B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_033_Ex1-3B-lcwgs-1-1.1.fq.gz
SnC0303403C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_034_Ex1-3C-lcwgs-1-1.1.fq.gz
SnC0303503D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_035_Ex1-3D-lcwgs-1-1.1.fq.gz
SnC0303603E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_036_Ex1-3E-lcwgs-1-1.1.fq.gz
SnC0303703F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_037_Ex1-3F-lcwgs-1-1.1.fq.gz
SnC0303803G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_038_Ex1-3G-lcwgs-1-1.1.fq.gz
SnC0303903H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_039_Ex1-3H-lcwgs-1-1.1.fq.gz
SnC0304004A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_040_Ex1-4A-lcwgs-1-1.1.fq.gz
SnC0304104B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_041_Ex1-4B-lcwgs-1-1.1.fq.gz
SnC0304204C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_042_Ex1-4C-lcwgs-1-1.1.fq.gz
SnC0304304D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_043_Ex1-4D-lcwgs-1-1.1.fq.gz
SnC0304404E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_044_Ex1-4E-lcwgs-1-1.1.fq.gz
SnC0304504F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_045_Ex1-4F-lcwgs-1-1.1.fq.gz
SnC0304604G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_046_Ex1-4G-lcwgs-1-1.1.fq.gz
SnC0304704H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_047_Ex1-4H-lcwgs-1-1.1.fq.gz
SnC0304805A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_048_Ex1-5A-lcwgs-1-1.1.fq.gz
SnC0304905B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_049_Ex1-5B-lcwgs-1-1.1.fq.gz
SnC0305005C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_050_Ex1-5C-lcwgs-1-1.1.fq.gz
SnC0305105D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_051_Ex1-5D-lcwgs-1-1.1.fq.gz
SnC0305205E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_052_Ex1-5E-lcwgs-1-1.1.fq.gz
SnC0305305F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_053_Ex1-5F-lcwgs-1-1.1.fq.gz
SnC0305405G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_054_Ex1-5G-lcwgs-1-1.1.fq.gz
SnC0305505H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_055_Ex1-5H-lcwgs-1-1.1.fq.gz
SnC0305606A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_056_Ex1-6A-lcwgs-1-1.1.fq.gz
SnC0305706B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_057_Ex1-6B-lcwgs-1-1.1.fq.gz
SnC0305806C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_058_Ex1-6C-lcwgs-1-1.1.fq.gz
SnC0305906D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_059_Ex1-6D-lcwgs-1-1.1.fq.gz
SnC0306006E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_060_Ex1-6E-lcwgs-1-1.1.fq.gz
SnC0306106F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_061_Ex1-6F-lcwgs-1-1.1.fq.gz
SnC0306206G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_062_Ex1-6G-lcwgs-1-1.1.fq.gz
SnC0306306H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_063_Ex1-6H-lcwgs-1-1.1.fq.gz
SnC0306407A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_064_Ex1-7A-lcwgs-1-1.1.fq.gz
SnC0306507B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_065_Ex1-7B-lcwgs-1-1.1.fq.gz
SnC0306607C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_066_Ex1-7C-lcwgs-1-1.1.fq.gz
SnC0306707D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_067_Ex1-7D-lcwgs-1-1.1.fq.gz
SnC0306807E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_068_Ex1-7E-lcwgs-1-1.1.fq.gz
SnC0306907F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_069_Ex1-7F-lcwgs-1-1.1.fq.gz
SnC0307007G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_070_Ex1-7G-lcwgs-1-1.1.fq.gz
SnC0307107H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_071_Ex1-7H-lcwgs-1-1.1.fq.gz
SnC0307208A_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_072_Ex1-8A-lcwgs-1-1.1.fq.gz
SnC0307308B_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_073_Ex1-8B-lcwgs-1-1.1.fq.gz
SnC0307408C_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_074_Ex1-8C-lcwgs-1-1.1.fq.gz
SnC0307508D_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_075_Ex1-8D-lcwgs-1-1.1.fq.gz
SnC0307608E_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_076_Ex1-8E-lcwgs-1-1.1.fq.gz
SnC0307708F_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_077_Ex1-8F-lcwgs-1-1.1.fq.gz
SnC0307808G_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_078_Ex1-8G-lcwgs-1-1.1.fq.gz
SnC0307908H_CKDL230020793-1A_HJFFNCCX2_L4_1.fq.gz Sne-CCab_079_Ex1-8H-lcwgs-1-1.1.fq.gz
preview of orig and new R2 file names...
SnA0500109A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_001_Ex1-9A-lcwgs-1-1.2.fq.gz
SnA0500209B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_002_Ex1-9B-lcwgs-1-1.2.fq.gz
SnA0500309C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_003_Ex1-9C-lcwgs-1-1.2.fq.gz
SnA0500409D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_004_Ex1-9D-lcwgs-1-1.2.fq.gz
SnA0500509E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_005_Ex1-9E-lcwgs-1-1.2.fq.gz
SnA0500609F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_006_Ex1-9F-lcwgs-1-1.2.fq.gz
SnA0500709G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_007_Ex1-9G-lcwgs-1-1.2.fq.gz
SnA0500809H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_008_Ex1-9H-lcwgs-1-1.2.fq.gz
SnA0500910A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_009_Ex1-10A-lcwgs-1-1.2.fq.gz
SnA0501010B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_010_Ex1-10B-lcwgs-1-1.2.fq.gz
SnA0501110C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_011_Ex1-10C-lcwgs-1-1.2.fq.gz
SnA0501210D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_012_Ex1-10D-lcwgs-1-1.2.fq.gz
SnA0501310E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_013_Ex1-10E-lcwgs-1-1.2.fq.gz
SnA0501410F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_014_Ex1-10F-lcwgs-1-1.2.fq.gz
SnA0501510G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_015_Ex1-10G-lcwgs-1-1.2.fq.gz
SnA0501610H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_016_Ex1-10H-lcwgs-1-1.2.fq.gz
SnA0501711A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_017_Ex1-11A-lcwgs-1-1.2.fq.gz
SnA0501811B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_018_Ex1-11B-lcwgs-1-1.2.fq.gz
SnA0501911C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_019_Ex1-11C-lcwgs-1-1.2.fq.gz
SnA0502011D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_020_Ex1-11D-lcwgs-1-1.2.fq.gz
SnA0502111E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_021_Ex1-11E-lcwgs-1-1.2.fq.gz
SnA0502211F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_022_Ex1-11F-lcwgs-1-1.2.fq.gz
SnA0502311G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_023_Ex1-11G-lcwgs-1-1.2.fq.gz
SnA0502411H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_024_Ex1-11H-lcwgs-1-1.2.fq.gz
SnA0502512A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_025_Ex1-12A-lcwgs-1-1.2.fq.gz
SnA0502612B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_026_Ex1-12B-lcwgs-1-1.2.fq.gz
SnA0502712C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_027_Ex1-12C-lcwgs-1-1.2.fq.gz
SnA0502812D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-ABir_028_Ex1-12D-lcwgs-1-1.2.fq.gz
SnC0301601A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_016_Ex1-1A-lcwgs-1-1.2.fq.gz
SnC0301701B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_017_Ex1-1B-lcwgs-1-1.2.fq.gz
SnC0301801C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_018_Ex1-1C-lcwgs-1-1.2.fq.gz
SnC0301901D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_019_Ex1-1D-lcwgs-1-1.2.fq.gz
SnC0302001E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_020_Ex1-1E-lcwgs-1-1.2.fq.gz
SnC0302101F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_021_Ex1-1F-lcwgs-1-1.2.fq.gz
SnC0302201G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_022_Ex1-1G-lcwgs-1-1.2.fq.gz
SnC0302301H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_023_Ex1-1H-lcwgs-1-1.2.fq.gz
SnC0302402A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_024_Ex1-2A-lcwgs-1-1.2.fq.gz
SnC0302502B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_025_Ex1-2B-lcwgs-1-1.2.fq.gz
SnC0302602C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_026_Ex1-2C-lcwgs-1-1.2.fq.gz
SnC0302702D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_027_Ex1-2D-lcwgs-1-1.2.fq.gz
SnC0302802E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_028_Ex1-2E-lcwgs-1-1.2.fq.gz
SnC0302902F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_029_Ex1-2F-lcwgs-1-1.2.fq.gz
SnC0303002G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_030_Ex1-2G-lcwgs-1-1.2.fq.gz
SnC0303102H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_031_Ex1-2H-lcwgs-1-1.2.fq.gz
SnC0303203A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_032_Ex1-3A-lcwgs-1-1.2.fq.gz
SnC0303303B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_033_Ex1-3B-lcwgs-1-1.2.fq.gz
SnC0303403C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_034_Ex1-3C-lcwgs-1-1.2.fq.gz
SnC0303503D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_035_Ex1-3D-lcwgs-1-1.2.fq.gz
SnC0303603E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_036_Ex1-3E-lcwgs-1-1.2.fq.gz
SnC0303703F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_037_Ex1-3F-lcwgs-1-1.2.fq.gz
SnC0303803G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_038_Ex1-3G-lcwgs-1-1.2.fq.gz
SnC0303903H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_039_Ex1-3H-lcwgs-1-1.2.fq.gz
SnC0304004A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_040_Ex1-4A-lcwgs-1-1.2.fq.gz
SnC0304104B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_041_Ex1-4B-lcwgs-1-1.2.fq.gz
SnC0304204C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_042_Ex1-4C-lcwgs-1-1.2.fq.gz
SnC0304304D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_043_Ex1-4D-lcwgs-1-1.2.fq.gz
SnC0304404E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_044_Ex1-4E-lcwgs-1-1.2.fq.gz
SnC0304504F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_045_Ex1-4F-lcwgs-1-1.2.fq.gz
SnC0304604G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_046_Ex1-4G-lcwgs-1-1.2.fq.gz
SnC0304704H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_047_Ex1-4H-lcwgs-1-1.2.fq.gz
SnC0304805A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_048_Ex1-5A-lcwgs-1-1.2.fq.gz
SnC0304905B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_049_Ex1-5B-lcwgs-1-1.2.fq.gz
SnC0305005C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_050_Ex1-5C-lcwgs-1-1.2.fq.gz
SnC0305105D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_051_Ex1-5D-lcwgs-1-1.2.fq.gz
SnC0305205E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_052_Ex1-5E-lcwgs-1-1.2.fq.gz
SnC0305305F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_053_Ex1-5F-lcwgs-1-1.2.fq.gz
SnC0305405G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_054_Ex1-5G-lcwgs-1-1.2.fq.gz
SnC0305505H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_055_Ex1-5H-lcwgs-1-1.2.fq.gz
SnC0305606A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_056_Ex1-6A-lcwgs-1-1.2.fq.gz
SnC0305706B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_057_Ex1-6B-lcwgs-1-1.2.fq.gz
SnC0305806C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_058_Ex1-6C-lcwgs-1-1.2.fq.gz
SnC0305906D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_059_Ex1-6D-lcwgs-1-1.2.fq.gz
SnC0306006E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_060_Ex1-6E-lcwgs-1-1.2.fq.gz
SnC0306106F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_061_Ex1-6F-lcwgs-1-1.2.fq.gz
SnC0306206G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_062_Ex1-6G-lcwgs-1-1.2.fq.gz
SnC0306306H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_063_Ex1-6H-lcwgs-1-1.2.fq.gz
SnC0306407A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_064_Ex1-7A-lcwgs-1-1.2.fq.gz
SnC0306507B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_065_Ex1-7B-lcwgs-1-1.2.fq.gz
SnC0306607C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_066_Ex1-7C-lcwgs-1-1.2.fq.gz
SnC0306707D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_067_Ex1-7D-lcwgs-1-1.2.fq.gz
SnC0306807E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_068_Ex1-7E-lcwgs-1-1.2.fq.gz
SnC0306907F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_069_Ex1-7F-lcwgs-1-1.2.fq.gz
SnC0307007G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_070_Ex1-7G-lcwgs-1-1.2.fq.gz
SnC0307107H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_071_Ex1-7H-lcwgs-1-1.2.fq.gz
SnC0307208A_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_072_Ex1-8A-lcwgs-1-1.2.fq.gz
SnC0307308B_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_073_Ex1-8B-lcwgs-1-1.2.fq.gz
SnC0307408C_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_074_Ex1-8C-lcwgs-1-1.2.fq.gz
SnC0307508D_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_075_Ex1-8D-lcwgs-1-1.2.fq.gz
SnC0307608E_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_076_Ex1-8E-lcwgs-1-1.2.fq.gz
SnC0307708F_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_077_Ex1-8F-lcwgs-1-1.2.fq.gz
SnC0307808G_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_078_Ex1-8G-lcwgs-1-1.2.fq.gz
SnC0307908H_CKDL230020793-1A_HJFFNCCX2_L4_2.fq.gz Sne-CCab_079_Ex1-8H-lcwgs-1-1.2.fq.gz
```
</p>
</details>

## 6. Rename the files for real
Files successfully renamed.

## 7. Check the quality of your data.
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report"  "fq.gz"`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	M Seqs
Sne-ABir_002_Ex1-9B-lcwgs-1-1.1	19.2%	49%	0.0
Sne-ABir_002_Ex1-9B-lcwgs-1-1.2	17.8%	49%	0.0
Sne-ABir_003_Ex1-9C-lcwgs-1-1.1	28.2%	52%	1.1
Sne-ABir_003_Ex1-9C-lcwgs-1-1.2	24.8%	53%	1.1
Sne-ABir_004_Ex1-9D-lcwgs-1-1.1	32.4%	48%	0.2
Sne-ABir_004_Ex1-9D-lcwgs-1-1.2	28.4%	48%	0.2
Sne-ABir_005_Ex1-9E-lcwgs-1-1.1	33.6%	53%	0.1
Sne-ABir_005_Ex1-9E-lcwgs-1-1.2	30.7%	53%	0.1
Sne-ABir_006_Ex1-9F-lcwgs-1-1.1	21.5%	53%	0.0
Sne-ABir_006_Ex1-9F-lcwgs-1-1.2	19.0%	54%	0.0
Sne-ABir_007_Ex1-9G-lcwgs-1-1.1	20.9%	53%	0.2
Sne-ABir_007_Ex1-9G-lcwgs-1-1.2	18.7%	53%	0.2
Sne-ABir_008_Ex1-9H-lcwgs-1-1.1	65.1%	53%	0.6
Sne-ABir_008_Ex1-9H-lcwgs-1-1.2	57.9%	53%	0.6
Sne-ABir_009_Ex1-10A-lcwgs-1-1.1	20.9%	53%	0.6
Sne-ABir_010_Ex1-10B-lcwgs-1-1.1	19.3%	54%	0.4
Sne-ABir_011_Ex1-10C-lcwgs-1-1.2	15.0%	39%	2.0
Sne-ABir_014_Ex1-10F-lcwgs-1-1.2	15.9%	38%	2.0
Sne-ABir_015_Ex1-10G-lcwgs-1-1.2	14.5%	39%	3.0
Sne-ABir_021_Ex1-11E-lcwgs-1-1.2	23.4%	39%	3.1
Sne-ABir_027_Ex1-12C-lcwgs-1-1.1	25.8%	39%	2.4
Sne-ABir_027_Ex1-12C-lcwgs-1-1.2	23.1%	39%	2.4
Sne-ABir_028_Ex1-12D-lcwgs-1-1.1	53.0%	46%	1.5
Sne-ABir_028_Ex1-12D-lcwgs-1-1.2	48.2%	46%	1.5
Sne-CCab_016_Ex1-1A-lcwgs-1-1.1	14.0%	39%	2.0
Sne-CCab_016_Ex1-1A-lcwgs-1-1.2	12.0%	40%	2.0
Sne-CCab_017_Ex1-1B-lcwgs-1-1.1	14.4%	40%	1.5
Sne-CCab_017_Ex1-1B-lcwgs-1-1.2	12.5%	40%	1.5
Sne-CCab_018_Ex1-1C-lcwgs-1-1.1	14.0%	40%	1.7
Sne-CCab_019_Ex1-1D-lcwgs-1-1.1	15.7%	40%	2.7
Sne-CCab_019_Ex1-1D-lcwgs-1-1.2	13.4%	40%	2.7
Sne-CCab_020_Ex1-1E-lcwgs-1-1.2	13.4%	40%	2.3
Sne-CCab_021_Ex1-1F-lcwgs-1-1.1	18.5%	38%	3.4
Sne-CCab_021_Ex1-1F-lcwgs-1-1.2	15.7%	38%	3.4
Sne-CCab_022_Ex1-1G-lcwgs-1-1.1	15.9%	39%	3.3
Sne-CCab_022_Ex1-1G-lcwgs-1-1.2	13.7%	39%	3.3
Sne-CCab_023_Ex1-1H-lcwgs-1-1.1	15.4%	39%	2.7
Sne-CCab_024_Ex1-2A-lcwgs-1-1.1	12.9%	39%	2.5
Sne-CCab_024_Ex1-2A-lcwgs-1-1.2	11.1%	39%	2.5
Sne-CCab_025_Ex1-2B-lcwgs-1-1.1	13.4%	39%	2.3
Sne-CCab_025_Ex1-2B-lcwgs-1-1.2	11.7%	39%	2.3
Sne-CCab_026_Ex1-2C-lcwgs-1-1.1	14.7%	38%	3.4
Sne-CCab_026_Ex1-2C-lcwgs-1-1.2	12.6%	39%	3.4
Sne-CCab_027_Ex1-2D-lcwgs-1-1.1	13.4%	39%	1.9
Sne-CCab_027_Ex1-2D-lcwgs-1-1.2	11.4%	39%	1.9
Sne-CCab_028_Ex1-2E-lcwgs-1-1.1	15.4%	39%	2.2
Sne-CCab_028_Ex1-2E-lcwgs-1-1.2	13.2%	39%	2.2
Sne-CCab_029_Ex1-2F-lcwgs-1-1.1	14.9%	39%	2.6
Sne-CCab_030_Ex1-2G-lcwgs-1-1.1	14.6%	39%	1.9
Sne-CCab_030_Ex1-2G-lcwgs-1-1.2	12.5%	39%	1.9
Sne-CCab_031_Ex1-2H-lcwgs-1-1.1	13.0%	40%	1.1
Sne-CCab_031_Ex1-2H-lcwgs-1-1.2	11.3%	40%	1.1
Sne-CCab_032_Ex1-3A-lcwgs-1-1.1	14.9%	39%	2.8
Sne-CCab_032_Ex1-3A-lcwgs-1-1.2	12.8%	39%	2.8
Sne-CCab_033_Ex1-3B-lcwgs-1-1.1	15.0%	39%	2.4
Sne-CCab_033_Ex1-3B-lcwgs-1-1.2	12.9%	39%	2.4
Sne-CCab_034_Ex1-3C-lcwgs-1-1.1	15.9%	38%	4.5
Sne-CCab_035_Ex1-3D-lcwgs-1-1.1	15.5%	38%	3.3
Sne-CCab_036_Ex1-3E-lcwgs-1-1.2	13.5%	39%	2.7
Sne-CCab_037_Ex1-3F-lcwgs-1-1.1	15.4%	39%	2.5
Sne-CCab_037_Ex1-3F-lcwgs-1-1.2	13.5%	39%	2.5
Sne-CCab_038_Ex1-3G-lcwgs-1-1.1	15.5%	39%	3.2
Sne-CCab_038_Ex1-3G-lcwgs-1-1.2	13.3%	39%	3.2
Sne-CCab_039_Ex1-3H-lcwgs-1-1.1	14.5%	39%	2.2
Sne-CCab_039_Ex1-3H-lcwgs-1-1.2	12.5%	39%	2.2
Sne-CCab_040_Ex1-4A-lcwgs-1-1.2	11.3%	39%	2.6
Sne-CCab_041_Ex1-4B-lcwgs-1-1.1	12.8%	39%	1.5
Sne-CCab_041_Ex1-4B-lcwgs-1-1.2	11.0%	39%	1.5
Sne-CCab_042_Ex1-4C-lcwgs-1-1.1	12.7%	39%	1.4
Sne-CCab_042_Ex1-4C-lcwgs-1-1.2	11.0%	39%	1.4
Sne-CCab_043_Ex1-4D-lcwgs-1-1.1	13.8%	39%	2.3
Sne-CCab_043_Ex1-4D-lcwgs-1-1.2	11.7%	39%	2.3
Sne-CCab_044_Ex1-4E-lcwgs-1-1.1	15.4%	40%	1.4
Sne-CCab_044_Ex1-4E-lcwgs-1-1.2	13.3%	40%	1.4
Sne-CCab_045_Ex1-4F-lcwgs-1-1.1	14.5%	39%	1.9
Sne-CCab_045_Ex1-4F-lcwgs-1-1.2	12.5%	39%	1.9
Sne-CCab_046_Ex1-4G-lcwgs-1-1.1	12.2%	40%	0.8
Sne-CCab_046_Ex1-4G-lcwgs-1-1.2	11.0%	40%	0.8
Sne-CCab_047_Ex1-4H-lcwgs-1-1.1	13.4%	40%	1.2
Sne-CCab_047_Ex1-4H-lcwgs-1-1.2	11.5%	40%	1.2
Sne-CCab_048_Ex1-5A-lcwgs-1-1.1	13.9%	39%	2.6
Sne-CCab_048_Ex1-5A-lcwgs-1-1.2	12.1%	39%	2.6
Sne-CCab_049_Ex1-5B-lcwgs-1-1.1	12.4%	40%	1.3
Sne-CCab_049_Ex1-5B-lcwgs-1-1.2	10.9%	40%	1.3
Sne-CCab_050_Ex1-5C-lcwgs-1-1.1	13.9%	39%	2.3
Sne-CCab_050_Ex1-5C-lcwgs-1-1.2	12.0%	39%	2.3
Sne-CCab_051_Ex1-5D-lcwgs-1-1.1	14.2%	40%	1.2
Sne-CCab_051_Ex1-5D-lcwgs-1-1.2	12.4%	40%	1.2
Sne-CCab_052_Ex1-5E-lcwgs-1-1.1	14.1%	40%	1.3
Sne-CCab_052_Ex1-5E-lcwgs-1-1.2	12.1%	40%	1.3
Sne-CCab_053_Ex1-5F-lcwgs-1-1.1	14.3%	40%	1.3
Sne-CCab_053_Ex1-5F-lcwgs-1-1.2	12.4%	40%	1.3
Sne-CCab_054_Ex1-5G-lcwgs-1-1.1	16.3%	40%	1.6
Sne-CCab_054_Ex1-5G-lcwgs-1-1.2	14.2%	40%	1.6
Sne-CCab_055_Ex1-5H-lcwgs-1-1.1	15.6%	40%	0.9
Sne-CCab_055_Ex1-5H-lcwgs-1-1.2	13.8%	40%	0.9
Sne-CCab_056_Ex1-6A-lcwgs-1-1.1	13.0%	39%	2.3
Sne-CCab_056_Ex1-6A-lcwgs-1-1.2	11.3%	40%	2.3
Sne-CCab_057_Ex1-6B-lcwgs-1-1.1	13.6%	40%	2.0
Sne-CCab_057_Ex1-6B-lcwgs-1-1.2	11.7%	40%	2.0
Sne-CCab_058_Ex1-6C-lcwgs-1-1.1	13.4%	39%	2.6
Sne-CCab_058_Ex1-6C-lcwgs-1-1.2	11.5%	39%	2.6
Sne-CCab_059_Ex1-6D-lcwgs-1-1.1	13.0%	39%	1.5
Sne-CCab_059_Ex1-6D-lcwgs-1-1.2	11.2%	40%	1.5
Sne-CCab_060_Ex1-6E-lcwgs-1-1.1	14.3%	39%	2.1
Sne-CCab_060_Ex1-6E-lcwgs-1-1.2	12.2%	39%	2.1
Sne-CCab_061_Ex1-6F-lcwgs-1-1.1	14.9%	39%	1.9
Sne-CCab_061_Ex1-6F-lcwgs-1-1.2	12.8%	39%	1.9
Sne-CCab_062_Ex1-6G-lcwgs-1-1.1	13.6%	40%	0.8
Sne-CCab_062_Ex1-6G-lcwgs-1-1.2	12.0%	40%	0.8
Sne-CCab_063_Ex1-6H-lcwgs-1-1.1	12.8%	40%	1.5
Sne-CCab_063_Ex1-6H-lcwgs-1-1.2	11.2%	40%	1.5
Sne-CCab_064_Ex1-7A-lcwgs-1-1.1	13.4%	39%	2.7
Sne-CCab_064_Ex1-7A-lcwgs-1-1.2	11.6%	39%	2.7
Sne-CCab_065_Ex1-7B-lcwgs-1-1.1	14.3%	40%	1.3
Sne-CCab_065_Ex1-7B-lcwgs-1-1.2	12.5%	40%	1.3
Sne-CCab_066_Ex1-7C-lcwgs-1-1.1	14.9%	39%	2.6
Sne-CCab_066_Ex1-7C-lcwgs-1-1.2	12.8%	39%	2.6
Sne-CCab_067_Ex1-7D-lcwgs-1-1.1	14.2%	39%	3.4
Sne-CCab_067_Ex1-7D-lcwgs-1-1.2	12.1%	39%	3.4
Sne-CCab_068_Ex1-7E-lcwgs-1-1.1	16.0%	39%	2.1
Sne-CCab_068_Ex1-7E-lcwgs-1-1.2	13.6%	39%	2.1
Sne-CCab_069_Ex1-7F-lcwgs-1-1.1	15.0%	39%	2.4
Sne-CCab_069_Ex1-7F-lcwgs-1-1.2	13.0%	39%	2.4
Sne-CCab_070_Ex1-7G-lcwgs-1-1.1	14.0%	38%	1.8
Sne-CCab_070_Ex1-7G-lcwgs-1-1.2	12.1%	38%	1.8
Sne-CCab_071_Ex1-7H-lcwgs-1-1.1	12.0%	39%	0.9
Sne-CCab_071_Ex1-7H-lcwgs-1-1.2	10.7%	40%	0.9
Sne-CCab_072_Ex1-8A-lcwgs-1-1.1	14.2%	41%	1.2
Sne-CCab_072_Ex1-8A-lcwgs-1-1.2	12.5%	41%	1.2
Sne-CCab_073_Ex1-8B-lcwgs-1-1.1	13.3%	41%	0.9
Sne-CCab_073_Ex1-8B-lcwgs-1-1.2	11.7%	41%	0.9
Sne-CCab_074_Ex1-8C-lcwgs-1-1.1	2.4%	40%	0.0
Sne-CCab_074_Ex1-8C-lcwgs-1-1.2	2.0%	40%	0.0
Sne-CCab_075_Ex1-8D-lcwgs-1-1.1	14.5%	40%	1.3
Sne-CCab_075_Ex1-8D-lcwgs-1-1.2	12.6%	40%	1.3
Sne-CCab_076_Ex1-8E-lcwgs-1-1.1	14.0%	39%	2.0
Sne-CCab_076_Ex1-8E-lcwgs-1-1.2	11.9%	39%	2.0
Sne-CCab_077_Ex1-8F-lcwgs-1-1.1	15.3%	38%	2.2
Sne-CCab_077_Ex1-8F-lcwgs-1-1.2	13.3%	38%	2.2
Sne-CCab_078_Ex1-8G-lcwgs-1-1.1	17.9%	39%	2.2
Sne-CCab_078_Ex1-8G-lcwgs-1-1.2	15.3%	39%	2.2
Sne-CCab_079_Ex1-8H-lcwgs-1-1.1	16.0%	39%	1.7
Sne-CCab_079_Ex1-8H-lcwgs-1-1.2	13.8%	39%	1.7
```
</p>
</details>

## 8. First trim.
`sbatch ../../../pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1`

<details><summary>Expand for MultiQC Output.</summary>

```bash


```
</p>
</details>

## 9. Remove duplicates with clumpify.

### 9a. Remove duplicates.


### 9b. Check duplicate removal success.


### 9c. Generate metadata on deduplicated FASTQ files.

<details><summary>Expand for MultiQC Output.</summary>

```bash
Insert output here.
```
  
</p>
</details>

## 10. Second trim.


<details><summary>Expand for MultiQC Output.</summary>

```bash

```

</p>
</details>

## 11. Decontaminate files.


<details><summary>Expand for MultiQC Output.</summary>

```bash
insert multiqc output here
```

</p>
</details>

## 12. Execute RePair


<details><summary>Expand for MultiQC Output.</summary>

```bash
Insert output here.
```

</p>
</details>
