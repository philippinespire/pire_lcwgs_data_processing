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

Deduplicate.

```
bash ../../../pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/breid 20
```

Check deduplication success.

```
salloc
enable_lmod
module load container_env mapdamage2

crun R < /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/checkClumpify_EG.R --no-save
exit
```

Generate metadata.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_fp1_clmp" "fqc_clmp_report"  "fq.gz"
```

Second trim.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_2_cssl.sbatch fq_fp1_clmp fq_fp1_clmp_fp2
```

Decontaminate.

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn 20
```

Re-pair.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 40
```

Last QC.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "./fq_fp1_clmp_fp2_fqscrn_rprd" "fqc_rprd_report" "fq.gz"
```

Map to references (Par ssl assembly and P. magnuspinnatus published genome from NCBI).
Make mkBAM_Par and mkBAM_PerMag folders.

```
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/2nd_sequencing_run/mkBAM_Par
mkdir /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/periophthalmus_argentilineatus/2nd_sequencing_run/mkBAM_PerMag
```

Downloaded fPerMag1.2.pri from NCBI and uploaded fasta to Wahab mkBAM_PerMag.
