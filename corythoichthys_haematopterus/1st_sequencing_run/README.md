## 1. Download data
Data downloaded from TAMUCC grid.

File formats correct, third column contents correct.

## 2. Proofread the decode files
Decode file format correct.

104 forward reads, 104 reverse reads, 104 unique individuals listed int he decode sheet.

## 3. Edit the decode file
N/A

## 4. Make a copy of the fq_raw files
`screen cp ./* /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/corythoichthys_haematopterus/1st_sequencing_run/fq_raw`

## 5. Perform a renaming dry run.
`bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Cha_lcwgs-TestLane_SequenceNameDecode.tsv`

<details><summary>Expand for output.</summary>

```bash
decode file read into memory
rename not specified, original and new file names will be printed to screen
bash renameFQGZ.bash Cha_lcwgs-TestLane_SequenceNameDecode.tsv

if you want to rename then bash renameFQGZ.bash Cha_lcwgs-TestLane_SequenceNameDecode.tsv rename

writing original file names to file, origFileNames.txt...
writing newFileNames.txt...
editing newFileNames.txt...
preview of orig and new R1 file names...
ChA0600101A_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_001-Ex1-1A-lcwgs-1-1.1.fq.gz
ChA0600201B_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_002-Ex1-1B-lcwgs-1-1.1.fq.gz
ChA0600301C_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_003-Ex1-1C-lcwgs-1-1.1.fq.gz
ChA0600401D_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_004-Ex1-1D-lcwgs-1-1.1.fq.gz
ChA0600501E_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_005-Ex1-1E-lcwgs-1-1.1.fq.gz
ChA0600601F_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_006-Ex1-1F-lcwgs-1-1.1.fq.gz
ChA0600701G_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_007-Ex1-1G-lcwgs-1-1.1.fq.gz
ChA0600801H_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_008-Ex1-1H-lcwgs-1-1.1.fq.gz
ChA0600902A_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_009-Ex1-2A-lcwgs-1-1.1.fq.gz
ChA0601002B_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_010-Ex1-2B-lcwgs-1-1.1.fq.gz
ChA0601102C_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_011-Ex1-2C-lcwgs-1-1.1.fq.gz
ChA0601202D_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_012-Ex1-2D-lcwgs-1-1.1.fq.gz
ChA0601302E_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_013-Ex1-2E-lcwgs-1-1.1.fq.gz
ChA0601402F_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_014-Ex1-2F-lcwgs-1-1.1.fq.gz
ChA0601502G_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_015-Ex1-2G-lcwgs-1-1.1.fq.gz
ChA0601602H_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_016-Ex1-2H-lcwgs-1-1.1.fq.gz
ChA0601703A_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_017-Ex1-3A-lcwgs-1-1.1.fq.gz
ChA0601803B_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_018-Ex1-3B-lcwgs-1-1.1.fq.gz
ChA0601903C_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_019-Ex1-3C-lcwgs-1-1.1.fq.gz
ChA0602003D_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_020-Ex1-3D-lcwgs-1-1.1.fq.gz
ChA0602103E_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_021-Ex1-3E-lcwgs-1-1.1.fq.gz
ChA0602203F_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_022-Ex1-3F-lcwgs-1-1.1.fq.gz
ChA0602303G_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_023-Ex1-3G-lcwgs-1-1.1.fq.gz
ChA0602403H_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_024-Ex1-3H-lcwgs-1-1.1.fq.gz
ChA0602504A_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_025-Ex1-4A-lcwgs-1-1.1.fq.gz
ChA0602604B_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_026-Ex1-4B-lcwgs-1-1.1.fq.gz
ChA0602704C_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_027-Ex1-4C-lcwgs-1-1.1.fq.gz
ChA0602804D_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_028-Ex1-4D-lcwgs-1-1.1.fq.gz
ChA0602904E_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_029-Ex1-4E-lcwgs-1-1.1.fq.gz
ChA0603004F_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_030-Ex1-4F-lcwgs-1-1.1.fq.gz
ChA0603104G_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_031-Ex1-4G-lcwgs-1-1.1.fq.gz
ChA0603204H_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_032-Ex1-4H-lcwgs-1-1.1.fq.gz
ChA0603305A_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_033-Ex1-5A-lcwgs-1-1.1.fq.gz
ChA0603405B_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_034-Ex1-5B-lcwgs-1-1.1.fq.gz
ChA0603505C_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_035-Ex1-5C-lcwgs-1-1.1.fq.gz
ChA0603605D_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_036-Ex1-5D-lcwgs-1-1.1.fq.gz
ChA0603705E_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_037-Ex1-5E-lcwgs-1-1.1.fq.gz
ChA0603805F_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_038-Ex1-5F-lcwgs-1-1.1.fq.gz
ChA0603905G_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_039-Ex1-5G-lcwgs-1-1.1.fq.gz
ChA0604005H_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-APnd_040-Ex1-5H-lcwgs-1-1.1.fq.gz
ChC0100908D_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_009-Ex1-8D-lcwgs-1-1.1.fq.gz
ChC0101007D_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_010-Ex1-7D-lcwgs-1-1.1.fq.gz
ChC0101107C_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_011-Ex1-7C-lcwgs-1-1.1.fq.gz
ChC0101308G_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_013-Ex1-8G-lcwgs-1-1.1.fq.gz
ChC0101407F_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_014-Ex1-7F-lcwgs-1-1.1.fq.gz
ChC0101507E_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_015-Ex1-7E-lcwgs-1-1.1.fq.gz
ChC0101606E_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_016-Ex1-6E-lcwgs-1-1.1.fq.gz
ChC0101708E_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_017-Ex1-8E-lcwgs-1-1.1.fq.gz
ChC0101806C_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_018-Ex1-6C-lcwgs-1-1.1.fq.gz
ChC0102105F_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_021-Ex1-5F-lcwgs-1-1.1.fq.gz
ChC0102206H_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_022-Ex1-6H-lcwgs-1-1.1.fq.gz
ChC0102301G_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_023-Ex1-1G-lcwgs-1-1.1.fq.gz
ChC0102404A_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_024-Ex1-4A-lcwgs-1-1.1.fq.gz
ChC0102502H_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_025-Ex1-2H-lcwgs-1-1.1.fq.gz
ChC0102608H_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_026-Ex1-8H-lcwgs-1-1.1.fq.gz
ChC0102705E_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_027-Ex1-5E-lcwgs-1-1.1.fq.gz
ChC0102801B_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_028-Ex1-1B-lcwgs-1-1.1.fq.gz
ChC0103003H_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_030-Ex1-3H-lcwgs-1-1.1.fq.gz
ChC0103102E_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_031-Ex1-2E-lcwgs-1-1.1.fq.gz
ChC0103207B_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_032-Ex1-7B-lcwgs-1-1.1.fq.gz
ChC0103308F_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_033-Ex1-8F-lcwgs-1-1.1.fq.gz
ChC0103406B_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_034-Ex1-6B-lcwgs-1-1.1.fq.gz
ChC0103504B_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_035-Ex1-4B-lcwgs-1-1.1.fq.gz
ChC0103604G_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_036-Ex1-4G-lcwgs-1-1.1.fq.gz
ChC0103702C_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_037-Ex1-2C-lcwgs-1-1.1.fq.gz
ChC0103805B_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_038-Ex1-5B-lcwgs-1-1.1.fq.gz
ChC0103903C_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_039-Ex1-3C-lcwgs-1-1.1.fq.gz
ChC0104007G_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_040-Ex1-7G-lcwgs-1-1.1.fq.gz
ChC0104101A_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_041-Ex1-1A-lcwgs-1-1.1.fq.gz
ChC0104205H_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_042-Ex1-5H-lcwgs-1-1.1.fq.gz
ChC0104303G_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_043-Ex1-3G-lcwgs-1-1.1.fq.gz
ChC0104404E_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_044-Ex1-4E-lcwgs-1-1.1.fq.gz
ChC0104506F_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_045-Ex1-6F-lcwgs-1-1.1.fq.gz
ChC0104701D_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_047-Ex1-1D-lcwgs-1-1.1.fq.gz
ChC0104805A_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_048-Ex1-5A-lcwgs-1-1.1.fq.gz
ChC0104902B_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_049-Ex1-2B-lcwgs-1-1.1.fq.gz
ChC0105101C_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_051-Ex1-1C-lcwgs-1-1.1.fq.gz
ChC0105203E_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_052-Ex1-3E-lcwgs-1-1.1.fq.gz
ChC0105303D_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_053-Ex1-3D-lcwgs-1-1.1.fq.gz
ChC0105401H_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_054-Ex1-1H-lcwgs-1-1.1.fq.gz
ChC0105908A_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_059-Ex1-8A-lcwgs-1-1.1.fq.gz
ChC0106001F_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_060-Ex1-1F-lcwgs-1-1.1.fq.gz
ChC0106105D_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_061-Ex1-5D-lcwgs-1-1.1.fq.gz
ChC0106201E_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_062-Ex1-1E-lcwgs-1-1.1.fq.gz
ChC0106407H_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_064-Ex1-7H-lcwgs-1-1.1.fq.gz
ChC0106507A_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_065-Ex1-7A-lcwgs-1-1.1.fq.gz
ChC0106603B_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_066-Ex1-3B-lcwgs-1-1.1.fq.gz
ChC0106702A_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_067-Ex1-2A-lcwgs-1-1.1.fq.gz
ChC0106902G_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_069-Ex1-2G-lcwgs-1-1.1.fq.gz
ChC0107003F_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_070-Ex1-3F-lcwgs-1-1.1.fq.gz
ChC0107106D_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_071-Ex1-6D-lcwgs-1-1.1.fq.gz
ChC0107203A_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_072-Ex1-3A-lcwgs-1-1.1.fq.gz
ChC0107302F_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_073-Ex1-2F-lcwgs-1-1.1.fq.gz
ChC0107402D_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_074-Ex1-2D-lcwgs-1-1.1.fq.gz
ChC0107604C_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_076-Ex1-4C-lcwgs-1-1.1.fq.gz
ChC0107706G_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_077-Ex1-6G-lcwgs-1-1.1.fq.gz
ChC0107804D_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_078-Ex1-4D-lcwgs-1-1.1.fq.gz
ChC0107904H_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_079-Ex1-4H-lcwgs-1-1.1.fq.gz
ChC0108108C_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_081-Ex1-8C-lcwgs-1-1.1.fq.gz
ChC0108208B_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_082-Ex1-8B-lcwgs-1-1.1.fq.gz
ChC0108306A_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_083-Ex1-6A-lcwgs-1-1.1.fq.gz
ChC0108404F_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_084-Ex1-4F-lcwgs-1-1.1.fq.gz
ChC0108505C_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_085-Ex1-5C-lcwgs-1-1.1.fq.gz
ChC0108605G_CKDL230029730-1A_HJLFCCCX2_L3_1.fq.gz Cha-CPnd_086-Ex1-5G-lcwgs-1-1.1.fq.gz
preview of orig and new R2 file names...
ChA0600101A_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_001-Ex1-1A-lcwgs-1-1.2.fq.gz
ChA0600201B_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_002-Ex1-1B-lcwgs-1-1.2.fq.gz
ChA0600301C_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_003-Ex1-1C-lcwgs-1-1.2.fq.gz
ChA0600401D_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_004-Ex1-1D-lcwgs-1-1.2.fq.gz
ChA0600501E_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_005-Ex1-1E-lcwgs-1-1.2.fq.gz
ChA0600601F_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_006-Ex1-1F-lcwgs-1-1.2.fq.gz
ChA0600701G_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_007-Ex1-1G-lcwgs-1-1.2.fq.gz
ChA0600801H_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_008-Ex1-1H-lcwgs-1-1.2.fq.gz
ChA0600902A_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_009-Ex1-2A-lcwgs-1-1.2.fq.gz
ChA0601002B_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_010-Ex1-2B-lcwgs-1-1.2.fq.gz
ChA0601102C_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_011-Ex1-2C-lcwgs-1-1.2.fq.gz
ChA0601202D_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_012-Ex1-2D-lcwgs-1-1.2.fq.gz
ChA0601302E_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_013-Ex1-2E-lcwgs-1-1.2.fq.gz
ChA0601402F_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_014-Ex1-2F-lcwgs-1-1.2.fq.gz
ChA0601502G_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_015-Ex1-2G-lcwgs-1-1.2.fq.gz
ChA0601602H_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_016-Ex1-2H-lcwgs-1-1.2.fq.gz
ChA0601703A_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_017-Ex1-3A-lcwgs-1-1.2.fq.gz
ChA0601803B_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_018-Ex1-3B-lcwgs-1-1.2.fq.gz
ChA0601903C_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_019-Ex1-3C-lcwgs-1-1.2.fq.gz
ChA0602003D_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_020-Ex1-3D-lcwgs-1-1.2.fq.gz
ChA0602103E_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_021-Ex1-3E-lcwgs-1-1.2.fq.gz
ChA0602203F_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_022-Ex1-3F-lcwgs-1-1.2.fq.gz
ChA0602303G_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_023-Ex1-3G-lcwgs-1-1.2.fq.gz
ChA0602403H_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_024-Ex1-3H-lcwgs-1-1.2.fq.gz
ChA0602504A_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_025-Ex1-4A-lcwgs-1-1.2.fq.gz
ChA0602604B_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_026-Ex1-4B-lcwgs-1-1.2.fq.gz
ChA0602704C_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_027-Ex1-4C-lcwgs-1-1.2.fq.gz
ChA0602804D_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_028-Ex1-4D-lcwgs-1-1.2.fq.gz
ChA0602904E_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_029-Ex1-4E-lcwgs-1-1.2.fq.gz
ChA0603004F_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_030-Ex1-4F-lcwgs-1-1.2.fq.gz
ChA0603104G_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_031-Ex1-4G-lcwgs-1-1.2.fq.gz
ChA0603204H_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_032-Ex1-4H-lcwgs-1-1.2.fq.gz
ChA0603305A_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_033-Ex1-5A-lcwgs-1-1.2.fq.gz
ChA0603405B_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_034-Ex1-5B-lcwgs-1-1.2.fq.gz
ChA0603505C_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_035-Ex1-5C-lcwgs-1-1.2.fq.gz
ChA0603605D_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_036-Ex1-5D-lcwgs-1-1.2.fq.gz
ChA0603705E_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_037-Ex1-5E-lcwgs-1-1.2.fq.gz
ChA0603805F_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_038-Ex1-5F-lcwgs-1-1.2.fq.gz
ChA0603905G_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_039-Ex1-5G-lcwgs-1-1.2.fq.gz
ChA0604005H_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-APnd_040-Ex1-5H-lcwgs-1-1.2.fq.gz
ChC0100908D_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_009-Ex1-8D-lcwgs-1-1.2.fq.gz
ChC0101007D_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_010-Ex1-7D-lcwgs-1-1.2.fq.gz
ChC0101107C_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_011-Ex1-7C-lcwgs-1-1.2.fq.gz
ChC0101308G_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_013-Ex1-8G-lcwgs-1-1.2.fq.gz
ChC0101407F_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_014-Ex1-7F-lcwgs-1-1.2.fq.gz
ChC0101507E_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_015-Ex1-7E-lcwgs-1-1.2.fq.gz
ChC0101606E_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_016-Ex1-6E-lcwgs-1-1.2.fq.gz
ChC0101708E_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_017-Ex1-8E-lcwgs-1-1.2.fq.gz
ChC0101806C_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_018-Ex1-6C-lcwgs-1-1.2.fq.gz
ChC0102105F_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_021-Ex1-5F-lcwgs-1-1.2.fq.gz
ChC0102206H_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_022-Ex1-6H-lcwgs-1-1.2.fq.gz
ChC0102301G_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_023-Ex1-1G-lcwgs-1-1.2.fq.gz
ChC0102404A_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_024-Ex1-4A-lcwgs-1-1.2.fq.gz
ChC0102502H_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_025-Ex1-2H-lcwgs-1-1.2.fq.gz
ChC0102608H_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_026-Ex1-8H-lcwgs-1-1.2.fq.gz
ChC0102705E_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_027-Ex1-5E-lcwgs-1-1.2.fq.gz
ChC0102801B_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_028-Ex1-1B-lcwgs-1-1.2.fq.gz
ChC0103003H_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_030-Ex1-3H-lcwgs-1-1.2.fq.gz
ChC0103102E_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_031-Ex1-2E-lcwgs-1-1.2.fq.gz
ChC0103207B_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_032-Ex1-7B-lcwgs-1-1.2.fq.gz
ChC0103308F_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_033-Ex1-8F-lcwgs-1-1.2.fq.gz
ChC0103406B_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_034-Ex1-6B-lcwgs-1-1.2.fq.gz
ChC0103504B_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_035-Ex1-4B-lcwgs-1-1.2.fq.gz
ChC0103604G_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_036-Ex1-4G-lcwgs-1-1.2.fq.gz
ChC0103702C_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_037-Ex1-2C-lcwgs-1-1.2.fq.gz
ChC0103805B_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_038-Ex1-5B-lcwgs-1-1.2.fq.gz
ChC0103903C_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_039-Ex1-3C-lcwgs-1-1.2.fq.gz
ChC0104007G_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_040-Ex1-7G-lcwgs-1-1.2.fq.gz
ChC0104101A_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_041-Ex1-1A-lcwgs-1-1.2.fq.gz
ChC0104205H_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_042-Ex1-5H-lcwgs-1-1.2.fq.gz
ChC0104303G_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_043-Ex1-3G-lcwgs-1-1.2.fq.gz
ChC0104404E_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_044-Ex1-4E-lcwgs-1-1.2.fq.gz
ChC0104506F_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_045-Ex1-6F-lcwgs-1-1.2.fq.gz
ChC0104701D_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_047-Ex1-1D-lcwgs-1-1.2.fq.gz
ChC0104805A_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_048-Ex1-5A-lcwgs-1-1.2.fq.gz
ChC0104902B_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_049-Ex1-2B-lcwgs-1-1.2.fq.gz
ChC0105101C_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_051-Ex1-1C-lcwgs-1-1.2.fq.gz
ChC0105203E_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_052-Ex1-3E-lcwgs-1-1.2.fq.gz
ChC0105303D_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_053-Ex1-3D-lcwgs-1-1.2.fq.gz
ChC0105401H_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_054-Ex1-1H-lcwgs-1-1.2.fq.gz
ChC0105908A_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_059-Ex1-8A-lcwgs-1-1.2.fq.gz
ChC0106001F_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_060-Ex1-1F-lcwgs-1-1.2.fq.gz
ChC0106105D_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_061-Ex1-5D-lcwgs-1-1.2.fq.gz
ChC0106201E_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_062-Ex1-1E-lcwgs-1-1.2.fq.gz
ChC0106407H_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_064-Ex1-7H-lcwgs-1-1.2.fq.gz
ChC0106507A_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_065-Ex1-7A-lcwgs-1-1.2.fq.gz
ChC0106603B_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_066-Ex1-3B-lcwgs-1-1.2.fq.gz
ChC0106702A_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_067-Ex1-2A-lcwgs-1-1.2.fq.gz
ChC0106902G_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_069-Ex1-2G-lcwgs-1-1.2.fq.gz
ChC0107003F_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_070-Ex1-3F-lcwgs-1-1.2.fq.gz
ChC0107106D_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_071-Ex1-6D-lcwgs-1-1.2.fq.gz
ChC0107203A_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_072-Ex1-3A-lcwgs-1-1.2.fq.gz
ChC0107302F_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_073-Ex1-2F-lcwgs-1-1.2.fq.gz
ChC0107402D_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_074-Ex1-2D-lcwgs-1-1.2.fq.gz
ChC0107604C_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_076-Ex1-4C-lcwgs-1-1.2.fq.gz
ChC0107706G_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_077-Ex1-6G-lcwgs-1-1.2.fq.gz
ChC0107804D_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_078-Ex1-4D-lcwgs-1-1.2.fq.gz
ChC0107904H_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_079-Ex1-4H-lcwgs-1-1.2.fq.gz
ChC0108108C_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_081-Ex1-8C-lcwgs-1-1.2.fq.gz
ChC0108208B_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_082-Ex1-8B-lcwgs-1-1.2.fq.gz
ChC0108306A_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_083-Ex1-6A-lcwgs-1-1.2.fq.gz
ChC0108404F_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_084-Ex1-4F-lcwgs-1-1.2.fq.gz
ChC0108505C_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_085-Ex1-5C-lcwgs-1-1.2.fq.gz
ChC0108605G_CKDL230029730-1A_HJLFCCCX2_L3_2.fq.gz Cha-CPnd_086-Ex1-5G-lcwgs-1-1.2.fq.gz
```
</p>
</details>

## 6. Rename the files for real
`bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Cha_lcwgs-TestLane_SequenceNameDecode.tsv rename`

## 7. Check the quality of your data.
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report"  "fq.gz"`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	M Seqs
Cha-APnd_001-Ex1-1A-lcwgs-1-1.1	41.4%	41%	0.5
Cha-APnd_001-Ex1-1A-lcwgs-1-1.2	38.3%	41%	0.5
Cha-APnd_002-Ex1-1B-lcwgs-1-1.1	52.8%	44%	0.6
Cha-APnd_002-Ex1-1B-lcwgs-1-1.2	50.0%	44%	0.6
Cha-APnd_003-Ex1-1C-lcwgs-1-1.1	36.1%	44%	3.4
Cha-APnd_003-Ex1-1C-lcwgs-1-1.2	34.1%	45%	3.4
Cha-APnd_004-Ex1-1D-lcwgs-1-1.1	36.0%	44%	2.7
Cha-APnd_004-Ex1-1D-lcwgs-1-1.2	33.2%	44%	2.7
Cha-APnd_005-Ex1-1E-lcwgs-1-1.1	36.0%	43%	3.2
Cha-APnd_005-Ex1-1E-lcwgs-1-1.2	34.0%	44%	3.2
Cha-APnd_006-Ex1-1F-lcwgs-1-1.1	49.9%	43%	1.0
Cha-APnd_006-Ex1-1F-lcwgs-1-1.2	47.1%	43%	1.0
Cha-APnd_007-Ex1-1G-lcwgs-1-1.1	29.9%	44%	0.9
Cha-APnd_007-Ex1-1G-lcwgs-1-1.2	28.2%	44%	0.9
Cha-APnd_008-Ex1-1H-lcwgs-1-1.1	39.7%	44%	3.7
Cha-APnd_008-Ex1-1H-lcwgs-1-1.2	37.8%	44%	3.7
Cha-APnd_009-Ex1-2A-lcwgs-1-1.1	41.7%	43%	2.8
Cha-APnd_009-Ex1-2A-lcwgs-1-1.2	39.3%	43%	2.8
Cha-APnd_010-Ex1-2B-lcwgs-1-1.1	34.4%	44%	1.5
Cha-APnd_010-Ex1-2B-lcwgs-1-1.2	32.4%	44%	1.5
Cha-APnd_011-Ex1-2C-lcwgs-1-1.1	46.3%	44%	1.6
Cha-APnd_011-Ex1-2C-lcwgs-1-1.2	43.9%	44%	1.6
Cha-APnd_012-Ex1-2D-lcwgs-1-1.1	29.9%	44%	2.3
Cha-APnd_012-Ex1-2D-lcwgs-1-1.2	27.9%	44%	2.3
Cha-APnd_013-Ex1-2E-lcwgs-1-1.1	21.2%	42%	0.5
Cha-APnd_013-Ex1-2E-lcwgs-1-1.2	20.0%	43%	0.5
Cha-APnd_014-Ex1-2F-lcwgs-1-1.1	28.5%	44%	2.7
Cha-APnd_014-Ex1-2F-lcwgs-1-1.2	26.9%	44%	2.7
Cha-APnd_015-Ex1-2G-lcwgs-1-1.1	32.7%	42%	1.8
Cha-APnd_015-Ex1-2G-lcwgs-1-1.2	30.5%	42%	1.8
Cha-APnd_016-Ex1-2H-lcwgs-1-1.1	29.4%	44%	2.6
Cha-APnd_016-Ex1-2H-lcwgs-1-1.2	27.8%	44%	2.6
Cha-APnd_017-Ex1-3A-lcwgs-1-1.1	46.9%	44%	2.5
Cha-APnd_017-Ex1-3A-lcwgs-1-1.2	44.6%	44%	2.5
Cha-APnd_018-Ex1-3B-lcwgs-1-1.1	23.4%	44%	0.3
Cha-APnd_018-Ex1-3B-lcwgs-1-1.2	21.6%	44%	0.3
Cha-APnd_019-Ex1-3C-lcwgs-1-1.1	20.3%	44%	0.1
Cha-APnd_019-Ex1-3C-lcwgs-1-1.2	19.0%	44%	0.1
Cha-APnd_020-Ex1-3D-lcwgs-1-1.1	28.5%	48%	0.0
Cha-APnd_020-Ex1-3D-lcwgs-1-1.2	25.8%	48%	0.0
Cha-APnd_021-Ex1-3E-lcwgs-1-1.1	30.5%	44%	0.7
Cha-APnd_021-Ex1-3E-lcwgs-1-1.2	28.7%	44%	0.7
Cha-APnd_022-Ex1-3F-lcwgs-1-1.1	35.5%	44%	2.5
Cha-APnd_022-Ex1-3F-lcwgs-1-1.2	33.8%	44%	2.5
Cha-APnd_023-Ex1-3G-lcwgs-1-1.1	15.2%	44%	0.0
Cha-APnd_023-Ex1-3G-lcwgs-1-1.2	14.4%	44%	0.0
Cha-APnd_024-Ex1-3H-lcwgs-1-1.1	6.9%	44%	0.0
Cha-APnd_024-Ex1-3H-lcwgs-1-1.2	6.4%	44%	0.0
Cha-APnd_025-Ex1-4A-lcwgs-1-1.1	31.7%	41%	0.1
Cha-APnd_025-Ex1-4A-lcwgs-1-1.2	28.9%	42%	0.1
Cha-APnd_026-Ex1-4B-lcwgs-1-1.1	34.3%	44%	2.8
Cha-APnd_026-Ex1-4B-lcwgs-1-1.2	32.6%	44%	2.8
Cha-APnd_027-Ex1-4C-lcwgs-1-1.1	33.1%	44%	2.5
Cha-APnd_027-Ex1-4C-lcwgs-1-1.2	31.7%	44%	2.5
Cha-APnd_028-Ex1-4D-lcwgs-1-1.1	28.3%	42%	2.9
Cha-APnd_028-Ex1-4D-lcwgs-1-1.2	26.5%	43%	2.9
Cha-APnd_029-Ex1-4E-lcwgs-1-1.1	36.5%	44%	2.5
Cha-APnd_029-Ex1-4E-lcwgs-1-1.2	34.8%	44%	2.5
Cha-APnd_030-Ex1-4F-lcwgs-1-1.1	32.0%	43%	0.9
Cha-APnd_030-Ex1-4F-lcwgs-1-1.2	29.5%	43%	0.9
Cha-APnd_031-Ex1-4G-lcwgs-1-1.1	32.7%	41%	0.4
Cha-APnd_031-Ex1-4G-lcwgs-1-1.2	30.0%	42%	0.4
Cha-APnd_032-Ex1-4H-lcwgs-1-1.1	24.0%	43%	2.4
Cha-APnd_032-Ex1-4H-lcwgs-1-1.2	22.8%	43%	2.4
Cha-APnd_033-Ex1-5A-lcwgs-1-1.1	11.1%	43%	0.0
Cha-APnd_033-Ex1-5A-lcwgs-1-1.2	10.3%	44%	0.0
Cha-APnd_034-Ex1-5B-lcwgs-1-1.1	32.7%	49%	0.0
Cha-APnd_034-Ex1-5B-lcwgs-1-1.2	32.1%	49%	0.0
Cha-APnd_035-Ex1-5C-lcwgs-1-1.1	21.4%	49%	1.0
Cha-APnd_035-Ex1-5C-lcwgs-1-1.2	20.7%	49%	1.0
Cha-APnd_036-Ex1-5D-lcwgs-1-1.1	22.7%	57%	0.6
Cha-APnd_036-Ex1-5D-lcwgs-1-1.2	21.9%	57%	0.6
Cha-APnd_037-Ex1-5E-lcwgs-1-1.1	21.5%	47%	0.5
Cha-APnd_037-Ex1-5E-lcwgs-1-1.2	20.5%	47%	0.5
Cha-APnd_038-Ex1-5F-lcwgs-1-1.1	13.3%	46%	1.2
Cha-APnd_038-Ex1-5F-lcwgs-1-1.2	12.6%	46%	1.2
Cha-APnd_039-Ex1-5G-lcwgs-1-1.1	12.2%	49%	0.0
Cha-APnd_039-Ex1-5G-lcwgs-1-1.2	11.4%	49%	0.0
Cha-APnd_040-Ex1-5H-lcwgs-1-1.1	10.8%	47%	0.0
Cha-APnd_040-Ex1-5H-lcwgs-1-1.2	10.3%	47%	0.0
Cha-CPnd_009-Ex1-8D-lcwgs-1-1.1	29.9%	57%	0.2
Cha-CPnd_009-Ex1-8D-lcwgs-1-1.2	28.6%	57%	0.2
Cha-CPnd_010-Ex1-7D-lcwgs-1-1.1	16.8%	43%	1.4
Cha-CPnd_010-Ex1-7D-lcwgs-1-1.2	15.8%	43%	1.4
Cha-CPnd_011-Ex1-7C-lcwgs-1-1.1	14.8%	53%	0.1
Cha-CPnd_011-Ex1-7C-lcwgs-1-1.2	13.7%	53%	0.1
Cha-CPnd_013-Ex1-8G-lcwgs-1-1.1	19.0%	44%	1.1
Cha-CPnd_013-Ex1-8G-lcwgs-1-1.2	18.2%	44%	1.1
Cha-CPnd_014-Ex1-7F-lcwgs-1-1.1	17.5%	43%	2.5
Cha-CPnd_014-Ex1-7F-lcwgs-1-1.2	16.5%	43%	2.5
Cha-CPnd_015-Ex1-7E-lcwgs-1-1.1	16.7%	43%	0.9
Cha-CPnd_015-Ex1-7E-lcwgs-1-1.2	15.6%	43%	0.9
Cha-CPnd_016-Ex1-6E-lcwgs-1-1.1	14.6%	43%	0.4
Cha-CPnd_016-Ex1-6E-lcwgs-1-1.2	13.5%	43%	0.4
Cha-CPnd_017-Ex1-8E-lcwgs-1-1.1	22.2%	41%	2.1
Cha-CPnd_017-Ex1-8E-lcwgs-1-1.2	20.5%	42%	2.1
Cha-CPnd_018-Ex1-6C-lcwgs-1-1.1	15.6%	42%	1.2
Cha-CPnd_018-Ex1-6C-lcwgs-1-1.2	14.3%	42%	1.2
Cha-CPnd_021-Ex1-5F-lcwgs-1-1.1	18.7%	43%	2.3
Cha-CPnd_021-Ex1-5F-lcwgs-1-1.2	17.8%	43%	2.3
Cha-CPnd_022-Ex1-6H-lcwgs-1-1.1	14.2%	43%	1.4
Cha-CPnd_022-Ex1-6H-lcwgs-1-1.2	13.6%	43%	1.4
Cha-CPnd_023-Ex1-1G-lcwgs-1-1.1	22.3%	53%	0.2
Cha-CPnd_023-Ex1-1G-lcwgs-1-1.2	21.1%	53%	0.2
Cha-CPnd_024-Ex1-4A-lcwgs-1-1.1	12.6%	42%	1.1
Cha-CPnd_024-Ex1-4A-lcwgs-1-1.2	11.6%	43%	1.1
Cha-CPnd_025-Ex1-2H-lcwgs-1-1.1	16.2%	43%	1.4
Cha-CPnd_025-Ex1-2H-lcwgs-1-1.2	15.1%	43%	1.4
Cha-CPnd_026-Ex1-8H-lcwgs-1-1.1	16.5%	42%	1.1
Cha-CPnd_026-Ex1-8H-lcwgs-1-1.2	15.5%	42%	1.1
Cha-CPnd_027-Ex1-5E-lcwgs-1-1.1	15.5%	43%	0.7
Cha-CPnd_027-Ex1-5E-lcwgs-1-1.2	14.4%	43%	0.7
Cha-CPnd_028-Ex1-1B-lcwgs-1-1.1	14.2%	43%	1.2
Cha-CPnd_028-Ex1-1B-lcwgs-1-1.2	13.1%	43%	1.2
Cha-CPnd_030-Ex1-3H-lcwgs-1-1.1	19.0%	42%	3.6
Cha-CPnd_030-Ex1-3H-lcwgs-1-1.2	16.9%	42%	3.6
Cha-CPnd_031-Ex1-2E-lcwgs-1-1.1	17.1%	43%	4.0
Cha-CPnd_031-Ex1-2E-lcwgs-1-1.2	16.0%	43%	4.0
Cha-CPnd_032-Ex1-7B-lcwgs-1-1.1	13.9%	43%	1.5
Cha-CPnd_032-Ex1-7B-lcwgs-1-1.2	13.1%	43%	1.5
Cha-CPnd_033-Ex1-8F-lcwgs-1-1.1	17.2%	43%	2.8
Cha-CPnd_033-Ex1-8F-lcwgs-1-1.2	16.2%	43%	2.8
Cha-CPnd_034-Ex1-6B-lcwgs-1-1.1	12.6%	43%	1.6
Cha-CPnd_034-Ex1-6B-lcwgs-1-1.2	11.9%	43%	1.6
Cha-CPnd_035-Ex1-4B-lcwgs-1-1.1	15.2%	42%	1.2
Cha-CPnd_035-Ex1-4B-lcwgs-1-1.2	13.9%	42%	1.2
Cha-CPnd_036-Ex1-4G-lcwgs-1-1.1	13.6%	43%	2.1
Cha-CPnd_036-Ex1-4G-lcwgs-1-1.2	12.9%	43%	2.1
Cha-CPnd_037-Ex1-2C-lcwgs-1-1.1	11.5%	43%	0.4
Cha-CPnd_037-Ex1-2C-lcwgs-1-1.2	10.6%	43%	0.4
Cha-CPnd_038-Ex1-5B-lcwgs-1-1.1	13.7%	43%	1.4
Cha-CPnd_038-Ex1-5B-lcwgs-1-1.2	13.0%	43%	1.4
Cha-CPnd_039-Ex1-3C-lcwgs-1-1.1	16.2%	43%	5.1
Cha-CPnd_039-Ex1-3C-lcwgs-1-1.2	15.2%	43%	5.1
Cha-CPnd_040-Ex1-7G-lcwgs-1-1.1	14.3%	43%	2.3
Cha-CPnd_040-Ex1-7G-lcwgs-1-1.2	13.6%	43%	2.3
Cha-CPnd_041-Ex1-1A-lcwgs-1-1.1	12.7%	42%	0.6
Cha-CPnd_041-Ex1-1A-lcwgs-1-1.2	11.3%	42%	0.6
Cha-CPnd_042-Ex1-5H-lcwgs-1-1.1	15.8%	43%	1.2
Cha-CPnd_042-Ex1-5H-lcwgs-1-1.2	14.8%	43%	1.2
Cha-CPnd_043-Ex1-3G-lcwgs-1-1.1	13.8%	43%	1.3
Cha-CPnd_043-Ex1-3G-lcwgs-1-1.2	12.9%	43%	1.3
Cha-CPnd_044-Ex1-4E-lcwgs-1-1.1	13.9%	44%	1.3
Cha-CPnd_044-Ex1-4E-lcwgs-1-1.2	13.0%	44%	1.3
Cha-CPnd_045-Ex1-6F-lcwgs-1-1.1	18.2%	43%	2.4
Cha-CPnd_045-Ex1-6F-lcwgs-1-1.2	17.2%	43%	2.4
Cha-CPnd_047-Ex1-1D-lcwgs-1-1.1	11.0%	42%	0.5
Cha-CPnd_047-Ex1-1D-lcwgs-1-1.2	10.1%	42%	0.5
Cha-CPnd_048-Ex1-5A-lcwgs-1-1.1	12.7%	42%	1.8
Cha-CPnd_048-Ex1-5A-lcwgs-1-1.2	11.6%	42%	1.8
Cha-CPnd_049-Ex1-2B-lcwgs-1-1.1	16.0%	43%	0.7
Cha-CPnd_049-Ex1-2B-lcwgs-1-1.2	15.0%	43%	0.7
Cha-CPnd_051-Ex1-1C-lcwgs-1-1.1	12.8%	44%	1.1
Cha-CPnd_051-Ex1-1C-lcwgs-1-1.2	12.2%	44%	1.1
Cha-CPnd_052-Ex1-3E-lcwgs-1-1.1	12.1%	43%	0.5
Cha-CPnd_052-Ex1-3E-lcwgs-1-1.2	11.2%	43%	0.5
Cha-CPnd_053-Ex1-3D-lcwgs-1-1.1	15.1%	43%	1.1
Cha-CPnd_053-Ex1-3D-lcwgs-1-1.2	13.8%	44%	1.1
Cha-CPnd_054-Ex1-1H-lcwgs-1-1.1	16.4%	42%	1.4
Cha-CPnd_054-Ex1-1H-lcwgs-1-1.2	14.9%	42%	1.4
Cha-CPnd_059-Ex1-8A-lcwgs-1-1.1	16.6%	43%	1.1
Cha-CPnd_059-Ex1-8A-lcwgs-1-1.2	15.4%	43%	1.1
Cha-CPnd_060-Ex1-1F-lcwgs-1-1.1	15.5%	42%	3.0
Cha-CPnd_060-Ex1-1F-lcwgs-1-1.2	14.6%	42%	3.0
Cha-CPnd_061-Ex1-5D-lcwgs-1-1.1	15.8%	43%	1.7
Cha-CPnd_061-Ex1-5D-lcwgs-1-1.2	14.6%	43%	1.7
Cha-CPnd_062-Ex1-1E-lcwgs-1-1.1	20.5%	44%	3.9
Cha-CPnd_062-Ex1-1E-lcwgs-1-1.2	19.4%	44%	3.9
Cha-CPnd_064-Ex1-7H-lcwgs-1-1.1	16.8%	43%	1.0
Cha-CPnd_064-Ex1-7H-lcwgs-1-1.2	15.9%	43%	1.0
Cha-CPnd_065-Ex1-7A-lcwgs-1-1.1	16.7%	42%	1.0
Cha-CPnd_065-Ex1-7A-lcwgs-1-1.2	15.4%	42%	1.0
Cha-CPnd_066-Ex1-3B-lcwgs-1-1.1	19.9%	44%	1.2
Cha-CPnd_066-Ex1-3B-lcwgs-1-1.2	17.6%	44%	1.2
Cha-CPnd_067-Ex1-2A-lcwgs-1-1.1	12.5%	43%	0.8
Cha-CPnd_067-Ex1-2A-lcwgs-1-1.2	11.5%	43%	0.8
Cha-CPnd_069-Ex1-2G-lcwgs-1-1.1	17.7%	43%	3.1
Cha-CPnd_069-Ex1-2G-lcwgs-1-1.2	16.4%	43%	3.1
Cha-CPnd_070-Ex1-3F-lcwgs-1-1.1	15.7%	44%	0.7
Cha-CPnd_070-Ex1-3F-lcwgs-1-1.2	14.8%	44%	0.7
Cha-CPnd_071-Ex1-6D-lcwgs-1-1.1	22.8%	54%	0.3
Cha-CPnd_071-Ex1-6D-lcwgs-1-1.2	21.5%	54%	0.3
Cha-CPnd_072-Ex1-3A-lcwgs-1-1.1	14.1%	42%	0.9
Cha-CPnd_072-Ex1-3A-lcwgs-1-1.2	12.6%	43%	0.9
Cha-CPnd_073-Ex1-2F-lcwgs-1-1.1	21.1%	43%	4.6
Cha-CPnd_073-Ex1-2F-lcwgs-1-1.2	19.8%	43%	4.6
Cha-CPnd_074-Ex1-2D-lcwgs-1-1.1	12.6%	44%	0.7
Cha-CPnd_074-Ex1-2D-lcwgs-1-1.2	11.7%	44%	0.7
Cha-CPnd_076-Ex1-4C-lcwgs-1-1.1	14.7%	44%	0.9
Cha-CPnd_076-Ex1-4C-lcwgs-1-1.2	13.8%	44%	0.9
Cha-CPnd_077-Ex1-6G-lcwgs-1-1.1	18.9%	42%	5.3
Cha-CPnd_077-Ex1-6G-lcwgs-1-1.2	17.7%	42%	5.3
Cha-CPnd_078-Ex1-4D-lcwgs-1-1.1	13.6%	42%	1.4
Cha-CPnd_078-Ex1-4D-lcwgs-1-1.2	12.3%	42%	1.4
Cha-CPnd_079-Ex1-4H-lcwgs-1-1.1	15.2%	43%	2.5
Cha-CPnd_079-Ex1-4H-lcwgs-1-1.2	14.3%	43%	2.5
Cha-CPnd_081-Ex1-8C-lcwgs-1-1.1	12.8%	44%	1.0
Cha-CPnd_081-Ex1-8C-lcwgs-1-1.2	12.1%	44%	1.0
Cha-CPnd_082-Ex1-8B-lcwgs-1-1.1	15.9%	43%	1.0
Cha-CPnd_082-Ex1-8B-lcwgs-1-1.2	15.1%	43%	1.0
Cha-CPnd_083-Ex1-6A-lcwgs-1-1.1	29.3%	57%	0.3
Cha-CPnd_083-Ex1-6A-lcwgs-1-1.2	27.9%	57%	0.3
Cha-CPnd_084-Ex1-4F-lcwgs-1-1.1	15.6%	44%	1.0
Cha-CPnd_084-Ex1-4F-lcwgs-1-1.2	14.8%	44%	1.0
Cha-CPnd_085-Ex1-5C-lcwgs-1-1.1	22.4%	44%	1.0
Cha-CPnd_085-Ex1-5C-lcwgs-1-1.2	21.4%	44%	1.0
Cha-CPnd_086-Ex1-5G-lcwgs-1-1.1	19.9%	43%	2.9
Cha-CPnd_086-Ex1-5G-lcwgs-1-1.2	18.7%	43%	2.9
```
</p>
</details>

## 8. First trim.
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Cha-APnd_001-Ex1-1A-lcwgs-1-1	13.0%	35.3%	92.1%	95.5%
Cha-APnd_002-Ex1-1B-lcwgs-1-1	11.4%	36.2%	71.3%	96.6%
Cha-APnd_003-Ex1-1C-lcwgs-1-1	11.0%	39.9%	94.6%	99.2%
Cha-APnd_004-Ex1-1D-lcwgs-1-1	11.4%	39.3%	94.7%	98.3%
Cha-APnd_005-Ex1-1E-lcwgs-1-1	10.7%	38.5%	93.9%	98.3%
Cha-APnd_006-Ex1-1F-lcwgs-1-1	12.4%	36.0%	80.6%	96.1%
Cha-APnd_007-Ex1-1G-lcwgs-1-1	10.4%	38.9%	95.7%	98.6%
Cha-APnd_008-Ex1-1H-lcwgs-1-1	14.3%	40.1%	94.7%	98.5%
Cha-APnd_009-Ex1-2A-lcwgs-1-1	11.2%	37.5%	90.1%	97.8%
Cha-APnd_010-Ex1-2B-lcwgs-1-1	10.8%	38.8%	92.5%	98.4%
Cha-APnd_011-Ex1-2C-lcwgs-1-1	10.7%	37.7%	88.0%	97.4%
Cha-APnd_012-Ex1-2D-lcwgs-1-1	10.6%	39.1%	96.4%	98.5%
Cha-APnd_013-Ex1-2E-lcwgs-1-1	10.3%	37.5%	94.7%	97.5%
Cha-APnd_014-Ex1-2F-lcwgs-1-1	10.7%	38.8%	96.1%	98.3%
Cha-APnd_015-Ex1-2G-lcwgs-1-1	11.7%	37.2%	94.6%	97.0%
Cha-APnd_016-Ex1-2H-lcwgs-1-1	10.9%	39.3%	96.8%	98.8%
Cha-APnd_017-Ex1-3A-lcwgs-1-1	12.2%	37.3%	85.3%	97.1%
Cha-APnd_018-Ex1-3B-lcwgs-1-1	9.3%	39.3%	94.5%	96.9%
Cha-APnd_019-Ex1-3C-lcwgs-1-1	8.8%	39.0%	94.1%	95.1%
Cha-APnd_020-Ex1-3D-lcwgs-1-1	8.2%	46.6%	80.1%	79.9%
Cha-APnd_021-Ex1-3E-lcwgs-1-1	11.0%	39.7%	93.8%	97.8%
Cha-APnd_022-Ex1-3F-lcwgs-1-1	11.4%	39.1%	94.2%	98.4%
Cha-APnd_023-Ex1-3G-lcwgs-1-1	7.2%	39.0%	93.6%	94.0%
Cha-APnd_024-Ex1-3H-lcwgs-1-1	0.9%	40.2%	93.0%	86.1%
Cha-APnd_025-Ex1-4A-lcwgs-1-1	9.9%	35.8%	90.5%	94.5%
Cha-APnd_026-Ex1-4B-lcwgs-1-1	10.3%	39.1%	94.4%	98.0%
Cha-APnd_027-Ex1-4C-lcwgs-1-1	9.8%	39.5%	93.8%	98.5%
Cha-APnd_028-Ex1-4D-lcwgs-1-1	10.8%	37.7%	97.6%	97.7%
Cha-APnd_029-Ex1-4E-lcwgs-1-1	10.3%	39.2%	93.4%	98.0%
Cha-APnd_030-Ex1-4F-lcwgs-1-1	12.2%	38.8%	96.3%	97.5%
Cha-APnd_031-Ex1-4G-lcwgs-1-1	10.6%	36.5%	93.1%	94.9%
Cha-APnd_032-Ex1-4H-lcwgs-1-1	10.6%	38.0%	95.9%	97.9%
Cha-APnd_033-Ex1-5A-lcwgs-1-1	2.0%	39.4%	87.2%	81.8%
Cha-APnd_034-Ex1-5B-lcwgs-1-1	9.1%	47.6%	72.1%	90.9%
Cha-APnd_035-Ex1-5C-lcwgs-1-1	14.2%	49.5%	91.2%	89.9%
Cha-APnd_036-Ex1-5D-lcwgs-1-1	17.3%	60.6%	91.3%	75.9%
Cha-APnd_037-Ex1-5E-lcwgs-1-1	15.5%	46.4%	90.0%	70.2%
Cha-APnd_038-Ex1-5F-lcwgs-1-1	13.4%	45.6%	96.4%	62.7%
Cha-APnd_039-Ex1-5G-lcwgs-1-1	7.4%	48.9%	92.2%	70.5%
Cha-APnd_040-Ex1-5H-lcwgs-1-1	5.1%	45.5%	91.9%	75.0%
Cha-CPnd_009-Ex1-8D-lcwgs-1-1	14.1%	58.5%	85.0%	45.1%
Cha-CPnd_010-Ex1-7D-lcwgs-1-1	9.9%	41.8%	94.0%	52.5%
Cha-CPnd_011-Ex1-7C-lcwgs-1-1	9.4%	54.3%	93.4%	43.3%
Cha-CPnd_013-Ex1-8G-lcwgs-1-1	10.2%	41.8%	91.9%	64.2%
Cha-CPnd_014-Ex1-7F-lcwgs-1-1	10.8%	41.3%	96.1%	52.1%
Cha-CPnd_015-Ex1-7E-lcwgs-1-1	9.9%	41.3%	95.9%	56.3%
Cha-CPnd_016-Ex1-6E-lcwgs-1-1	8.8%	41.5%	95.1%	53.1%
Cha-CPnd_017-Ex1-8E-lcwgs-1-1	11.3%	40.0%	90.7%	42.8%
Cha-CPnd_018-Ex1-6C-lcwgs-1-1	9.6%	41.4%	96.9%	45.5%
Cha-CPnd_021-Ex1-5F-lcwgs-1-1	10.7%	41.9%	95.0%	56.8%
Cha-CPnd_022-Ex1-6H-lcwgs-1-1	9.5%	41.3%	94.9%	57.0%
Cha-CPnd_023-Ex1-1G-lcwgs-1-1	9.4%	53.8%	90.4%	46.6%
Cha-CPnd_024-Ex1-4A-lcwgs-1-1	9.8%	41.6%	96.0%	43.5%
Cha-CPnd_025-Ex1-2H-lcwgs-1-1	10.2%	41.8%	97.3%	44.7%
Cha-CPnd_026-Ex1-8H-lcwgs-1-1	10.4%	40.7%	95.0%	52.8%
Cha-CPnd_027-Ex1-5E-lcwgs-1-1	10.0%	41.4%	95.2%	51.2%
Cha-CPnd_028-Ex1-1B-lcwgs-1-1	10.0%	41.8%	97.6%	45.5%
Cha-CPnd_030-Ex1-3H-lcwgs-1-1	11.6%	41.0%	93.6%	38.0%
Cha-CPnd_031-Ex1-2E-lcwgs-1-1	10.7%	42.1%	97.4%	48.0%
Cha-CPnd_032-Ex1-7B-lcwgs-1-1	10.0%	41.7%	95.8%	58.4%
Cha-CPnd_033-Ex1-8F-lcwgs-1-1	11.2%	41.6%	93.4%	49.9%
Cha-CPnd_034-Ex1-6B-lcwgs-1-1	9.5%	42.0%	97.0%	56.5%
Cha-CPnd_035-Ex1-4B-lcwgs-1-1	10.2%	41.1%	95.9%	36.6%
Cha-CPnd_036-Ex1-4G-lcwgs-1-1	10.0%	41.3%	97.3%	56.5%
Cha-CPnd_037-Ex1-2C-lcwgs-1-1	8.6%	41.8%	96.9%	60.8%
Cha-CPnd_038-Ex1-5B-lcwgs-1-1	9.7%	41.5%	97.1%	63.0%
Cha-CPnd_039-Ex1-3C-lcwgs-1-1	11.5%	41.9%	97.4%	40.4%
Cha-CPnd_040-Ex1-7G-lcwgs-1-1	10.1%	41.3%	96.2%	60.6%
Cha-CPnd_041-Ex1-1A-lcwgs-1-1	9.8%	41.6%	96.6%	30.5%
Cha-CPnd_042-Ex1-5H-lcwgs-1-1	10.2%	41.6%	95.8%	53.4%
Cha-CPnd_043-Ex1-3G-lcwgs-1-1	10.7%	42.0%	97.1%	52.9%
Cha-CPnd_044-Ex1-4E-lcwgs-1-1	9.8%	42.8%	96.6%	55.8%
Cha-CPnd_045-Ex1-6F-lcwgs-1-1	10.4%	41.5%	94.6%	45.5%
Cha-CPnd_047-Ex1-1D-lcwgs-1-1	9.4%	41.3%	97.1%	48.6%
Cha-CPnd_048-Ex1-5A-lcwgs-1-1	10.5%	41.4%	96.4%	36.1%
Cha-CPnd_049-Ex1-2B-lcwgs-1-1	9.3%	41.4%	97.1%	57.7%
Cha-CPnd_051-Ex1-1C-lcwgs-1-1	8.9%	42.5%	97.6%	70.9%
Cha-CPnd_052-Ex1-3E-lcwgs-1-1	9.5%	41.7%	95.8%	55.2%
Cha-CPnd_053-Ex1-3D-lcwgs-1-1	10.6%	42.5%	96.1%	46.6%
Cha-CPnd_054-Ex1-1H-lcwgs-1-1	10.3%	41.6%	97.5%	37.4%
Cha-CPnd_059-Ex1-8A-lcwgs-1-1	10.3%	41.7%	96.8%	49.5%
Cha-CPnd_060-Ex1-1F-lcwgs-1-1	11.0%	41.5%	97.5%	42.4%
Cha-CPnd_061-Ex1-5D-lcwgs-1-1	10.2%	41.9%	95.0%	45.1%
Cha-CPnd_062-Ex1-1E-lcwgs-1-1	10.3%	42.6%	97.1%	53.2%
Cha-CPnd_064-Ex1-7H-lcwgs-1-1	10.1%	41.9%	95.4%	57.0%
Cha-CPnd_065-Ex1-7A-lcwgs-1-1	10.3%	41.2%	94.5%	41.4%
Cha-CPnd_066-Ex1-3B-lcwgs-1-1	11.2%	44.0%	95.7%	23.1%
Cha-CPnd_067-Ex1-2A-lcwgs-1-1	9.8%	41.9%	97.3%	43.3%
Cha-CPnd_069-Ex1-2G-lcwgs-1-1	10.3%	42.4%	97.5%	46.2%
Cha-CPnd_070-Ex1-3F-lcwgs-1-1	10.4%	42.4%	95.0%	63.5%
Cha-CPnd_071-Ex1-6D-lcwgs-1-1	12.4%	54.5%	85.9%	39.8%
Cha-CPnd_072-Ex1-3A-lcwgs-1-1	10.7%	41.9%	96.0%	35.9%
Cha-CPnd_073-Ex1-2F-lcwgs-1-1	10.8%	41.8%	97.5%	46.0%
Cha-CPnd_074-Ex1-2D-lcwgs-1-1	9.3%	42.7%	97.2%	52.6%
Cha-CPnd_076-Ex1-4C-lcwgs-1-1	9.6%	42.2%	95.5%	57.0%
Cha-CPnd_077-Ex1-6G-lcwgs-1-1	10.5%	41.5%	95.7%	40.0%
Cha-CPnd_078-Ex1-4D-lcwgs-1-1	10.3%	41.2%	96.4%	32.0%
Cha-CPnd_079-Ex1-4H-lcwgs-1-1	10.0%	42.1%	95.8%	50.3%
Cha-CPnd_081-Ex1-8C-lcwgs-1-1	9.9%	42.1%	96.8%	65.1%
Cha-CPnd_082-Ex1-8B-lcwgs-1-1	9.9%	41.3%	96.8%	68.6%
Cha-CPnd_083-Ex1-6A-lcwgs-1-1	13.1%	58.6%	79.7%	41.6%
Cha-CPnd_084-Ex1-4F-lcwgs-1-1	9.9%	42.3%	94.9%	62.5%
Cha-CPnd_085-Ex1-5C-lcwgs-1-1	9.9%	41.9%	86.6%	56.5%
Cha-CPnd_086-Ex1-5G-lcwgs-1-1	10.5%	41.9%	94.8%	46.5%
```
</p>
</details>

## 9. Remove duplicates with clumpify.

### 9a. Remove duplicates.
`bash ../../../pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/hpc-0351 20`

### 9b. Check duplicate removal success.
```bash
salloc
enable_lmod
module load container_env R/4.2
```

"Clumpify Successfully worked on all samples"

### 9c. Generate metadata on deduplicated FASTQ files.
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report"  "fq.gz"`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	Length	M Seqs
Cha-APnd_001-Ex1-1A-lcwgs-1-1.clmp.r1	6.5%	34%	96 bp	0.3
Cha-APnd_001-Ex1-1A-lcwgs-1-1.clmp.r2	4.9%	34%	96 bp	0.3
Cha-APnd_002-Ex1-1B-lcwgs-1-1.clmp.r1	5.7%	35%	95 bp	0.2
Cha-APnd_002-Ex1-1B-lcwgs-1-1.clmp.r2	4.2%	35%	95 bp	0.2
Cha-APnd_003-Ex1-1C-lcwgs-1-1.clmp.r1	2.2%	40%	77 bp	1.9
Cha-APnd_003-Ex1-1C-lcwgs-1-1.clmp.r2	1.8%	40%	77 bp	1.9
Cha-APnd_004-Ex1-1D-lcwgs-1-1.clmp.r1	3.9%	39%	89 bp	1.6
Cha-APnd_004-Ex1-1D-lcwgs-1-1.clmp.r2	3.0%	39%	89 bp	1.6
Cha-APnd_005-Ex1-1E-lcwgs-1-1.clmp.r1	3.1%	38%	82 bp	1.8
Cha-APnd_005-Ex1-1E-lcwgs-1-1.clmp.r2	2.4%	38%	82 bp	1.8
Cha-APnd_006-Ex1-1F-lcwgs-1-1.clmp.r1	7.0%	35%	96 bp	0.4
Cha-APnd_006-Ex1-1F-lcwgs-1-1.clmp.r2	5.4%	35%	96 bp	0.4
Cha-APnd_007-Ex1-1G-lcwgs-1-1.clmp.r1	2.3%	39%	78 bp	0.5
Cha-APnd_007-Ex1-1G-lcwgs-1-1.clmp.r2	1.9%	39%	78 bp	0.5
Cha-APnd_008-Ex1-1H-lcwgs-1-1.clmp.r1	3.3%	41%	85 bp	2.0
Cha-APnd_008-Ex1-1H-lcwgs-1-1.clmp.r2	2.6%	41%	85 bp	2.0
Cha-APnd_009-Ex1-2A-lcwgs-1-1.clmp.r1	4.0%	37%	86 bp	1.5
Cha-APnd_009-Ex1-2A-lcwgs-1-1.clmp.r2	3.2%	37%	86 bp	1.5
Cha-APnd_010-Ex1-2B-lcwgs-1-1.clmp.r1	3.1%	39%	85 bp	0.9
Cha-APnd_010-Ex1-2B-lcwgs-1-1.clmp.r2	2.4%	39%	85 bp	0.9
Cha-APnd_011-Ex1-2C-lcwgs-1-1.clmp.r1	5.2%	38%	88 bp	0.8
Cha-APnd_011-Ex1-2C-lcwgs-1-1.clmp.r2	4.0%	38%	89 bp	0.8
Cha-APnd_012-Ex1-2D-lcwgs-1-1.clmp.r1	2.6%	39%	82 bp	1.4
Cha-APnd_012-Ex1-2D-lcwgs-1-1.clmp.r2	1.9%	39%	82 bp	1.4
Cha-APnd_013-Ex1-2E-lcwgs-1-1.clmp.r1	1.8%	37%	85 bp	0.4
Cha-APnd_013-Ex1-2E-lcwgs-1-1.clmp.r2	1.4%	37%	85 bp	0.4
Cha-APnd_014-Ex1-2F-lcwgs-1-1.clmp.r1	2.1%	39%	80 bp	1.7
Cha-APnd_014-Ex1-2F-lcwgs-1-1.clmp.r2	1.7%	39%	81 bp	1.7
Cha-APnd_015-Ex1-2G-lcwgs-1-1.clmp.r1	3.6%	37%	90 bp	1.1
Cha-APnd_015-Ex1-2G-lcwgs-1-1.clmp.r2	2.9%	37%	91 bp	1.1
Cha-APnd_016-Ex1-2H-lcwgs-1-1.clmp.r1	2.0%	39%	77 bp	1.5
Cha-APnd_016-Ex1-2H-lcwgs-1-1.clmp.r2	1.7%	39%	78 bp	1.5
Cha-APnd_017-Ex1-3A-lcwgs-1-1.clmp.r1	5.0%	37%	89 bp	1.2
Cha-APnd_017-Ex1-3A-lcwgs-1-1.clmp.r2	4.1%	37%	89 bp	1.2
Cha-APnd_018-Ex1-3B-lcwgs-1-1.clmp.r1	4.3%	39%	84 bp	0.2
Cha-APnd_018-Ex1-3B-lcwgs-1-1.clmp.r2	3.3%	39%	84 bp	0.2
Cha-APnd_019-Ex1-3C-lcwgs-1-1.clmp.r1	1.5%	39%	84 bp	0.0
Cha-APnd_019-Ex1-3C-lcwgs-1-1.clmp.r2	1.1%	39%	84 bp	0.0
Cha-APnd_020-Ex1-3D-lcwgs-1-1.clmp.r1	1.9%	46%	100 bp	0.0
Cha-APnd_020-Ex1-3D-lcwgs-1-1.clmp.r2	1.4%	46%	100 bp	0.0
Cha-APnd_021-Ex1-3E-lcwgs-1-1.clmp.r1	2.5%	40%	82 bp	0.4
Cha-APnd_021-Ex1-3E-lcwgs-1-1.clmp.r2	1.9%	40%	82 bp	0.4
Cha-APnd_022-Ex1-3F-lcwgs-1-1.clmp.r1	2.5%	39%	79 bp	1.4
Cha-APnd_022-Ex1-3F-lcwgs-1-1.clmp.r2	2.0%	39%	79 bp	1.4
Cha-APnd_023-Ex1-3G-lcwgs-1-1.clmp.r1	0.9%	39%	84 bp	0.0
Cha-APnd_023-Ex1-3G-lcwgs-1-1.clmp.r2	0.6%	39%	85 bp	0.0
Cha-APnd_024-Ex1-3H-lcwgs-1-1.clmp.r1	0.4%	40%	91 bp	0.0
Cha-APnd_024-Ex1-3H-lcwgs-1-1.clmp.r2	0.2%	40%	91 bp	0.0
Cha-APnd_025-Ex1-4A-lcwgs-1-1.clmp.r1	4.6%	35%	94 bp	0.1
Cha-APnd_025-Ex1-4A-lcwgs-1-1.clmp.r2	3.2%	35%	95 bp	0.1
Cha-APnd_026-Ex1-4B-lcwgs-1-1.clmp.r1	2.9%	39%	81 bp	1.6
Cha-APnd_026-Ex1-4B-lcwgs-1-1.clmp.r2	2.4%	39%	81 bp	1.6
Cha-APnd_027-Ex1-4C-lcwgs-1-1.clmp.r1	2.1%	40%	76 bp	1.4
Cha-APnd_027-Ex1-4C-lcwgs-1-1.clmp.r2	1.7%	40%	76 bp	1.4
Cha-APnd_028-Ex1-4D-lcwgs-1-1.clmp.r1	2.7%	37%	85 bp	1.9
Cha-APnd_028-Ex1-4D-lcwgs-1-1.clmp.r2	2.1%	37%	85 bp	1.9
Cha-APnd_029-Ex1-4E-lcwgs-1-1.clmp.r1	2.9%	39%	81 bp	1.4
Cha-APnd_029-Ex1-4E-lcwgs-1-1.clmp.r2	2.4%	39%	81 bp	1.4
Cha-APnd_030-Ex1-4F-lcwgs-1-1.clmp.r1	3.7%	39%	89 bp	0.5
Cha-APnd_030-Ex1-4F-lcwgs-1-1.clmp.r2	2.8%	39%	89 bp	0.5
Cha-APnd_031-Ex1-4G-lcwgs-1-1.clmp.r1	5.2%	36%	97 bp	0.2
Cha-APnd_031-Ex1-4G-lcwgs-1-1.clmp.r2	4.1%	36%	97 bp	0.2
Cha-APnd_032-Ex1-4H-lcwgs-1-1.clmp.r1	1.8%	38%	80 bp	1.6
Cha-APnd_032-Ex1-4H-lcwgs-1-1.clmp.r2	1.5%	38%	80 bp	1.6
Cha-APnd_033-Ex1-5A-lcwgs-1-1.clmp.r1	0.5%	39%	97 bp	0.0
Cha-APnd_033-Ex1-5A-lcwgs-1-1.clmp.r2	0.4%	39%	97 bp	0.0
Cha-APnd_034-Ex1-5B-lcwgs-1-1.clmp.r1	0.7%	47%	85 bp	0.0
Cha-APnd_034-Ex1-5B-lcwgs-1-1.clmp.r2	0.6%	47%	85 bp	0.0
Cha-APnd_035-Ex1-5C-lcwgs-1-1.clmp.r1	1.0%	49%	86 bp	0.7
Cha-APnd_035-Ex1-5C-lcwgs-1-1.clmp.r2	0.9%	49%	87 bp	0.7
Cha-APnd_036-Ex1-5D-lcwgs-1-1.clmp.r1	2.0%	60%	110 bp	0.5
Cha-APnd_036-Ex1-5D-lcwgs-1-1.clmp.r2	1.6%	60%	110 bp	0.5
Cha-APnd_037-Ex1-5E-lcwgs-1-1.clmp.r1	1.8%	46%	115 bp	0.4
Cha-APnd_037-Ex1-5E-lcwgs-1-1.clmp.r2	1.5%	46%	115 bp	0.4
Cha-APnd_038-Ex1-5F-lcwgs-1-1.clmp.r1	1.7%	45%	118 bp	1.0
Cha-APnd_038-Ex1-5F-lcwgs-1-1.clmp.r2	1.4%	45%	118 bp	1.0
Cha-APnd_039-Ex1-5G-lcwgs-1-1.clmp.r1	1.3%	48%	112 bp	0.0
Cha-APnd_039-Ex1-5G-lcwgs-1-1.clmp.r2	0.9%	48%	112 bp	0.0
Cha-APnd_040-Ex1-5H-lcwgs-1-1.clmp.r1	1.0%	45%	104 bp	0.0
Cha-APnd_040-Ex1-5H-lcwgs-1-1.clmp.r2	0.7%	45%	104 bp	0.0
Cha-CPnd_009-Ex1-8D-lcwgs-1-1.clmp.r1	3.1%	58%	133 bp	0.1
Cha-CPnd_009-Ex1-8D-lcwgs-1-1.clmp.r2	2.0%	58%	133 bp	0.1
Cha-CPnd_010-Ex1-7D-lcwgs-1-1.clmp.r1	3.3%	41%	124 bp	1.1
Cha-CPnd_010-Ex1-7D-lcwgs-1-1.clmp.r2	3.6%	41%	124 bp	1.1
Cha-CPnd_011-Ex1-7C-lcwgs-1-1.clmp.r1	1.8%	53%	132 bp	0.1
Cha-CPnd_011-Ex1-7C-lcwgs-1-1.clmp.r2	1.0%	53%	131 bp	0.1
Cha-CPnd_013-Ex1-8G-lcwgs-1-1.clmp.r1	3.1%	41%	115 bp	0.9
Cha-CPnd_013-Ex1-8G-lcwgs-1-1.clmp.r2	3.1%	41%	115 bp	0.9
Cha-CPnd_014-Ex1-7F-lcwgs-1-1.clmp.r1	4.0%	41%	124 bp	2.0
Cha-CPnd_014-Ex1-7F-lcwgs-1-1.clmp.r2	4.5%	41%	124 bp	2.0
Cha-CPnd_015-Ex1-7E-lcwgs-1-1.clmp.r1	4.2%	41%	121 bp	0.7
Cha-CPnd_015-Ex1-7E-lcwgs-1-1.clmp.r2	4.2%	41%	121 bp	0.7
Cha-CPnd_016-Ex1-6E-lcwgs-1-1.clmp.r1	3.5%	41%	122 bp	0.3
Cha-CPnd_016-Ex1-6E-lcwgs-1-1.clmp.r2	3.3%	41%	122 bp	0.3
Cha-CPnd_017-Ex1-8E-lcwgs-1-1.clmp.r1	6.0%	39%	133 bp	1.6
Cha-CPnd_017-Ex1-8E-lcwgs-1-1.clmp.r2	6.3%	40%	132 bp	1.6
Cha-CPnd_018-Ex1-6C-lcwgs-1-1.clmp.r1	6.0%	41%	128 bp	1.0
Cha-CPnd_018-Ex1-6C-lcwgs-1-1.clmp.r2	5.8%	41%	128 bp	1.0
Cha-CPnd_021-Ex1-5F-lcwgs-1-1.clmp.r1	3.8%	41%	122 bp	1.8
Cha-CPnd_021-Ex1-5F-lcwgs-1-1.clmp.r2	4.3%	41%	122 bp	1.8
Cha-CPnd_022-Ex1-6H-lcwgs-1-1.clmp.r1	2.7%	41%	121 bp	1.2
Cha-CPnd_022-Ex1-6H-lcwgs-1-1.clmp.r2	2.7%	41%	121 bp	1.2
Cha-CPnd_023-Ex1-1G-lcwgs-1-1.clmp.r1	2.5%	53%	129 bp	0.1
Cha-CPnd_023-Ex1-1G-lcwgs-1-1.clmp.r2	1.7%	53%	129 bp	0.1
Cha-CPnd_024-Ex1-4A-lcwgs-1-1.clmp.r1	2.9%	41%	129 bp	0.9
Cha-CPnd_024-Ex1-4A-lcwgs-1-1.clmp.r2	2.9%	41%	129 bp	0.9
Cha-CPnd_025-Ex1-2H-lcwgs-1-1.clmp.r1	4.6%	41%	130 bp	1.2
Cha-CPnd_025-Ex1-2H-lcwgs-1-1.clmp.r2	5.0%	41%	130 bp	1.2
Cha-CPnd_026-Ex1-8H-lcwgs-1-1.clmp.r1	3.7%	40%	125 bp	0.9
Cha-CPnd_026-Ex1-8H-lcwgs-1-1.clmp.r2	3.7%	40%	125 bp	0.9
Cha-CPnd_027-Ex1-5E-lcwgs-1-1.clmp.r1	4.4%	41%	124 bp	0.6
Cha-CPnd_027-Ex1-5E-lcwgs-1-1.clmp.r2	4.1%	41%	124 bp	0.6
Cha-CPnd_028-Ex1-1B-lcwgs-1-1.clmp.r1	3.6%	41%	129 bp	1.0
Cha-CPnd_028-Ex1-1B-lcwgs-1-1.clmp.r2	3.9%	41%	129 bp	1.0
Cha-CPnd_030-Ex1-3H-lcwgs-1-1.clmp.r1	6.1%	40%	133 bp	2.8
Cha-CPnd_030-Ex1-3H-lcwgs-1-1.clmp.r2	6.5%	41%	133 bp	2.8
Cha-CPnd_031-Ex1-2E-lcwgs-1-1.clmp.r1	4.6%	42%	127 bp	3.3
Cha-CPnd_031-Ex1-2E-lcwgs-1-1.clmp.r2	5.2%	42%	127 bp	3.3
Cha-CPnd_032-Ex1-7B-lcwgs-1-1.clmp.r1	2.6%	41%	119 bp	1.2
Cha-CPnd_032-Ex1-7B-lcwgs-1-1.clmp.r2	2.6%	41%	119 bp	1.2
Cha-CPnd_033-Ex1-8F-lcwgs-1-1.clmp.r1	3.4%	41%	126 bp	2.3
Cha-CPnd_033-Ex1-8F-lcwgs-1-1.clmp.r2	3.5%	41%	126 bp	2.3
Cha-CPnd_034-Ex1-6B-lcwgs-1-1.clmp.r1	2.6%	41%	121 bp	1.4
Cha-CPnd_034-Ex1-6B-lcwgs-1-1.clmp.r2	2.7%	41%	121 bp	1.4
Cha-CPnd_035-Ex1-4B-lcwgs-1-1.clmp.r1	5.6%	41%	134 bp	1.0
Cha-CPnd_035-Ex1-4B-lcwgs-1-1.clmp.r2	5.4%	41%	134 bp	1.0
Cha-CPnd_036-Ex1-4G-lcwgs-1-1.clmp.r1	3.1%	41%	121 bp	1.8
Cha-CPnd_036-Ex1-4G-lcwgs-1-1.clmp.r2	3.3%	41%	121 bp	1.8
Cha-CPnd_037-Ex1-2C-lcwgs-1-1.clmp.r1	2.2%	41%	117 bp	0.3
Cha-CPnd_037-Ex1-2C-lcwgs-1-1.clmp.r2	2.0%	41%	117 bp	0.3
Cha-CPnd_038-Ex1-5B-lcwgs-1-1.clmp.r1	2.8%	41%	116 bp	1.2
Cha-CPnd_038-Ex1-5B-lcwgs-1-1.clmp.r2	2.9%	41%	116 bp	1.2
Cha-CPnd_039-Ex1-3C-lcwgs-1-1.clmp.r1	4.8%	41%	132 bp	4.2
Cha-CPnd_039-Ex1-3C-lcwgs-1-1.clmp.r2	5.2%	41%	132 bp	4.2
Cha-CPnd_040-Ex1-7G-lcwgs-1-1.clmp.r1	2.6%	41%	118 bp	1.8
Cha-CPnd_040-Ex1-7G-lcwgs-1-1.clmp.r2	2.7%	41%	118 bp	1.8
Cha-CPnd_041-Ex1-1A-lcwgs-1-1.clmp.r1	4.0%	41%	137 bp	0.5
Cha-CPnd_041-Ex1-1A-lcwgs-1-1.clmp.r2	3.7%	41%	137 bp	0.5
Cha-CPnd_042-Ex1-5H-lcwgs-1-1.clmp.r1	3.4%	41%	124 bp	1.0
Cha-CPnd_042-Ex1-5H-lcwgs-1-1.clmp.r2	3.6%	41%	124 bp	1.0
Cha-CPnd_043-Ex1-3G-lcwgs-1-1.clmp.r1	3.2%	41%	124 bp	1.1
Cha-CPnd_043-Ex1-3G-lcwgs-1-1.clmp.r2	3.1%	42%	124 bp	1.1
Cha-CPnd_044-Ex1-4E-lcwgs-1-1.clmp.r1	2.9%	42%	121 bp	1.1
Cha-CPnd_044-Ex1-4E-lcwgs-1-1.clmp.r2	3.1%	42%	121 bp	1.1
Cha-CPnd_045-Ex1-6F-lcwgs-1-1.clmp.r1	4.5%	41%	129 bp	2.0
Cha-CPnd_045-Ex1-6F-lcwgs-1-1.clmp.r2	5.1%	41%	129 bp	2.0
Cha-CPnd_047-Ex1-1D-lcwgs-1-1.clmp.r1	2.5%	41%	126 bp	0.5
Cha-CPnd_047-Ex1-1D-lcwgs-1-1.clmp.r2	2.4%	41%	126 bp	0.5
Cha-CPnd_048-Ex1-5A-lcwgs-1-1.clmp.r1	3.3%	41%	134 bp	1.5
Cha-CPnd_048-Ex1-5A-lcwgs-1-1.clmp.r2	3.2%	41%	134 bp	1.5
Cha-CPnd_049-Ex1-2B-lcwgs-1-1.clmp.r1	5.2%	41%	122 bp	0.5
Cha-CPnd_049-Ex1-2B-lcwgs-1-1.clmp.r2	4.9%	41%	122 bp	0.5
Cha-CPnd_051-Ex1-1C-lcwgs-1-1.clmp.r1	2.3%	42%	110 bp	0.9
Cha-CPnd_051-Ex1-1C-lcwgs-1-1.clmp.r2	2.4%	42%	110 bp	0.9
Cha-CPnd_052-Ex1-3E-lcwgs-1-1.clmp.r1	2.3%	41%	121 bp	0.4
Cha-CPnd_052-Ex1-3E-lcwgs-1-1.clmp.r2	2.0%	41%	121 bp	0.4
Cha-CPnd_053-Ex1-3D-lcwgs-1-1.clmp.r1	3.8%	42%	127 bp	0.9
Cha-CPnd_053-Ex1-3D-lcwgs-1-1.clmp.r2	3.7%	42%	127 bp	0.9
Cha-CPnd_054-Ex1-1H-lcwgs-1-1.clmp.r1	7.1%	41%	134 bp	1.2
Cha-CPnd_054-Ex1-1H-lcwgs-1-1.clmp.r2	7.0%	41%	134 bp	1.2
Cha-CPnd_059-Ex1-8A-lcwgs-1-1.clmp.r1	4.4%	41%	127 bp	0.9
Cha-CPnd_059-Ex1-8A-lcwgs-1-1.clmp.r2	4.4%	41%	126 bp	0.9
Cha-CPnd_060-Ex1-1F-lcwgs-1-1.clmp.r1	3.9%	41%	131 bp	2.5
Cha-CPnd_060-Ex1-1F-lcwgs-1-1.clmp.r2	3.8%	41%	131 bp	2.5
Cha-CPnd_061-Ex1-5D-lcwgs-1-1.clmp.r1	3.5%	41%	129 bp	1.4
Cha-CPnd_061-Ex1-5D-lcwgs-1-1.clmp.r2	3.8%	41%	129 bp	1.4
Cha-CPnd_062-Ex1-1E-lcwgs-1-1.clmp.r1	5.6%	42%	125 bp	3.1
Cha-CPnd_062-Ex1-1E-lcwgs-1-1.clmp.r2	6.5%	42%	125 bp	3.1
Cha-CPnd_064-Ex1-7H-lcwgs-1-1.clmp.r1	3.6%	41%	122 bp	0.8
Cha-CPnd_064-Ex1-7H-lcwgs-1-1.clmp.r2	3.8%	41%	122 bp	0.8
Cha-CPnd_065-Ex1-7A-lcwgs-1-1.clmp.r1	4.2%	41%	132 bp	0.9
Cha-CPnd_065-Ex1-7A-lcwgs-1-1.clmp.r2	4.2%	41%	132 bp	0.9
Cha-CPnd_066-Ex1-3B-lcwgs-1-1.clmp.r1	6.9%	44%	143 bp	1.0
Cha-CPnd_066-Ex1-3B-lcwgs-1-1.clmp.r2	7.2%	44%	142 bp	1.0
Cha-CPnd_067-Ex1-2A-lcwgs-1-1.clmp.r1	3.6%	41%	130 bp	0.7
Cha-CPnd_067-Ex1-2A-lcwgs-1-1.clmp.r2	3.5%	41%	130 bp	0.7
Cha-CPnd_069-Ex1-2G-lcwgs-1-1.clmp.r1	5.0%	42%	129 bp	2.6
Cha-CPnd_069-Ex1-2G-lcwgs-1-1.clmp.r2	5.7%	42%	129 bp	2.6
Cha-CPnd_070-Ex1-3F-lcwgs-1-1.clmp.r1	3.1%	42%	115 bp	0.6
Cha-CPnd_070-Ex1-3F-lcwgs-1-1.clmp.r2	3.0%	42%	115 bp	0.6
Cha-CPnd_071-Ex1-6D-lcwgs-1-1.clmp.r1	2.0%	54%	137 bp	0.2
Cha-CPnd_071-Ex1-6D-lcwgs-1-1.clmp.r2	1.4%	54%	137 bp	0.2
Cha-CPnd_072-Ex1-3A-lcwgs-1-1.clmp.r1	4.0%	41%	134 bp	0.7
Cha-CPnd_072-Ex1-3A-lcwgs-1-1.clmp.r2	3.8%	41%	134 bp	0.7
Cha-CPnd_073-Ex1-2F-lcwgs-1-1.clmp.r1	5.4%	41%	129 bp	3.7
Cha-CPnd_073-Ex1-2F-lcwgs-1-1.clmp.r2	5.6%	41%	129 bp	3.7
Cha-CPnd_074-Ex1-2D-lcwgs-1-1.clmp.r1	3.3%	42%	123 bp	0.6
Cha-CPnd_074-Ex1-2D-lcwgs-1-1.clmp.r2	3.0%	42%	123 bp	0.6
Cha-CPnd_076-Ex1-4C-lcwgs-1-1.clmp.r1	3.2%	42%	121 bp	0.8
Cha-CPnd_076-Ex1-4C-lcwgs-1-1.clmp.r2	3.1%	42%	121 bp	0.8
Cha-CPnd_077-Ex1-6G-lcwgs-1-1.clmp.r1	5.4%	41%	133 bp	4.4
Cha-CPnd_077-Ex1-6G-lcwgs-1-1.clmp.r2	6.5%	41%	133 bp	4.4
Cha-CPnd_078-Ex1-4D-lcwgs-1-1.clmp.r1	3.8%	41%	137 bp	1.2
Cha-CPnd_078-Ex1-4D-lcwgs-1-1.clmp.r2	3.9%	41%	137 bp	1.2
Cha-CPnd_079-Ex1-4H-lcwgs-1-1.clmp.r1	3.5%	42%	125 bp	2.1
Cha-CPnd_079-Ex1-4H-lcwgs-1-1.clmp.r2	3.8%	42%	125 bp	2.1
Cha-CPnd_081-Ex1-8C-lcwgs-1-1.clmp.r1	2.4%	42%	114 bp	0.8
Cha-CPnd_081-Ex1-8C-lcwgs-1-1.clmp.r2	2.2%	42%	114 bp	0.8
Cha-CPnd_082-Ex1-8B-lcwgs-1-1.clmp.r1	4.1%	41%	112 bp	0.8
Cha-CPnd_082-Ex1-8B-lcwgs-1-1.clmp.r2	4.0%	41%	112 bp	0.8
Cha-CPnd_083-Ex1-6A-lcwgs-1-1.clmp.r1	3.8%	58%	139 bp	0.2
Cha-CPnd_083-Ex1-6A-lcwgs-1-1.clmp.r2	2.4%	58%	139 bp	0.2
Cha-CPnd_084-Ex1-4F-lcwgs-1-1.clmp.r1	3.1%	42%	116 bp	0.8
Cha-CPnd_084-Ex1-4F-lcwgs-1-1.clmp.r2	2.9%	42%	116 bp	0.8
Cha-CPnd_085-Ex1-5C-lcwgs-1-1.clmp.r1	3.1%	41%	123 bp	0.7
Cha-CPnd_085-Ex1-5C-lcwgs-1-1.clmp.r2	2.9%	41%	123 bp	0.7
Cha-CPnd_086-Ex1-5G-lcwgs-1-1.clmp.r1	5.2%	41%	129 bp	2.3
Cha-CPnd_086-Ex1-5G-lcwgs-1-1.clmp.r2	5.9%	41%	129 bp	2.3
```
  
</p>
</details>

## 10. Second trim.
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_2.sbatch fq_fp1_clmp fq_fp1_clmp_fp2 33`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Duplication	GC content	% PF	% Adapter
Cha-APnd_001-Ex1-1A-lcwgs-1-1.clmp.r1r2_fastp	1.3%	34.7%	99.1%	3.9%
Cha-APnd_002-Ex1-1B-lcwgs-1-1.clmp.r1r2_fastp	1.1%	35.9%	99.1%	4.0%
Cha-APnd_003-Ex1-1C-lcwgs-1-1.clmp.r1r2_fastp	0.5%	40.7%	99.4%	4.1%
Cha-APnd_004-Ex1-1D-lcwgs-1-1.clmp.r1r2_fastp	0.7%	39.9%	99.4%	3.9%
Cha-APnd_005-Ex1-1E-lcwgs-1-1.clmp.r1r2_fastp	0.7%	38.9%	99.3%	4.2%
Cha-APnd_006-Ex1-1F-lcwgs-1-1.clmp.r1r2_fastp	1.4%	35.7%	99.1%	4.1%
Cha-APnd_007-Ex1-1G-lcwgs-1-1.clmp.r1r2_fastp	0.7%	39.4%	99.4%	4.2%
Cha-APnd_008-Ex1-1H-lcwgs-1-1.clmp.r1r2_fastp	0.9%	41.2%	99.4%	4.1%
Cha-APnd_009-Ex1-2A-lcwgs-1-1.clmp.r1r2_fastp	0.8%	37.6%	99.3%	4.1%
Cha-APnd_010-Ex1-2B-lcwgs-1-1.clmp.r1r2_fastp	0.8%	39.3%	99.4%	4.1%
Cha-APnd_011-Ex1-2C-lcwgs-1-1.clmp.r1r2_fastp	0.8%	38.1%	99.2%	3.9%
Cha-APnd_012-Ex1-2D-lcwgs-1-1.clmp.r1r2_fastp	0.6%	39.7%	99.4%	3.9%
Cha-APnd_013-Ex1-2E-lcwgs-1-1.clmp.r1r2_fastp	1.0%	37.6%	99.4%	4.0%
Cha-APnd_014-Ex1-2F-lcwgs-1-1.clmp.r1r2_fastp	0.6%	39.0%	99.4%	4.1%
Cha-APnd_015-Ex1-2G-lcwgs-1-1.clmp.r1r2_fastp	1.0%	37.2%	99.3%	4.0%
Cha-APnd_016-Ex1-2H-lcwgs-1-1.clmp.r1r2_fastp	0.6%	39.8%	99.4%	4.0%
Cha-APnd_017-Ex1-3A-lcwgs-1-1.clmp.r1r2_fastp	1.0%	37.5%	99.2%	4.1%
Cha-APnd_018-Ex1-3B-lcwgs-1-1.clmp.r1r2_fastp	0.9%	39.7%	99.4%	4.0%
Cha-APnd_019-Ex1-3C-lcwgs-1-1.clmp.r1r2_fastp	0.7%	39.2%	98.9%	3.9%
Cha-APnd_020-Ex1-3D-lcwgs-1-1.clmp.r1r2_fastp	1.2%	46.9%	98.5%	3.3%
Cha-APnd_021-Ex1-3E-lcwgs-1-1.clmp.r1r2_fastp	0.7%	40.4%	99.4%	4.1%
Cha-APnd_022-Ex1-3F-lcwgs-1-1.clmp.r1r2_fastp	0.7%	39.8%	99.4%	4.1%
Cha-APnd_023-Ex1-3G-lcwgs-1-1.clmp.r1r2_fastp	0.4%	39.3%	98.8%	4.2%
Cha-APnd_024-Ex1-3H-lcwgs-1-1.clmp.r1r2_fastp	0.1%	40.3%	98.2%	4.6%
Cha-APnd_025-Ex1-4A-lcwgs-1-1.clmp.r1r2_fastp	1.2%	35.4%	98.9%	3.9%
Cha-APnd_026-Ex1-4B-lcwgs-1-1.clmp.r1r2_fastp	0.6%	39.6%	99.3%	4.2%
Cha-APnd_027-Ex1-4C-lcwgs-1-1.clmp.r1r2_fastp	0.5%	40.1%	99.4%	4.0%
Cha-APnd_028-Ex1-4D-lcwgs-1-1.clmp.r1r2_fastp	0.8%	37.8%	99.4%	3.8%
Cha-APnd_029-Ex1-4E-lcwgs-1-1.clmp.r1r2_fastp	0.6%	39.9%	99.3%	4.1%
Cha-APnd_030-Ex1-4F-lcwgs-1-1.clmp.r1r2_fastp	0.9%	39.2%	99.3%	4.2%
Cha-APnd_031-Ex1-4G-lcwgs-1-1.clmp.r1r2_fastp	1.3%	36.4%	99.2%	4.0%
Cha-APnd_032-Ex1-4H-lcwgs-1-1.clmp.r1r2_fastp	0.7%	38.0%	99.4%	4.0%
Cha-APnd_033-Ex1-5A-lcwgs-1-1.clmp.r1r2_fastp	0.2%	39.4%	97.3%	4.4%
Cha-APnd_034-Ex1-5B-lcwgs-1-1.clmp.r1r2_fastp	0.7%	47.7%	99.0%	3.9%
Cha-APnd_035-Ex1-5C-lcwgs-1-1.clmp.r1r2_fastp	1.2%	49.5%	99.3%	3.4%
Cha-APnd_036-Ex1-5D-lcwgs-1-1.clmp.r1r2_fastp	2.2%	60.4%	98.9%	2.8%
Cha-APnd_037-Ex1-5E-lcwgs-1-1.clmp.r1r2_fastp	2.1%	46.3%	98.9%	2.8%
Cha-APnd_038-Ex1-5F-lcwgs-1-1.clmp.r1r2_fastp	1.9%	45.5%	98.9%	2.5%
Cha-APnd_039-Ex1-5G-lcwgs-1-1.clmp.r1r2_fastp	1.1%	48.7%	98.1%	3.0%
Cha-APnd_040-Ex1-5H-lcwgs-1-1.clmp.r1r2_fastp	0.7%	45.3%	98.4%	4.2%
Cha-CPnd_009-Ex1-8D-lcwgs-1-1.clmp.r1r2_fastp	2.0%	58.1%	98.2%	1.6%
Cha-CPnd_010-Ex1-7D-lcwgs-1-1.clmp.r1r2_fastp	1.3%	41.8%	98.6%	2.3%
Cha-CPnd_011-Ex1-7C-lcwgs-1-1.clmp.r1r2_fastp	1.1%	53.7%	98.4%	1.8%
Cha-CPnd_013-Ex1-8G-lcwgs-1-1.clmp.r1r2_fastp	1.1%	41.8%	98.8%	2.7%
Cha-CPnd_014-Ex1-7F-lcwgs-1-1.clmp.r1r2_fastp	1.4%	41.3%	98.6%	2.3%
Cha-CPnd_015-Ex1-7E-lcwgs-1-1.clmp.r1r2_fastp	1.2%	41.3%	98.7%	2.6%
Cha-CPnd_016-Ex1-6E-lcwgs-1-1.clmp.r1r2_fastp	1.2%	41.4%	98.6%	2.6%
Cha-CPnd_017-Ex1-8E-lcwgs-1-1.clmp.r1r2_fastp	1.8%	39.9%	98.2%	1.8%
Cha-CPnd_018-Ex1-6C-lcwgs-1-1.clmp.r1r2_fastp	1.4%	41.4%	98.6%	2.0%
Cha-CPnd_021-Ex1-5F-lcwgs-1-1.clmp.r1r2_fastp	1.3%	41.8%	98.7%	2.4%
Cha-CPnd_022-Ex1-6H-lcwgs-1-1.clmp.r1r2_fastp	1.2%	41.3%	98.8%	2.4%
Cha-CPnd_023-Ex1-1G-lcwgs-1-1.clmp.r1r2_fastp	1.4%	53.3%	98.2%	2.2%
Cha-CPnd_024-Ex1-4A-lcwgs-1-1.clmp.r1r2_fastp	1.4%	41.5%	98.4%	1.8%
Cha-CPnd_025-Ex1-2H-lcwgs-1-1.clmp.r1r2_fastp	1.5%	41.8%	98.5%	2.1%
Cha-CPnd_026-Ex1-8H-lcwgs-1-1.clmp.r1r2_fastp	1.4%	40.7%	98.7%	2.2%
Cha-CPnd_027-Ex1-5E-lcwgs-1-1.clmp.r1r2_fastp	1.3%	41.4%	98.5%	2.4%
Cha-CPnd_028-Ex1-1B-lcwgs-1-1.clmp.r1r2_fastp	1.4%	41.7%	98.5%	2.0%
Cha-CPnd_030-Ex1-3H-lcwgs-1-1.clmp.r1r2_fastp	1.9%	40.9%	98.2%	1.7%
Cha-CPnd_031-Ex1-2E-lcwgs-1-1.clmp.r1r2_fastp	1.4%	42.0%	98.5%	2.1%
Cha-CPnd_032-Ex1-7B-lcwgs-1-1.clmp.r1r2_fastp	1.2%	41.7%	98.8%	2.4%
Cha-CPnd_033-Ex1-8F-lcwgs-1-1.clmp.r1r2_fastp	1.5%	41.5%	98.5%	2.0%
Cha-CPnd_034-Ex1-6B-lcwgs-1-1.clmp.r1r2_fastp	1.2%	41.9%	98.7%	2.4%
Cha-CPnd_035-Ex1-4B-lcwgs-1-1.clmp.r1r2_fastp	1.6%	41.1%	98.3%	1.7%
Cha-CPnd_036-Ex1-4G-lcwgs-1-1.clmp.r1r2_fastp	1.2%	41.2%	98.8%	2.5%
Cha-CPnd_037-Ex1-2C-lcwgs-1-1.clmp.r1r2_fastp	1.0%	41.7%	98.8%	2.6%
Cha-CPnd_038-Ex1-5B-lcwgs-1-1.clmp.r1r2_fastp	1.2%	41.5%	98.9%	2.6%
Cha-CPnd_039-Ex1-3C-lcwgs-1-1.clmp.r1r2_fastp	1.7%	41.8%	98.5%	1.7%
Cha-CPnd_040-Ex1-7G-lcwgs-1-1.clmp.r1r2_fastp	1.2%	41.2%	98.9%	2.6%
Cha-CPnd_041-Ex1-1A-lcwgs-1-1.clmp.r1r2_fastp	1.7%	41.6%	98.0%	1.5%
Cha-CPnd_042-Ex1-5H-lcwgs-1-1.clmp.r1r2_fastp	1.3%	41.5%	98.7%	2.3%
Cha-CPnd_043-Ex1-3G-lcwgs-1-1.clmp.r1r2_fastp	1.4%	41.9%	98.7%	2.4%
Cha-CPnd_044-Ex1-4E-lcwgs-1-1.clmp.r1r2_fastp	1.2%	42.7%	98.7%	2.5%
Cha-CPnd_045-Ex1-6F-lcwgs-1-1.clmp.r1r2_fastp	1.5%	41.5%	98.5%	2.0%
Cha-CPnd_047-Ex1-1D-lcwgs-1-1.clmp.r1r2_fastp	1.3%	41.2%	98.6%	2.2%
Cha-CPnd_048-Ex1-5A-lcwgs-1-1.clmp.r1r2_fastp	1.6%	41.3%	98.3%	1.5%
Cha-CPnd_049-Ex1-2B-lcwgs-1-1.clmp.r1r2_fastp	1.1%	41.5%	98.8%	2.5%
Cha-CPnd_051-Ex1-1C-lcwgs-1-1.clmp.r1r2_fastp	0.9%	42.4%	99.1%	2.9%
Cha-CPnd_052-Ex1-3E-lcwgs-1-1.clmp.r1r2_fastp	1.2%	41.6%	98.6%	2.5%
Cha-CPnd_053-Ex1-3D-lcwgs-1-1.clmp.r1r2_fastp	1.5%	42.5%	98.4%	2.1%
Cha-CPnd_054-Ex1-1H-lcwgs-1-1.clmp.r1r2_fastp	1.6%	41.6%	98.3%	1.9%
Cha-CPnd_059-Ex1-8A-lcwgs-1-1.clmp.r1r2_fastp	1.4%	41.7%	98.5%	2.1%
Cha-CPnd_060-Ex1-1F-lcwgs-1-1.clmp.r1r2_fastp	1.6%	41.4%	98.4%	1.9%
Cha-CPnd_061-Ex1-5D-lcwgs-1-1.clmp.r1r2_fastp	1.5%	41.8%	98.4%	2.0%
Cha-CPnd_062-Ex1-1E-lcwgs-1-1.clmp.r1r2_fastp	1.4%	42.6%	98.6%	2.4%
Cha-CPnd_064-Ex1-7H-lcwgs-1-1.clmp.r1r2_fastp	1.2%	41.9%	98.8%	2.5%
Cha-CPnd_065-Ex1-7A-lcwgs-1-1.clmp.r1r2_fastp	1.6%	41.2%	98.4%	1.8%
Cha-CPnd_066-Ex1-3B-lcwgs-1-1.clmp.r1r2_fastp	2.2%	44.0%	97.7%	1.3%
Cha-CPnd_067-Ex1-2A-lcwgs-1-1.clmp.r1r2_fastp	1.4%	41.9%	98.5%	1.9%
Cha-CPnd_069-Ex1-2G-lcwgs-1-1.clmp.r1r2_fastp	1.4%	42.3%	98.5%	2.1%
Cha-CPnd_070-Ex1-3F-lcwgs-1-1.clmp.r1r2_fastp	1.2%	42.3%	98.8%	2.7%
Cha-CPnd_071-Ex1-6D-lcwgs-1-1.clmp.r1r2_fastp	1.8%	54.2%	98.2%	1.5%
Cha-CPnd_072-Ex1-3A-lcwgs-1-1.clmp.r1r2_fastp	1.7%	41.8%	98.2%	1.6%
Cha-CPnd_073-Ex1-2F-lcwgs-1-1.clmp.r1r2_fastp	1.5%	41.9%	98.5%	2.1%
Cha-CPnd_074-Ex1-2D-lcwgs-1-1.clmp.r1r2_fastp	1.2%	42.6%	98.7%	2.3%
Cha-CPnd_076-Ex1-4C-lcwgs-1-1.clmp.r1r2_fastp	1.2%	42.2%	98.8%	2.4%
Cha-CPnd_077-Ex1-6G-lcwgs-1-1.clmp.r1r2_fastp	1.5%	41.4%	98.4%	1.8%
Cha-CPnd_078-Ex1-4D-lcwgs-1-1.clmp.r1r2_fastp	1.7%	41.1%	98.2%	1.6%
Cha-CPnd_079-Ex1-4H-lcwgs-1-1.clmp.r1r2_fastp	1.4%	42.0%	98.6%	2.2%
Cha-CPnd_081-Ex1-8C-lcwgs-1-1.clmp.r1r2_fastp	1.1%	42.1%	99.0%	2.6%
Cha-CPnd_082-Ex1-8B-lcwgs-1-1.clmp.r1r2_fastp	1.1%	41.4%	99.0%	2.9%
Cha-CPnd_083-Ex1-6A-lcwgs-1-1.clmp.r1r2_fastp	2.0%	58.3%	98.0%	1.2%
Cha-CPnd_084-Ex1-4F-lcwgs-1-1.clmp.r1r2_fastp	1.1%	42.2%	98.8%	2.6%
Cha-CPnd_085-Ex1-5C-lcwgs-1-1.clmp.r1r2_fastp	1.3%	41.8%	98.7%	2.2%
Cha-CPnd_086-Ex1-5G-lcwgs-1-1.clmp.r1r2_fastp	1.5%	41.8%	98.5%	2.2%
```

</p>
</details>

## 11. Decontaminate files.
`bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 /scratch/hpc-0351/fq_fp1_clmp_fp2_fqscrn 20`

```bash
[hpc-0351@wahab-01 1st_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*tagged.fastq.gz | wc -l
208
[hpc-0351@wahab-01 1st_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*tagged_filter.fastq.gz | wc -l
208
[hpc-0351@wahab-01 1st_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*screen.txt | wc -l
208
[hpc-0351@wahab-01 1st_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*screen.png | wc -l
208
[hpc-0351@wahab-01 1st_sequencing_run]$ ls fq_fp1_clmp_fp2_fqscrn/*screen.html | wc -l
208
[hpc-0351@wahab-01 1st_sequencing_run]$ grep 'error' slurm-fqscrn.*out
[hpc-0351@wahab-01 1st_sequencing_run]$ grep 'No reads in' slurm-fqscrn.*out
```

`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runMULTIQC.sbatch fq_fp1_clmp_fp2_fqscrn fastq_screen_report`

## 12. Execute RePair
`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 5`

`sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "./fq_fp1_clmp_fp2_fqscrn_rprd" "fqc_rprd_report" "fq.gz"`

<details><summary>Expand for MultiQC Output.</summary>

```bash
Sample Name	% Dups	% GC	Length	M Seqs
Cha-APnd_001-Ex1-1A-lcwgs-1-1.clmp.fp2_repr.R1	6.8%	35%	95 bp	0.3
Cha-APnd_001-Ex1-1A-lcwgs-1-1.clmp.fp2_repr.R2	5.3%	35%	95 bp	0.3
Cha-APnd_002-Ex1-1B-lcwgs-1-1.clmp.fp2_repr.R1	6.0%	36%	94 bp	0.2
Cha-APnd_002-Ex1-1B-lcwgs-1-1.clmp.fp2_repr.R2	4.5%	36%	94 bp	0.2
Cha-APnd_003-Ex1-1C-lcwgs-1-1.clmp.fp2_repr.R1	2.4%	40%	77 bp	1.8
Cha-APnd_003-Ex1-1C-lcwgs-1-1.clmp.fp2_repr.R2	1.9%	40%	77 bp	1.8
Cha-APnd_004-Ex1-1D-lcwgs-1-1.clmp.fp2_repr.R1	4.1%	39%	88 bp	1.5
Cha-APnd_004-Ex1-1D-lcwgs-1-1.clmp.fp2_repr.R2	3.2%	39%	88 bp	1.5
Cha-APnd_005-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R1	3.4%	39%	82 bp	1.7
Cha-APnd_005-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	39%	82 bp	1.7
Cha-APnd_006-Ex1-1F-lcwgs-1-1.clmp.fp2_repr.R1	7.3%	36%	96 bp	0.4
Cha-APnd_006-Ex1-1F-lcwgs-1-1.clmp.fp2_repr.R2	5.8%	36%	95 bp	0.4
Cha-APnd_007-Ex1-1G-lcwgs-1-1.clmp.fp2_repr.R1	2.5%	39%	77 bp	0.5
Cha-APnd_007-Ex1-1G-lcwgs-1-1.clmp.fp2_repr.R2	2.0%	39%	77 bp	0.5
Cha-APnd_008-Ex1-1H-lcwgs-1-1.clmp.fp2_repr.R1	3.6%	40%	84 bp	1.9
Cha-APnd_008-Ex1-1H-lcwgs-1-1.clmp.fp2_repr.R2	2.9%	40%	84 bp	1.9
Cha-APnd_009-Ex1-2A-lcwgs-1-1.clmp.fp2_repr.R1	4.2%	37%	85 bp	1.4
Cha-APnd_009-Ex1-2A-lcwgs-1-1.clmp.fp2_repr.R2	3.4%	37%	85 bp	1.4
Cha-APnd_010-Ex1-2B-lcwgs-1-1.clmp.fp2_repr.R1	3.3%	39%	84 bp	0.9
Cha-APnd_010-Ex1-2B-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	39%	84 bp	0.9
Cha-APnd_011-Ex1-2C-lcwgs-1-1.clmp.fp2_repr.R1	5.6%	38%	88 bp	0.7
Cha-APnd_011-Ex1-2C-lcwgs-1-1.clmp.fp2_repr.R2	4.5%	38%	87 bp	0.7
Cha-APnd_012-Ex1-2D-lcwgs-1-1.clmp.fp2_repr.R1	2.7%	39%	82 bp	1.3
Cha-APnd_012-Ex1-2D-lcwgs-1-1.clmp.fp2_repr.R2	2.1%	39%	81 bp	1.3
Cha-APnd_013-Ex1-2E-lcwgs-1-1.clmp.fp2_repr.R1	1.8%	37%	84 bp	0.4
Cha-APnd_013-Ex1-2E-lcwgs-1-1.clmp.fp2_repr.R2	1.5%	37%	84 bp	0.4
Cha-APnd_014-Ex1-2F-lcwgs-1-1.clmp.fp2_repr.R1	2.2%	39%	80 bp	1.6
Cha-APnd_014-Ex1-2F-lcwgs-1-1.clmp.fp2_repr.R2	1.8%	39%	80 bp	1.6
Cha-APnd_015-Ex1-2G-lcwgs-1-1.clmp.fp2_repr.R1	3.8%	37%	90 bp	1.1
Cha-APnd_015-Ex1-2G-lcwgs-1-1.clmp.fp2_repr.R2	3.1%	37%	89 bp	1.1
Cha-APnd_016-Ex1-2H-lcwgs-1-1.clmp.fp2_repr.R1	2.1%	40%	77 bp	1.5
Cha-APnd_016-Ex1-2H-lcwgs-1-1.clmp.fp2_repr.R2	1.8%	40%	77 bp	1.5
Cha-APnd_017-Ex1-3A-lcwgs-1-1.clmp.fp2_repr.R1	5.4%	37%	88 bp	1.1
Cha-APnd_017-Ex1-3A-lcwgs-1-1.clmp.fp2_repr.R2	4.5%	37%	88 bp	1.1
Cha-APnd_018-Ex1-3B-lcwgs-1-1.clmp.fp2_repr.R1	4.3%	39%	83 bp	0.2
Cha-APnd_018-Ex1-3B-lcwgs-1-1.clmp.fp2_repr.R2	3.4%	39%	83 bp	0.2
Cha-APnd_019-Ex1-3C-lcwgs-1-1.clmp.fp2_repr.R1	1.6%	39%	83 bp	0.0
Cha-APnd_019-Ex1-3C-lcwgs-1-1.clmp.fp2_repr.R2	1.2%	39%	83 bp	0.0
Cha-APnd_020-Ex1-3D-lcwgs-1-1.clmp.fp2_repr.R1	1.5%	43%	95 bp	0.0
Cha-APnd_020-Ex1-3D-lcwgs-1-1.clmp.fp2_repr.R2	1.1%	43%	94 bp	0.0
Cha-APnd_021-Ex1-3E-lcwgs-1-1.clmp.fp2_repr.R1	2.6%	40%	82 bp	0.4
Cha-APnd_021-Ex1-3E-lcwgs-1-1.clmp.fp2_repr.R2	2.1%	40%	81 bp	0.4
Cha-APnd_022-Ex1-3F-lcwgs-1-1.clmp.fp2_repr.R1	2.7%	39%	78 bp	1.3
Cha-APnd_022-Ex1-3F-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	39%	78 bp	1.3
Cha-APnd_023-Ex1-3G-lcwgs-1-1.clmp.fp2_repr.R1	0.9%	39%	84 bp	0.0
Cha-APnd_023-Ex1-3G-lcwgs-1-1.clmp.fp2_repr.R2	0.7%	39%	83 bp	0.0
Cha-APnd_024-Ex1-3H-lcwgs-1-1.clmp.fp2_repr.R1	0.3%	40%	89 bp	0.0
Cha-APnd_024-Ex1-3H-lcwgs-1-1.clmp.fp2_repr.R2	0.2%	40%	88 bp	0.0
Cha-APnd_025-Ex1-4A-lcwgs-1-1.clmp.fp2_repr.R1	4.7%	35%	94 bp	0.1
Cha-APnd_025-Ex1-4A-lcwgs-1-1.clmp.fp2_repr.R2	3.5%	35%	93 bp	0.1
Cha-APnd_026-Ex1-4B-lcwgs-1-1.clmp.fp2_repr.R1	3.1%	39%	81 bp	1.5
Cha-APnd_026-Ex1-4B-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	39%	80 bp	1.5
Cha-APnd_027-Ex1-4C-lcwgs-1-1.clmp.fp2_repr.R1	2.2%	40%	75 bp	1.4
Cha-APnd_027-Ex1-4C-lcwgs-1-1.clmp.fp2_repr.R2	1.8%	40%	75 bp	1.4
Cha-APnd_028-Ex1-4D-lcwgs-1-1.clmp.fp2_repr.R1	2.8%	38%	84 bp	1.8
Cha-APnd_028-Ex1-4D-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	38%	84 bp	1.8
Cha-APnd_029-Ex1-4E-lcwgs-1-1.clmp.fp2_repr.R1	3.0%	40%	80 bp	1.3
Cha-APnd_029-Ex1-4E-lcwgs-1-1.clmp.fp2_repr.R2	2.5%	40%	80 bp	1.3
Cha-APnd_030-Ex1-4F-lcwgs-1-1.clmp.fp2_repr.R1	3.8%	39%	89 bp	0.5
Cha-APnd_030-Ex1-4F-lcwgs-1-1.clmp.fp2_repr.R2	2.9%	39%	88 bp	0.5
Cha-APnd_031-Ex1-4G-lcwgs-1-1.clmp.fp2_repr.R1	5.3%	36%	96 bp	0.2
Cha-APnd_031-Ex1-4G-lcwgs-1-1.clmp.fp2_repr.R2	4.3%	36%	96 bp	0.2
Cha-APnd_032-Ex1-4H-lcwgs-1-1.clmp.fp2_repr.R1	1.8%	38%	79 bp	1.5
Cha-APnd_032-Ex1-4H-lcwgs-1-1.clmp.fp2_repr.R2	1.5%	38%	79 bp	1.5
Cha-APnd_033-Ex1-5A-lcwgs-1-1.clmp.fp2_repr.R1	0.5%	39%	95 bp	0.0
Cha-APnd_033-Ex1-5A-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	39%	93 bp	0.0
Cha-APnd_034-Ex1-5B-lcwgs-1-1.clmp.fp2_repr.R1	0.5%	44%	80 bp	0.0
Cha-APnd_034-Ex1-5B-lcwgs-1-1.clmp.fp2_repr.R2	0.5%	44%	80 bp	0.0
Cha-APnd_035-Ex1-5C-lcwgs-1-1.clmp.fp2_repr.R1	0.8%	45%	77 bp	0.5
Cha-APnd_035-Ex1-5C-lcwgs-1-1.clmp.fp2_repr.R2	0.7%	45%	77 bp	0.5
Cha-APnd_036-Ex1-5D-lcwgs-1-1.clmp.fp2_repr.R1	1.6%	57%	104 bp	0.2
Cha-APnd_036-Ex1-5D-lcwgs-1-1.clmp.fp2_repr.R2	1.4%	57%	103 bp	0.2
Cha-APnd_037-Ex1-5E-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	56%	128 bp	0.0
Cha-APnd_037-Ex1-5E-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	56%	126 bp	0.0
Cha-APnd_038-Ex1-5F-lcwgs-1-1.clmp.fp2_repr.R1	1.2%	45%	99 bp	0.4
Cha-APnd_038-Ex1-5F-lcwgs-1-1.clmp.fp2_repr.R2	1.1%	45%	99 bp	0.4
Cha-APnd_039-Ex1-5G-lcwgs-1-1.clmp.fp2_repr.R1	0.7%	47%	102 bp	0.0
Cha-APnd_039-Ex1-5G-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	47%	101 bp	0.0
Cha-APnd_040-Ex1-5H-lcwgs-1-1.clmp.fp2_repr.R1	0.5%	43%	95 bp	0.0
Cha-APnd_040-Ex1-5H-lcwgs-1-1.clmp.fp2_repr.R2	0.4%	43%	94 bp	0.0
Cha-CPnd_009-Ex1-8D-lcwgs-1-1.clmp.fp2_repr.R1	2.0%	53%	130 bp	0.1
Cha-CPnd_009-Ex1-8D-lcwgs-1-1.clmp.fp2_repr.R2	1.3%	53%	128 bp	0.1
Cha-CPnd_010-Ex1-7D-lcwgs-1-1.clmp.fp2_repr.R1	3.1%	41%	123 bp	1.1
Cha-CPnd_010-Ex1-7D-lcwgs-1-1.clmp.fp2_repr.R2	3.4%	41%	121 bp	1.1
Cha-CPnd_011-Ex1-7C-lcwgs-1-1.clmp.fp2_repr.R1	1.2%	48%	128 bp	0.0
Cha-CPnd_011-Ex1-7C-lcwgs-1-1.clmp.fp2_repr.R2	0.7%	48%	125 bp	0.0
Cha-CPnd_013-Ex1-8G-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	41%	114 bp	0.8
Cha-CPnd_013-Ex1-8G-lcwgs-1-1.clmp.fp2_repr.R2	3.0%	41%	112 bp	0.8
Cha-CPnd_014-Ex1-7F-lcwgs-1-1.clmp.fp2_repr.R1	3.7%	41%	122 bp	1.9
Cha-CPnd_014-Ex1-7F-lcwgs-1-1.clmp.fp2_repr.R2	4.3%	41%	121 bp	1.9
Cha-CPnd_015-Ex1-7E-lcwgs-1-1.clmp.fp2_repr.R1	4.0%	41%	120 bp	0.7
Cha-CPnd_015-Ex1-7E-lcwgs-1-1.clmp.fp2_repr.R2	4.0%	41%	118 bp	0.7
Cha-CPnd_016-Ex1-6E-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	41%	121 bp	0.3
Cha-CPnd_016-Ex1-6E-lcwgs-1-1.clmp.fp2_repr.R2	3.1%	41%	119 bp	0.3
Cha-CPnd_017-Ex1-8E-lcwgs-1-1.clmp.fp2_repr.R1	5.7%	40%	131 bp	1.5
Cha-CPnd_017-Ex1-8E-lcwgs-1-1.clmp.fp2_repr.R2	6.1%	40%	128 bp	1.5
Cha-CPnd_018-Ex1-6C-lcwgs-1-1.clmp.fp2_repr.R1	5.7%	41%	127 bp	0.9
Cha-CPnd_018-Ex1-6C-lcwgs-1-1.clmp.fp2_repr.R2	5.7%	41%	125 bp	0.9
Cha-CPnd_021-Ex1-5F-lcwgs-1-1.clmp.fp2_repr.R1	3.6%	41%	120 bp	1.7
Cha-CPnd_021-Ex1-5F-lcwgs-1-1.clmp.fp2_repr.R2	4.1%	41%	118 bp	1.7
Cha-CPnd_022-Ex1-6H-lcwgs-1-1.clmp.fp2_repr.R1	2.5%	41%	120 bp	1.1
Cha-CPnd_022-Ex1-6H-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	41%	118 bp	1.1
Cha-CPnd_023-Ex1-1G-lcwgs-1-1.clmp.fp2_repr.R1	1.5%	48%	124 bp	0.1
Cha-CPnd_023-Ex1-1G-lcwgs-1-1.clmp.fp2_repr.R2	1.1%	48%	122 bp	0.1
Cha-CPnd_024-Ex1-4A-lcwgs-1-1.clmp.fp2_repr.R1	2.7%	41%	128 bp	0.9
Cha-CPnd_024-Ex1-4A-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	41%	126 bp	0.9
Cha-CPnd_025-Ex1-2H-lcwgs-1-1.clmp.fp2_repr.R1	4.3%	41%	128 bp	1.1
Cha-CPnd_025-Ex1-2H-lcwgs-1-1.clmp.fp2_repr.R2	4.8%	41%	126 bp	1.1
Cha-CPnd_026-Ex1-8H-lcwgs-1-1.clmp.fp2_repr.R1	3.6%	40%	123 bp	0.8
Cha-CPnd_026-Ex1-8H-lcwgs-1-1.clmp.fp2_repr.R2	3.6%	40%	121 bp	0.8
Cha-CPnd_027-Ex1-5E-lcwgs-1-1.clmp.fp2_repr.R1	4.2%	41%	123 bp	0.6
Cha-CPnd_027-Ex1-5E-lcwgs-1-1.clmp.fp2_repr.R2	4.0%	41%	120 bp	0.6
Cha-CPnd_028-Ex1-1B-lcwgs-1-1.clmp.fp2_repr.R1	3.3%	41%	127 bp	1.0
Cha-CPnd_028-Ex1-1B-lcwgs-1-1.clmp.fp2_repr.R2	3.7%	41%	125 bp	1.0
Cha-CPnd_030-Ex1-3H-lcwgs-1-1.clmp.fp2_repr.R1	5.7%	41%	132 bp	2.7
Cha-CPnd_030-Ex1-3H-lcwgs-1-1.clmp.fp2_repr.R2	6.2%	41%	129 bp	2.7
Cha-CPnd_031-Ex1-2E-lcwgs-1-1.clmp.fp2_repr.R1	4.3%	42%	126 bp	3.1
Cha-CPnd_031-Ex1-2E-lcwgs-1-1.clmp.fp2_repr.R2	5.0%	42%	124 bp	3.1
Cha-CPnd_032-Ex1-7B-lcwgs-1-1.clmp.fp2_repr.R1	2.4%	41%	118 bp	1.1
Cha-CPnd_032-Ex1-7B-lcwgs-1-1.clmp.fp2_repr.R2	2.5%	41%	116 bp	1.1
Cha-CPnd_033-Ex1-8F-lcwgs-1-1.clmp.fp2_repr.R1	3.1%	41%	124 bp	2.2
Cha-CPnd_033-Ex1-8F-lcwgs-1-1.clmp.fp2_repr.R2	3.3%	41%	122 bp	2.2
Cha-CPnd_034-Ex1-6B-lcwgs-1-1.clmp.fp2_repr.R1	2.4%	42%	120 bp	1.3
Cha-CPnd_034-Ex1-6B-lcwgs-1-1.clmp.fp2_repr.R2	2.5%	41%	118 bp	1.3
Cha-CPnd_035-Ex1-4B-lcwgs-1-1.clmp.fp2_repr.R1	5.2%	41%	133 bp	1.0
Cha-CPnd_035-Ex1-4B-lcwgs-1-1.clmp.fp2_repr.R2	5.2%	41%	130 bp	1.0
Cha-CPnd_036-Ex1-4G-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	41%	120 bp	1.7
Cha-CPnd_036-Ex1-4G-lcwgs-1-1.clmp.fp2_repr.R2	3.2%	41%	118 bp	1.7
Cha-CPnd_037-Ex1-2C-lcwgs-1-1.clmp.fp2_repr.R1	2.1%	41%	116 bp	0.3
Cha-CPnd_037-Ex1-2C-lcwgs-1-1.clmp.fp2_repr.R2	2.0%	41%	114 bp	0.3
Cha-CPnd_038-Ex1-5B-lcwgs-1-1.clmp.fp2_repr.R1	2.6%	41%	115 bp	1.1
Cha-CPnd_038-Ex1-5B-lcwgs-1-1.clmp.fp2_repr.R2	2.8%	41%	114 bp	1.1
Cha-CPnd_039-Ex1-3C-lcwgs-1-1.clmp.fp2_repr.R1	4.3%	41%	131 bp	4.0
Cha-CPnd_039-Ex1-3C-lcwgs-1-1.clmp.fp2_repr.R2	4.8%	41%	128 bp	4.0
Cha-CPnd_040-Ex1-7G-lcwgs-1-1.clmp.fp2_repr.R1	2.4%	41%	117 bp	1.8
Cha-CPnd_040-Ex1-7G-lcwgs-1-1.clmp.fp2_repr.R2	2.6%	41%	115 bp	1.8
Cha-CPnd_041-Ex1-1A-lcwgs-1-1.clmp.fp2_repr.R1	3.6%	41%	135 bp	0.5
Cha-CPnd_041-Ex1-1A-lcwgs-1-1.clmp.fp2_repr.R2	3.5%	41%	132 bp	0.5
Cha-CPnd_042-Ex1-5H-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	41%	122 bp	1.0
Cha-CPnd_042-Ex1-5H-lcwgs-1-1.clmp.fp2_repr.R2	3.4%	41%	121 bp	1.0
Cha-CPnd_043-Ex1-3G-lcwgs-1-1.clmp.fp2_repr.R1	3.0%	42%	122 bp	1.0
Cha-CPnd_043-Ex1-3G-lcwgs-1-1.clmp.fp2_repr.R2	3.0%	42%	120 bp	1.0
Cha-CPnd_044-Ex1-4E-lcwgs-1-1.clmp.fp2_repr.R1	2.6%	42%	120 bp	1.0
Cha-CPnd_044-Ex1-4E-lcwgs-1-1.clmp.fp2_repr.R2	2.9%	42%	118 bp	1.0
Cha-CPnd_045-Ex1-6F-lcwgs-1-1.clmp.fp2_repr.R1	4.3%	41%	128 bp	1.9
Cha-CPnd_045-Ex1-6F-lcwgs-1-1.clmp.fp2_repr.R2	4.9%	41%	125 bp	1.9
Cha-CPnd_047-Ex1-1D-lcwgs-1-1.clmp.fp2_repr.R1	2.3%	41%	125 bp	0.4
Cha-CPnd_047-Ex1-1D-lcwgs-1-1.clmp.fp2_repr.R2	2.2%	41%	123 bp	0.4
Cha-CPnd_048-Ex1-5A-lcwgs-1-1.clmp.fp2_repr.R1	3.0%	41%	133 bp	1.5
Cha-CPnd_048-Ex1-5A-lcwgs-1-1.clmp.fp2_repr.R2	3.0%	41%	130 bp	1.5
Cha-CPnd_049-Ex1-2B-lcwgs-1-1.clmp.fp2_repr.R1	5.0%	41%	121 bp	0.5
Cha-CPnd_049-Ex1-2B-lcwgs-1-1.clmp.fp2_repr.R2	4.8%	41%	119 bp	0.5
Cha-CPnd_051-Ex1-1C-lcwgs-1-1.clmp.fp2_repr.R1	2.2%	42%	109 bp	0.8
Cha-CPnd_051-Ex1-1C-lcwgs-1-1.clmp.fp2_repr.R2	2.3%	42%	108 bp	0.8
Cha-CPnd_052-Ex1-3E-lcwgs-1-1.clmp.fp2_repr.R1	2.1%	41%	119 bp	0.4
Cha-CPnd_052-Ex1-3E-lcwgs-1-1.clmp.fp2_repr.R2	1.9%	41%	117 bp	0.4
Cha-CPnd_053-Ex1-3D-lcwgs-1-1.clmp.fp2_repr.R1	3.5%	42%	126 bp	0.9
Cha-CPnd_053-Ex1-3D-lcwgs-1-1.clmp.fp2_repr.R2	3.7%	42%	123 bp	0.9
Cha-CPnd_054-Ex1-1H-lcwgs-1-1.clmp.fp2_repr.R1	6.9%	41%	132 bp	1.1
Cha-CPnd_054-Ex1-1H-lcwgs-1-1.clmp.fp2_repr.R2	6.8%	41%	129 bp	1.1
Cha-CPnd_059-Ex1-8A-lcwgs-1-1.clmp.fp2_repr.R1	4.2%	41%	125 bp	0.8
Cha-CPnd_059-Ex1-8A-lcwgs-1-1.clmp.fp2_repr.R2	4.4%	41%	123 bp	0.8
Cha-CPnd_060-Ex1-1F-lcwgs-1-1.clmp.fp2_repr.R1	3.6%	41%	130 bp	2.4
Cha-CPnd_060-Ex1-1F-lcwgs-1-1.clmp.fp2_repr.R2	3.6%	41%	127 bp	2.4
Cha-CPnd_061-Ex1-5D-lcwgs-1-1.clmp.fp2_repr.R1	3.2%	41%	127 bp	1.4
Cha-CPnd_061-Ex1-5D-lcwgs-1-1.clmp.fp2_repr.R2	3.5%	41%	125 bp	1.4
Cha-CPnd_062-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R1	5.4%	42%	124 bp	2.9
Cha-CPnd_062-Ex1-1E-lcwgs-1-1.clmp.fp2_repr.R2	6.2%	42%	122 bp	2.9
Cha-CPnd_064-Ex1-7H-lcwgs-1-1.clmp.fp2_repr.R1	3.8%	41%	120 bp	0.8
Cha-CPnd_064-Ex1-7H-lcwgs-1-1.clmp.fp2_repr.R2	3.9%	41%	119 bp	0.8
Cha-CPnd_065-Ex1-7A-lcwgs-1-1.clmp.fp2_repr.R1	3.9%	41%	131 bp	0.8
Cha-CPnd_065-Ex1-7A-lcwgs-1-1.clmp.fp2_repr.R2	4.0%	41%	128 bp	0.8
Cha-CPnd_066-Ex1-3B-lcwgs-1-1.clmp.fp2_repr.R1	6.9%	44%	141 bp	1.0
Cha-CPnd_066-Ex1-3B-lcwgs-1-1.clmp.fp2_repr.R2	7.0%	44%	137 bp	1.0
Cha-CPnd_067-Ex1-2A-lcwgs-1-1.clmp.fp2_repr.R1	3.4%	41%	129 bp	0.6
Cha-CPnd_067-Ex1-2A-lcwgs-1-1.clmp.fp2_repr.R2	3.4%	41%	126 bp	0.6
Cha-CPnd_069-Ex1-2G-lcwgs-1-1.clmp.fp2_repr.R1	4.7%	42%	127 bp	2.4
Cha-CPnd_069-Ex1-2G-lcwgs-1-1.clmp.fp2_repr.R2	5.5%	42%	125 bp	2.4
Cha-CPnd_070-Ex1-3F-lcwgs-1-1.clmp.fp2_repr.R1	2.9%	42%	114 bp	0.5
Cha-CPnd_070-Ex1-3F-lcwgs-1-1.clmp.fp2_repr.R2	2.9%	42%	113 bp	0.5
Cha-CPnd_071-Ex1-6D-lcwgs-1-1.clmp.fp2_repr.R1	2.6%	49%	135 bp	0.1
Cha-CPnd_071-Ex1-6D-lcwgs-1-1.clmp.fp2_repr.R2	1.8%	49%	132 bp	0.1
Cha-CPnd_072-Ex1-3A-lcwgs-1-1.clmp.fp2_repr.R1	3.7%	41%	133 bp	0.7
Cha-CPnd_072-Ex1-3A-lcwgs-1-1.clmp.fp2_repr.R2	3.6%	41%	130 bp	0.7
Cha-CPnd_073-Ex1-2F-lcwgs-1-1.clmp.fp2_repr.R1	5.1%	41%	128 bp	3.5
Cha-CPnd_073-Ex1-2F-lcwgs-1-1.clmp.fp2_repr.R2	5.4%	41%	126 bp	3.5
Cha-CPnd_074-Ex1-2D-lcwgs-1-1.clmp.fp2_repr.R1	3.0%	42%	122 bp	0.6
Cha-CPnd_074-Ex1-2D-lcwgs-1-1.clmp.fp2_repr.R2	2.9%	42%	120 bp	0.6
Cha-CPnd_076-Ex1-4C-lcwgs-1-1.clmp.fp2_repr.R1	3.1%	42%	119 bp	0.7
Cha-CPnd_076-Ex1-4C-lcwgs-1-1.clmp.fp2_repr.R2	3.1%	42%	118 bp	0.7
Cha-CPnd_077-Ex1-6G-lcwgs-1-1.clmp.fp2_repr.R1	5.2%	41%	132 bp	4.2
Cha-CPnd_077-Ex1-6G-lcwgs-1-1.clmp.fp2_repr.R2	6.4%	41%	130 bp	4.2
Cha-CPnd_078-Ex1-4D-lcwgs-1-1.clmp.fp2_repr.R1	3.4%	41%	135 bp	1.2
Cha-CPnd_078-Ex1-4D-lcwgs-1-1.clmp.fp2_repr.R2	3.7%	41%	133 bp	1.2
Cha-CPnd_079-Ex1-4H-lcwgs-1-1.clmp.fp2_repr.R1	3.3%	42%	124 bp	2.0
Cha-CPnd_079-Ex1-4H-lcwgs-1-1.clmp.fp2_repr.R2	3.7%	42%	122 bp	2.0
Cha-CPnd_081-Ex1-8C-lcwgs-1-1.clmp.fp2_repr.R1	2.2%	42%	113 bp	0.8
Cha-CPnd_081-Ex1-8C-lcwgs-1-1.clmp.fp2_repr.R2	2.1%	42%	111 bp	0.8
Cha-CPnd_082-Ex1-8B-lcwgs-1-1.clmp.fp2_repr.R1	4.0%	41%	110 bp	0.8
Cha-CPnd_082-Ex1-8B-lcwgs-1-1.clmp.fp2_repr.R2	3.9%	41%	109 bp	0.8
Cha-CPnd_083-Ex1-6A-lcwgs-1-1.clmp.fp2_repr.R1	2.1%	53%	136 bp	0.1
Cha-CPnd_083-Ex1-6A-lcwgs-1-1.clmp.fp2_repr.R2	1.3%	53%	133 bp	0.1
Cha-CPnd_084-Ex1-4F-lcwgs-1-1.clmp.fp2_repr.R1	3.0%	42%	115 bp	0.7
Cha-CPnd_084-Ex1-4F-lcwgs-1-1.clmp.fp2_repr.R2	3.0%	42%	114 bp	0.7
Cha-CPnd_085-Ex1-5C-lcwgs-1-1.clmp.fp2_repr.R1	2.8%	41%	122 bp	0.7
Cha-CPnd_085-Ex1-5C-lcwgs-1-1.clmp.fp2_repr.R2	2.7%	41%	120 bp	0.7
Cha-CPnd_086-Ex1-5G-lcwgs-1-1.clmp.fp2_repr.R1	4.8%	41%	127 bp	2.2
Cha-CPnd_086-Ex1-5G-lcwgs-1-1.clmp.fp2_repr.R2	5.6%	41%	125 bp	2.2
```

</p>
</details>

## 14. Clean Up
```bash
mkdir logs
mv *out logs
```
