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

Results:
* lower duplication, still one Albatross and one Contemporary with high rates
* GC content much better!
* high proportion of adapter-trimmed reads for Albatross but large majority passed filter

Clumpify - ran into errors with original settings. May have run out of space on scratch - was also trying to run Abu and Goy simultaneously. Trying just Abu with 40 cores.

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/breid 40
```

Still had jobs that had errors and weren't terminating (even though checkClumpify script reported no errors). Running the files that failed a second time.

```
mkdir fq_fp1_clumprpt
cp fq_fp1/Abu-APnd_017-Ex1-6E-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt
cp fq_fp1/Abu-APnd_029-Ex1-8A-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt
cp fq_fp1/Abu-CPnd_038-Ex1-7B-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt
cp fq_fp1/Abu-CPnd_074-Ex1-6B-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt
cp fq_fp1/Abu-CPnd_085-Ex1-3E-lcwgs-1-2.r1.fq.gz fq_fp1_clumprpt

rm fq_fp1_clmp/Abu-APnd_017*
rm fq_fp1_clmp/Abu-APnd_029*
rm fq_fp1_clmp/Abu-CPnd_038*
rm fq_fp1_clmp/Abu-CPnd_074*
rm fq_fp1_clmp/Abu-CPnd_085*

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1_clumprpt fq_fp1_clmp /scratch/breid 40
```

Redoing a few with different errors.

```
mkdir fq_fp1_clumprpt2

cp fq_fp1/Abu-APnd_018-Ex1-6F-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2
cp fq_fp1/Abu-APnd_028-Ex1-7H-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2
cp fq_fp1/Abu-CPnd_053-Ex1-5G-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2
cp fq_fp1/Abu-CPnd_059-Ex1-6C-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2
cp fq_fp1/Abu-CPnd_060-Ex1-8C-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2

rm fq_fp1_clmp/Abu-APnd_018*
rm fq_fp1_clmp/Abu-APnd_028*
rm fq_fp1_clmp/Abu-CPnd_053*
rm fq_fp1_clmp/Abu-CPnd_059*
rm fq_fp1_clmp/Abu-CPnd_060*

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1_clumprpt2 fq_fp1_clmp /scratch/breid 40
```

All look good now!

Second trim.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_2.sbatch fq_fp1_clmp fq_fp1_clmp_fp2 33
```

Summary:
* Duplication mostly <2% now, but two individuals (APnd010 + CPnd085) >10% still.
* GC content is on average higher for contemporary individuals (Albatross mostly ~37-40%, contemp 43-46%), but decent amount of variation within those two categories.
* Longer inserts for contemp.
* Looking pretty good otherwise (>99% PF, almost all <2% adapter).

Decontaminate.

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn 20
```

Some failures - making a list and rerunning with output to scratch as per Chris Bird's latest instructions.

```
grep 'No reads in' logs/slurm-fqscrn.2119196*out | sed -e 's/^.*No reads in //' -e 's/, skipping.*$//' > fqscrn_files_to_rerun_noreads.txt

bash

indir="fq_fp1_clmp_fp2"
outdir="/scratch/breid/fq_fp1_clmp_fp2_fqscrn"
nodes=1
rerun_file=fqscrn_files_to_rerun_noreads.txt

while read -r fqfile; do
  sbatch --wrap="bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash $indir $outdir $nodes $fqfile"
done < $rerun_file
```

Worked!
Move the files produced from scratch back to main directory.

```
mv /scratch/breid/fq_fp1_clmp_fp2_fqscrn/* /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/ambassis_buruensis/2nd_sequencing_run/fq_fp1_clmp_fp2_fqscrn
```

Run MultiQC.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runMULTIQC.sbatch fq_fp1_clmp_fp2_fqscrn fastq_screen_report
```

Summary:
* Mostly no-hit (>83%)
* Generally higher protist + multiple genomes for contemp (protist ~1.5%, multiple 6-12%) than for Albatross (protist ~1%, multiple 3-6%).
* A few contemporaries with up to 4% bacterial, but mostly very low.
* All other categories < 0.5%.

Re-pair and MultiQC.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 40
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "./fq_fp1_clmp_fp2_fqscrn_rprd" "fqc_rprd_report" "fq.gz"

```

Summary:
* Shorter Albatross reads (86-114 bp) than contemporary (100-135 bp).
* Duplication generally low but can be >10% still.
* GC content lower on average for Albatross than contemp - still some flags for GC.
