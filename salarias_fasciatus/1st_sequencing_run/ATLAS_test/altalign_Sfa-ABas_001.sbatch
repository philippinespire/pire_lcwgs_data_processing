#!/bin/bash -l

#SBATCH --job-name=Sfa_altalign
#SBATCH -o Sfa_altalign-%j.out
#SBATCH --time=00:00:00
#SBATCH --cpus-per-task=1

enable_lmod
module load bwa
module load samtools
module load container_env atlas
export SINGULARITY_BIND=/home/e1garcia

bwa mem GCF_902148845.1_fSalaFa1.1_genomic.fa Sfa-ABas_001_Ex1_L3_clmp.fp2_repr.R1.fq.gz Sfa-ABas_001_Ex1_L3_clmp.fp2_repr.R2.fq.gz > Sfa-ABas_001_altalign.aln-pe.sam
samtools sort -n -o Sfa-ABas_001_altalign.sort.bam Sfa-ABas_001_altalign.aln-pe.sam
samtools view -f 0x2 -b Sfa-ABas_001_altalign.sort.bam > Sfa-ABas_001_altalign.sort.filt.bam
samtools fixmate -m Sfa-ABas_001_altalign.sort.filt.bam Sfa-ABas_001_altalign.fixmate.bam
samtools sort -o Sfa-ABas_001_altalign.positionsort.bam Sfa-ABas_001_altalign.fixmate.bam
samtools markdup -r Sfa-ABas_001_altalign.positionsort.bam Sfa-ABas_001_altalign.rmdup.bam
samtools index Sfa-ABas_001_altalign.rmdup.bam
