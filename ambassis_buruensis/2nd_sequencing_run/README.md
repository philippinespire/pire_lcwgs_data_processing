## Ambassis buruensis 2nd sequencing run

Downloading from TAMUCC server.

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/2nd_sequencing_run/fq_raw
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/gridDownloader.sh . https://gridftp.tamucc.edu/genomics/20230726_PIRE-Abu-lcwgs/
```

Manually retrying a few files that gave input/output errors the first time.

```
wget -c -P . https://gridftp.tamucc.edu/genomics/20230726_PIRE-Abu-lcwgs/AbC0205906C_CKDL230021621-1A_HCNTYDSX7_L4_1.fq.gz

wget -c -P . https://gridftp.tamucc.edu/genomics/20230726_PIRE-Abu-lcwgs/AbC0208104B_CKDL230021621-1A_HCNTYDSX7_L4_1.fq.gz

wget -c -P . https://gridftp.tamucc.edu/genomics/20230726_PIRE-Abu-lcwgs/AbC0208503E_CKDL230021621-1A_HCNTYDSX7_L4_1.fq.gz
```

Check downloads.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkFQ.sh .
```

Lots of bad fq.gz formats, and some improper file types!.
Roy Roberts did a direct transfer from TAMUCC to a new folder fq_raw2- checking these.

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/2nd_sequencing_run/fq_raw2
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkFQ.sh .
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

Had lots of problems with this method after the Wahab upgrade. Min recommended using an sbatch script and copying using a node, which worked.

Renaming files.

```
# dry run

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Abu-LCWGS-Seq_SequenceNameDecode.tsv 

# for real

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Abu-LCWGS-Seq_SequenceNameDecode.tsv rename

```

MultiQC.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report"  "fq.gz"  

```

Results:

* Highly variable sequence numbers (~1M to >300M)
* Duplication rates variable, some <20%, a few >50%.
* A decent proportion of libraries (~25%) flagged for high GC content, another ~35% yellow flags
* High adapter content

First trim.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1 

```
