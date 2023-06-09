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

Most libraries have very low sequence #s (< 1M; most contemporaries < 100K). For Albatross libraries with a decent number of reads (>5M) metrics look good though - low GC content, low duplications, low adapter content after processing. 

Mapping these libraries to Sde SSL reference (note- this assembly was notably poor!) for preliminary data. Edit the config.6 to reflect reference name and dDocent_dev2.sbatch with full path.

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/spratelloides_delicatulus/1st_sequencing_run
mkdir mkBAM

cp fq_fp1_clmp_fp2_fqscrn_rprd/Sde-ABol_033-Ex1-9C-lcwgs-1-1.clmp.fp2_repr.R1.fq.gz mkBAM
cp fq_fp1_clmp_fp2_fqscrn_rprd/Sde-ABol_033-Ex1-9C-lcwgs-1-1.clmp.fp2_repr.R2.fq.gz mkBAM
cp fq_fp1_clmp_fp2_fqscrn_rprd/Sde-ABol_068-Ex1-8F-lcwgs-1-1.clmp.fp2_repr.R1.fq.gz mkBAM
cp fq_fp1_clmp_fp2_fqscrn_rprd/Sde-ABol_068-Ex1-8F-lcwgs-1-1.clmp.fp2_repr.R2.fq.gz mkBAM
cp fq_fp1_clmp_fp2_fqscrn_rprd/Sde-ABol_083-Ex1-11G-lcwgs-1-1.clmp.fp2_repr.R1.fq.gz mkBAM
cp fq_fp1_clmp_fp2_fqscrn_rprd/Sde-ABol_083-Ex1-11G-lcwgs-1-1.clmp.fp2_repr.R2.fq.gz mkBAM
cp fq_fp1_clmp_fp2_fqscrn_rprd/Sde-ABol_084-Ex1-12G-lcwgs-1-1.clmp.fp2_repr.R1.fq.gz mkBAM
cp fq_fp1_clmp_fp2_fqscrn_rprd/Sde-ABol_084-Ex1-12G-lcwgs-1-1.clmp.fp2_repr.R2.fq.gz mkBAM
cp fq_fp1_clmp_fp2_fqscrn_rprd/Sde-ABol_090-Ex1-6H-lcwgs-1-1.clmp.fp2_repr.R1.fq.gz mkBAM
cp fq_fp1_clmp_fp2_fqscrn_rprd/Sde-ABol_090-Ex1-6H-lcwgs-1-1.clmp.fp2_repr.R2.fq.gz mkBAM

cd mkBAM

cp /home/e1garcia/shotgun_PIRE/pire_ssl_data_processing/spratelloides_delicatulus/SPAdes_allLibs_decontam_R1R2_noIsolate/scaffolds.fasta .
mv scaffolds.fasta reference.ssl.Sde.fasta
cp /home/e1garcia/shotgun_PIRE/dDocentHPC/configs/config.6.lcwgs .
cp /home/e1garcia/shotgun_PIRE/dDocentHPC/dDocentHPC_dev2.sbatch .
sbatch dDocentHPC_dev2.sbatch mkBAM config.6.lcwgs
```

Filter alignments.

```
sbatch dDocentHPC_dev2.sbatch fltrBAM config.6.lcwgs
```
