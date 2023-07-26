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
