## 1. Download data
Data downloaded from TAMUCC grid at https://gridftp.tamucc.edu/genomics/20230602_PIRE-Sde-lcwgs-testlane/

## 2. Proofread the decode files
Formatting is decode file is correct. There are 134 forward reads and 134 reverse reads. All libraries are unique.

## 3. Edit the decode file
N/A, no formatting issue.

## 4. Make a copy of the fq_raw files
Used `screen` to copy the raw files to `/RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/spratelloides_delicatulus/2nd_sequencing_run/fq_raw`

## 5. Perform a renaming dry run.
<details><summary>Expand for output.</summary>

```bash
decode file read into memory
rename not specified, original and new file names will be printed to screen
bash renameFQGZ.bash Sde-LCWGS-TestLane_SequenceNameDecode.tsv

if you want to rename then bash renameFQGZ.bash Sde-LCWGS-TestLane_SequenceNameDecode.tsv rename

writing original file names to file, origFileNames.txt...
writing newFileNames.txt...
editing newFileNames.txt...
preview of orig and new R1 file names...
SdA1101301B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_013-Ex1-1B-lcwgs-1-1.1.fq.gz
SdA1101402B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_014-Ex1-2B-lcwgs-1-1.1.fq.gz
SdA1101503B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_015-Ex1-3B-lcwgs-1-1.1.fq.gz
SdA1101604B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_016-Ex1-4B-lcwgs-1-1.1.fq.gz
SdA1101705B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_017-Ex1-5B-lcwgs-1-1.1.fq.gz
SdA1101806B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_018-Ex1-6B-lcwgs-1-1.1.fq.gz
SdA1101907B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_019-Ex1-7B-lcwgs-1-1.1.fq.gz
SdA1102008B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_020-Ex1-8B-lcwgs-1-1.1.fq.gz
SdA1102109B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_021-Ex1-9B-lcwgs-1-1.1.fq.gz
SdA1102210B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_022-Ex1-10B-lcwgs-1-1.1.fq.gz
SdA1102311B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_023-Ex1-11B-lcwgs-1-1.1.fq.gz
SdA1102412B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_024-Ex1-12B-lcwgs-1-1.1.fq.gz
SdA1102602C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_026-Ex1-2C-lcwgs-1-1.1.fq.gz
SdA1102703C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_027-Ex1-3C-lcwgs-1-1.1.fq.gz
SdA1102804C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_028-Ex1-4C-lcwgs-1-1.1.fq.gz
SdA1102905C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_029-Ex1-5C-lcwgs-1-1.1.fq.gz
SdA1103006C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_030-Ex1-6C-lcwgs-1-1.1.fq.gz
SdA1103107C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_031-Ex1-7C-lcwgs-1-1.1.fq.gz
SdA1103208C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_032-Ex1-8C-lcwgs-1-1.1.fq.gz
SdA1103309C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_033-Ex1-9C-lcwgs-1-1.1.fq.gz
SdA1103410C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_034-Ex1-10C-lcwgs-1-1.1.fq.gz
SdA1103612C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_036-Ex1-12C-lcwgs-1-1.1.fq.gz
SdA1103701D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_037-Ex1-1D-lcwgs-1-1.1.fq.gz
SdA1103802D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_038-Ex1-2D-lcwgs-1-1.1.fq.gz
SdA1103903D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_039-Ex1-3D-lcwgs-1-1.1.fq.gz
SdA1104004D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_040-Ex1-4D-lcwgs-1-1.1.fq.gz
SdA1104105D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_041-Ex1-5D-lcwgs-1-1.1.fq.gz
SdA1104206D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_042-Ex1-6D-lcwgs-1-1.1.fq.gz
SdA1104408D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_044-Ex1-8D-lcwgs-1-1.1.fq.gz
SdA1104610D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_046-Ex1-10D-lcwgs-1-1.1.fq.gz
SdA1104711D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_047-Ex1-11D-lcwgs-1-1.1.fq.gz
SdA1104812D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_048-Ex1-12D-lcwgs-1-1.1.fq.gz
SdA1104901E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_049-Ex1-1E-lcwgs-1-1.1.fq.gz
SdA1105002E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_050-Ex1-2E-lcwgs-1-1.1.fq.gz
SdA1105103E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_051-Ex1-3E-lcwgs-1-1.1.fq.gz
SdA1105305E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_053-Ex1-5E-lcwgs-1-1.1.fq.gz
SdA1105406E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_054-Ex1-6E-lcwgs-1-1.1.fq.gz
SdA1105507E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_055-Ex1-7E-lcwgs-1-1.1.fq.gz
SdA1105608E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_056-Ex1-8E-lcwgs-1-1.1.fq.gz
SdA1105709E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_057-Ex1-9E-lcwgs-1-1.1.fq.gz
SdA1105810E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_058-Ex1-10E-lcwgs-1-1.1.fq.gz
SdA1105911E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_059-Ex1-11E-lcwgs-1-1.1.fq.gz
SdA1106012E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_060-Ex1-12E-lcwgs-1-1.1.fq.gz
SdA1106101F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_061-Ex1-1F-lcwgs-1-1.1.fq.gz
SdA1106202F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_062-Ex1-2F-lcwgs-1-1.1.fq.gz
SdA1106303F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_063-Ex1-3F-lcwgs-1-1.1.fq.gz
SdA1106404F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_064-Ex1-4F-lcwgs-1-1.1.fq.gz
SdA1106505F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_065-Ex1-5F-lcwgs-1-1.1.fq.gz
SdA1106707F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_067-Ex1-7F-lcwgs-1-1.1.fq.gz
SdA1106808F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_068-Ex1-8F-lcwgs-1-1.1.fq.gz
SdA1106909F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_069-Ex1-9F-lcwgs-1-1.1.fq.gz
SdA1107010F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_070-Ex1-10F-lcwgs-1-1.1.fq.gz
SdA1107111F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_071-Ex1-11F-lcwgs-1-1.1.fq.gz
SdA1107212F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_072-Ex1-12F-lcwgs-1-1.1.fq.gz
SdA1107301G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_073-Ex1-1G-lcwgs-1-1.1.fq.gz
SdA1107402G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_074-Ex1-2G-lcwgs-1-1.1.fq.gz
SdA1107503G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_075-Ex1-3G-lcwgs-1-1.1.fq.gz
SdA1107705G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_077-Ex1-5G-lcwgs-1-1.1.fq.gz
SdA1107806G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_078-Ex1-6G-lcwgs-1-1.1.fq.gz
SdA1107907G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_079-Ex1-7G-lcwgs-1-1.1.fq.gz
SdA1108008G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_080-Ex1-8G-lcwgs-1-1.1.fq.gz
SdA1108109G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_081-Ex1-9G-lcwgs-1-1.1.fq.gz
SdA1108210G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_082-Ex1-10G-lcwgs-1-1.1.fq.gz
SdA1108311G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_083-Ex1-11G-lcwgs-1-1.1.fq.gz
SdA1108412G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_084-Ex1-12G-lcwgs-1-1.1.fq.gz
SdA1108703H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_087-Ex1-3H-lcwgs-1-1.1.fq.gz
SdA1108804H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_088-Ex1-4H-lcwgs-1-1.1.fq.gz
SdA1109006H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_090-Ex1-6H-lcwgs-1-1.1.fq.gz
SdA1109107H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_091-Ex1-7H-lcwgs-1-1.1.fq.gz
SdA1109208H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_092-Ex1-8H-lcwgs-1-1.1.fq.gz
SdA1109511H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-ABol_095-Ex1-11H-lcwgs-1-1.1.fq.gz
SdC0800302G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_003-Ex1-2G-lcwgs-1-1.1.fq.gz
SdC0800402E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_004-Ex1-2E-lcwgs-1-1.1.fq.gz
SdC0800504D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_005-Ex1-4D-lcwgs-1-1.1.fq.gz
SdC0800604B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_006-Ex1-4B-lcwgs-1-1.1.fq.gz
SdC0800903G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_009-Ex1-3G-lcwgs-1-1.1.fq.gz
SdC0801001D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_010-Ex1-1D-lcwgs-1-1.1.fq.gz
SdC0801104G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_011-Ex1-4G-lcwgs-1-1.1.fq.gz
SdC0801303H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_013-Ex1-3H-lcwgs-1-1.1.fq.gz
SdC0801501B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_015-Ex1-1B-lcwgs-1-1.1.fq.gz
SdC0801608A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_016-Ex1-8A-lcwgs-1-1.1.fq.gz
SdC0801701F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_017-Ex1-1F-lcwgs-1-1.1.fq.gz
SdC0801806G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_018-Ex1-6G-lcwgs-1-1.1.fq.gz
SdC0801905A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_019-Ex1-5A-lcwgs-1-1.1.fq.gz
SdC0802001C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_020-Ex1-1C-lcwgs-1-1.1.fq.gz
SdC0802104A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_021-Ex1-4A-lcwgs-1-1.1.fq.gz
SdC0802205G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_022-Ex1-5G-lcwgs-1-1.1.fq.gz
SdC0802307E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_023-Ex1-7E-lcwgs-1-1.1.fq.gz
SdC0802404C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_024-Ex1-4C-lcwgs-1-1.1.fq.gz
SdC0802503C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_025-Ex1-3C-lcwgs-1-1.1.fq.gz
SdC0802605E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_026-Ex1-5E-lcwgs-1-1.1.fq.gz
SdC0802708H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_027-Ex1-8H-lcwgs-1-1.1.fq.gz
SdC0802806H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_028-Ex1-6H-lcwgs-1-1.1.fq.gz
SdC0802907F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_029-Ex1-7F-lcwgs-1-1.1.fq.gz
SdC0803005F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_030-Ex1-5F-lcwgs-1-1.1.fq.gz
SdC0803105D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_031-Ex1-5D-lcwgs-1-1.1.fq.gz
SdC0803208C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_032-Ex1-8C-lcwgs-1-1.1.fq.gz
SdC0803307B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_033-Ex1-7B-lcwgs-1-1.1.fq.gz
SdC0803401A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_034-Ex1-1A-lcwgs-1-1.1.fq.gz
SdC0803503A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_035-Ex1-3A-lcwgs-1-1.1.fq.gz
SdC0803608F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_036-Ex1-8F-lcwgs-1-1.1.fq.gz
SdC0803708G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_037-Ex1-8G-lcwgs-1-1.1.fq.gz
SdC0803802H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_038-Ex1-2H-lcwgs-1-1.1.fq.gz
SdC0803906F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_039-Ex1-6F-lcwgs-1-1.1.fq.gz
SdC0804006E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_040-Ex1-6E-lcwgs-1-1.1.fq.gz
SdC0804107H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_041-Ex1-7H-lcwgs-1-1.1.fq.gz
SdC0804207A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_042-Ex1-7A-lcwgs-1-1.1.fq.gz
SdC0804301E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_043-Ex1-1E-lcwgs-1-1.1.fq.gz
SdC0804402D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_044-Ex1-2D-lcwgs-1-1.1.fq.gz
SdC0804506C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_045-Ex1-6C-lcwgs-1-1.1.fq.gz
SdC0804601H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_046-Ex1-1H-lcwgs-1-1.1.fq.gz
SdC0804702F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_047-Ex1-2F-lcwgs-1-1.1.fq.gz
SdC0804804F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_048-Ex1-4F-lcwgs-1-1.1.fq.gz
SdC0804906A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_049-Ex1-6A-lcwgs-1-1.1.fq.gz
SdC0805003D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_050-Ex1-3D-lcwgs-1-1.1.fq.gz
SdC0805105H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_051-Ex1-5H-lcwgs-1-1.1.fq.gz
SdC0805208E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_052-Ex1-8E-lcwgs-1-1.1.fq.gz
SdC0805307D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_053-Ex1-7D-lcwgs-1-1.1.fq.gz
SdC0805405B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_054-Ex1-5B-lcwgs-1-1.1.fq.gz
SdC0805508D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_055-Ex1-8D-lcwgs-1-1.1.fq.gz
SdC0805605C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_056-Ex1-5C-lcwgs-1-1.1.fq.gz
SdC0805707C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_057-Ex1-7C-lcwgs-1-1.1.fq.gz
SdC0805807G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_058-Ex1-7G-lcwgs-1-1.1.fq.gz
SdC0805903B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_059-Ex1-3B-lcwgs-1-1.1.fq.gz
SdC0806004H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_060-Ex1-4H-lcwgs-1-1.1.fq.gz
SdC0806108B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_061-Ex1-8B-lcwgs-1-1.1.fq.gz
SdC0806202B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_062-Ex1-2B-lcwgs-1-1.1.fq.gz
SdC0806306B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_063-Ex1-6B-lcwgs-1-1.1.fq.gz
SdC0806406D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_064-Ex1-6D-lcwgs-1-1.1.fq.gz
SdC0806502C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_065-Ex1-2C-lcwgs-1-1.1.fq.gz
SdC0806601G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_066-Ex1-1G-lcwgs-1-1.1.fq.gz
SdC0806703F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_067-Ex1-3F-lcwgs-1-1.1.fq.gz
SdC0806802A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_068-Ex1-2A-lcwgs-1-1.1.fq.gz
SdC0806904E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Sde-CMal_069-Ex1-4E-lcwgs-1-1.1.fq.gz
preview of orig and new R2 file names...
SdA1101301B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_013-Ex1-1B-lcwgs-1-1.2.fq.gz
SdA1101402B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_014-Ex1-2B-lcwgs-1-1.2.fq.gz
SdA1101503B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_015-Ex1-3B-lcwgs-1-1.2.fq.gz
SdA1101604B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_016-Ex1-4B-lcwgs-1-1.2.fq.gz
SdA1101705B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_017-Ex1-5B-lcwgs-1-1.2.fq.gz
SdA1101806B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_018-Ex1-6B-lcwgs-1-1.2.fq.gz
SdA1101907B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_019-Ex1-7B-lcwgs-1-1.2.fq.gz
SdA1102008B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_020-Ex1-8B-lcwgs-1-1.2.fq.gz
SdA1102109B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_021-Ex1-9B-lcwgs-1-1.2.fq.gz
SdA1102210B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_022-Ex1-10B-lcwgs-1-1.2.fq.gz
SdA1102311B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_023-Ex1-11B-lcwgs-1-1.2.fq.gz
SdA1102412B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_024-Ex1-12B-lcwgs-1-1.2.fq.gz
SdA1102602C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_026-Ex1-2C-lcwgs-1-1.2.fq.gz
SdA1102703C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_027-Ex1-3C-lcwgs-1-1.2.fq.gz
SdA1102804C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_028-Ex1-4C-lcwgs-1-1.2.fq.gz
SdA1102905C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_029-Ex1-5C-lcwgs-1-1.2.fq.gz
SdA1103006C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_030-Ex1-6C-lcwgs-1-1.2.fq.gz
SdA1103107C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_031-Ex1-7C-lcwgs-1-1.2.fq.gz
SdA1103208C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_032-Ex1-8C-lcwgs-1-1.2.fq.gz
SdA1103309C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_033-Ex1-9C-lcwgs-1-1.2.fq.gz
SdA1103410C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_034-Ex1-10C-lcwgs-1-1.2.fq.gz
SdA1103612C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_036-Ex1-12C-lcwgs-1-1.2.fq.gz
SdA1103701D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_037-Ex1-1D-lcwgs-1-1.2.fq.gz
SdA1103802D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_038-Ex1-2D-lcwgs-1-1.2.fq.gz
SdA1103903D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_039-Ex1-3D-lcwgs-1-1.2.fq.gz
SdA1104004D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_040-Ex1-4D-lcwgs-1-1.2.fq.gz
SdA1104105D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_041-Ex1-5D-lcwgs-1-1.2.fq.gz
SdA1104206D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_042-Ex1-6D-lcwgs-1-1.2.fq.gz
SdA1104408D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_044-Ex1-8D-lcwgs-1-1.2.fq.gz
SdA1104610D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_046-Ex1-10D-lcwgs-1-1.2.fq.gz
SdA1104711D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_047-Ex1-11D-lcwgs-1-1.2.fq.gz
SdA1104812D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_048-Ex1-12D-lcwgs-1-1.2.fq.gz
SdA1104901E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_049-Ex1-1E-lcwgs-1-1.2.fq.gz
SdA1105002E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_050-Ex1-2E-lcwgs-1-1.2.fq.gz
SdA1105103E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_051-Ex1-3E-lcwgs-1-1.2.fq.gz
SdA1105305E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_053-Ex1-5E-lcwgs-1-1.2.fq.gz
SdA1105406E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_054-Ex1-6E-lcwgs-1-1.2.fq.gz
SdA1105507E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_055-Ex1-7E-lcwgs-1-1.2.fq.gz
SdA1105608E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_056-Ex1-8E-lcwgs-1-1.2.fq.gz
SdA1105709E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_057-Ex1-9E-lcwgs-1-1.2.fq.gz
SdA1105810E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_058-Ex1-10E-lcwgs-1-1.2.fq.gz
SdA1105911E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_059-Ex1-11E-lcwgs-1-1.2.fq.gz
SdA1106012E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_060-Ex1-12E-lcwgs-1-1.2.fq.gz
SdA1106101F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_061-Ex1-1F-lcwgs-1-1.2.fq.gz
SdA1106202F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_062-Ex1-2F-lcwgs-1-1.2.fq.gz
SdA1106303F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_063-Ex1-3F-lcwgs-1-1.2.fq.gz
SdA1106404F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_064-Ex1-4F-lcwgs-1-1.2.fq.gz
SdA1106505F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_065-Ex1-5F-lcwgs-1-1.2.fq.gz
SdA1106707F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_067-Ex1-7F-lcwgs-1-1.2.fq.gz
SdA1106808F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_068-Ex1-8F-lcwgs-1-1.2.fq.gz
SdA1106909F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_069-Ex1-9F-lcwgs-1-1.2.fq.gz
SdA1107010F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_070-Ex1-10F-lcwgs-1-1.2.fq.gz
SdA1107111F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_071-Ex1-11F-lcwgs-1-1.2.fq.gz
SdA1107212F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_072-Ex1-12F-lcwgs-1-1.2.fq.gz
SdA1107301G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_073-Ex1-1G-lcwgs-1-1.2.fq.gz
SdA1107402G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_074-Ex1-2G-lcwgs-1-1.2.fq.gz
SdA1107503G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_075-Ex1-3G-lcwgs-1-1.2.fq.gz
SdA1107705G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_077-Ex1-5G-lcwgs-1-1.2.fq.gz
SdA1107806G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_078-Ex1-6G-lcwgs-1-1.2.fq.gz
SdA1107907G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_079-Ex1-7G-lcwgs-1-1.2.fq.gz
SdA1108008G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_080-Ex1-8G-lcwgs-1-1.2.fq.gz
SdA1108109G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_081-Ex1-9G-lcwgs-1-1.2.fq.gz
SdA1108210G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_082-Ex1-10G-lcwgs-1-1.2.fq.gz
SdA1108311G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_083-Ex1-11G-lcwgs-1-1.2.fq.gz
SdA1108412G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_084-Ex1-12G-lcwgs-1-1.2.fq.gz
SdA1108703H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_087-Ex1-3H-lcwgs-1-1.2.fq.gz
SdA1108804H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_088-Ex1-4H-lcwgs-1-1.2.fq.gz
SdA1109006H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_090-Ex1-6H-lcwgs-1-1.2.fq.gz
SdA1109107H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_091-Ex1-7H-lcwgs-1-1.2.fq.gz
SdA1109208H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_092-Ex1-8H-lcwgs-1-1.2.fq.gz
SdA1109511H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-ABol_095-Ex1-11H-lcwgs-1-1.2.fq.gz
SdC0800302G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_003-Ex1-2G-lcwgs-1-1.2.fq.gz
SdC0800402E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_004-Ex1-2E-lcwgs-1-1.2.fq.gz
SdC0800504D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_005-Ex1-4D-lcwgs-1-1.2.fq.gz
SdC0800604B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_006-Ex1-4B-lcwgs-1-1.2.fq.gz
SdC0800903G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_009-Ex1-3G-lcwgs-1-1.2.fq.gz
SdC0801001D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_010-Ex1-1D-lcwgs-1-1.2.fq.gz
SdC0801104G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_011-Ex1-4G-lcwgs-1-1.2.fq.gz
SdC0801303H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_013-Ex1-3H-lcwgs-1-1.2.fq.gz
SdC0801501B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_015-Ex1-1B-lcwgs-1-1.2.fq.gz
SdC0801608A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_016-Ex1-8A-lcwgs-1-1.2.fq.gz
SdC0801701F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_017-Ex1-1F-lcwgs-1-1.2.fq.gz
SdC0801806G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_018-Ex1-6G-lcwgs-1-1.2.fq.gz
SdC0801905A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_019-Ex1-5A-lcwgs-1-1.2.fq.gz
SdC0802001C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_020-Ex1-1C-lcwgs-1-1.2.fq.gz
SdC0802104A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_021-Ex1-4A-lcwgs-1-1.2.fq.gz
SdC0802205G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_022-Ex1-5G-lcwgs-1-1.2.fq.gz
SdC0802307E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_023-Ex1-7E-lcwgs-1-1.2.fq.gz
SdC0802404C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_024-Ex1-4C-lcwgs-1-1.2.fq.gz
SdC0802503C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_025-Ex1-3C-lcwgs-1-1.2.fq.gz
SdC0802605E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_026-Ex1-5E-lcwgs-1-1.2.fq.gz
SdC0802708H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_027-Ex1-8H-lcwgs-1-1.2.fq.gz
SdC0802806H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_028-Ex1-6H-lcwgs-1-1.2.fq.gz
SdC0802907F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_029-Ex1-7F-lcwgs-1-1.2.fq.gz
SdC0803005F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_030-Ex1-5F-lcwgs-1-1.2.fq.gz
SdC0803105D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_031-Ex1-5D-lcwgs-1-1.2.fq.gz
SdC0803208C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_032-Ex1-8C-lcwgs-1-1.2.fq.gz
SdC0803307B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_033-Ex1-7B-lcwgs-1-1.2.fq.gz
SdC0803401A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_034-Ex1-1A-lcwgs-1-1.2.fq.gz
SdC0803503A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_035-Ex1-3A-lcwgs-1-1.2.fq.gz
SdC0803608F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_036-Ex1-8F-lcwgs-1-1.2.fq.gz
SdC0803708G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_037-Ex1-8G-lcwgs-1-1.2.fq.gz
SdC0803802H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_038-Ex1-2H-lcwgs-1-1.2.fq.gz
SdC0803906F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_039-Ex1-6F-lcwgs-1-1.2.fq.gz
SdC0804006E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_040-Ex1-6E-lcwgs-1-1.2.fq.gz
SdC0804107H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_041-Ex1-7H-lcwgs-1-1.2.fq.gz
SdC0804207A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_042-Ex1-7A-lcwgs-1-1.2.fq.gz
SdC0804301E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_043-Ex1-1E-lcwgs-1-1.2.fq.gz
SdC0804402D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_044-Ex1-2D-lcwgs-1-1.2.fq.gz
SdC0804506C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_045-Ex1-6C-lcwgs-1-1.2.fq.gz
SdC0804601H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_046-Ex1-1H-lcwgs-1-1.2.fq.gz
SdC0804702F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_047-Ex1-2F-lcwgs-1-1.2.fq.gz
SdC0804804F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_048-Ex1-4F-lcwgs-1-1.2.fq.gz
SdC0804906A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_049-Ex1-6A-lcwgs-1-1.2.fq.gz
SdC0805003D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_050-Ex1-3D-lcwgs-1-1.2.fq.gz
SdC0805105H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_051-Ex1-5H-lcwgs-1-1.2.fq.gz
SdC0805208E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_052-Ex1-8E-lcwgs-1-1.2.fq.gz
SdC0805307D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_053-Ex1-7D-lcwgs-1-1.2.fq.gz
SdC0805405B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_054-Ex1-5B-lcwgs-1-1.2.fq.gz
SdC0805508D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_055-Ex1-8D-lcwgs-1-1.2.fq.gz
SdC0805605C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_056-Ex1-5C-lcwgs-1-1.2.fq.gz
SdC0805707C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_057-Ex1-7C-lcwgs-1-1.2.fq.gz
SdC0805807G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_058-Ex1-7G-lcwgs-1-1.2.fq.gz
SdC0805903B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_059-Ex1-3B-lcwgs-1-1.2.fq.gz
SdC0806004H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_060-Ex1-4H-lcwgs-1-1.2.fq.gz
SdC0806108B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_061-Ex1-8B-lcwgs-1-1.2.fq.gz
SdC0806202B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_062-Ex1-2B-lcwgs-1-1.2.fq.gz
SdC0806306B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_063-Ex1-6B-lcwgs-1-1.2.fq.gz
SdC0806406D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_064-Ex1-6D-lcwgs-1-1.2.fq.gz
SdC0806502C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_065-Ex1-2C-lcwgs-1-1.2.fq.gz
SdC0806601G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_066-Ex1-1G-lcwgs-1-1.2.fq.gz
SdC0806703F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_067-Ex1-3F-lcwgs-1-1.2.fq.gz
SdC0806802A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_068-Ex1-2A-lcwgs-1-1.2.fq.gz
SdC0806904E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Sde-CMal_069-Ex1-4E-lcwgs-1-1.2.fq.gz
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
Sde-ABol_013-Ex1-1B-lcwgs-1-1.1	14.7%	43%	1.0
Sde-ABol_013-Ex1-1B-lcwgs-1-1.2	13.8%	43%	1.0
Sde-ABol_014-Ex1-2B-lcwgs-1-1.1	19.5%	47%	0.0
Sde-ABol_014-Ex1-2B-lcwgs-1-1.2	18.7%	47%	0.0
Sde-ABol_015-Ex1-3B-lcwgs-1-1.1	23.1%	44%	0.3
Sde-ABol_015-Ex1-3B-lcwgs-1-1.2	20.8%	45%	0.3
Sde-ABol_016-Ex1-4B-lcwgs-1-1.1	20.2%	44%	0.5
Sde-ABol_016-Ex1-4B-lcwgs-1-1.2	18.0%	45%	0.5
Sde-ABol_017-Ex1-5B-lcwgs-1-1.1	20.2%	45%	0.4
Sde-ABol_017-Ex1-5B-lcwgs-1-1.2	18.4%	45%	0.4
Sde-ABol_018-Ex1-6B-lcwgs-1-1.1	21.5%	49%	0.1
Sde-ABol_018-Ex1-6B-lcwgs-1-1.2	19.0%	49%	0.1
Sde-ABol_019-Ex1-7B-lcwgs-1-1.1	18.2%	44%	0.0
Sde-ABol_019-Ex1-7B-lcwgs-1-1.2	17.2%	44%	0.0
Sde-ABol_020-Ex1-8B-lcwgs-1-1.1	16.3%	44%	2.4
Sde-ABol_021-Ex1-9B-lcwgs-1-1.1	8.7%	45%	0.0
Sde-ABol_021-Ex1-9B-lcwgs-1-1.2	5.9%	46%	0.0
Sde-ABol_022-Ex1-10B-lcwgs-1-1.1	17.6%	44%	0.0
Sde-ABol_022-Ex1-10B-lcwgs-1-1.2	16.6%	45%	0.0
Sde-ABol_023-Ex1-11B-lcwgs-1-1.1	16.5%	44%	0.1
Sde-ABol_023-Ex1-11B-lcwgs-1-1.2	15.7%	45%	0.1
Sde-ABol_024-Ex1-12B-lcwgs-1-1.1	9.7%	45%	0.0
Sde-ABol_024-Ex1-12B-lcwgs-1-1.2	6.1%	46%	0.0
Sde-ABol_026-Ex1-2C-lcwgs-1-1.1	14.9%	45%	0.3
Sde-ABol_026-Ex1-2C-lcwgs-1-1.2	14.3%	45%	0.3
Sde-ABol_027-Ex1-3C-lcwgs-1-1.1	14.5%	43%	0.4
Sde-ABol_027-Ex1-3C-lcwgs-1-1.2	13.8%	44%	0.4
Sde-ABol_028-Ex1-4C-lcwgs-1-1.1	13.5%	43%	1.3
Sde-ABol_028-Ex1-4C-lcwgs-1-1.2	12.8%	44%	1.3
Sde-ABol_029-Ex1-5C-lcwgs-1-1.1	5.9%	45%	0.0
Sde-ABol_029-Ex1-5C-lcwgs-1-1.2	4.5%	45%	0.0
Sde-ABol_030-Ex1-6C-lcwgs-1-1.1	16.7%	44%	1.2
Sde-ABol_031-Ex1-7C-lcwgs-1-1.1	18.2%	45%	0.1
Sde-ABol_031-Ex1-7C-lcwgs-1-1.2	17.3%	45%	0.1
Sde-ABol_032-Ex1-8C-lcwgs-1-1.1	15.8%	44%	0.2
Sde-ABol_032-Ex1-8C-lcwgs-1-1.2	14.7%	45%	0.2
Sde-ABol_034-Ex1-10C-lcwgs-1-1.1	9.6%	45%	0.0
Sde-ABol_034-Ex1-10C-lcwgs-1-1.2	7.6%	46%	0.0
Sde-ABol_036-Ex1-12C-lcwgs-1-1.1	7.1%	45%	0.0
Sde-ABol_036-Ex1-12C-lcwgs-1-1.2	5.6%	45%	0.0
Sde-ABol_037-Ex1-1D-lcwgs-1-1.1	16.9%	44%	0.3
Sde-ABol_037-Ex1-1D-lcwgs-1-1.2	15.6%	45%	0.3
Sde-ABol_038-Ex1-2D-lcwgs-1-1.1	13.8%	45%	0.0
Sde-ABol_038-Ex1-2D-lcwgs-1-1.2	9.9%	46%	0.0
Sde-ABol_039-Ex1-3D-lcwgs-1-1.1	17.1%	43%	0.9
Sde-ABol_039-Ex1-3D-lcwgs-1-1.2	15.7%	44%	0.9
Sde-ABol_040-Ex1-4D-lcwgs-1-1.1	15.9%	44%	0.1
Sde-ABol_040-Ex1-4D-lcwgs-1-1.2	15.0%	44%	0.1
Sde-ABol_041-Ex1-5D-lcwgs-1-1.1	7.0%	44%	0.0
Sde-ABol_041-Ex1-5D-lcwgs-1-1.2	4.7%	45%	0.0
Sde-ABol_042-Ex1-6D-lcwgs-1-1.1	18.6%	44%	3.5
Sde-ABol_042-Ex1-6D-lcwgs-1-1.2	16.8%	44%	3.5
Sde-ABol_046-Ex1-10D-lcwgs-1-1.1	16.0%	44%	0.9
Sde-ABol_046-Ex1-10D-lcwgs-1-1.2	14.7%	44%	0.9
Sde-ABol_047-Ex1-11D-lcwgs-1-1.1	17.1%	43%	1.0
Sde-ABol_047-Ex1-11D-lcwgs-1-1.2	15.5%	44%	1.0
Sde-ABol_048-Ex1-12D-lcwgs-1-1.1	21.8%	48%	0.4
Sde-ABol_048-Ex1-12D-lcwgs-1-1.2	19.1%	49%	0.4
Sde-ABol_049-Ex1-1E-lcwgs-1-1.1	14.1%	45%	0.0
Sde-ABol_049-Ex1-1E-lcwgs-1-1.2	10.8%	46%	0.0
Sde-ABol_050-Ex1-2E-lcwgs-1-1.1	16.3%	47%	0.0
Sde-ABol_050-Ex1-2E-lcwgs-1-1.2	14.7%	47%	0.0
Sde-ABol_051-Ex1-3E-lcwgs-1-1.1	21.8%	45%	0.1
Sde-ABol_051-Ex1-3E-lcwgs-1-1.2	20.0%	45%	0.1
Sde-ABol_053-Ex1-5E-lcwgs-1-1.1	21.8%	45%	0.7
Sde-ABol_053-Ex1-5E-lcwgs-1-1.2	19.2%	46%	0.7
Sde-ABol_054-Ex1-6E-lcwgs-1-1.2	19.8%	46%	0.7
Sde-ABol_055-Ex1-7E-lcwgs-1-1.1	17.3%	44%	0.1
Sde-ABol_055-Ex1-7E-lcwgs-1-1.2	16.5%	44%	0.1
Sde-ABol_056-Ex1-8E-lcwgs-1-1.1	17.3%	44%	0.2
Sde-ABol_056-Ex1-8E-lcwgs-1-1.2	15.9%	44%	0.2
Sde-ABol_057-Ex1-9E-lcwgs-1-1.1	15.3%	43%	1.3
Sde-ABol_057-Ex1-9E-lcwgs-1-1.2	14.0%	44%	1.3
Sde-ABol_058-Ex1-10E-lcwgs-1-1.1	16.6%	43%	0.5
Sde-ABol_058-Ex1-10E-lcwgs-1-1.2	15.8%	43%	0.5
Sde-ABol_059-Ex1-11E-lcwgs-1-1.1	22.1%	45%	0.2
Sde-ABol_059-Ex1-11E-lcwgs-1-1.2	21.0%	45%	0.2
Sde-ABol_060-Ex1-12E-lcwgs-1-1.1	17.6%	44%	0.3
Sde-ABol_060-Ex1-12E-lcwgs-1-1.2	16.3%	44%	0.3
Sde-ABol_061-Ex1-1F-lcwgs-1-1.1	18.0%	44%	0.1
Sde-ABol_061-Ex1-1F-lcwgs-1-1.2	16.8%	44%	0.1
Sde-ABol_062-Ex1-2F-lcwgs-1-1.1	15.7%	43%	0.3
Sde-ABol_062-Ex1-2F-lcwgs-1-1.2	14.8%	43%	0.3
Sde-ABol_063-Ex1-3F-lcwgs-1-1.1	20.2%	44%	0.5
Sde-ABol_063-Ex1-3F-lcwgs-1-1.2	18.5%	44%	0.5
Sde-ABol_064-Ex1-4F-lcwgs-1-1.1	18.2%	43%	3.0
Sde-ABol_064-Ex1-4F-lcwgs-1-1.2	17.0%	43%	3.0
Sde-ABol_065-Ex1-5F-lcwgs-1-1.1	19.8%	43%	0.2
Sde-ABol_065-Ex1-5F-lcwgs-1-1.2	18.7%	44%	0.2
Sde-ABol_067-Ex1-7F-lcwgs-1-1.1	13.7%	43%	1.1
Sde-ABol_069-Ex1-9F-lcwgs-1-1.1	13.0%	43%	0.6
Sde-ABol_069-Ex1-9F-lcwgs-1-1.2	12.4%	43%	0.6
Sde-ABol_070-Ex1-10F-lcwgs-1-1.1	15.8%	44%	1.5
Sde-ABol_070-Ex1-10F-lcwgs-1-1.2	14.4%	44%	1.5
Sde-ABol_071-Ex1-11F-lcwgs-1-1.1	15.9%	44%	0.3
Sde-ABol_071-Ex1-11F-lcwgs-1-1.2	14.6%	44%	0.3
Sde-ABol_072-Ex1-12F-lcwgs-1-1.1	13.1%	44%	0.6
Sde-ABol_072-Ex1-12F-lcwgs-1-1.2	12.4%	44%	0.6
Sde-ABol_073-Ex1-1G-lcwgs-1-1.1	12.8%	45%	0.0
Sde-ABol_073-Ex1-1G-lcwgs-1-1.2	9.6%	46%	0.0
Sde-ABol_074-Ex1-2G-lcwgs-1-1.1	16.4%	43%	0.8
Sde-ABol_074-Ex1-2G-lcwgs-1-1.2	15.5%	44%	0.8
Sde-ABol_075-Ex1-3G-lcwgs-1-1.1	17.8%	44%	0.4
Sde-ABol_075-Ex1-3G-lcwgs-1-1.2	16.2%	44%	0.4
Sde-ABol_077-Ex1-5G-lcwgs-1-1.1	14.3%	43%	8.2
Sde-ABol_078-Ex1-6G-lcwgs-1-1.1	14.6%	44%	0.7
Sde-ABol_078-Ex1-6G-lcwgs-1-1.2	13.3%	44%	0.7
Sde-ABol_080-Ex1-8G-lcwgs-1-1.1	14.9%	45%	0.9
Sde-ABol_080-Ex1-8G-lcwgs-1-1.2	13.7%	45%	0.9
Sde-ABol_081-Ex1-9G-lcwgs-1-1.1	15.4%	45%	0.1
Sde-ABol_081-Ex1-9G-lcwgs-1-1.2	14.4%	45%	0.1
Sde-ABol_082-Ex1-10G-lcwgs-1-1.1	13.0%	44%	0.9
Sde-ABol_082-Ex1-10G-lcwgs-1-1.2	12.1%	44%	0.9
Sde-ABol_087-Ex1-3H-lcwgs-1-1.1	17.4%	44%	2.6
Sde-ABol_088-Ex1-4H-lcwgs-1-1.1	18.8%	45%	6.6
Sde-ABol_091-Ex1-7H-lcwgs-1-1.1	14.5%	44%	1.2
Sde-ABol_091-Ex1-7H-lcwgs-1-1.2	13.5%	45%	1.2
Sde-ABol_092-Ex1-8H-lcwgs-1-1.1	16.0%	43%	2.6
Sde-ABol_092-Ex1-8H-lcwgs-1-1.2	15.1%	44%	2.6
Sde-ABol_095-Ex1-11H-lcwgs-1-1.1	15.4%	45%	0.0
Sde-ABol_095-Ex1-11H-lcwgs-1-1.2	14.2%	45%	0.0
Sde-CMal_003-Ex1-2G-lcwgs-1-1.1	6.7%	45%	0.1
Sde-CMal_003-Ex1-2G-lcwgs-1-1.2	4.3%	45%	0.1
Sde-CMal_004-Ex1-2E-lcwgs-1-1.1	8.9%	45%	0.0
Sde-CMal_004-Ex1-2E-lcwgs-1-1.2	5.3%	46%	0.0
Sde-CMal_005-Ex1-4D-lcwgs-1-1.1	7.3%	45%	0.0
Sde-CMal_005-Ex1-4D-lcwgs-1-1.2	3.9%	46%	0.0
Sde-CMal_006-Ex1-4B-lcwgs-1-1.1	8.0%	46%	0.0
Sde-CMal_006-Ex1-4B-lcwgs-1-1.2	4.2%	46%	0.0
Sde-CMal_009-Ex1-3G-lcwgs-1-1.1	7.6%	45%	0.1
Sde-CMal_009-Ex1-3G-lcwgs-1-1.2	4.8%	45%	0.1
Sde-CMal_010-Ex1-1D-lcwgs-1-1.1	7.8%	45%	0.1
Sde-CMal_010-Ex1-1D-lcwgs-1-1.2	5.1%	46%	0.1
Sde-CMal_011-Ex1-4G-lcwgs-1-1.1	7.7%	45%	0.0
Sde-CMal_011-Ex1-4G-lcwgs-1-1.2	4.4%	46%	0.0
Sde-CMal_013-Ex1-3H-lcwgs-1-1.1	7.2%	44%	0.0
Sde-CMal_013-Ex1-3H-lcwgs-1-1.2	4.2%	45%	0.0
Sde-CMal_015-Ex1-1B-lcwgs-1-1.1	8.2%	46%	0.0
Sde-CMal_015-Ex1-1B-lcwgs-1-1.2	5.2%	46%	0.0
Sde-CMal_016-Ex1-8A-lcwgs-1-1.1	2.3%	45%	0.0
Sde-CMal_016-Ex1-8A-lcwgs-1-1.2	1.5%	45%	0.0
Sde-CMal_017-Ex1-1F-lcwgs-1-1.1	7.5%	45%	0.0
Sde-CMal_017-Ex1-1F-lcwgs-1-1.2	4.9%	46%	0.0
Sde-CMal_018-Ex1-6G-lcwgs-1-1.1	8.2%	45%	0.0
Sde-CMal_018-Ex1-6G-lcwgs-1-1.2	4.7%	46%	0.0
Sde-CMal_019-Ex1-5A-lcwgs-1-1.1	0.0%	46%	0.0
Sde-CMal_019-Ex1-5A-lcwgs-1-1.2	0.0%	47%	0.0
Sde-CMal_020-Ex1-1C-lcwgs-1-1.1	6.1%	46%	0.0
Sde-CMal_020-Ex1-1C-lcwgs-1-1.2	4.2%	46%	0.0
Sde-CMal_021-Ex1-4A-lcwgs-1-1.1	2.7%	45%	0.0
Sde-CMal_021-Ex1-4A-lcwgs-1-1.2	2.4%	46%	0.0
Sde-CMal_022-Ex1-5G-lcwgs-1-1.1	8.9%	45%	0.0
Sde-CMal_022-Ex1-5G-lcwgs-1-1.2	5.6%	46%	0.0
Sde-CMal_023-Ex1-7E-lcwgs-1-1.1	12.2%	46%	0.0
Sde-CMal_023-Ex1-7E-lcwgs-1-1.2	5.9%	47%	0.0
Sde-CMal_024-Ex1-4C-lcwgs-1-1.1	5.0%	45%	0.0
Sde-CMal_024-Ex1-4C-lcwgs-1-1.2	3.1%	46%	0.0
Sde-CMal_025-Ex1-3C-lcwgs-1-1.1	4.4%	44%	0.0
Sde-CMal_025-Ex1-3C-lcwgs-1-1.2	2.8%	44%	0.0
Sde-CMal_026-Ex1-5E-lcwgs-1-1.1	12.8%	46%	0.0
Sde-CMal_026-Ex1-5E-lcwgs-1-1.2	7.1%	47%	0.0
Sde-CMal_027-Ex1-8H-lcwgs-1-1.1	6.4%	45%	0.0
Sde-CMal_027-Ex1-8H-lcwgs-1-1.2	3.4%	45%	0.0
Sde-CMal_028-Ex1-6H-lcwgs-1-1.1	7.4%	45%	0.0
Sde-CMal_028-Ex1-6H-lcwgs-1-1.2	4.1%	46%	0.0
Sde-CMal_029-Ex1-7F-lcwgs-1-1.1	7.3%	45%	0.0
Sde-CMal_029-Ex1-7F-lcwgs-1-1.2	3.9%	45%	0.0
Sde-CMal_030-Ex1-5F-lcwgs-1-1.1	8.5%	45%	0.0
Sde-CMal_030-Ex1-5F-lcwgs-1-1.2	4.8%	45%	0.0
Sde-CMal_031-Ex1-5D-lcwgs-1-1.1	8.4%	45%	0.0
Sde-CMal_031-Ex1-5D-lcwgs-1-1.2	4.8%	46%	0.0
Sde-CMal_032-Ex1-8C-lcwgs-1-1.1	4.2%	45%	0.0
Sde-CMal_032-Ex1-8C-lcwgs-1-1.2	2.3%	46%	0.0
Sde-CMal_033-Ex1-7B-lcwgs-1-1.1	7.5%	45%	0.0
Sde-CMal_033-Ex1-7B-lcwgs-1-1.2	3.8%	46%	0.0
Sde-CMal_034-Ex1-1A-lcwgs-1-1.1	4.2%	45%	0.0
Sde-CMal_034-Ex1-1A-lcwgs-1-1.2	3.5%	45%	0.0
Sde-CMal_035-Ex1-3A-lcwgs-1-1.1	6.7%	45%	0.0
Sde-CMal_035-Ex1-3A-lcwgs-1-1.2	6.7%	45%	0.0
Sde-CMal_036-Ex1-8F-lcwgs-1-1.1	6.0%	45%	0.0
Sde-CMal_036-Ex1-8F-lcwgs-1-1.2	3.2%	45%	0.0
Sde-CMal_037-Ex1-8G-lcwgs-1-1.1	7.5%	45%	0.1
Sde-CMal_037-Ex1-8G-lcwgs-1-1.2	4.0%	46%	0.1
Sde-CMal_038-Ex1-2H-lcwgs-1-1.1	5.9%	44%	0.1
Sde-CMal_038-Ex1-2H-lcwgs-1-1.2	3.7%	45%	0.1
Sde-CMal_039-Ex1-6F-lcwgs-1-1.1	7.6%	45%	0.0
Sde-CMal_039-Ex1-6F-lcwgs-1-1.2	4.3%	45%	0.0
Sde-CMal_040-Ex1-6E-lcwgs-1-1.1	11.0%	46%	0.0
Sde-CMal_040-Ex1-6E-lcwgs-1-1.2	6.8%	46%	0.0
Sde-CMal_041-Ex1-7H-lcwgs-1-1.1	7.1%	45%	0.0
Sde-CMal_041-Ex1-7H-lcwgs-1-1.2	3.8%	46%	0.0
Sde-CMal_042-Ex1-7A-lcwgs-1-1.1	0.0%	46%	0.0
Sde-CMal_042-Ex1-7A-lcwgs-1-1.2	0.0%	47%	0.0
Sde-CMal_043-Ex1-1E-lcwgs-1-1.1	10.6%	46%	0.0
Sde-CMal_043-Ex1-1E-lcwgs-1-1.2	6.8%	46%	0.0
Sde-CMal_044-Ex1-2D-lcwgs-1-1.1	5.9%	45%	0.1
Sde-CMal_044-Ex1-2D-lcwgs-1-1.2	3.7%	45%	0.1
Sde-CMal_045-Ex1-6C-lcwgs-1-1.1	5.7%	45%	0.0
Sde-CMal_045-Ex1-6C-lcwgs-1-1.2	3.5%	46%	0.0
Sde-CMal_046-Ex1-1H-lcwgs-1-1.1	8.0%	45%	0.1
Sde-CMal_046-Ex1-1H-lcwgs-1-1.2	5.3%	46%	0.1
Sde-CMal_047-Ex1-2F-lcwgs-1-1.1	5.8%	44%	0.0
Sde-CMal_047-Ex1-2F-lcwgs-1-1.2	3.7%	45%	0.0
Sde-CMal_048-Ex1-4F-lcwgs-1-1.1	7.2%	45%	0.0
Sde-CMal_048-Ex1-4F-lcwgs-1-1.2	4.0%	45%	0.0
Sde-CMal_049-Ex1-6A-lcwgs-1-1.1	1.4%	46%	0.0
Sde-CMal_049-Ex1-6A-lcwgs-1-1.2	1.4%	46%	0.0
Sde-CMal_050-Ex1-3D-lcwgs-1-1.1	7.5%	44%	0.0
Sde-CMal_050-Ex1-3D-lcwgs-1-1.2	4.3%	45%	0.0
Sde-CMal_051-Ex1-5H-lcwgs-1-1.1	8.4%	45%	0.0
Sde-CMal_051-Ex1-5H-lcwgs-1-1.2	4.9%	46%	0.0
Sde-CMal_052-Ex1-8E-lcwgs-1-1.1	10.3%	46%	0.0
Sde-CMal_052-Ex1-8E-lcwgs-1-1.2	5.5%	46%	0.0
Sde-CMal_053-Ex1-7D-lcwgs-1-1.1	7.5%	45%	0.0
Sde-CMal_053-Ex1-7D-lcwgs-1-1.2	4.0%	46%	0.0
Sde-CMal_054-Ex1-5B-lcwgs-1-1.1	9.8%	46%	0.0
Sde-CMal_054-Ex1-5B-lcwgs-1-1.2	5.5%	46%	0.0
Sde-CMal_055-Ex1-8D-lcwgs-1-1.1	6.5%	45%	0.0
Sde-CMal_055-Ex1-8D-lcwgs-1-1.2	3.4%	45%	0.0
Sde-CMal_056-Ex1-5C-lcwgs-1-1.1	6.2%	45%	0.0
Sde-CMal_056-Ex1-5C-lcwgs-1-1.2	3.7%	46%	0.0
Sde-CMal_057-Ex1-7C-lcwgs-1-1.1	4.7%	45%	0.0
Sde-CMal_057-Ex1-7C-lcwgs-1-1.2	2.6%	46%	0.0
Sde-CMal_058-Ex1-7G-lcwgs-1-1.1	8.3%	45%	0.0
Sde-CMal_058-Ex1-7G-lcwgs-1-1.2	4.5%	46%	0.0
Sde-CMal_059-Ex1-3B-lcwgs-1-1.1	7.1%	45%	0.0
Sde-CMal_059-Ex1-3B-lcwgs-1-1.2	4.5%	45%	0.0
Sde-CMal_060-Ex1-4H-lcwgs-1-1.1	7.1%	45%	0.0
Sde-CMal_060-Ex1-4H-lcwgs-1-1.2	3.9%	46%	0.0
Sde-CMal_061-Ex1-8B-lcwgs-1-1.1	7.5%	45%	0.0
Sde-CMal_061-Ex1-8B-lcwgs-1-1.2	3.9%	46%	0.0
Sde-CMal_062-Ex1-2B-lcwgs-1-1.1	6.8%	45%	0.0
Sde-CMal_062-Ex1-2B-lcwgs-1-1.2	4.4%	45%	0.0
Sde-CMal_063-Ex1-6B-lcwgs-1-1.1	7.7%	45%	0.0
Sde-CMal_063-Ex1-6B-lcwgs-1-1.2	4.0%	46%	0.0
Sde-CMal_064-Ex1-6D-lcwgs-1-1.1	7.0%	45%	0.0
Sde-CMal_064-Ex1-6D-lcwgs-1-1.2	4.1%	46%	0.0
Sde-CMal_065-Ex1-2C-lcwgs-1-1.1	4.7%	45%	0.0
Sde-CMal_065-Ex1-2C-lcwgs-1-1.2	3.1%	45%	0.0
Sde-CMal_066-Ex1-1G-lcwgs-1-1.1	8.5%	46%	0.1
Sde-CMal_066-Ex1-1G-lcwgs-1-1.2	5.7%	46%	0.1
Sde-CMal_067-Ex1-3F-lcwgs-1-1.1	7.3%	44%	0.0
Sde-CMal_067-Ex1-3F-lcwgs-1-1.2	4.4%	45%	0.0
Sde-CMal_068-Ex1-2A-lcwgs-1-1.1	3.2%	44%	0.0
Sde-CMal_068-Ex1-2A-lcwgs-1-1.2	1.9%	44%	0.0
Sde-CMal_069-Ex1-4E-lcwgs-1-1.1	11.2%	46%	0.0
Sde-CMal_069-Ex1-4E-lcwgs-1-1.2	5.4%	46%	0.0

```
</p>
</details>

## 8. First trim.
`sbatch ../../../pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Sde-ABol_013-Ex1-1B-lcwgs-1-1	17.0%	39.8%	98.9%	91.9%
Sde-ABol_014-Ex1-2B-lcwgs-1-1	17.3%	46.5%	97.6%	74.7%
Sde-ABol_015-Ex1-3B-lcwgs-1-1	18.5%	42.1%	96.3%	84.1%
Sde-ABol_016-Ex1-4B-lcwgs-1-1	17.0%	42.5%	97.7%	84.9%
Sde-ABol_017-Ex1-5B-lcwgs-1-1	18.1%	42.5%	98.5%	90.1%
Sde-ABol_018-Ex1-6B-lcwgs-1-1	15.0%	49.0%	96.3%	75.3%
Sde-ABol_019-Ex1-7B-lcwgs-1-1	16.4%	41.9%	98.2%	89.3%
Sde-ABol_020-Ex1-8B-lcwgs-1-1	14.4%	42.1%	99.0%	94.7%
Sde-ABol_021-Ex1-9B-lcwgs-1-1	1.2%	43.2%	90.0%	81.0%
Sde-ABol_022-Ex1-10B-lcwgs-1-1	15.4%	41.8%	97.8%	92.3%
Sde-ABol_023-Ex1-11B-lcwgs-1-1	15.3%	42.1%	98.7%	94.0%
Sde-ABol_024-Ex1-12B-lcwgs-1-1	1.1%	43.9%	90.8%	81.0%
Sde-ABol_026-Ex1-2C-lcwgs-1-1	16.5%	42.5%	98.8%	94.0%
Sde-ABol_027-Ex1-3C-lcwgs-1-1	17.4%	40.4%	99.1%	94.5%
Sde-ABol_028-Ex1-4C-lcwgs-1-1	16.5%	40.4%	99.0%	94.5%
Sde-ABol_029-Ex1-5C-lcwgs-1-1	1.5%	42.2%	91.7%	86.8%
Sde-ABol_030-Ex1-6C-lcwgs-1-1	13.1%	41.7%	98.6%	87.3%
Sde-ABol_031-Ex1-7C-lcwgs-1-1	15.6%	42.8%	98.4%	93.2%
Sde-ABol_032-Ex1-8C-lcwgs-1-1	15.8%	41.9%	97.4%	93.5%
Sde-ABol_033-Ex1-9C-lcwgs-1-1	0.0%	0.0%		
Sde-ABol_034-Ex1-10C-lcwgs-1-1	3.7%	42.9%	91.8%	83.6%
Sde-ABol_036-Ex1-12C-lcwgs-1-1	2.3%	43.0%	92.2%	84.6%
Sde-ABol_037-Ex1-1D-lcwgs-1-1	15.3%	41.7%	98.1%	91.5%
Sde-ABol_038-Ex1-2D-lcwgs-1-1	2.9%	43.2%	90.3%	80.3%
Sde-ABol_039-Ex1-3D-lcwgs-1-1	17.9%	41.1%	98.3%	88.6%
Sde-ABol_040-Ex1-4D-lcwgs-1-1	13.7%	40.8%	97.6%	93.3%
Sde-ABol_041-Ex1-5D-lcwgs-1-1	1.1%	42.0%	91.5%	86.4%
Sde-ABol_042-Ex1-6D-lcwgs-1-1	16.7%	41.6%	98.2%	88.4%
Sde-ABol_044-Ex1-8D-lcwgs-1-1	0.0%	0.0%		
Sde-ABol_046-Ex1-10D-lcwgs-1-1	15.8%	41.0%	98.1%	91.8%
Sde-ABol_047-Ex1-11D-lcwgs-1-1	15.9%	40.9%	97.1%	89.8%
Sde-ABol_048-Ex1-12D-lcwgs-1-1	18.3%	48.3%	96.3%	56.4%
Sde-ABol_049-Ex1-1E-lcwgs-1-1	7.0%	43.3%	94.6%	82.4%
Sde-ABol_050-Ex1-2E-lcwgs-1-1	6.1%	45.2%	91.5%	73.4%
Sde-ABol_051-Ex1-3E-lcwgs-1-1	17.3%	42.8%	97.7%	88.2%
Sde-ABol_053-Ex1-5E-lcwgs-1-1	16.4%	43.2%	96.5%	86.6%
Sde-ABol_054-Ex1-6E-lcwgs-1-1	0.0%	0.0%		
Sde-ABol_055-Ex1-7E-lcwgs-1-1	15.4%	41.3%	98.3%	91.2%
Sde-ABol_056-Ex1-8E-lcwgs-1-1	16.1%	41.6%	97.9%	90.8%
Sde-ABol_057-Ex1-9E-lcwgs-1-1	16.6%	41.0%	98.5%	90.6%
Sde-ABol_058-Ex1-10E-lcwgs-1-1	15.5%	39.6%	98.4%	93.1%
Sde-ABol_059-Ex1-11E-lcwgs-1-1	16.1%	42.8%	98.5%	94.0%
Sde-ABol_060-Ex1-12E-lcwgs-1-1	17.2%	42.0%	98.0%	82.2%
Sde-ABol_061-Ex1-1F-lcwgs-1-1	14.7%	41.7%	98.2%	92.5%
Sde-ABol_062-Ex1-2F-lcwgs-1-1	16.3%	40.1%	98.6%	92.8%
Sde-ABol_063-Ex1-3F-lcwgs-1-1	17.3%	41.2%	95.4%	88.7%
Sde-ABol_064-Ex1-4F-lcwgs-1-1	17.2%	39.8%	99.0%	90.0%
Sde-ABol_065-Ex1-5F-lcwgs-1-1	14.2%	40.2%	98.4%	94.9%
Sde-ABol_067-Ex1-7F-lcwgs-1-1	13.5%	40.6%	98.9%	92.3%
Sde-ABol_068-Ex1-8F-lcwgs-1-1	13.4%	41.0%	98.6%	89.2%
Sde-ABol_069-Ex1-9F-lcwgs-1-1	15.9%	40.2%	98.8%	91.7%
Sde-ABol_070-Ex1-10F-lcwgs-1-1	15.8%	41.2%	98.1%	93.0%
Sde-ABol_071-Ex1-11F-lcwgs-1-1	16.1%	42.0%	98.1%	89.0%
Sde-ABol_072-Ex1-12F-lcwgs-1-1	16.6%	41.3%	98.8%	92.7%
Sde-ABol_073-Ex1-1G-lcwgs-1-1	1.7%	43.6%	92.0%	78.6%
Sde-ABol_074-Ex1-2G-lcwgs-1-1	16.3%	40.2%	98.0%	92.1%
Sde-ABol_075-Ex1-3G-lcwgs-1-1	16.5%	41.0%	97.9%	91.7%
Sde-ABol_077-Ex1-5G-lcwgs-1-1	13.1%	40.2%	99.1%	95.1%
Sde-ABol_078-Ex1-6G-lcwgs-1-1	13.9%	40.7%	97.9%	92.3%
Sde-ABol_079-Ex1-7G-lcwgs-1-1	12.5%	40.9%	50.8%	71.6%
Sde-ABol_080-Ex1-8G-lcwgs-1-1	15.4%	42.5%	98.0%	91.4%
Sde-ABol_081-Ex1-9G-lcwgs-1-1	12.9%	42.2%	96.6%	92.5%
Sde-ABol_082-Ex1-10G-lcwgs-1-1	14.6%	41.1%	98.8%	94.5%
Sde-ABol_083-Ex1-11G-lcwgs-1-1	0.0%	0.0%		
Sde-ABol_084-Ex1-12G-lcwgs-1-1	0.0%	0.0%		
Sde-ABol_087-Ex1-3H-lcwgs-1-1	0.0%	0.0%		
Sde-ABol_088-Ex1-4H-lcwgs-1-1	0.0%	0.0%		
Sde-ABol_090-Ex1-6H-lcwgs-1-1	0.0%	0.0%		
Sde-ABol_091-Ex1-7H-lcwgs-1-1	16.8%	42.3%	98.5%	90.1%
Sde-ABol_092-Ex1-8H-lcwgs-1-1	17.3%	40.8%	97.2%	91.1%
Sde-ABol_095-Ex1-11H-lcwgs-1-1	12.4%	42.3%	96.5%	91.2%
Sde-CMal_003-Ex1-2G-lcwgs-1-1	1.0%	43.1%	91.9%	72.1%
Sde-CMal_004-Ex1-2E-lcwgs-1-1	1.5%	43.7%	91.8%	68.4%
Sde-CMal_005-Ex1-4D-lcwgs-1-1	1.0%	43.5%	91.7%	67.7%
Sde-CMal_006-Ex1-4B-lcwgs-1-1	1.5%	44.2%	91.2%	65.3%
Sde-CMal_009-Ex1-3G-lcwgs-1-1	1.1%	42.8%	91.5%	70.7%
Sde-CMal_010-Ex1-1D-lcwgs-1-1	1.2%	43.9%	89.8%	69.9%
Sde-CMal_011-Ex1-4G-lcwgs-1-1	1.0%	44.1%	91.4%	64.4%
Sde-CMal_013-Ex1-3H-lcwgs-1-1	1.1%	42.4%	90.6%	69.5%
Sde-CMal_015-Ex1-1B-lcwgs-1-1	1.3%	44.3%	90.3%	71.0%
Sde-CMal_016-Ex1-8A-lcwgs-1-1	1.6%	44.4%	84.2%	21.3%
Sde-CMal_017-Ex1-1F-lcwgs-1-1	1.0%	43.8%	90.1%	69.5%
Sde-CMal_018-Ex1-6G-lcwgs-1-1	1.1%	44.0%	92.0%	64.5%
Sde-CMal_019-Ex1-5A-lcwgs-1-1	0.0%	45.9%	89.1%	30.4%
Sde-CMal_020-Ex1-1C-lcwgs-1-1	1.1%	44.2%	88.9%	69.0%
Sde-CMal_021-Ex1-4A-lcwgs-1-1	2.6%	45.4%	84.2%	33.0%
Sde-CMal_022-Ex1-5G-lcwgs-1-1	1.3%	43.9%	91.9%	67.4%
Sde-CMal_023-Ex1-7E-lcwgs-1-1	1.2%	44.9%	91.7%	62.7%
Sde-CMal_024-Ex1-4C-lcwgs-1-1	0.8%	44.3%	86.5%	54.0%
Sde-CMal_025-Ex1-3C-lcwgs-1-1	0.9%	42.4%	88.2%	60.5%
Sde-CMal_026-Ex1-5E-lcwgs-1-1	1.7%	44.9%	91.5%	63.5%
Sde-CMal_027-Ex1-8H-lcwgs-1-1	1.0%	43.7%	90.3%	59.1%
Sde-CMal_028-Ex1-6H-lcwgs-1-1	1.1%	43.8%	91.0%	62.4%
Sde-CMal_029-Ex1-7F-lcwgs-1-1	1.1%	43.7%	91.8%	63.5%
Sde-CMal_030-Ex1-5F-lcwgs-1-1	1.1%	43.6%	91.9%	64.5%
Sde-CMal_031-Ex1-5D-lcwgs-1-1	1.2%	43.8%	91.3%	64.9%
Sde-CMal_032-Ex1-8C-lcwgs-1-1	0.9%	44.0%	88.2%	54.6%
Sde-CMal_033-Ex1-7B-lcwgs-1-1	1.2%	44.2%	91.9%	64.1%
Sde-CMal_034-Ex1-1A-lcwgs-1-1	3.6%	43.3%	91.6%	69.2%
Sde-CMal_035-Ex1-3A-lcwgs-1-1	7.6%	42.7%	91.7%	49.2%
Sde-CMal_036-Ex1-8F-lcwgs-1-1	0.9%	43.7%	89.4%	55.6%
Sde-CMal_037-Ex1-8G-lcwgs-1-1	0.9%	43.9%	91.0%	61.4%
Sde-CMal_038-Ex1-2H-lcwgs-1-1	1.1%	42.8%	91.1%	70.3%
Sde-CMal_039-Ex1-6F-lcwgs-1-1	1.2%	43.7%	91.2%	62.1%
Sde-CMal_040-Ex1-6E-lcwgs-1-1	1.2%	44.7%	91.0%	59.4%
Sde-CMal_041-Ex1-7H-lcwgs-1-1	1.0%	43.8%	91.6%	64.7%
Sde-CMal_042-Ex1-7A-lcwgs-1-1	0.0%	45.8%	89.6%	41.0%
Sde-CMal_043-Ex1-1E-lcwgs-1-1	1.7%	44.7%	90.8%	68.5%
Sde-CMal_044-Ex1-2D-lcwgs-1-1	1.0%	43.0%	90.7%	68.7%
Sde-CMal_045-Ex1-6C-lcwgs-1-1	1.4%	44.1%	90.2%	61.3%
Sde-CMal_046-Ex1-1H-lcwgs-1-1	1.3%	43.9%	90.0%	71.6%
Sde-CMal_047-Ex1-2F-lcwgs-1-1	1.1%	42.8%	90.8%	67.4%
Sde-CMal_048-Ex1-4F-lcwgs-1-1	1.2%	43.7%	90.5%	62.4%
Sde-CMal_049-Ex1-6A-lcwgs-1-1	1.5%	45.5%	88.6%	34.3%
Sde-CMal_050-Ex1-3D-lcwgs-1-1	1.1%	42.6%	91.3%	71.8%
Sde-CMal_051-Ex1-5H-lcwgs-1-1	1.2%	43.8%	91.6%	63.6%
Sde-CMal_052-Ex1-8E-lcwgs-1-1	0.9%	44.7%	91.0%	58.2%
Sde-CMal_053-Ex1-7D-lcwgs-1-1	0.8%	43.9%	91.6%	63.8%
Sde-CMal_054-Ex1-5B-lcwgs-1-1	1.5%	44.3%	91.6%	65.4%
Sde-CMal_055-Ex1-8D-lcwgs-1-1	0.9%	43.7%	89.5%	57.3%
Sde-CMal_056-Ex1-5C-lcwgs-1-1	1.0%	44.1%	89.9%	61.0%
Sde-CMal_057-Ex1-7C-lcwgs-1-1	1.1%	44.0%	90.5%	62.6%
Sde-CMal_058-Ex1-7G-lcwgs-1-1	1.0%	44.1%	92.3%	65.9%
Sde-CMal_059-Ex1-3B-lcwgs-1-1	1.1%	43.3%	90.5%	68.1%
Sde-CMal_060-Ex1-4H-lcwgs-1-1	1.1%	43.9%	90.1%	62.5%
Sde-CMal_061-Ex1-8B-lcwgs-1-1	1.2%	44.3%	90.8%	60.0%
Sde-CMal_062-Ex1-2B-lcwgs-1-1	1.5%	43.3%	91.4%	70.5%
Sde-CMal_063-Ex1-6B-lcwgs-1-1	1.4%	44.2%	91.1%	60.0%
Sde-CMal_064-Ex1-6D-lcwgs-1-1	1.0%	43.8%	90.2%	60.1%
Sde-CMal_065-Ex1-2C-lcwgs-1-1	1.1%	42.9%	90.2%	69.0%
Sde-CMal_066-Ex1-1G-lcwgs-1-1	1.2%	44.0%	90.9%	72.1%
Sde-CMal_067-Ex1-3F-lcwgs-1-1	1.1%	42.4%	91.1%	70.6%
Sde-CMal_068-Ex1-2A-lcwgs-1-1	2.3%	40.9%	90.1%	72.4%
Sde-CMal_069-Ex1-4E-lcwgs-1-1	1.2%	44.9%	91.4%	62.0%
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

## 14. Clean up
TBD
