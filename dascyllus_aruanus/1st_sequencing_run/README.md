## 1. Download data
Data downloaded from TAMUCC grid.

## 2. Proofread the decode files
Decode file format is correct. There are 85 forward reads and 85 reverse reads, all libraries are unique.

## 3. Edit the decode file
N/A, no formatting issue.

## 4. Make a copy of the fq_raw files
Used `screen` to copy the raw files to `/RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/dascyllus_aruanus/1st_sequencing_run/fq_raw`

## 5. Perform a renaming dry run.
<details><summary>Expand for output.</summary>

```bash
decode file read into memory
rename not specified, original and new file names will be printed to screen
bash renameFQGZ.bash Dar_LCWGS-TestLane_SequenceNameDecode.tsv

if you want to rename then bash renameFQGZ.bash Dar_LCWGS-TestLane_SequenceNameDecode.tsv rename

writing original file names to file, origFileNames.txt...
writing newFileNames.txt...
editing newFileNames.txt...
preview of orig and new R1 file names...
Da0100903B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_009-Ex1-3B-lcwgs-1-1.1.fq.gz
Da0101203D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_012-Ex1-3D-lcwgs-1-1.1.fq.gz
Da0101901G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_019-Ex1-1G-lcwgs-1-1.1.fq.gz
Da0102004F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_020-Ex1-4F-lcwgs-1-1.1.fq.gz
Da0102106F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_021-Ex1-6F-lcwgs-1-1.1.fq.gz
Da0102207C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_022-Ex1-7C-lcwgs-1-1.1.fq.gz
Da0102308B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_023-Ex1-8B-lcwgs-1-1.1.fq.gz
Da0102407E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_024-Ex1-7E-lcwgs-1-1.1.fq.gz
Da0102503C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_025-Ex1-3C-lcwgs-1-1.1.fq.gz
Da0102608A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_026-Ex1-8A-lcwgs-1-1.1.fq.gz
Da0102802F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_028-Ex1-2F-lcwgs-1-1.1.fq.gz
Da0102905B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_029-Ex1-5B-lcwgs-1-1.1.fq.gz
Da0103008D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_030-Ex1-8D-lcwgs-1-1.1.fq.gz
Da0103104H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_031-Ex1-4H-lcwgs-1-1.1.fq.gz
Da0103203H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_032-Ex1-3H-lcwgs-1-1.1.fq.gz
Da0103508H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_035-Ex1-8H-lcwgs-1-1.1.fq.gz
Da0103608C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_036-Ex1-8C-lcwgs-1-1.1.fq.gz
Da0103702D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_037-Ex1-2D-lcwgs-1-1.1.fq.gz
Da0103806A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_038-Ex1-6A-lcwgs-1-1.1.fq.gz
Da0103907H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_039-Ex1-7H-lcwgs-1-1.1.fq.gz
Da0104001E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_040-Ex1-1E-lcwgs-1-1.1.fq.gz
Da0104101B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_041-Ex1-1B-lcwgs-1-1.1.fq.gz
Da0104304C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_043-Ex1-4C-lcwgs-1-1.1.fq.gz
Da0104405E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_044-Ex1-5E-lcwgs-1-1.1.fq.gz
Da0104505D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_045-Ex1-5D-lcwgs-1-1.1.fq.gz
Da0104602A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_046-Ex1-2A-lcwgs-1-1.1.fq.gz
Da0105003E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_050-Ex1-3E-lcwgs-1-1.1.fq.gz
Da0105101H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_051-Ex1-1H-lcwgs-1-1.1.fq.gz
Da0105203G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_052-Ex1-3G-lcwgs-1-1.1.fq.gz
Da0105302C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_053-Ex1-2C-lcwgs-1-1.1.fq.gz
Da0105402H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_054-Ex1-2H-lcwgs-1-1.1.fq.gz
Da0105506B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_055-Ex1-6B-lcwgs-1-1.1.fq.gz
Da0105608F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_056-Ex1-8F-lcwgs-1-1.1.fq.gz
Da0105801C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_058-Ex1-1C-lcwgs-1-1.1.fq.gz
Da0105906H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_059-Ex1-6H-lcwgs-1-1.1.fq.gz
Da0106001F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_060-Ex1-1F-lcwgs-1-1.1.fq.gz
Da0106102B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_061-Ex1-2B-lcwgs-1-1.1.fq.gz
Da0106207B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_062-Ex1-7B-lcwgs-1-1.1.fq.gz
Da0106502G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_065-Ex1-2G-lcwgs-1-1.1.fq.gz
Da0106605A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_066-Ex1-5A-lcwgs-1-1.1.fq.gz
Da0106702E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_067-Ex1-2E-lcwgs-1-1.1.fq.gz
Da0106808E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_068-Ex1-8E-lcwgs-1-1.1.fq.gz
Da0106904D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_069-Ex1-4D-lcwgs-1-1.1.fq.gz
Da0107005F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_070-Ex1-5F-lcwgs-1-1.1.fq.gz
Da0107107D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_071-Ex1-7D-lcwgs-1-1.1.fq.gz
Da0107208G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_072-Ex1-8G-lcwgs-1-1.1.fq.gz
Da0107303F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_073-Ex1-3F-lcwgs-1-1.1.fq.gz
Da0107407G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_074-Ex1-7G-lcwgs-1-1.1.fq.gz
Da0107504E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_075-Ex1-4E-lcwgs-1-1.1.fq.gz
Da0107605H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_076-Ex1-5H-lcwgs-1-1.1.fq.gz
Da0107707A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_077-Ex1-7A-lcwgs-1-1.1.fq.gz
Da0107806D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_078-Ex1-6D-lcwgs-1-1.1.fq.gz
Da0108004G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_080-Ex1-4G-lcwgs-1-1.1.fq.gz
Da0108107F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_081-Ex1-7F-lcwgs-1-1.1.fq.gz
Da0108205C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_082-Ex1-5C-lcwgs-1-1.1.fq.gz
Da0108306C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_083-Ex1-6C-lcwgs-1-1.1.fq.gz
Da0108404A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_084-Ex1-4A-lcwgs-1-1.1.fq.gz
Da0108503A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_085-Ex1-3A-lcwgs-1-1.1.fq.gz
Da0108606E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_086-Ex1-6E-lcwgs-1-1.1.fq.gz
Da0108704B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_087-Ex1-4B-lcwgs-1-1.1.fq.gz
Da0108801A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_088-Ex1-1A-lcwgs-1-1.1.fq.gz
Da0109006G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_090-Ex1-6G-lcwgs-1-1.1.fq.gz
Da0109205G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_092-Ex1-5G-lcwgs-1-1.1.fq.gz
Da0109401D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-CJol_094-Ex1-1D-lcwgs-1-1.1.fq.gz
Da0800101A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_001-Ex1-1A-lcwgs-1-1.1.fq.gz
Da0800201B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_002-Ex1-1B-lcwgs-1-1.1.fq.gz
Da0800301C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_003-Ex1-1C-lcwgs-1-1.1.fq.gz
Da0800401D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_004-Ex1-1D-lcwgs-1-1.1.fq.gz
Da0800501E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_005-Ex1-1E-lcwgs-1-1.1.fq.gz
Da0800601F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_006-Ex1-1F-lcwgs-1-1.1.fq.gz
Da0800701G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_007-Ex1-1G-lcwgs-1-1.1.fq.gz
Da0800801H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_008-Ex1-1H-lcwgs-1-1.1.fq.gz
Da0800902A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_009-Ex1-2A-lcwgs-1-1.1.fq.gz
Da0801002B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_010-Ex1-2B-lcwgs-1-1.1.fq.gz
Da0801102C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_011-Ex1-2C-lcwgs-1-1.1.fq.gz
Da0801202D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_012-Ex1-2D-lcwgs-1-1.1.fq.gz
Da0801302E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_013-Ex1-2E-lcwgs-1-1.1.fq.gz
Da0801402F_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_014-Ex1-2F-lcwgs-1-1.1.fq.gz
Da0801502G_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_015-Ex1-2G-lcwgs-1-1.1.fq.gz
Da0801602H_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_016-Ex1-2H-lcwgs-1-1.1.fq.gz
Da0801703A_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_017-Ex1-3A-lcwgs-1-1.1.fq.gz
Da0801803B_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_018-Ex1-3B-lcwgs-1-1.1.fq.gz
Da0801903C_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_019-Ex1-3C-lcwgs-1-1.1.fq.gz
Da0802003D_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_020-Ex1-3D-lcwgs-1-1.1.fq.gz
Da0802103E_CKDL230015394-1A_HJLLNCCX2_L1_1.fq.gz Dar-AJol_021-Ex1-3E-lcwgs-1-1.1.fq.gz
preview of orig and new R2 file names...
Da0100903B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_009-Ex1-3B-lcwgs-1-1.2.fq.gz
Da0101203D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_012-Ex1-3D-lcwgs-1-1.2.fq.gz
Da0101901G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_019-Ex1-1G-lcwgs-1-1.2.fq.gz
Da0102004F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_020-Ex1-4F-lcwgs-1-1.2.fq.gz
Da0102106F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_021-Ex1-6F-lcwgs-1-1.2.fq.gz
Da0102207C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_022-Ex1-7C-lcwgs-1-1.2.fq.gz
Da0102308B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_023-Ex1-8B-lcwgs-1-1.2.fq.gz
Da0102407E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_024-Ex1-7E-lcwgs-1-1.2.fq.gz
Da0102503C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_025-Ex1-3C-lcwgs-1-1.2.fq.gz
Da0102608A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_026-Ex1-8A-lcwgs-1-1.2.fq.gz
Da0102802F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_028-Ex1-2F-lcwgs-1-1.2.fq.gz
Da0102905B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_029-Ex1-5B-lcwgs-1-1.2.fq.gz
Da0103008D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_030-Ex1-8D-lcwgs-1-1.2.fq.gz
Da0103104H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_031-Ex1-4H-lcwgs-1-1.2.fq.gz
Da0103203H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_032-Ex1-3H-lcwgs-1-1.2.fq.gz
Da0103508H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_035-Ex1-8H-lcwgs-1-1.2.fq.gz
Da0103608C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_036-Ex1-8C-lcwgs-1-1.2.fq.gz
Da0103702D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_037-Ex1-2D-lcwgs-1-1.2.fq.gz
Da0103806A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_038-Ex1-6A-lcwgs-1-1.2.fq.gz
Da0103907H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_039-Ex1-7H-lcwgs-1-1.2.fq.gz
Da0104001E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_040-Ex1-1E-lcwgs-1-1.2.fq.gz
Da0104101B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_041-Ex1-1B-lcwgs-1-1.2.fq.gz
Da0104304C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_043-Ex1-4C-lcwgs-1-1.2.fq.gz
Da0104405E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_044-Ex1-5E-lcwgs-1-1.2.fq.gz
Da0104505D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_045-Ex1-5D-lcwgs-1-1.2.fq.gz
Da0104602A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_046-Ex1-2A-lcwgs-1-1.2.fq.gz
Da0105003E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_050-Ex1-3E-lcwgs-1-1.2.fq.gz
Da0105101H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_051-Ex1-1H-lcwgs-1-1.2.fq.gz
Da0105203G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_052-Ex1-3G-lcwgs-1-1.2.fq.gz
Da0105302C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_053-Ex1-2C-lcwgs-1-1.2.fq.gz
Da0105402H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_054-Ex1-2H-lcwgs-1-1.2.fq.gz
Da0105506B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_055-Ex1-6B-lcwgs-1-1.2.fq.gz
Da0105608F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_056-Ex1-8F-lcwgs-1-1.2.fq.gz
Da0105801C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_058-Ex1-1C-lcwgs-1-1.2.fq.gz
Da0105906H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_059-Ex1-6H-lcwgs-1-1.2.fq.gz
Da0106001F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_060-Ex1-1F-lcwgs-1-1.2.fq.gz
Da0106102B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_061-Ex1-2B-lcwgs-1-1.2.fq.gz
Da0106207B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_062-Ex1-7B-lcwgs-1-1.2.fq.gz
Da0106502G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_065-Ex1-2G-lcwgs-1-1.2.fq.gz
Da0106605A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_066-Ex1-5A-lcwgs-1-1.2.fq.gz
Da0106702E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_067-Ex1-2E-lcwgs-1-1.2.fq.gz
Da0106808E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_068-Ex1-8E-lcwgs-1-1.2.fq.gz
Da0106904D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_069-Ex1-4D-lcwgs-1-1.2.fq.gz
Da0107005F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_070-Ex1-5F-lcwgs-1-1.2.fq.gz
Da0107107D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_071-Ex1-7D-lcwgs-1-1.2.fq.gz
Da0107208G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_072-Ex1-8G-lcwgs-1-1.2.fq.gz
Da0107303F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_073-Ex1-3F-lcwgs-1-1.2.fq.gz
Da0107407G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_074-Ex1-7G-lcwgs-1-1.2.fq.gz
Da0107504E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_075-Ex1-4E-lcwgs-1-1.2.fq.gz
Da0107605H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_076-Ex1-5H-lcwgs-1-1.2.fq.gz
Da0107707A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_077-Ex1-7A-lcwgs-1-1.2.fq.gz
Da0107806D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_078-Ex1-6D-lcwgs-1-1.2.fq.gz
Da0108004G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_080-Ex1-4G-lcwgs-1-1.2.fq.gz
Da0108107F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_081-Ex1-7F-lcwgs-1-1.2.fq.gz
Da0108205C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_082-Ex1-5C-lcwgs-1-1.2.fq.gz
Da0108306C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_083-Ex1-6C-lcwgs-1-1.2.fq.gz
Da0108404A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_084-Ex1-4A-lcwgs-1-1.2.fq.gz
Da0108503A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_085-Ex1-3A-lcwgs-1-1.2.fq.gz
Da0108606E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_086-Ex1-6E-lcwgs-1-1.2.fq.gz
Da0108704B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_087-Ex1-4B-lcwgs-1-1.2.fq.gz
Da0108801A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_088-Ex1-1A-lcwgs-1-1.2.fq.gz
Da0109006G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_090-Ex1-6G-lcwgs-1-1.2.fq.gz
Da0109205G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_092-Ex1-5G-lcwgs-1-1.2.fq.gz
Da0109401D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-CJol_094-Ex1-1D-lcwgs-1-1.2.fq.gz
Da0800101A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_001-Ex1-1A-lcwgs-1-1.2.fq.gz
Da0800201B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_002-Ex1-1B-lcwgs-1-1.2.fq.gz
Da0800301C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_003-Ex1-1C-lcwgs-1-1.2.fq.gz
Da0800401D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_004-Ex1-1D-lcwgs-1-1.2.fq.gz
Da0800501E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_005-Ex1-1E-lcwgs-1-1.2.fq.gz
Da0800601F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_006-Ex1-1F-lcwgs-1-1.2.fq.gz
Da0800701G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_007-Ex1-1G-lcwgs-1-1.2.fq.gz
Da0800801H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_008-Ex1-1H-lcwgs-1-1.2.fq.gz
Da0800902A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_009-Ex1-2A-lcwgs-1-1.2.fq.gz
Da0801002B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_010-Ex1-2B-lcwgs-1-1.2.fq.gz
Da0801102C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_011-Ex1-2C-lcwgs-1-1.2.fq.gz
Da0801202D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_012-Ex1-2D-lcwgs-1-1.2.fq.gz
Da0801302E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_013-Ex1-2E-lcwgs-1-1.2.fq.gz
Da0801402F_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_014-Ex1-2F-lcwgs-1-1.2.fq.gz
Da0801502G_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_015-Ex1-2G-lcwgs-1-1.2.fq.gz
Da0801602H_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_016-Ex1-2H-lcwgs-1-1.2.fq.gz
Da0801703A_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_017-Ex1-3A-lcwgs-1-1.2.fq.gz
Da0801803B_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_018-Ex1-3B-lcwgs-1-1.2.fq.gz
Da0801903C_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_019-Ex1-3C-lcwgs-1-1.2.fq.gz
Da0802003D_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_020-Ex1-3D-lcwgs-1-1.2.fq.gz
Da0802103E_CKDL230015394-1A_HJLLNCCX2_L1_2.fq.gz Dar-AJol_021-Ex1-3E-lcwgs-1-1.2.fq.gz
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
Dar-AJol_001-Ex1-1A-lcwgs-1-1.1	14.7%	48%	7.1
Dar-AJol_001-Ex1-1A-lcwgs-1-1.2	13.9%	48%	7.1
Dar-AJol_002-Ex1-1B-lcwgs-1-1.1	15.2%	45%	4.8
Dar-AJol_002-Ex1-1B-lcwgs-1-1.2	14.3%	45%	4.8
Dar-AJol_003-Ex1-1C-lcwgs-1-1.1	16.5%	46%	4.0
Dar-AJol_003-Ex1-1C-lcwgs-1-1.2	15.7%	46%	4.0
Dar-AJol_004-Ex1-1D-lcwgs-1-1.1	14.7%	46%	8.2
Dar-AJol_004-Ex1-1D-lcwgs-1-1.2	13.9%	46%	8.2
Dar-AJol_005-Ex1-1E-lcwgs-1-1.1	33.4%	48%	1.4
Dar-AJol_005-Ex1-1E-lcwgs-1-1.2	32.0%	48%	1.4
Dar-AJol_006-Ex1-1F-lcwgs-1-1.1	16.8%	46%	2.3
Dar-AJol_006-Ex1-1F-lcwgs-1-1.2	16.3%	46%	2.3
Dar-AJol_007-Ex1-1G-lcwgs-1-1.1	25.6%	46%	3.6
Dar-AJol_007-Ex1-1G-lcwgs-1-1.2	24.5%	46%	3.6
Dar-AJol_008-Ex1-1H-lcwgs-1-1.1	20.7%	46%	5.4
Dar-AJol_008-Ex1-1H-lcwgs-1-1.2	19.3%	46%	5.4
Dar-AJol_009-Ex1-2A-lcwgs-1-1.1	13.5%	44%	11.1
Dar-AJol_009-Ex1-2A-lcwgs-1-1.2	12.5%	44%	11.1
Dar-AJol_010-Ex1-2B-lcwgs-1-1.1	11.4%	43%	3.3
Dar-AJol_010-Ex1-2B-lcwgs-1-1.2	11.0%	43%	3.3
Dar-AJol_011-Ex1-2C-lcwgs-1-1.1	14.2%	45%	1.7
Dar-AJol_011-Ex1-2C-lcwgs-1-1.2	13.7%	45%	1.7
Dar-AJol_012-Ex1-2D-lcwgs-1-1.1	15.5%	45%	6.9
Dar-AJol_012-Ex1-2D-lcwgs-1-1.2	14.7%	46%	6.9
Dar-AJol_013-Ex1-2E-lcwgs-1-1.1	12.9%	43%	4.3
Dar-AJol_013-Ex1-2E-lcwgs-1-1.2	12.3%	44%	4.3
Dar-AJol_014-Ex1-2F-lcwgs-1-1.1	13.3%	42%	2.6
Dar-AJol_014-Ex1-2F-lcwgs-1-1.2	12.9%	42%	2.6
Dar-AJol_015-Ex1-2G-lcwgs-1-1.1	14.1%	42%	1.1
Dar-AJol_015-Ex1-2G-lcwgs-1-1.2	13.6%	43%	1.1
Dar-AJol_016-Ex1-2H-lcwgs-1-1.1	16.9%	46%	6.1
Dar-AJol_016-Ex1-2H-lcwgs-1-1.2	15.9%	46%	6.1
Dar-AJol_017-Ex1-3A-lcwgs-1-1.1	13.1%	44%	3.2
Dar-AJol_017-Ex1-3A-lcwgs-1-1.2	12.4%	45%	3.2
Dar-AJol_018-Ex1-3B-lcwgs-1-1.1	13.9%	43%	1.7
Dar-AJol_018-Ex1-3B-lcwgs-1-1.2	13.4%	43%	1.7
Dar-AJol_019-Ex1-3C-lcwgs-1-1.1	16.0%	43%	10.9
Dar-AJol_019-Ex1-3C-lcwgs-1-1.2	14.6%	43%	10.9
Dar-AJol_020-Ex1-3D-lcwgs-1-1.1	16.3%	43%	5.8
Dar-AJol_020-Ex1-3D-lcwgs-1-1.2	15.8%	44%	5.8
Dar-AJol_021-Ex1-3E-lcwgs-1-1.1	13.7%	42%	1.9
Dar-AJol_021-Ex1-3E-lcwgs-1-1.2	13.3%	42%	1.9
Dar-CJol_009-Ex1-3B-lcwgs-1-1.1	16.8%	47%	2.8
Dar-CJol_009-Ex1-3B-lcwgs-1-1.2	15.7%	47%	2.8
Dar-CJol_012-Ex1-3D-lcwgs-1-1.1	22.0%	51%	2.4
Dar-CJol_012-Ex1-3D-lcwgs-1-1.2	20.4%	51%	2.4
Dar-CJol_019-Ex1-1G-lcwgs-1-1.1	13.8%	47%	2.7
Dar-CJol_019-Ex1-1G-lcwgs-1-1.2	12.7%	47%	2.7
Dar-CJol_020-Ex1-4F-lcwgs-1-1.1	16.7%	49%	4.8
Dar-CJol_020-Ex1-4F-lcwgs-1-1.2	15.7%	49%	4.8
Dar-CJol_021-Ex1-6F-lcwgs-1-1.1	16.5%	48%	5.3
Dar-CJol_021-Ex1-6F-lcwgs-1-1.2	15.6%	48%	5.3
Dar-CJol_022-Ex1-7C-lcwgs-1-1.1	13.1%	49%	1.3
Dar-CJol_022-Ex1-7C-lcwgs-1-1.2	12.4%	49%	1.3
Dar-CJol_023-Ex1-8B-lcwgs-1-1.1	12.4%	48%	1.0
Dar-CJol_023-Ex1-8B-lcwgs-1-1.2	11.8%	48%	1.0
Dar-CJol_024-Ex1-7E-lcwgs-1-1.1	9.8%	49%	0.0
Dar-CJol_024-Ex1-7E-lcwgs-1-1.2	4.9%	48%	0.0
Dar-CJol_025-Ex1-3C-lcwgs-1-1.1	13.5%	47%	2.4
Dar-CJol_025-Ex1-3C-lcwgs-1-1.2	12.6%	47%	2.4
Dar-CJol_026-Ex1-8A-lcwgs-1-1.1	12.5%	48%	1.2
Dar-CJol_026-Ex1-8A-lcwgs-1-1.2	12.0%	48%	1.2
Dar-CJol_028-Ex1-2F-lcwgs-1-1.1	17.7%	47%	5.6
Dar-CJol_028-Ex1-2F-lcwgs-1-1.2	16.8%	47%	5.6
Dar-CJol_029-Ex1-5B-lcwgs-1-1.1	15.7%	46%	2.9
Dar-CJol_029-Ex1-5B-lcwgs-1-1.2	14.9%	46%	2.9
Dar-CJol_030-Ex1-8D-lcwgs-1-1.1	16.0%	49%	1.9
Dar-CJol_030-Ex1-8D-lcwgs-1-1.2	15.3%	49%	1.9
Dar-CJol_031-Ex1-4H-lcwgs-1-1.1	13.6%	48%	2.2
Dar-CJol_031-Ex1-4H-lcwgs-1-1.2	12.9%	48%	2.2
Dar-CJol_032-Ex1-3H-lcwgs-1-1.1	18.5%	49%	2.0
Dar-CJol_032-Ex1-3H-lcwgs-1-1.2	17.3%	49%	2.0
Dar-CJol_035-Ex1-8H-lcwgs-1-1.1	12.2%	46%	0.7
Dar-CJol_035-Ex1-8H-lcwgs-1-1.2	11.6%	46%	0.7
Dar-CJol_036-Ex1-8C-lcwgs-1-1.1	13.2%	47%	0.8
Dar-CJol_036-Ex1-8C-lcwgs-1-1.2	12.6%	47%	0.8
Dar-CJol_037-Ex1-2D-lcwgs-1-1.1	15.5%	49%	2.6
Dar-CJol_037-Ex1-2D-lcwgs-1-1.2	14.5%	49%	2.6
Dar-CJol_038-Ex1-6A-lcwgs-1-1.1	15.5%	46%	2.5
Dar-CJol_038-Ex1-6A-lcwgs-1-1.2	14.6%	46%	2.5
Dar-CJol_039-Ex1-7H-lcwgs-1-1.1	19.2%	48%	1.3
Dar-CJol_039-Ex1-7H-lcwgs-1-1.2	18.4%	48%	1.3
Dar-CJol_040-Ex1-1E-lcwgs-1-1.1	4.4%	48%	0.0
Dar-CJol_040-Ex1-1E-lcwgs-1-1.2	4.4%	48%	0.0
Dar-CJol_041-Ex1-1B-lcwgs-1-1.1	16.5%	50%	3.2
Dar-CJol_041-Ex1-1B-lcwgs-1-1.2	15.5%	50%	3.2
Dar-CJol_043-Ex1-4C-lcwgs-1-1.1	14.3%	46%	1.8
Dar-CJol_043-Ex1-4C-lcwgs-1-1.2	13.4%	46%	1.8
Dar-CJol_044-Ex1-5E-lcwgs-1-1.1	2.4%	49%	0.0
Dar-CJol_044-Ex1-5E-lcwgs-1-1.2	2.4%	47%	0.0
Dar-CJol_045-Ex1-5D-lcwgs-1-1.1	18.5%	49%	3.3
Dar-CJol_045-Ex1-5D-lcwgs-1-1.2	17.4%	49%	3.3
Dar-CJol_046-Ex1-2A-lcwgs-1-1.1	15.1%	48%	2.4
Dar-CJol_046-Ex1-2A-lcwgs-1-1.2	14.5%	48%	2.4
Dar-CJol_050-Ex1-3E-lcwgs-1-1.1	0.0%	49%	0.0
Dar-CJol_050-Ex1-3E-lcwgs-1-1.2	0.0%	49%	0.0
Dar-CJol_051-Ex1-1H-lcwgs-1-1.1	13.3%	48%	3.4
Dar-CJol_051-Ex1-1H-lcwgs-1-1.2	12.6%	48%	3.4
Dar-CJol_052-Ex1-3G-lcwgs-1-1.1	14.7%	48%	2.3
Dar-CJol_052-Ex1-3G-lcwgs-1-1.2	13.8%	48%	2.3
Dar-CJol_053-Ex1-2C-lcwgs-1-1.1	17.7%	49%	2.7
Dar-CJol_053-Ex1-2C-lcwgs-1-1.2	16.8%	49%	2.7
Dar-CJol_054-Ex1-2H-lcwgs-1-1.1	13.8%	45%	3.7
Dar-CJol_054-Ex1-2H-lcwgs-1-1.2	13.0%	45%	3.7
Dar-CJol_055-Ex1-6B-lcwgs-1-1.1	14.6%	46%	3.3
Dar-CJol_055-Ex1-6B-lcwgs-1-1.2	13.9%	46%	3.3
Dar-CJol_056-Ex1-8F-lcwgs-1-1.1	18.6%	48%	3.1
Dar-CJol_056-Ex1-8F-lcwgs-1-1.2	17.9%	48%	3.1
Dar-CJol_058-Ex1-1C-lcwgs-1-1.1	13.1%	47%	2.6
Dar-CJol_058-Ex1-1C-lcwgs-1-1.2	12.4%	47%	2.6
Dar-CJol_059-Ex1-6H-lcwgs-1-1.1	14.8%	46%	1.5
Dar-CJol_059-Ex1-6H-lcwgs-1-1.2	14.0%	46%	1.5
Dar-CJol_060-Ex1-1F-lcwgs-1-1.1	15.8%	48%	6.0
Dar-CJol_060-Ex1-1F-lcwgs-1-1.2	15.1%	48%	6.0
Dar-CJol_061-Ex1-2B-lcwgs-1-1.1	18.9%	50%	2.6
Dar-CJol_061-Ex1-2B-lcwgs-1-1.2	18.1%	49%	2.6
Dar-CJol_062-Ex1-7B-lcwgs-1-1.1	18.8%	49%	1.8
Dar-CJol_062-Ex1-7B-lcwgs-1-1.2	17.9%	49%	1.8
Dar-CJol_065-Ex1-2G-lcwgs-1-1.1	22.8%	49%	1.5
Dar-CJol_065-Ex1-2G-lcwgs-1-1.2	21.7%	49%	1.5
Dar-CJol_066-Ex1-5A-lcwgs-1-1.1	15.7%	48%	2.1
Dar-CJol_066-Ex1-5A-lcwgs-1-1.2	15.0%	48%	2.1
Dar-CJol_067-Ex1-2E-lcwgs-1-1.1	3.6%	47%	0.0
Dar-CJol_067-Ex1-2E-lcwgs-1-1.2	3.6%	48%	0.0
Dar-CJol_068-Ex1-8E-lcwgs-1-1.1	6.7%	50%	0.0
Dar-CJol_068-Ex1-8E-lcwgs-1-1.2	6.7%	53%	0.0
Dar-CJol_069-Ex1-4D-lcwgs-1-1.1	16.6%	49%	3.3
Dar-CJol_069-Ex1-4D-lcwgs-1-1.2	15.7%	49%	3.3
Dar-CJol_070-Ex1-5F-lcwgs-1-1.1	19.3%	49%	4.8
Dar-CJol_070-Ex1-5F-lcwgs-1-1.2	18.5%	49%	4.8
Dar-CJol_071-Ex1-7D-lcwgs-1-1.1	13.7%	48%	1.8
Dar-CJol_071-Ex1-7D-lcwgs-1-1.2	13.1%	48%	1.8
Dar-CJol_072-Ex1-8G-lcwgs-1-1.1	12.5%	47%	0.7
Dar-CJol_072-Ex1-8G-lcwgs-1-1.2	11.9%	47%	0.7
Dar-CJol_073-Ex1-3F-lcwgs-1-1.1	17.2%	49%	6.8
Dar-CJol_073-Ex1-3F-lcwgs-1-1.2	16.4%	48%	6.8
Dar-CJol_074-Ex1-7G-lcwgs-1-1.1	14.0%	48%	2.3
Dar-CJol_074-Ex1-7G-lcwgs-1-1.2	13.4%	48%	2.3
Dar-CJol_075-Ex1-4E-lcwgs-1-1.1	5.4%	49%	0.0
Dar-CJol_075-Ex1-4E-lcwgs-1-1.2	2.7%	49%	0.0
Dar-CJol_076-Ex1-5H-lcwgs-1-1.1	15.1%	48%	4.1
Dar-CJol_076-Ex1-5H-lcwgs-1-1.2	14.4%	48%	4.1
Dar-CJol_077-Ex1-7A-lcwgs-1-1.1	17.7%	48%	1.5
Dar-CJol_077-Ex1-7A-lcwgs-1-1.2	16.9%	48%	1.5
Dar-CJol_078-Ex1-6D-lcwgs-1-1.1	16.9%	49%	1.9
Dar-CJol_078-Ex1-6D-lcwgs-1-1.2	15.8%	49%	1.9
Dar-CJol_080-Ex1-4G-lcwgs-1-1.1	15.5%	49%	3.4
Dar-CJol_080-Ex1-4G-lcwgs-1-1.2	14.6%	49%	3.4
Dar-CJol_081-Ex1-7F-lcwgs-1-1.1	15.9%	48%	4.6
Dar-CJol_081-Ex1-7F-lcwgs-1-1.2	15.1%	48%	4.6
Dar-CJol_082-Ex1-5C-lcwgs-1-1.1	14.9%	48%	1.1
Dar-CJol_082-Ex1-5C-lcwgs-1-1.2	14.1%	48%	1.1
Dar-CJol_083-Ex1-6C-lcwgs-1-1.1	17.7%	49%	1.1
Dar-CJol_083-Ex1-6C-lcwgs-1-1.2	16.6%	49%	1.1
Dar-CJol_084-Ex1-4A-lcwgs-1-1.1	14.5%	48%	1.6
Dar-CJol_084-Ex1-4A-lcwgs-1-1.2	13.6%	48%	1.6
Dar-CJol_085-Ex1-3A-lcwgs-1-1.1	19.6%	49%	4.3
Dar-CJol_085-Ex1-3A-lcwgs-1-1.2	18.5%	49%	4.3
Dar-CJol_086-Ex1-6E-lcwgs-1-1.1	11.8%	47%	0.0
Dar-CJol_086-Ex1-6E-lcwgs-1-1.2	11.8%	49%	0.0
Dar-CJol_087-Ex1-4B-lcwgs-1-1.1	16.2%	49%	2.6
Dar-CJol_087-Ex1-4B-lcwgs-1-1.2	15.3%	49%	2.6
Dar-CJol_088-Ex1-1A-lcwgs-1-1.1	13.8%	48%	1.6
Dar-CJol_088-Ex1-1A-lcwgs-1-1.2	13.1%	48%	1.6
Dar-CJol_090-Ex1-6G-lcwgs-1-1.1	16.1%	47%	1.5
Dar-CJol_090-Ex1-6G-lcwgs-1-1.2	14.6%	47%	1.5
Dar-CJol_092-Ex1-5G-lcwgs-1-1.1	16.3%	48%	4.1
Dar-CJol_092-Ex1-5G-lcwgs-1-1.2	15.3%	48%	4.1
Dar-CJol_094-Ex1-1D-lcwgs-1-1.1	15.1%	48%	2.1
Dar-CJol_094-Ex1-1D-lcwgs-1-1.2	13.9%	48%	2.1
```
</p>
</details>

## 8. First trim.
`sbatch ../../../pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Dar-AJol_001-Ex1-1A-lcwgs-1-1	15.3%	46.5%	93.9%	58.8%
Dar-AJol_002-Ex1-1B-lcwgs-1-1	16.3%	43.5%	95.5%	62.6%
Dar-AJol_003-Ex1-1C-lcwgs-1-1	16.1%	45.1%	93.8%	68.2%
Dar-AJol_004-Ex1-1D-lcwgs-1-1	16.3%	45.0%	95.8%	59.9%
Dar-AJol_005-Ex1-1E-lcwgs-1-1	23.5%	47.2%	83.1%	64.2%
Dar-AJol_006-Ex1-1F-lcwgs-1-1	16.8%	44.2%	94.1%	80.5%
Dar-AJol_007-Ex1-1G-lcwgs-1-1	17.1%	44.1%	87.9%	71.4%
Dar-AJol_008-Ex1-1H-lcwgs-1-1	19.7%	45.5%	92.8%	43.9%
Dar-AJol_009-Ex1-2A-lcwgs-1-1	15.7%	43.3%	96.8%	46.1%
Dar-AJol_010-Ex1-2B-lcwgs-1-1	14.1%	38.8%	97.0%	89.7%
Dar-AJol_011-Ex1-2C-lcwgs-1-1	14.4%	43.0%	95.0%	87.2%
Dar-AJol_012-Ex1-2D-lcwgs-1-1	15.8%	44.5%	95.5%	60.4%
Dar-AJol_013-Ex1-2E-lcwgs-1-1	15.3%	41.7%	96.8%	71.1%
Dar-AJol_014-Ex1-2F-lcwgs-1-1	15.8%	38.1%	96.6%	89.9%
Dar-AJol_015-Ex1-2G-lcwgs-1-1	16.2%	39.4%	96.6%	85.0%
Dar-AJol_016-Ex1-2H-lcwgs-1-1	16.5%	44.8%	93.7%	54.8%
Dar-AJol_017-Ex1-3A-lcwgs-1-1	15.5%	42.9%	96.3%	69.1%
Dar-AJol_018-Ex1-3B-lcwgs-1-1	15.0%	39.7%	95.0%	86.7%
Dar-AJol_019-Ex1-3C-lcwgs-1-1	16.8%	42.0%	96.4%	35.4%
Dar-AJol_020-Ex1-3D-lcwgs-1-1	15.5%	39.8%	93.1%	88.4%
Dar-AJol_021-Ex1-3E-lcwgs-1-1	15.7%	37.8%	96.1%	91.3%
Dar-CJol_009-Ex1-3B-lcwgs-1-1	17.5%	46.9%	96.7%	41.5%
Dar-CJol_012-Ex1-3D-lcwgs-1-1	17.6%	51.0%	93.9%	32.5%
Dar-CJol_019-Ex1-1G-lcwgs-1-1	16.4%	46.8%	98.0%	33.6%
Dar-CJol_020-Ex1-4F-lcwgs-1-1	16.5%	48.7%	96.6%	41.7%
Dar-CJol_021-Ex1-6F-lcwgs-1-1	18.1%	47.6%	96.8%	44.5%
Dar-CJol_022-Ex1-7C-lcwgs-1-1	14.0%	49.2%	96.3%	62.3%
Dar-CJol_023-Ex1-8B-lcwgs-1-1	14.8%	47.4%	97.1%	61.0%
Dar-CJol_024-Ex1-7E-lcwgs-1-1	2.7%	50.3%	82.9%	57.3%
Dar-CJol_025-Ex1-3C-lcwgs-1-1	16.8%	46.6%	98.0%	39.3%
Dar-CJol_026-Ex1-8A-lcwgs-1-1	15.1%	48.3%	97.4%	66.5%
Dar-CJol_028-Ex1-2F-lcwgs-1-1	16.7%	46.4%	94.4%	44.8%
Dar-CJol_029-Ex1-5B-lcwgs-1-1	17.5%	46.1%	97.6%	46.4%
Dar-CJol_030-Ex1-8D-lcwgs-1-1	14.5%	48.9%	94.3%	56.6%
Dar-CJol_031-Ex1-4H-lcwgs-1-1	16.5%	47.9%	97.9%	38.9%
Dar-CJol_032-Ex1-3H-lcwgs-1-1	17.9%	48.8%	95.9%	34.9%
Dar-CJol_035-Ex1-8H-lcwgs-1-1	15.4%	46.2%	97.6%	49.5%
Dar-CJol_036-Ex1-8C-lcwgs-1-1	14.9%	46.6%	96.2%	57.0%
Dar-CJol_037-Ex1-2D-lcwgs-1-1	16.2%	49.0%	96.6%	41.6%
Dar-CJol_038-Ex1-6A-lcwgs-1-1	19.2%	45.5%	98.5%	52.4%
Dar-CJol_039-Ex1-7H-lcwgs-1-1	14.8%	47.8%	90.6%	56.7%
Dar-CJol_040-Ex1-1E-lcwgs-1-1	4.4%	48.6%	91.1%	42.2%
Dar-CJol_041-Ex1-1B-lcwgs-1-1	16.0%	49.9%	97.1%	47.4%
Dar-CJol_043-Ex1-4C-lcwgs-1-1	16.4%	45.5%	96.6%	33.2%
Dar-CJol_044-Ex1-5E-lcwgs-1-1	2.4%	48.3%	83.3%	39.3%
Dar-CJol_045-Ex1-5D-lcwgs-1-1	16.6%	49.4%	96.0%	47.9%
Dar-CJol_046-Ex1-2A-lcwgs-1-1	16.5%	47.8%	97.3%	59.4%
Dar-CJol_050-Ex1-3E-lcwgs-1-1	0.0%	49.8%	90.5%	38.1%
Dar-CJol_051-Ex1-1H-lcwgs-1-1	15.1%	47.7%	97.7%	42.9%
Dar-CJol_052-Ex1-3G-lcwgs-1-1	16.4%	47.8%	96.8%	45.4%
Dar-CJol_053-Ex1-2C-lcwgs-1-1	16.8%	49.1%	94.9%	41.7%
Dar-CJol_054-Ex1-2H-lcwgs-1-1	17.6%	44.6%	98.3%	41.6%
Dar-CJol_055-Ex1-6B-lcwgs-1-1	18.3%	45.5%	98.1%	57.6%
Dar-CJol_056-Ex1-8F-lcwgs-1-1	15.0%	47.9%	92.4%	59.8%
Dar-CJol_058-Ex1-1C-lcwgs-1-1	15.5%	46.4%	97.8%	45.6%
Dar-CJol_059-Ex1-6H-lcwgs-1-1	18.8%	46.0%	98.0%	44.5%
Dar-CJol_060-Ex1-1F-lcwgs-1-1	15.2%	47.8%	96.4%	47.3%
Dar-CJol_061-Ex1-2B-lcwgs-1-1	15.9%	49.7%	93.3%	55.7%
Dar-CJol_062-Ex1-7B-lcwgs-1-1	14.7%	48.7%	92.2%	61.9%
Dar-CJol_065-Ex1-2G-lcwgs-1-1	17.5%	48.8%	89.3%	44.4%
Dar-CJol_066-Ex1-5A-lcwgs-1-1	17.9%	47.9%	97.7%	52.9%
Dar-CJol_067-Ex1-2E-lcwgs-1-1	7.1%	47.9%	89.3%	32.1%
Dar-CJol_068-Ex1-8E-lcwgs-1-1	6.7%	51.3%	86.7%	50.0%
Dar-CJol_069-Ex1-4D-lcwgs-1-1	14.9%	48.8%	94.9%	47.8%
Dar-CJol_070-Ex1-5F-lcwgs-1-1	16.7%	48.9%	94.1%	48.2%
Dar-CJol_071-Ex1-7D-lcwgs-1-1	14.4%	48.2%	96.5%	55.3%
Dar-CJol_072-Ex1-8G-lcwgs-1-1	15.2%	47.1%	97.1%	51.1%
Dar-CJol_073-Ex1-3F-lcwgs-1-1	16.8%	48.6%	96.5%	41.7%
Dar-CJol_074-Ex1-7G-lcwgs-1-1	15.0%	48.0%	96.7%	53.9%
Dar-CJol_075-Ex1-4E-lcwgs-1-1	2.8%	49.6%	94.6%	35.1%
Dar-CJol_076-Ex1-5H-lcwgs-1-1	16.4%	48.0%	97.2%	49.9%
Dar-CJol_077-Ex1-7A-lcwgs-1-1	14.5%	47.2%	93.0%	66.4%
Dar-CJol_078-Ex1-6D-lcwgs-1-1	18.2%	49.1%	96.2%	40.2%
Dar-CJol_080-Ex1-4G-lcwgs-1-1	16.6%	49.3%	97.6%	37.1%
Dar-CJol_081-Ex1-7F-lcwgs-1-1	14.3%	48.1%	95.2%	59.0%
Dar-CJol_082-Ex1-5C-lcwgs-1-1	15.9%	48.0%	95.9%	48.2%
Dar-CJol_083-Ex1-6C-lcwgs-1-1	18.4%	49.4%	96.5%	42.4%
Dar-CJol_084-Ex1-4A-lcwgs-1-1	16.2%	48.4%	97.7%	46.9%
Dar-CJol_085-Ex1-3A-lcwgs-1-1	18.4%	49.3%	97.1%	45.9%
Dar-CJol_086-Ex1-6E-lcwgs-1-1	11.8%	47.9%	94.1%	29.4%
Dar-CJol_087-Ex1-4B-lcwgs-1-1	16.4%	48.7%	96.4%	44.1%
Dar-CJol_088-Ex1-1A-lcwgs-1-1	15.3%	48.5%	97.9%	49.6%
Dar-CJol_090-Ex1-6G-lcwgs-1-1	19.0%	46.8%	97.1%	29.4%
Dar-CJol_092-Ex1-5G-lcwgs-1-1	17.6%	47.7%	97.8%	40.8%
Dar-CJol_094-Ex1-1D-lcwgs-1-1	15.3%	48.2%	97.2%	31.9%
```
</p>
</details>

## 9. Remove duplicates with clumpify.

### 9a. Remove duplicates.
`bash ../../../pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/hpc-0351 20`

### 9b. Check duplicate removal success.
`[hpc-0351@e1-w6420b-23 1st_sequencing_run]$ enable_lmod`\
`[hpc-0351@e1-w6420b-23 1st_sequencing_run]$ module load container_env R/4.2`\
`[hpc-0351@e1-w6420b-23 1st_sequencing_run]$ crun R < /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkClumpify_EG.R --no-save`

"Clumpify Successfully worked on all samples"

### 9c. Generate metadata on deduplicated FASTQ files.
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report" "fq.gz"`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	Length	M Seqs
Dar-AJol_001-Ex1-1A-lcwgs-1-1.clmp.r1	3.4%	46%	115 bp	5.5
Dar-AJol_001-Ex1-1A-lcwgs-1-1.clmp.r2	3.3%	46%	115 bp	5.5
Dar-AJol_002-Ex1-1B-lcwgs-1-1.clmp.r1	2.5%	43%	117 bp	3.8
Dar-AJol_002-Ex1-1B-lcwgs-1-1.clmp.r2	2.4%	43%	117 bp	3.8
Dar-AJol_003-Ex1-1C-lcwgs-1-1.clmp.r1	2.3%	45%	109 bp	3.1
Dar-AJol_003-Ex1-1C-lcwgs-1-1.clmp.r2	2.1%	45%	109 bp	3.1
Dar-AJol_004-Ex1-1D-lcwgs-1-1.clmp.r1	2.6%	45%	119 bp	6.5
Dar-AJol_004-Ex1-1D-lcwgs-1-1.clmp.r2	2.5%	45%	119 bp	6.5
Dar-AJol_005-Ex1-1E-lcwgs-1-1.clmp.r1	3.0%	47%	123 bp	0.9
Dar-AJol_005-Ex1-1E-lcwgs-1-1.clmp.r2	2.6%	47%	123 bp	0.9
Dar-AJol_006-Ex1-1F-lcwgs-1-1.clmp.r1	2.3%	44%	104 bp	1.8
Dar-AJol_006-Ex1-1F-lcwgs-1-1.clmp.r2	2.1%	44%	104 bp	1.8
Dar-AJol_007-Ex1-1G-lcwgs-1-1.clmp.r1	3.0%	44%	112 bp	2.6
Dar-AJol_007-Ex1-1G-lcwgs-1-1.clmp.r2	2.7%	44%	112 bp	2.6
Dar-AJol_008-Ex1-1H-lcwgs-1-1.clmp.r1	3.5%	45%	131 bp	4.1
Dar-AJol_008-Ex1-1H-lcwgs-1-1.clmp.r2	3.1%	45%	131 bp	4.1
Dar-AJol_009-Ex1-2A-lcwgs-1-1.clmp.r1	2.9%	43%	126 bp	9.1
Dar-AJol_009-Ex1-2A-lcwgs-1-1.clmp.r2	2.8%	43%	126 bp	9.1
Dar-AJol_010-Ex1-2B-lcwgs-1-1.clmp.r1	1.1%	38%	91 bp	2.7
Dar-AJol_010-Ex1-2B-lcwgs-1-1.clmp.r2	1.1%	38%	91 bp	2.7
Dar-AJol_011-Ex1-2C-lcwgs-1-1.clmp.r1	1.2%	43%	99 bp	1.4
Dar-AJol_011-Ex1-2C-lcwgs-1-1.clmp.r2	1.1%	43%	99 bp	1.4
Dar-AJol_012-Ex1-2D-lcwgs-1-1.clmp.r1	2.5%	44%	122 bp	5.5
Dar-AJol_012-Ex1-2D-lcwgs-1-1.clmp.r2	2.3%	44%	122 bp	5.5
Dar-AJol_013-Ex1-2E-lcwgs-1-1.clmp.r1	1.9%	41%	112 bp	3.5
Dar-AJol_013-Ex1-2E-lcwgs-1-1.clmp.r2	1.8%	41%	112 bp	3.5
Dar-AJol_014-Ex1-2F-lcwgs-1-1.clmp.r1	1.1%	38%	95 bp	2.1
Dar-AJol_014-Ex1-2F-lcwgs-1-1.clmp.r2	1.1%	38%	95 bp	2.1
Dar-AJol_015-Ex1-2G-lcwgs-1-1.clmp.r1	1.2%	39%	105 bp	0.9
Dar-AJol_015-Ex1-2G-lcwgs-1-1.clmp.r2	1.2%	39%	105 bp	0.9
Dar-AJol_016-Ex1-2H-lcwgs-1-1.clmp.r1	3.1%	44%	123 bp	4.8
Dar-AJol_016-Ex1-2H-lcwgs-1-1.clmp.r2	2.9%	44%	123 bp	4.8
Dar-AJol_017-Ex1-3A-lcwgs-1-1.clmp.r1	2.2%	42%	110 bp	2.6
Dar-AJol_017-Ex1-3A-lcwgs-1-1.clmp.r2	2.0%	43%	110 bp	2.6
Dar-AJol_018-Ex1-3B-lcwgs-1-1.clmp.r1	1.3%	39%	95 bp	1.4
Dar-AJol_018-Ex1-3B-lcwgs-1-1.clmp.r2	1.3%	39%	95 bp	1.4
Dar-AJol_019-Ex1-3C-lcwgs-1-1.clmp.r1	3.9%	42%	130 bp	8.9
Dar-AJol_019-Ex1-3C-lcwgs-1-1.clmp.r2	4.1%	42%	129 bp	8.9
Dar-AJol_020-Ex1-3D-lcwgs-1-1.clmp.r1	1.2%	39%	92 bp	4.5
Dar-AJol_020-Ex1-3D-lcwgs-1-1.clmp.r2	1.2%	39%	92 bp	4.5
Dar-AJol_021-Ex1-3E-lcwgs-1-1.clmp.r1	1.0%	37%	93 bp	1.5
Dar-AJol_021-Ex1-3E-lcwgs-1-1.clmp.r2	0.9%	37%	93 bp	1.5
Dar-CJol_009-Ex1-3B-lcwgs-1-1.clmp.r1	3.7%	46%	134 bp	2.2
Dar-CJol_009-Ex1-3B-lcwgs-1-1.clmp.r2	3.7%	46%	133 bp	2.2
Dar-CJol_012-Ex1-3D-lcwgs-1-1.clmp.r1	5.2%	51%	139 bp	1.9
Dar-CJol_012-Ex1-3D-lcwgs-1-1.clmp.r2	5.8%	50%	139 bp	1.9
Dar-CJol_019-Ex1-1G-lcwgs-1-1.clmp.r1	3.2%	46%	137 bp	2.2
Dar-CJol_019-Ex1-1G-lcwgs-1-1.clmp.r2	3.0%	46%	137 bp	2.2
Dar-CJol_020-Ex1-4F-lcwgs-1-1.clmp.r1	3.8%	48%	134 bp	3.8
Dar-CJol_020-Ex1-4F-lcwgs-1-1.clmp.r2	4.1%	48%	134 bp	3.8
Dar-CJol_021-Ex1-6F-lcwgs-1-1.clmp.r1	3.4%	47%	130 bp	4.2
Dar-CJol_021-Ex1-6F-lcwgs-1-1.clmp.r2	3.6%	47%	130 bp	4.2
Dar-CJol_022-Ex1-7C-lcwgs-1-1.clmp.r1	2.0%	49%	116 bp	1.0
Dar-CJol_022-Ex1-7C-lcwgs-1-1.clmp.r2	2.0%	49%	116 bp	1.0
Dar-CJol_023-Ex1-8B-lcwgs-1-1.clmp.r1	1.9%	47%	117 bp	0.8
Dar-CJol_023-Ex1-8B-lcwgs-1-1.clmp.r2	1.8%	47%	117 bp	0.8
Dar-CJol_024-Ex1-7E-lcwgs-1-1.clmp.r1	0.0%	50%	120 bp	0.0
Dar-CJol_024-Ex1-7E-lcwgs-1-1.clmp.r2	0.0%	50%	120 bp	0.0
Dar-CJol_025-Ex1-3C-lcwgs-1-1.clmp.r1	2.9%	46%	134 bp	2.0
Dar-CJol_025-Ex1-3C-lcwgs-1-1.clmp.r2	2.8%	46%	134 bp	2.0
Dar-CJol_026-Ex1-8A-lcwgs-1-1.clmp.r1	1.9%	48%	112 bp	1.0
Dar-CJol_026-Ex1-8A-lcwgs-1-1.clmp.r2	1.8%	48%	112 bp	1.0
Dar-CJol_028-Ex1-2F-lcwgs-1-1.clmp.r1	3.0%	46%	132 bp	4.4
Dar-CJol_028-Ex1-2F-lcwgs-1-1.clmp.r2	3.1%	46%	132 bp	4.4
Dar-CJol_029-Ex1-5B-lcwgs-1-1.clmp.r1	3.1%	46%	131 bp	2.3
Dar-CJol_029-Ex1-5B-lcwgs-1-1.clmp.r2	3.2%	46%	131 bp	2.3
Dar-CJol_030-Ex1-8D-lcwgs-1-1.clmp.r1	2.6%	48%	121 bp	1.5
Dar-CJol_030-Ex1-8D-lcwgs-1-1.clmp.r2	2.7%	48%	120 bp	1.5
Dar-CJol_031-Ex1-4H-lcwgs-1-1.clmp.r1	2.9%	47%	135 bp	1.8
Dar-CJol_031-Ex1-4H-lcwgs-1-1.clmp.r2	3.0%	47%	135 bp	1.8
Dar-CJol_032-Ex1-3H-lcwgs-1-1.clmp.r1	4.2%	48%	137 bp	1.6
Dar-CJol_032-Ex1-3H-lcwgs-1-1.clmp.r2	4.4%	48%	137 bp	1.6
Dar-CJol_035-Ex1-8H-lcwgs-1-1.clmp.r1	2.0%	46%	125 bp	0.6
Dar-CJol_035-Ex1-8H-lcwgs-1-1.clmp.r2	1.8%	46%	125 bp	0.6
Dar-CJol_036-Ex1-8C-lcwgs-1-1.clmp.r1	1.9%	46%	121 bp	0.6
Dar-CJol_036-Ex1-8C-lcwgs-1-1.clmp.r2	1.7%	46%	121 bp	0.6
Dar-CJol_037-Ex1-2D-lcwgs-1-1.clmp.r1	3.5%	49%	133 bp	2.1
Dar-CJol_037-Ex1-2D-lcwgs-1-1.clmp.r2	3.6%	48%	133 bp	2.1
Dar-CJol_038-Ex1-6A-lcwgs-1-1.clmp.r1	2.8%	45%	128 bp	2.0
Dar-CJol_038-Ex1-6A-lcwgs-1-1.clmp.r2	2.8%	45%	128 bp	2.0
Dar-CJol_039-Ex1-7H-lcwgs-1-1.clmp.r1	2.3%	47%	123 bp	1.0
Dar-CJol_039-Ex1-7H-lcwgs-1-1.clmp.r2	2.3%	47%	123 bp	1.0
Dar-CJol_040-Ex1-1E-lcwgs-1-1.clmp.r1	0.0%	49%	132 bp	0.0
Dar-CJol_040-Ex1-1E-lcwgs-1-1.clmp.r2	0.0%	48%	132 bp	0.0
Dar-CJol_041-Ex1-1B-lcwgs-1-1.clmp.r1	3.9%	49%	131 bp	2.6
Dar-CJol_041-Ex1-1B-lcwgs-1-1.clmp.r2	4.2%	49%	131 bp	2.6
Dar-CJol_043-Ex1-4C-lcwgs-1-1.clmp.r1	2.6%	45%	138 bp	1.5
Dar-CJol_043-Ex1-4C-lcwgs-1-1.clmp.r2	2.4%	45%	138 bp	1.5
Dar-CJol_044-Ex1-5E-lcwgs-1-1.clmp.r1	0.0%	49%	132 bp	0.0
Dar-CJol_044-Ex1-5E-lcwgs-1-1.clmp.r2	0.0%	47%	132 bp	0.0
Dar-CJol_045-Ex1-5D-lcwgs-1-1.clmp.r1	4.1%	49%	129 bp	2.6
Dar-CJol_045-Ex1-5D-lcwgs-1-1.clmp.r2	4.5%	49%	129 bp	2.6
Dar-CJol_046-Ex1-2A-lcwgs-1-1.clmp.r1	2.8%	47%	122 bp	2.0
Dar-CJol_046-Ex1-2A-lcwgs-1-1.clmp.r2	2.8%	47%	122 bp	2.0
Dar-CJol_050-Ex1-3E-lcwgs-1-1.clmp.r1	0.0%	49%	136 bp	0.0
Dar-CJol_050-Ex1-3E-lcwgs-1-1.clmp.r2	0.0%	49%	135 bp	0.0
Dar-CJol_051-Ex1-1H-lcwgs-1-1.clmp.r1	3.1%	47%	132 bp	2.8
Dar-CJol_051-Ex1-1H-lcwgs-1-1.clmp.r2	3.2%	47%	132 bp	2.8
Dar-CJol_052-Ex1-3G-lcwgs-1-1.clmp.r1	3.1%	47%	129 bp	1.9
Dar-CJol_052-Ex1-3G-lcwgs-1-1.clmp.r2	3.0%	47%	129 bp	1.9
Dar-CJol_053-Ex1-2C-lcwgs-1-1.clmp.r1	3.6%	49%	134 bp	2.2
Dar-CJol_053-Ex1-2C-lcwgs-1-1.clmp.r2	3.7%	48%	134 bp	2.2
Dar-CJol_054-Ex1-2H-lcwgs-1-1.clmp.r1	2.7%	44%	133 bp	3.0
Dar-CJol_054-Ex1-2H-lcwgs-1-1.clmp.r2	2.6%	44%	133 bp	3.0
Dar-CJol_055-Ex1-6B-lcwgs-1-1.clmp.r1	2.5%	45%	123 bp	2.7
Dar-CJol_055-Ex1-6B-lcwgs-1-1.clmp.r2	2.5%	45%	123 bp	2.7
Dar-CJol_056-Ex1-8F-lcwgs-1-1.clmp.r1	2.6%	47%	119 bp	2.4
Dar-CJol_056-Ex1-8F-lcwgs-1-1.clmp.r2	2.7%	47%	119 bp	2.4
Dar-CJol_058-Ex1-1C-lcwgs-1-1.clmp.r1	2.6%	46%	132 bp	2.1
Dar-CJol_058-Ex1-1C-lcwgs-1-1.clmp.r2	2.5%	46%	132 bp	2.1
Dar-CJol_059-Ex1-6H-lcwgs-1-1.clmp.r1	2.6%	46%	131 bp	1.2
Dar-CJol_059-Ex1-6H-lcwgs-1-1.clmp.r2	2.5%	45%	131 bp	1.2
Dar-CJol_060-Ex1-1F-lcwgs-1-1.clmp.r1	3.3%	47%	130 bp	4.9
Dar-CJol_060-Ex1-1F-lcwgs-1-1.clmp.r2	3.6%	47%	130 bp	4.9
Dar-CJol_061-Ex1-2B-lcwgs-1-1.clmp.r1	3.3%	49%	125 bp	2.0
Dar-CJol_061-Ex1-2B-lcwgs-1-1.clmp.r2	3.4%	49%	125 bp	2.0
Dar-CJol_062-Ex1-7B-lcwgs-1-1.clmp.r1	2.7%	48%	119 bp	1.4
Dar-CJol_062-Ex1-7B-lcwgs-1-1.clmp.r2	2.7%	48%	119 bp	1.4
Dar-CJol_065-Ex1-2G-lcwgs-1-1.clmp.r1	3.2%	48%	134 bp	1.2
Dar-CJol_065-Ex1-2G-lcwgs-1-1.clmp.r2	3.0%	48%	134 bp	1.2
Dar-CJol_066-Ex1-5A-lcwgs-1-1.clmp.r1	3.1%	47%	128 bp	1.7
Dar-CJol_066-Ex1-5A-lcwgs-1-1.clmp.r2	3.1%	47%	128 bp	1.7
Dar-CJol_067-Ex1-2E-lcwgs-1-1.clmp.r1	0.0%	47%	139 bp	0.0
Dar-CJol_067-Ex1-2E-lcwgs-1-1.clmp.r2	0.0%	48%	139 bp	0.0
Dar-CJol_068-Ex1-8E-lcwgs-1-1.clmp.r1	0.0%	50%	121 bp	0.0
Dar-CJol_068-Ex1-8E-lcwgs-1-1.clmp.r2	0.0%	51%	121 bp	0.0
Dar-CJol_069-Ex1-4D-lcwgs-1-1.clmp.r1	3.3%	48%	128 bp	2.7
Dar-CJol_069-Ex1-4D-lcwgs-1-1.clmp.r2	3.6%	48%	128 bp	2.7
Dar-CJol_070-Ex1-5F-lcwgs-1-1.clmp.r1	3.8%	48%	129 bp	3.8
Dar-CJol_070-Ex1-5F-lcwgs-1-1.clmp.r2	4.2%	48%	129 bp	3.8
Dar-CJol_071-Ex1-7D-lcwgs-1-1.clmp.r1	2.4%	48%	122 bp	1.4
Dar-CJol_071-Ex1-7D-lcwgs-1-1.clmp.r2	2.4%	48%	122 bp	1.4
Dar-CJol_072-Ex1-8G-lcwgs-1-1.clmp.r1	2.1%	47%	123 bp	0.6
Dar-CJol_072-Ex1-8G-lcwgs-1-1.clmp.r2	2.0%	47%	123 bp	0.6
Dar-CJol_073-Ex1-3F-lcwgs-1-1.clmp.r1	3.6%	48%	133 bp	5.4
Dar-CJol_073-Ex1-3F-lcwgs-1-1.clmp.r2	4.0%	48%	133 bp	5.4
Dar-CJol_074-Ex1-7G-lcwgs-1-1.clmp.r1	2.7%	47%	123 bp	1.9
Dar-CJol_074-Ex1-7G-lcwgs-1-1.clmp.r2	2.7%	47%	123 bp	1.9
Dar-CJol_075-Ex1-4E-lcwgs-1-1.clmp.r1	5.7%	49%	130 bp	0.0
Dar-CJol_075-Ex1-4E-lcwgs-1-1.clmp.r2	2.9%	49%	130 bp	0.0
Dar-CJol_076-Ex1-5H-lcwgs-1-1.clmp.r1	3.3%	48%	127 bp	3.3
Dar-CJol_076-Ex1-5H-lcwgs-1-1.clmp.r2	3.6%	47%	126 bp	3.3
Dar-CJol_077-Ex1-7A-lcwgs-1-1.clmp.r1	2.4%	47%	114 bp	1.2
Dar-CJol_077-Ex1-7A-lcwgs-1-1.clmp.r2	2.4%	47%	114 bp	1.2
Dar-CJol_078-Ex1-6D-lcwgs-1-1.clmp.r1	3.7%	49%	133 bp	1.5
Dar-CJol_078-Ex1-6D-lcwgs-1-1.clmp.r2	3.6%	48%	133 bp	1.5
Dar-CJol_080-Ex1-4G-lcwgs-1-1.clmp.r1	3.8%	49%	136 bp	2.8
Dar-CJol_080-Ex1-4G-lcwgs-1-1.clmp.r2	4.2%	49%	135 bp	2.8
Dar-CJol_081-Ex1-7F-lcwgs-1-1.clmp.r1	2.9%	48%	119 bp	3.7
Dar-CJol_081-Ex1-7F-lcwgs-1-1.clmp.r2	3.2%	47%	119 bp	3.7
Dar-CJol_082-Ex1-5C-lcwgs-1-1.clmp.r1	2.4%	48%	127 bp	0.9
Dar-CJol_082-Ex1-5C-lcwgs-1-1.clmp.r2	2.3%	47%	127 bp	0.9
Dar-CJol_083-Ex1-6C-lcwgs-1-1.clmp.r1	4.0%	49%	133 bp	0.9
Dar-CJol_083-Ex1-6C-lcwgs-1-1.clmp.r2	3.9%	49%	132 bp	0.9
Dar-CJol_084-Ex1-4A-lcwgs-1-1.clmp.r1	3.1%	48%	130 bp	1.3
Dar-CJol_084-Ex1-4A-lcwgs-1-1.clmp.r2	3.1%	48%	130 bp	1.3
Dar-CJol_085-Ex1-3A-lcwgs-1-1.clmp.r1	4.9%	49%	132 bp	3.4
Dar-CJol_085-Ex1-3A-lcwgs-1-1.clmp.r2	5.3%	49%	132 bp	3.4
Dar-CJol_086-Ex1-6E-lcwgs-1-1.clmp.r1	6.7%	48%	135 bp	0.0
Dar-CJol_086-Ex1-6E-lcwgs-1-1.clmp.r2	6.7%	48%	135 bp	0.0
Dar-CJol_087-Ex1-4B-lcwgs-1-1.clmp.r1	3.5%	48%	132 bp	2.1
Dar-CJol_087-Ex1-4B-lcwgs-1-1.clmp.r2	3.5%	48%	132 bp	2.1
Dar-CJol_088-Ex1-1A-lcwgs-1-1.clmp.r1	2.8%	48%	129 bp	1.3
Dar-CJol_088-Ex1-1A-lcwgs-1-1.clmp.r2	2.9%	48%	129 bp	1.3
Dar-CJol_090-Ex1-6G-lcwgs-1-1.clmp.r1	3.4%	46%	138 bp	1.2
Dar-CJol_090-Ex1-6G-lcwgs-1-1.clmp.r2	3.2%	46%	138 bp	1.2
Dar-CJol_092-Ex1-5G-lcwgs-1-1.clmp.r1	4.1%	47%	134 bp	3.3
Dar-CJol_092-Ex1-5G-lcwgs-1-1.clmp.r2	4.1%	47%	134 bp	3.3
Dar-CJol_094-Ex1-1D-lcwgs-1-1.clmp.r1	3.7%	48%	138 bp	1.8
Dar-CJol_094-Ex1-1D-lcwgs-1-1.clmp.r2	3.8%	48%	138 bp	1.8
```
  
</p>
</details>

## 10. Second trim.
`sbatch ../../../pire_fq_gz_processing/runFASTP_2.sbatch fq_fp1_clmp fq_fp1_clmp_fp2 33`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Dar-AJol_001-Ex1-1A-lcwgs-1-1.clmp.r1r2_fastp	2.5%	46.2%	98.7%	1.9%
Dar-AJol_002-Ex1-1B-lcwgs-1-1.clmp.r1r2_fastp	2.3%	43.5%	98.9%	2.1%
Dar-AJol_003-Ex1-1C-lcwgs-1-1.clmp.r1r2_fastp	2.2%	45.0%	98.9%	2.2%
Dar-AJol_004-Ex1-1D-lcwgs-1-1.clmp.r1r2_fastp	2.4%	44.9%	98.9%	2.1%
Dar-AJol_005-Ex1-1E-lcwgs-1-1.clmp.r1r2_fastp	3.8%	46.9%	98.8%	1.8%
Dar-AJol_006-Ex1-1F-lcwgs-1-1.clmp.r1r2_fastp	2.0%	44.1%	99.2%	2.7%
Dar-AJol_007-Ex1-1G-lcwgs-1-1.clmp.r1r2_fastp	2.4%	44.0%	99.0%	2.2%
Dar-AJol_008-Ex1-1H-lcwgs-1-1.clmp.r1r2_fastp	3.4%	45.5%	98.4%	1.4%
Dar-AJol_009-Ex1-2A-lcwgs-1-1.clmp.r1r2_fastp	2.5%	43.3%	98.5%	1.5%
Dar-AJol_010-Ex1-2B-lcwgs-1-1.clmp.r1r2_fastp	1.3%	38.9%	99.4%	3.1%
Dar-AJol_011-Ex1-2C-lcwgs-1-1.clmp.r1r2_fastp	1.3%	43.0%	99.2%	2.8%
Dar-AJol_012-Ex1-2D-lcwgs-1-1.clmp.r1r2_fastp	2.3%	44.5%	98.8%	2.0%
Dar-AJol_013-Ex1-2E-lcwgs-1-1.clmp.r1r2_fastp	1.9%	41.6%	99.1%	2.2%
Dar-AJol_014-Ex1-2F-lcwgs-1-1.clmp.r1r2_fastp	1.5%	38.1%	99.4%	3.0%
Dar-AJol_015-Ex1-2G-lcwgs-1-1.clmp.r1r2_fastp	1.7%	39.4%	99.3%	2.8%
Dar-AJol_016-Ex1-2H-lcwgs-1-1.clmp.r1r2_fastp	2.7%	44.7%	98.7%	1.8%
Dar-AJol_017-Ex1-3A-lcwgs-1-1.clmp.r1r2_fastp	2.0%	42.8%	98.9%	2.2%
Dar-AJol_018-Ex1-3B-lcwgs-1-1.clmp.r1r2_fastp	1.5%	39.7%	99.3%	2.9%
Dar-AJol_019-Ex1-3C-lcwgs-1-1.clmp.r1r2_fastp	2.9%	41.9%	98.5%	1.2%
Dar-AJol_020-Ex1-3D-lcwgs-1-1.clmp.r1r2_fastp	1.4%	39.9%	99.4%	2.9%
Dar-AJol_021-Ex1-3E-lcwgs-1-1.clmp.r1r2_fastp	1.4%	37.8%	99.4%	2.8%
Dar-CJol_009-Ex1-3B-lcwgs-1-1.clmp.r1r2_fastp	2.8%	46.7%	98.5%	1.4%
Dar-CJol_012-Ex1-3D-lcwgs-1-1.clmp.r1r2_fastp	3.4%	50.8%	98.2%	1.0%
Dar-CJol_019-Ex1-1G-lcwgs-1-1.clmp.r1r2_fastp	2.7%	46.7%	98.4%	1.1%
Dar-CJol_020-Ex1-4F-lcwgs-1-1.clmp.r1r2_fastp	2.6%	48.5%	98.6%	1.4%
Dar-CJol_021-Ex1-6F-lcwgs-1-1.clmp.r1r2_fastp	2.7%	47.5%	98.7%	1.4%
Dar-CJol_022-Ex1-7C-lcwgs-1-1.clmp.r1r2_fastp	1.9%	49.0%	99.0%	1.9%
Dar-CJol_023-Ex1-8B-lcwgs-1-1.clmp.r1r2_fastp	1.9%	47.3%	98.9%	2.1%
Dar-CJol_024-Ex1-7E-lcwgs-1-1.clmp.r1r2_fastp	0.0%	50.2%	94.1%	0.0%
Dar-CJol_025-Ex1-3C-lcwgs-1-1.clmp.r1r2_fastp	2.6%	46.6%	98.6%	1.2%
Dar-CJol_026-Ex1-8A-lcwgs-1-1.clmp.r1r2_fastp	1.9%	48.1%	99.0%	2.3%
Dar-CJol_028-Ex1-2F-lcwgs-1-1.clmp.r1r2_fastp	2.5%	46.3%	98.6%	1.4%
Dar-CJol_029-Ex1-5B-lcwgs-1-1.clmp.r1r2_fastp	2.6%	46.0%	98.7%	1.6%
Dar-CJol_030-Ex1-8D-lcwgs-1-1.clmp.r1r2_fastp	2.0%	48.7%	98.9%	1.7%
Dar-CJol_031-Ex1-4H-lcwgs-1-1.clmp.r1r2_fastp	2.6%	47.8%	98.6%	1.3%
Dar-CJol_032-Ex1-3H-lcwgs-1-1.clmp.r1r2_fastp	3.1%	48.6%	98.4%	1.1%
Dar-CJol_035-Ex1-8H-lcwgs-1-1.clmp.r1r2_fastp	2.1%	46.2%	98.8%	1.7%
Dar-CJol_036-Ex1-8C-lcwgs-1-1.clmp.r1r2_fastp	1.9%	46.5%	98.9%	1.8%
Dar-CJol_037-Ex1-2D-lcwgs-1-1.clmp.r1r2_fastp	2.6%	48.9%	98.5%	1.3%
Dar-CJol_038-Ex1-6A-lcwgs-1-1.clmp.r1r2_fastp	2.7%	45.4%	98.8%	1.8%
Dar-CJol_039-Ex1-7H-lcwgs-1-1.clmp.r1r2_fastp	2.1%	47.7%	98.8%	1.8%
Dar-CJol_040-Ex1-1E-lcwgs-1-1.clmp.r1r2_fastp	0.0%	49.1%	92.3%	0.0%
Dar-CJol_041-Ex1-1B-lcwgs-1-1.clmp.r1r2_fastp	2.6%	49.6%	98.6%	1.6%
Dar-CJol_043-Ex1-4C-lcwgs-1-1.clmp.r1r2_fastp	2.6%	45.5%	98.5%	1.0%
Dar-CJol_044-Ex1-5E-lcwgs-1-1.clmp.r1r2_fastp	0.0%	48.9%	82.4%	0.0%
Dar-CJol_045-Ex1-5D-lcwgs-1-1.clmp.r1r2_fastp	2.5%	49.1%	98.7%	1.5%
Dar-CJol_046-Ex1-2A-lcwgs-1-1.clmp.r1r2_fastp	2.3%	47.6%	98.9%	2.0%
Dar-CJol_050-Ex1-3E-lcwgs-1-1.clmp.r1r2_fastp	0.0%	49.9%	84.2%	0.0%
Dar-CJol_051-Ex1-1H-lcwgs-1-1.clmp.r1r2_fastp	2.3%	47.6%	98.6%	1.4%
Dar-CJol_052-Ex1-3G-lcwgs-1-1.clmp.r1r2_fastp	2.5%	47.6%	98.6%	1.5%
Dar-CJol_053-Ex1-2C-lcwgs-1-1.clmp.r1r2_fastp	2.7%	48.9%	98.6%	1.2%
Dar-CJol_054-Ex1-2H-lcwgs-1-1.clmp.r1r2_fastp	2.6%	44.5%	98.7%	1.4%
Dar-CJol_055-Ex1-6B-lcwgs-1-1.clmp.r1r2_fastp	2.5%	45.4%	98.9%	2.0%
Dar-CJol_056-Ex1-8F-lcwgs-1-1.clmp.r1r2_fastp	2.0%	47.7%	98.9%	1.9%
Dar-CJol_058-Ex1-1C-lcwgs-1-1.clmp.r1r2_fastp	2.3%	46.3%	98.7%	1.4%
Dar-CJol_059-Ex1-6H-lcwgs-1-1.clmp.r1r2_fastp	2.8%	45.9%	98.7%	1.5%
Dar-CJol_060-Ex1-1F-lcwgs-1-1.clmp.r1r2_fastp	2.3%	47.6%	98.7%	1.5%
Dar-CJol_061-Ex1-2B-lcwgs-1-1.clmp.r1r2_fastp	2.4%	49.4%	98.8%	1.8%
Dar-CJol_062-Ex1-7B-lcwgs-1-1.clmp.r1r2_fastp	2.1%	48.4%	98.9%	2.0%
Dar-CJol_065-Ex1-2G-lcwgs-1-1.clmp.r1r2_fastp	2.9%	48.6%	98.4%	1.3%
Dar-CJol_066-Ex1-5A-lcwgs-1-1.clmp.r1r2_fastp	2.6%	47.7%	98.9%	1.8%
Dar-CJol_067-Ex1-2E-lcwgs-1-1.clmp.r1r2_fastp	0.0%	46.8%	83.3%	0.0%
Dar-CJol_068-Ex1-8E-lcwgs-1-1.clmp.r1r2_fastp	0.0%	53.6%	83.3%	0.0%
Dar-CJol_069-Ex1-4D-lcwgs-1-1.clmp.r1r2_fastp	2.2%	48.6%	98.7%	1.4%
Dar-CJol_070-Ex1-5F-lcwgs-1-1.clmp.r1r2_fastp	2.5%	48.7%	98.7%	1.5%
Dar-CJol_071-Ex1-7D-lcwgs-1-1.clmp.r1r2_fastp	2.0%	48.0%	98.8%	1.7%
Dar-CJol_072-Ex1-8G-lcwgs-1-1.clmp.r1r2_fastp	2.1%	47.0%	98.7%	1.7%
Dar-CJol_073-Ex1-3F-lcwgs-1-1.clmp.r1r2_fastp	2.7%	48.4%	98.5%	1.3%
Dar-CJol_074-Ex1-7G-lcwgs-1-1.clmp.r1r2_fastp	2.1%	47.8%	98.7%	1.8%
Dar-CJol_075-Ex1-4E-lcwgs-1-1.clmp.r1r2_fastp	2.9%	49.6%	97.1%	0.0%
Dar-CJol_076-Ex1-5H-lcwgs-1-1.clmp.r1r2_fastp	2.3%	47.9%	98.8%	1.6%
Dar-CJol_077-Ex1-7A-lcwgs-1-1.clmp.r1r2_fastp	1.9%	47.0%	99.0%	2.2%
Dar-CJol_078-Ex1-6D-lcwgs-1-1.clmp.r1r2_fastp	3.0%	49.0%	98.5%	1.2%
Dar-CJol_080-Ex1-4G-lcwgs-1-1.clmp.r1r2_fastp	2.7%	49.2%	98.5%	1.3%
Dar-CJol_081-Ex1-7F-lcwgs-1-1.clmp.r1r2_fastp	1.9%	47.9%	98.9%	1.9%
Dar-CJol_082-Ex1-5C-lcwgs-1-1.clmp.r1r2_fastp	2.3%	47.9%	98.7%	1.5%
Dar-CJol_083-Ex1-6C-lcwgs-1-1.clmp.r1r2_fastp	3.1%	49.2%	98.6%	1.3%
Dar-CJol_084-Ex1-4A-lcwgs-1-1.clmp.r1r2_fastp	2.4%	48.3%	98.7%	1.6%
Dar-CJol_085-Ex1-3A-lcwgs-1-1.clmp.r1r2_fastp	3.0%	48.9%	98.6%	1.5%
Dar-CJol_086-Ex1-6E-lcwgs-1-1.clmp.r1r2_fastp	6.7%	49.0%	93.3%	0.0%
Dar-CJol_087-Ex1-4B-lcwgs-1-1.clmp.r1r2_fastp	2.6%	48.5%	98.6%	1.5%
Dar-CJol_088-Ex1-1A-lcwgs-1-1.clmp.r1r2_fastp	2.3%	48.2%	98.7%	1.7%
Dar-CJol_090-Ex1-6G-lcwgs-1-1.clmp.r1r2_fastp	3.3%	46.8%	98.2%	1.0%
Dar-CJol_092-Ex1-5G-lcwgs-1-1.clmp.r1r2_fastp	2.8%	47.6%	98.6%	1.4%
Dar-CJol_094-Ex1-1D-lcwgs-1-1.clmp.r1r2_fastp	2.7%	48.0%	98.3%	1.0%
```

</p>
</details>

## 11. Decontaminate files.
`bash ../../../pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn 20`

170 files for each file type, no return for `grep 'error' slurm-fqscrn.*out` or `grep 'No reads in' slurm-fqscrn.*out`

'sbatch ../../../pire_fq_gz_processing/runMULTIQC.sbatch fq_fp1_clmp_fp2_fqscrn fastq_screen_report'

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
Dar-AJol_001-Ex1-1A-lcwgs-1-1.clmp.fp2_repr.R1	2.0%	45%	114 bp	4.0
Dar-AJol_001-Ex1-1A-lcwgs-1-1.clmp.fp2_repr.R2	2.0%	45%	113 bp	4.0
Dar-AJol_002-Ex1-1B-lcwgs-1-1.clmp.fp2_repr.R1	1.9%	43%	115 bp	3.4
Dar-AJol_002-Ex1-1B-lcwgs-1-1.clmp.fp2_repr.R2	1.9%	42%	114 bp	3.4
Dar-AJol_003-Ex1-1C-lcwgs-1-1.clmp.fp2_repr.R1	1.7%	44%	105 bp	2.7
Dar-AJol_003-Ex1-1C-lcwgs-1-1.clmp.fp2_repr.R2	1.7%	44%	104 bp	2.7
Dar-AJol_004-Ex1-1D-lcwgs-1-1.clmp.fp2_repr.R1	1.9%	44%	117 bp	5.4
Dar-AJol_004-Ex1-1D-lcwgs-1-1.clmp.fp2_repr.R2	1.9%	44%	116 bp	5.4
Dar-AJol_005-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R1	2.5%	45%	119 bp	0.7
Dar-AJol_005-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R2	2.3%	45%	118 bp	0.7
Dar-AJol_006-Ex1-1F-lcwgs-1-1.clmp.fp2_repr.R1	1.5%	43%	102 bp	1.5
Dar-AJol_006-Ex1-1F-lcwgs-1-1.clmp.fp2_repr.R2	1.5%	43%	102 bp	1.5
Dar-AJol_007-Ex1-1G-lcwgs-1-1.clmp.fp2_repr.R1	2.3%	43%	110 bp	2.2
Dar-AJol_007-Ex1-1G-lcwgs-1-1.clmp.fp2_repr.R2	2.1%	43%	109 bp	2.2
Dar-AJol_008-Ex1-1H-lcwgs-1-1.clmp.fp2_repr.R1	2.6%	44%	129 bp	3.3
Dar-AJol_008-Ex1-1H-lcwgs-1-1.clmp.fp2_repr.R2	2.4%	44%	127 bp	3.3
Dar-AJol_009-Ex1-2A-lcwgs-1-1.clmp.fp2_repr.R1	2.2%	42%	123 bp	7.3
Dar-AJol_009-Ex1-2A-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	42%	121 bp	7.3
Dar-AJol_010-Ex1-2B-lcwgs-1-1.clmp.fp2_repr.R1	1.0%	38%	90 bp	2.5
Dar-AJol_010-Ex1-2B-lcwgs-1-1.clmp.fp2_repr.R2	1.0%	38%	90 bp	2.5
Dar-AJol_011-Ex1-2C-lcwgs-1-1.clmp.fp2_repr.R1	1.2%	42%	98 bp	1.3
Dar-AJol_011-Ex1-2C-lcwgs-1-1.clmp.fp2_repr.R2	1.1%	42%	98 bp	1.3
Dar-AJol_012-Ex1-2D-lcwgs-1-1.clmp.fp2_repr.R1	1.9%	43%	120 bp	4.7
Dar-AJol_012-Ex1-2D-lcwgs-1-1.clmp.fp2_repr.R2	1.8%	43%	118 bp	4.7
Dar-AJol_013-Ex1-2E-lcwgs-1-1.clmp.fp2_repr.R1	1.5%	41%	111 bp	3.2
Dar-AJol_013-Ex1-2E-lcwgs-1-1.clmp.fp2_repr.R2	1.4%	41%	110 bp	3.2
Dar-AJol_014-Ex1-2F-lcwgs-1-1.clmp.fp2_repr.R1	1.2%	37%	94 bp	1.9
Dar-AJol_014-Ex1-2F-lcwgs-1-1.clmp.fp2_repr.R2	1.1%	37%	93 bp	1.9
Dar-AJol_015-Ex1-2G-lcwgs-1-1.clmp.fp2_repr.R1	1.2%	38%	103 bp	0.8
Dar-AJol_015-Ex1-2G-lcwgs-1-1.clmp.fp2_repr.R2	1.2%	38%	102 bp	0.8
Dar-AJol_016-Ex1-2H-lcwgs-1-1.clmp.fp2_repr.R1	2.1%	44%	121 bp	4.0
Dar-AJol_016-Ex1-2H-lcwgs-1-1.clmp.fp2_repr.R2	2.0%	43%	120 bp	4.0
Dar-AJol_017-Ex1-3A-lcwgs-1-1.clmp.fp2_repr.R1	1.5%	42%	109 bp	2.2
Dar-AJol_017-Ex1-3A-lcwgs-1-1.clmp.fp2_repr.R2	1.4%	42%	108 bp	2.2
Dar-AJol_018-Ex1-3B-lcwgs-1-1.clmp.fp2_repr.R1	1.1%	39%	94 bp	1.3
Dar-AJol_018-Ex1-3B-lcwgs-1-1.clmp.fp2_repr.R2	1.1%	39%	93 bp	1.3
Dar-AJol_019-Ex1-3C-lcwgs-1-1.clmp.fp2_repr.R1	3.1%	40%	127 bp	7.2
Dar-AJol_019-Ex1-3C-lcwgs-1-1.clmp.fp2_repr.R2	3.2%	40%	125 bp	7.2
Dar-AJol_020-Ex1-3D-lcwgs-1-1.clmp.fp2_repr.R1	1.1%	39%	91 bp	4.2
Dar-AJol_020-Ex1-3D-lcwgs-1-1.clmp.fp2_repr.R2	1.1%	39%	90 bp	4.2
Dar-AJol_021-Ex1-3E-lcwgs-1-1.clmp.fp2_repr.R1	1.1%	37%	93 bp	1.5
Dar-AJol_021-Ex1-3E-lcwgs-1-1.clmp.fp2_repr.R2	1.1%	37%	92 bp	1.5
Dar-CJol_009-Ex1-3B-lcwgs-1-1.clmp.fp2_repr.R1	3.3%	46%	133 bp	2.1
Dar-CJol_009-Ex1-3B-lcwgs-1-1.clmp.fp2_repr.R2	3.4%	46%	130 bp	2.1
Dar-CJol_012-Ex1-3D-lcwgs-1-1.clmp.fp2_repr.R1	4.6%	50%	137 bp	1.7
Dar-CJol_012-Ex1-3D-lcwgs-1-1.clmp.fp2_repr.R2	4.9%	50%	134 bp	1.7
Dar-CJol_019-Ex1-1G-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	46%	137 bp	2.1
Dar-CJol_019-Ex1-1G-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	46%	134 bp	2.1
Dar-CJol_020-Ex1-4F-lcwgs-1-1.clmp.fp2_repr.R1	3.5%	48%	133 bp	3.5
Dar-CJol_020-Ex1-4F-lcwgs-1-1.clmp.fp2_repr.R2	3.6%	48%	130 bp	3.5
Dar-CJol_021-Ex1-6F-lcwgs-1-1.clmp.fp2_repr.R1	3.1%	47%	129 bp	3.9
Dar-CJol_021-Ex1-6F-lcwgs-1-1.clmp.fp2_repr.R2	3.2%	47%	127 bp	3.9
Dar-CJol_022-Ex1-7C-lcwgs-1-1.clmp.fp2_repr.R1	1.9%	48%	115 bp	1.0
Dar-CJol_022-Ex1-7C-lcwgs-1-1.clmp.fp2_repr.R2	1.8%	48%	114 bp	1.0
Dar-CJol_023-Ex1-8B-lcwgs-1-1.clmp.fp2_repr.R1	1.7%	47%	116 bp	0.8
Dar-CJol_023-Ex1-8B-lcwgs-1-1.clmp.fp2_repr.R2	1.6%	46%	114 bp	0.8
Dar-CJol_024-Ex1-7E-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	49%	118 bp	0.0
Dar-CJol_024-Ex1-7E-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	50%	114 bp	0.0
Dar-CJol_025-Ex1-3C-lcwgs-1-1.clmp.fp2_repr.R1	2.7%	46%	133 bp	1.8
Dar-CJol_025-Ex1-3C-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	46%	131 bp	1.8
Dar-CJol_026-Ex1-8A-lcwgs-1-1.clmp.fp2_repr.R1	1.7%	47%	111 bp	0.9
Dar-CJol_026-Ex1-8A-lcwgs-1-1.clmp.fp2_repr.R2	1.7%	47%	110 bp	0.9
Dar-CJol_028-Ex1-2F-lcwgs-1-1.clmp.fp2_repr.R1	2.7%	46%	131 bp	4.1
Dar-CJol_028-Ex1-2F-lcwgs-1-1.clmp.fp2_repr.R2	2.8%	45%	129 bp	4.1
Dar-CJol_029-Ex1-5B-lcwgs-1-1.clmp.fp2_repr.R1	2.8%	45%	130 bp	2.2
Dar-CJol_029-Ex1-5B-lcwgs-1-1.clmp.fp2_repr.R2	2.8%	45%	128 bp	2.2
Dar-CJol_030-Ex1-8D-lcwgs-1-1.clmp.fp2_repr.R1	2.3%	48%	119 bp	1.4
Dar-CJol_030-Ex1-8D-lcwgs-1-1.clmp.fp2_repr.R2	2.4%	48%	118 bp	1.4
Dar-CJol_031-Ex1-4H-lcwgs-1-1.clmp.fp2_repr.R1	2.7%	47%	134 bp	1.7
Dar-CJol_031-Ex1-4H-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	47%	132 bp	1.7
Dar-CJol_032-Ex1-3H-lcwgs-1-1.clmp.fp2_repr.R1	3.6%	48%	136 bp	1.4
Dar-CJol_032-Ex1-3H-lcwgs-1-1.clmp.fp2_repr.R2	3.7%	47%	133 bp	1.4
Dar-CJol_035-Ex1-8H-lcwgs-1-1.clmp.fp2_repr.R1	1.8%	46%	124 bp	0.6
Dar-CJol_035-Ex1-8H-lcwgs-1-1.clmp.fp2_repr.R2	1.6%	45%	123 bp	0.6
Dar-CJol_036-Ex1-8C-lcwgs-1-1.clmp.fp2_repr.R1	1.7%	46%	120 bp	0.6
Dar-CJol_036-Ex1-8C-lcwgs-1-1.clmp.fp2_repr.R2	1.6%	46%	118 bp	0.6
Dar-CJol_037-Ex1-2D-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	48%	132 bp	1.9
Dar-CJol_037-Ex1-2D-lcwgs-1-1.clmp.fp2_repr.R2	3.2%	48%	130 bp	1.9
Dar-CJol_038-Ex1-6A-lcwgs-1-1.clmp.fp2_repr.R1	2.6%	45%	127 bp	1.9
Dar-CJol_038-Ex1-6A-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	45%	125 bp	1.9
Dar-CJol_039-Ex1-7H-lcwgs-1-1.clmp.fp2_repr.R1	2.0%	47%	122 bp	0.9
Dar-CJol_039-Ex1-7H-lcwgs-1-1.clmp.fp2_repr.R2	2.0%	47%	120 bp	0.9
Dar-CJol_040-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	48%	129 bp	0.0
Dar-CJol_040-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	47%	126 bp	0.0
Dar-CJol_041-Ex1-1B-lcwgs-1-1.clmp.fp2_repr.R1	3.6%	49%	130 bp	2.4
Dar-CJol_041-Ex1-1B-lcwgs-1-1.clmp.fp2_repr.R2	3.8%	49%	128 bp	2.4
Dar-CJol_043-Ex1-4C-lcwgs-1-1.clmp.fp2_repr.R1	2.4%	45%	137 bp	1.4
Dar-CJol_043-Ex1-4C-lcwgs-1-1.clmp.fp2_repr.R2	2.1%	45%	135 bp	1.4
Dar-CJol_044-Ex1-5E-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	49%	127 bp	0.0
Dar-CJol_044-Ex1-5E-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	47%	125 bp	0.0
Dar-CJol_045-Ex1-5D-lcwgs-1-1.clmp.fp2_repr.R1	3.6%	48%	128 bp	2.4
Dar-CJol_045-Ex1-5D-lcwgs-1-1.clmp.fp2_repr.R2	3.8%	48%	126 bp	2.4
Dar-CJol_046-Ex1-2A-lcwgs-1-1.clmp.fp2_repr.R1	2.6%	47%	121 bp	1.8
Dar-CJol_046-Ex1-2A-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	47%	120 bp	1.8
Dar-CJol_050-Ex1-3E-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	48%	136 bp	0.0
Dar-CJol_050-Ex1-3E-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	49%	123 bp	0.0
Dar-CJol_051-Ex1-1H-lcwgs-1-1.clmp.fp2_repr.R1	2.8%	47%	131 bp	2.6
Dar-CJol_051-Ex1-1H-lcwgs-1-1.clmp.fp2_repr.R2	2.9%	47%	129 bp	2.6
Dar-CJol_052-Ex1-3G-lcwgs-1-1.clmp.fp2_repr.R1	2.7%	47%	128 bp	1.7
Dar-CJol_052-Ex1-3G-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	47%	126 bp	1.7
Dar-CJol_053-Ex1-2C-lcwgs-1-1.clmp.fp2_repr.R1	3.3%	48%	133 bp	2.0
Dar-CJol_053-Ex1-2C-lcwgs-1-1.clmp.fp2_repr.R2	3.3%	48%	131 bp	2.0
Dar-CJol_054-Ex1-2H-lcwgs-1-1.clmp.fp2_repr.R1	2.5%	44%	133 bp	2.8
Dar-CJol_054-Ex1-2H-lcwgs-1-1.clmp.fp2_repr.R2	2.4%	44%	131 bp	2.8
Dar-CJol_055-Ex1-6B-lcwgs-1-1.clmp.fp2_repr.R1	2.4%	45%	122 bp	2.5
Dar-CJol_055-Ex1-6B-lcwgs-1-1.clmp.fp2_repr.R2	2.4%	45%	121 bp	2.5
Dar-CJol_056-Ex1-8F-lcwgs-1-1.clmp.fp2_repr.R1	2.4%	47%	118 bp	2.2
Dar-CJol_056-Ex1-8F-lcwgs-1-1.clmp.fp2_repr.R2	2.5%	47%	117 bp	2.2
Dar-CJol_058-Ex1-1C-lcwgs-1-1.clmp.fp2_repr.R1	2.4%	46%	131 bp	2.0
Dar-CJol_058-Ex1-1C-lcwgs-1-1.clmp.fp2_repr.R2	2.4%	45%	129 bp	2.0
Dar-CJol_059-Ex1-6H-lcwgs-1-1.clmp.fp2_repr.R1	2.3%	45%	130 bp	1.1
Dar-CJol_059-Ex1-6H-lcwgs-1-1.clmp.fp2_repr.R2	2.3%	45%	128 bp	1.1
Dar-CJol_060-Ex1-1F-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	47%	129 bp	4.5
Dar-CJol_060-Ex1-1F-lcwgs-1-1.clmp.fp2_repr.R2	3.3%	47%	127 bp	4.5
Dar-CJol_061-Ex1-2B-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	49%	124 bp	1.9
Dar-CJol_061-Ex1-2B-lcwgs-1-1.clmp.fp2_repr.R2	3.0%	48%	122 bp	1.9
Dar-CJol_062-Ex1-7B-lcwgs-1-1.clmp.fp2_repr.R1	2.4%	48%	118 bp	1.3
Dar-CJol_062-Ex1-7B-lcwgs-1-1.clmp.fp2_repr.R2	2.4%	47%	116 bp	1.3
Dar-CJol_065-Ex1-2G-lcwgs-1-1.clmp.fp2_repr.R1	2.8%	48%	133 bp	1.1
Dar-CJol_065-Ex1-2G-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	48%	131 bp	1.1
Dar-CJol_066-Ex1-5A-lcwgs-1-1.clmp.fp2_repr.R1	2.8%	47%	127 bp	1.5
Dar-CJol_066-Ex1-5A-lcwgs-1-1.clmp.fp2_repr.R2	2.8%	47%	125 bp	1.5
Dar-CJol_067-Ex1-2E-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	46%	136 bp	0.0
Dar-CJol_067-Ex1-2E-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	47%	128 bp	0.0
Dar-CJol_068-Ex1-8E-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	53%	120 bp	0.0
Dar-CJol_068-Ex1-8E-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	52%	103 bp	0.0
Dar-CJol_069-Ex1-4D-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	48%	127 bp	2.5
Dar-CJol_069-Ex1-4D-lcwgs-1-1.clmp.fp2_repr.R2	3.1%	48%	125 bp	2.5
Dar-CJol_070-Ex1-5F-lcwgs-1-1.clmp.fp2_repr.R1	3.5%	48%	128 bp	3.5
Dar-CJol_070-Ex1-5F-lcwgs-1-1.clmp.fp2_repr.R2	3.8%	48%	126 bp	3.5
Dar-CJol_071-Ex1-7D-lcwgs-1-1.clmp.fp2_repr.R1	2.2%	47%	121 bp	1.3
Dar-CJol_071-Ex1-7D-lcwgs-1-1.clmp.fp2_repr.R2	2.1%	47%	119 bp	1.3
Dar-CJol_072-Ex1-8G-lcwgs-1-1.clmp.fp2_repr.R1	1.9%	46%	122 bp	0.6
Dar-CJol_072-Ex1-8G-lcwgs-1-1.clmp.fp2_repr.R2	1.7%	46%	121 bp	0.6
Dar-CJol_073-Ex1-3F-lcwgs-1-1.clmp.fp2_repr.R1	3.3%	48%	132 bp	5.0
Dar-CJol_073-Ex1-3F-lcwgs-1-1.clmp.fp2_repr.R2	3.4%	47%	129 bp	5.0
Dar-CJol_074-Ex1-7G-lcwgs-1-1.clmp.fp2_repr.R1	2.4%	47%	122 bp	1.7
Dar-CJol_074-Ex1-7G-lcwgs-1-1.clmp.fp2_repr.R2	2.5%	47%	120 bp	1.7
Dar-CJol_075-Ex1-4E-lcwgs-1-1.clmp.fp2_repr.R1	6.1%	48%	129 bp	0.0
Dar-CJol_075-Ex1-4E-lcwgs-1-1.clmp.fp2_repr.R2	3.0%	48%	127 bp	0.0
Dar-CJol_076-Ex1-5H-lcwgs-1-1.clmp.fp2_repr.R1	3.1%	47%	126 bp	3.0
Dar-CJol_076-Ex1-5H-lcwgs-1-1.clmp.fp2_repr.R2	3.3%	47%	124 bp	3.0
Dar-CJol_077-Ex1-7A-lcwgs-1-1.clmp.fp2_repr.R1	2.2%	46%	113 bp	1.1
Dar-CJol_077-Ex1-7A-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	46%	112 bp	1.1
Dar-CJol_078-Ex1-6D-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	48%	132 bp	1.4
Dar-CJol_078-Ex1-6D-lcwgs-1-1.clmp.fp2_repr.R2	3.1%	48%	130 bp	1.4
Dar-CJol_080-Ex1-4G-lcwgs-1-1.clmp.fp2_repr.R1	3.5%	49%	134 bp	2.5
Dar-CJol_080-Ex1-4G-lcwgs-1-1.clmp.fp2_repr.R2	3.6%	48%	132 bp	2.5
Dar-CJol_081-Ex1-7F-lcwgs-1-1.clmp.fp2_repr.R1	2.6%	47%	118 bp	3.4
Dar-CJol_081-Ex1-7F-lcwgs-1-1.clmp.fp2_repr.R2	2.8%	47%	116 bp	3.4
Dar-CJol_082-Ex1-5C-lcwgs-1-1.clmp.fp2_repr.R1	2.2%	47%	126 bp	0.8
Dar-CJol_082-Ex1-5C-lcwgs-1-1.clmp.fp2_repr.R2	2.1%	47%	124 bp	0.8
Dar-CJol_083-Ex1-6C-lcwgs-1-1.clmp.fp2_repr.R1	3.4%	49%	131 bp	0.8
Dar-CJol_083-Ex1-6C-lcwgs-1-1.clmp.fp2_repr.R2	3.4%	48%	129 bp	0.8
Dar-CJol_084-Ex1-4A-lcwgs-1-1.clmp.fp2_repr.R1	2.8%	48%	129 bp	1.2
Dar-CJol_084-Ex1-4A-lcwgs-1-1.clmp.fp2_repr.R2	2.8%	47%	127 bp	1.2
Dar-CJol_085-Ex1-3A-lcwgs-1-1.clmp.fp2_repr.R1	4.5%	48%	131 bp	3.1
Dar-CJol_085-Ex1-3A-lcwgs-1-1.clmp.fp2_repr.R2	5.0%	48%	129 bp	3.1
Dar-CJol_086-Ex1-6E-lcwgs-1-1.clmp.fp2_repr.R1	0.0%	48%	135 bp	0.0
Dar-CJol_086-Ex1-6E-lcwgs-1-1.clmp.fp2_repr.R2	0.0%	47%	122 bp	0.0
Dar-CJol_087-Ex1-4B-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	48%	131 bp	2.0
Dar-CJol_087-Ex1-4B-lcwgs-1-1.clmp.fp2_repr.R2	3.2%	48%	129 bp	2.0
Dar-CJol_088-Ex1-1A-lcwgs-1-1.clmp.fp2_repr.R1	2.5%	48%	128 bp	1.2
Dar-CJol_088-Ex1-1A-lcwgs-1-1.clmp.fp2_repr.R2	2.5%	47%	126 bp	1.2
Dar-CJol_090-Ex1-6G-lcwgs-1-1.clmp.fp2_repr.R1	3.0%	46%	137 bp	1.1
Dar-CJol_090-Ex1-6G-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	46%	135 bp	1.1
Dar-CJol_092-Ex1-5G-lcwgs-1-1.clmp.fp2_repr.R1	3.7%	47%	133 bp	3.1
Dar-CJol_092-Ex1-5G-lcwgs-1-1.clmp.fp2_repr.R2	3.8%	47%	131 bp	3.1
Dar-CJol_094-Ex1-1D-lcwgs-1-1.clmp.fp2_repr.R1	3.1%	47%	137 bp	1.6
Dar-CJol_094-Ex1-1D-lcwgs-1-1.clmp.fp2_repr.R2	3.2%	47%	134 bp	1.6
```

</p>
</details>

## 14. Clean Up
`mkdir logs`\
`mv *out logs/`
