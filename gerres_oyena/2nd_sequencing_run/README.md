## Gerres oyena 2nd sequencing run

Downloading from TAMUCC server

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/fq_raw
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/gridDownloader.sh . https://gridftp.tamucc.edu/genomics/20230726_PIRE-Goy-lcwgs/
```

Check decode - looks OK! 96 F/R files, 48 Alb / 48 contemp.

Make a copy of raw files before beginning.

```
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/fq_raw

## add 1st sequencing run dir to RC folder

mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/1st_sequencing_run
mv -r /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/fq_raw/ /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/1st_sequencing_run/

## copy!

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/fq_raw
screen
cp ./* /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/fq_raw

# `ctrl-a`  and then `d` to detach from the `screen` terminal

# look at your screen jobs running
screen -ls
```
