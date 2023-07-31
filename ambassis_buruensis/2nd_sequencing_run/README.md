## Ambassis buruensis 2nd sequencing run

Downloading from TAMUCC server.

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/2nd_sequencing_run/fq_raw
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/gridDownloader.sh . https://gridftp.tamucc.edu/genomics/20230726_PIRE-Abu-lcwgs/
```

Check decode: looks OK! 96 forward/ 96 reverse read files.

Make a copy of raw files before beginning.

```
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/2nd_sequencing_run
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/2nd_sequencing_run/fq_raw

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/2nd_sequencing_run/fq_raw
screen
cp ./* /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/2nd_sequencing_run/fq_raw

# `ctrl-a`  and then `d` to detach from the `screen` terminal

# look at your screen jobs running
screen -ls
```
