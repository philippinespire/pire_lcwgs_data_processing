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

Results:
* lots of variation in read numbers (<1M to >200M)
* duplication generally not too bad, up to ~30%
* one red flag for GC content, some yellow flags and a secondary peak around 65% GC, but most don't look too bad
* adapter content flagged for all but this should be fixed later

First trim.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1 
```

Results:
* much lower duplication overall
* GC content lower - contemporary higher than Albatross on avg!
* high % adapter-trimmed reads in Albatross, but most (usually >90%) passed filter

Clumpify.

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1 fq_fp1_clmp /scratch/breid 40
```

Still had jobs that had errors and weren't terminating (even though checkClumpify script reported no errors). Running the files that failed a second time.

```
mkdir fq_fp1_clumprpt
cp fq_fp1/Goy-APnd_033-Ex1-5A-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt
cp fq_fp1/Goy-APnd_037-Ex1-5E-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt
cp fq_fp1/Goy-APnd_048-Ex1-6H-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt
cp fq_fp1/Goy-CPnd_008-Ex1-4B-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt
cp fq_fp1/Goy-CPnd_071-Ex1-3E-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt

rm fq_fp1_clmp/Goy-APnd_033*
rm fq_fp1_clmp/Goy-APnd_037*
rm fq_fp1_clmp/Goy-APnd_088*
rm fq_fp1_clmp/Goy-CPnd_008*
rm fq_fp1_clmp/Goy-CPnd_071*

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1_clumprpt fq_fp1_clmp /scratch/breid 40
```

Repeat one more where the job did not terminate.

```
mkdir fq_fp1_clumprpt2
cp fq_fp1_clumprpt/Goy-APnd_037-Ex1-5E-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2

rm fq_fp1_clmp/Goy-APnd_037*

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1_clumprpt2 fq_fp1_clmp /scratch/breid 40
```

Repeat more that had different errors.

```
mkdir fq_fp1_clumprpt2
cp fq_fp1/Goy-APnd_006-Ex1-1F-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2
cp fq_fp1/Goy-APnd_011-Ex1-2C-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2
cp fq_fp1/Goy-APnd_012-Ex1-2D-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2
cp fq_fp1/Goy-APnd_016-Ex1-2H-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2
cp fq_fp1/Goy-APnd_017-Ex1-3A-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2
cp fq_fp1/Goy-APnd_030-Ex1-4F-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2
cp fq_fp1/Goy-APnd_035-Ex1-5C-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2
cp fq_fp1/Goy-APnd_046-Ex1-6F-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2
cp fq_fp1/Goy-APnd_048-Ex1-6H-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2
cp fq_fp1/Goy-CPnd_053-Ex1-2E-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2
cp fq_fp1/Goy-CPnd_068-Ex1-2E-lcwgs-1-2.r*.fq.gz fq_fp1_clumprpt2

rm fq_fp1_clmp/Goy-APnd_006*
rm fq_fp1_clmp/Goy-APnd_011*
rm fq_fp1_clmp/Goy-APnd_012*
rm fq_fp1_clmp/Goy-APnd_016*
rm fq_fp1_clmp/Goy-APnd_017*
rm fq_fp1_clmp/Goy-APnd_030*
rm fq_fp1_clmp/Goy-APnd_035*
rm fq_fp1_clmp/Goy-APnd_046*
rm fq_fp1_clmp/Goy-APnd_048*

rm fq_fp1_clmp/Goy-CPnd_053*
rm fq_fp1_clmp/Goy-CPnd_068*

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runCLUMPIFY_r1r2_array.bash fq_fp1_clumprpt fq_fp1_clmp /scratch/breid 40
```

All look good now!

Second trim.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFASTP_2.sbatch fq_fp1_clmp fq_fp1_clmp_fp2 33
```

Summary:
* Duplication mostly <2% now, only two individuals >5%
* GC content is on average higher for contemporary individuals (Albatross mostly ~40-42%, contemp 43-44%)
* Longer inserts for contemp.
* Looking pretty good otherwise (>99% PF, almost all <2% adapter).

Decontaminate/FQSCRN.

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn 20
```

Some errors, looks like especially with large files. Trying one of these individually:

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn 2 "Goy-APnd_004*.fq.gz"
```

Outputting to scratch:

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash fq_fp1_clmp_fp2 /scratch/breid/gerres_2ndrun/fq_fp1_clmp_fp2_fqscrn 2 "Goy-APnd_004*.fq.gz"
```

Making a list and rerunning with output to scratch as per Chris Bird's latest instructions.

```
grep 'No reads in' logs/slurm-fqscrn.2119221*out | sed -e 's/^.*No reads in //' -e 's/, skipping.*$//' > fqscrn_files_to_rerun_noreads.txt

bash

indir="fq_fp1_clmp_fp2"
outdir="/scratch/breid/fq_fp1_clmp_fp2_fqscrn_goy"
nodes=1
rerun_file=fqscrn_files_to_rerun_noreads.txt

while read -r fqfile; do
  sbatch --wrap="bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash $indir $outdir $nodes $fqfile"
done < $rerun_file
```

One file did not finish!

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runFQSCRN_6.bash "fq_fp1_clmp_fp2" "/scratch/breid/fq_fp1_clmp_fp2_fqscrn_goy" 1 Goy-CPnd_027-Ex1-2H-lcwgs-1-2.clmp.fp2_r1.fq.gz 
```

Run MultiQC.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/runMULTIQC.sbatch fq_fp1_clmp_fp2_fqscrn fastq_screen_report
```

Summary:
* All libraries mostly no-hit (>90%).
* Multiple genomes mostly ~2%, up to ~8%
* ~ 0.6-0.8% protist content for most libraries
* A few libraries with 2-3% bacteria
* Human < 0.5%
* All other categories 0-0.1%

Re-pair.

```
sbatch /home/e1garcia/pire_fq_gz_processing/runREPAIR.sbatch fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd 40

```

Final MultiQC.

```
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "./fq_fp1_clmp_fp2_fqscrn_rprd" "fqc_rprd_report" "fq.gz"
```

Summary:
* Generally very low duplication, some up to 9%.
* Length distribution for Albatross smaller (74-111) than contemp (109-140).
* Still higher GC content for contemp than Albatross. But distributions look OK.
