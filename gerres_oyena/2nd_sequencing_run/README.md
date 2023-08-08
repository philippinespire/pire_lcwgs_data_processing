## Gerres oyena 2nd sequencing run

Downloading from TAMUCC server

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/fq_raw
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/gridDownloader.sh . https://gridftp.tamucc.edu/genomics/20230726_PIRE-Goy-lcwgs/
```

Repeat one that failed

```
wget -c -P . https://gridftp.tamucc.edu/genomics/20230726_PIRE-Goy-lcwgs/GoA0104106A_CKDL230021622-1A_HCNTYDSX7_L3_2.fq.gz
```

Check downloads.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkFQ.sh .
```

Lots of bad fq.gz files and some improper zip formats - Roy Roberts transferred directly from TAMUCC to fq_raw2. Checking these files.

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/gerres_oyena/2nd_sequencing_run/fq_raw2
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkFQ.sh .
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

Had lots of problems with this method after the Wahab upgrade. Min recommended using an sbatch script and copying using a node, which worked.

Renaming files.

```
# dry run

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Goy_LCWGS-Seq_SequenceNameDecode.tsv 

# for real

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Goy_LCWGS-Seq_SequenceNameDecode.tsv rename

```

MultiQC.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report"  "fq.gz"  

```

One pair of files (Goy-CPnd_062-Ex1-3F-lcwgs-1-2.[1/2].fq.gz) didn't and stalled MultiQC - running these independently.

```
enable_lmod
module load parallel
module load container_env multiqc
module load container_env fastqc
bash
export SINGULARITY_BIND=/home/e1garcia

crun fastqc Goy-CPnd_062-Ex1-3F-lcwgs-1-2.1.fq.gz
crun fastqc Goy-CPnd_062-Ex1-3F-lcwgs-1-2.2.fq.gz

crun multiqc -v -p -ip -f --data-dir --data-format tsv --cl-config "max_table_rows: 3000" --filename fqc_raw_report --outdir fq_raw fq_raw

```
