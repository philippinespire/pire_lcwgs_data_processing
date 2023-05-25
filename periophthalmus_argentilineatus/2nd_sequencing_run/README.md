## Par 2nd sequencing run

Downloading data:
```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/gridDownloader.sh . https://gridftp.tamucc.edu/genomics/20230510_PIRE-Par-lcwgs/
```

Decode file looks OK.

Make a copy of the fq_raw files before renaming.

```
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/2nd_sequencing_run
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/2nd_sequencing_run/fq_raw

# add 1st run to previous structure

mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/1st_sequencing_run
mv /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/fq_raw /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/1st_sequencing_run

# on wahab replace <yourPireDirPath> with /home/e1garcia/shotgun_PIRE
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/2nd_sequencing_run/fq_raw
screen
cp ./* /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/2nd_sequencing_run/fq_raw

# `ctrl-a`  and then `d` to detach from the `screen` terminal

# look at your screen jobs running
screen -ls
```

Dry run rename.

```
salloc
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Par_lcwgs-1_SequenceNameDecode.tsv
```

Looks good! Rename for real.

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Par_lcwgs-1_SequenceNameDecode.tsv rename
```

Check data quality.

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/2nd_sequencing_run

#sbatch Multi_FASTQC.sh "<indir>" "<mqc report name>" "<file extension to qc>"
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report"  "fq.gz"
```

Summary:
* Duplication higher for Albatross (25-50%) vs contemp (generally <20%)
* GC content very different for Albatross (mid to high 50%s) compared to contemporary (mid-40%s) - contamination?
* Number of sequences for Albatross generally decent / stable around 1-5M. Lots more variation in contemporary... some close to 0, some >10M
* Lots of libraries flagged for overrepresented seqs / adapter content.

First trim.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1
```
