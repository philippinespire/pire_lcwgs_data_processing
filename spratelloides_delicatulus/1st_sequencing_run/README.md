## Sde test lane

Eric Garcia downloaded data from TAMUCC.

Decode file looks OK!

Make a copy of the fq_raw files before renaming.

```
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/spratelloides_delicatulus/1st_sequencing_run
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/spratelloides_delicatulus/1st_sequencing_run/fq_raw

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/spratelloides_delicatulus/1st_sequencing_run/fq_raw
screen
cp ./* /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/spratelloides_delicatulus/1st_sequencing_run/fq_raw
```

Dry run rename.

```
salloc
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Sde-LCWGS-TestLane_SequenceNameDecode.tsv
```

Looks good! Rename for real.

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Sde-LCWGS-TestLane_SequenceNameDecode.tsv rename
```

Check data quality.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report" "fq.gz"
```
