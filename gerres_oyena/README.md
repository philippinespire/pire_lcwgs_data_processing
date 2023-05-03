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
`Multi_FASTQC.sh` run. Issues pushing to github, unable to view `fastqc_report.html`.


## 8. First trim.
First trim complete. Unable to view `FastQC` report at this time.

## 9. Remove duplicates with clumpify.

# 9a. Remove duplicates.
Executed `runCLUMPIFY_r1r2_array.bash`, running. 5/2

As of this morning, 4 samples still running. Manually canceled these runs, put those samples into fp_fq_stragglers and ran again. Successfully completed. 5/3

# 9b. Check duplicate removal sucess.
Ran `checkClumpify_EG.R`. "Clumpify Successfully worked on all samples"
