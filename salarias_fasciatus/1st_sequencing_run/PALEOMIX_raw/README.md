## running PALEOMIX on raw .fq.gz files for Sfa

Making a makefile.yaml:

```
sh PALEO_makemakefile.sh /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_faciatus 1st_sequencing_run/PALEOMIX_raw Sfa /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_faciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fasta /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_faciatus/1st_sequencing_run/fq_raw/Sfa_LCWGS_SequenceNameDecode.tsv one
```

Run PALEOMIX:

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_faciatus/1st_sequencing_run/PALEOMIX_raw/
sbatch /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/runPALEOMIX.sbatch
```

Check outputs - several node errors, seems like these caused failure for a few individuals (ABas_035, CBas_032, CBas_042, CBas_061).

Gonna move these to a separate folder.

```
mkdir failed
mv Sfa_lcWGS/Sfa/Sfa-ABas_035 failed
mv Sfa_lcWGS/Sfa/Sfa-CBas_032 failed
mv Sfa_lcWGS/Sfa/Sfa-CBas_042 failed
mv Sfa_lcWGS/Sfa/Sfa-CBas_061 failed
```

Calculate heterozygosity with inidvidual safs:

```
bash calcsfs_rescaled_array.bash "/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/PALEOMIX_raw/Sfa_lcWGS/Sfa/*" /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/PALEOMIX_raw/safs_rescaled /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fasta
```

Calculate heterozygosity without transitions.

```
bash calcsfs_rescaled_noTrans_array.bash "/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/PALEOMIX_raw/Sfa_lcWGS/Sfa/*" /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/PALEOMIX_raw/safs_rescaled_noTrans /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fasta
```
