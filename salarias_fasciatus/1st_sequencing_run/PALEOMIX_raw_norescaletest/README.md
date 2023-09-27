## running PALEOMIX on raw .fq.gz files for Sfa

Calculate heterozygosity with inidvidual safs:

```
bash calcsfs_notrescaled_array.bash "/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/PALEOMIX_raw_norescaletest/Sfa_lcWGS/Sfa/*" /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/PALEOMIX_raw_norescaletest/safs_notrescaled /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fasta
```

Calculate heterozygosity without transitions.

```
bash calcsfs_notrescaled_noTrans_array.bash "/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/PALEOMIX_raw_norescaletest/Sfa_lcWGS/Sfa/*" /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/PALEOMIX_raw_norescaletest/safs_notrescaled_noTrans /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fasta
```
