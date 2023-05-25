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

# on wahab replace <yourPireDirPath> with /home/e1garcia/shotgun_PIRE
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/2nd_sequencing_run/fq_raw
screen
cp ./* /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/2nd_sequencing_run/fq_raw

# `ctrl-a`  and then `d` to detach from the `screen` terminal

# look at your screen jobs running
screen -ls
```
