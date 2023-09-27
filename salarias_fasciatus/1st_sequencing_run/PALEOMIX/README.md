## trying a PALEOMIX analysis

After making makefile.yaml by hand (a better method now exists - see scripts/PALEOMIX_makemakefile.sh) run PALEOMIX using:

```
runPALEOMIX.sbatch
```

Making lists of raw and rescaled .bam files
```
ls *ABas_*.bam > Sfa_Albatross_bamlist
ls *CBas_*.bam > Sfa_contemporary_bamlist
ls Sfa-ABas_*/fSalaFa/*/*rescaled.bam > Sfa_Albatross_rescaled_bamlist
ls Sfa-CBas_*/fSalaFa/*/*rescaled.bam > Sfa_contemporary_rescaled_bamlist
```

try to get heterozygosity:

```
salloc
enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

crun angsd -i Sfa-ABas_001.fSalaFa.bam -anc /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fasta -dosaf 1 -fold 1

crun.ngstools realSFS angsdput.saf.idx >est.ml

#in R
a<-scan("est.ml")
a[2]/sum(a)
```

an Albatross sample

```
salloc
enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

crun angsd -i Sfa-ABas_001/fSalaFa/Sfa-ABas_001/Sfa-ABas_001_Lib1.rescaled.bam -anc /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fasta -dosaf 1 -gl 1 -out Sfa-ABas_001_rescaled

crun realSFS Sfa-ABas_001_rescaled.saf.idx > Sfa-ABas_001_rescaled.ml

#in R
a<-scan("est.ml")
a[2]/sum(a)
```

output is same as previous! Maybe use the other file?

```
salloc
enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

crun angsd -i Sfa-ABas_001/fSalaFa/Sfa-ABas_001/Sfa-ABas_001_Lib1.rmdup.normal.bam -anc /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fasta -dosaf 1 -gl 1 -out Sfa-ABas_001_normal

crun realSFS Sfa-ABas_001_normal.saf.idx > Sfa-ABas_001_normal.ml

#in R
a<-scan("est.ml")
a[2]
```

Normal is empty!
Trying the previously made .bam

```
crun angsd -i /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/mkBAM/Sfa-ABas_001_Ex1_L3_clmp.fp2_repr_fltrd.bam -anc /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fasta -dosaf 1 -gl 1 -out Sfa-ABas_001_mkBAM

crun realSFS Sfa-ABas_001_mkBAM.saf.idx > Sfa-ABas_001_mkBAM.ml
```

Contempo samplo.

```
crun angsd -i Sfa-CBas_001/fSalaFa/Sfa-CBas_001/Sfa-CBas_001_Lib1.rescaled.bam -anc /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fasta -dosaf 1 -gl 1 -out Sfa-CBas_001_rescaled

crun realSFS Sfa-CBas_001_rescaled.saf.idx > Sfa-CBas_001_rescaled.ml
```

Looks like Albatross maybe still higher. Try no transversions version...

```
crun angsd -i Sfa-ABas_001/fSalaFa/Sfa-ABas_001/Sfa-ABas_001_Lib1.rescaled.bam -anc /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fasta -dosaf 1 -gl 1 -noTrans 1 -out Sfa-ABas_001_rescaled_noTrans

crun realSFS Sfa-ABas_001_rescaled_noTrans.saf.idx > Sfa-ABas_001_rescaled_noTrans.ml

crun angsd -i Sfa-CBas_001/fSalaFa/Sfa-CBas_001/Sfa-CBas_001_Lib1.rescaled.bam -anc /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/refGenome/GCF_902148845.1_fSalaFa1.1_chr1-23-mtgen.fasta -dosaf 1 -gl 1 -noTrans 1 -out Sfa-CBas_001_rescaled_noTrans

crun realSFS Sfa-CBas_001_rescaled_noTrans.saf.idx > Sfa-CBas_001_rescaled_noTrans.ml

```

Make some BGLs for PCANGSD!

```
ls *.bam > Sfa_PALEO_bamlist

## script: Sfa_PALEO_mkBGL.sbatch

#!/bin/bash
#SBATCH --job-name=mkBGL
#SBATCH -o mkBGL-%j.out
#SBATCH -e mkBGL-%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

crun angsd -gl 1 -nThreads 10 -doGlf 2 -doMajorMinor 1 -SNP_pval 1e-6 -doMaf 1 -bam Sfa_PALEO_bamlist -out Sfa_PALEO_genolike

## script: Sfa_PALEO_mkBGL_noTrans.sbatch

#!/bin/bash
#SBATCH --job-name=mkBGL
#SBATCH -o mkBGL-%j.out
#SBATCH -e mkBGL-%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task 40

enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

crun angsd -gl 1 -nThreads 10 -doGlf 2 -doMajorMinor 1 -SNP_pval 1e-6 -doMaf 1 -noTrans 1 -bam Sfa_PALEO_bamlist -out Sfa_PALEO_genolike_noTrans

```

ok also: try an array script that gets sfs for each individual for heterozygosity!

```

#### calcsfs_array.bash

#!/bin/bash

export SINGULARITY_BIND=/home/e1garcia

nodes=$4

BAMPATTERN=*.bam
INDIR=$1
OUTDIR=$2
REF=$3

SCRIPTPATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

all_samples=$(ls ${INDIR}/${BAMPATTERN} | sed -e 's/\.bam//' -e 's/.*\///g')
all_samples=($all_samples)

sbatch --array=0-$((${#all_samples[@]}-1))%${nodes} $SCRIPTPATH/calcsfs_array.sbatch ${INDIR} ${OUTDIR} ${REF}

#### calcsfs_array.sbatch

#!/bin/bash -l

#SBATCH --job-name=calcsfs
#SBATCH -o calcsfs-%j.out 
#SBATCH -p main 
#SBATCH -n 1  
#SBATCH -N 1  
#SBATCH --cpus-per-task=40 

enable_lmod
module load container_env ngsTools
export SINGULARITY_BIND=/home/e1garcia

INDIR=$1
OUTDIR=$2
REF=$3

mkdir -p ${OUTDIR}

cd ${OUTDIR}

BAMPATTERN=*.bam

all_samples=$(ls ${INDIR}/${BAMPATTERN} | sed -e 's/\.bam//' -e 's/.*\///g')
all_samples=($all_samples)

sample_name=${all_samples[${SLURM_ARRAY_TASK_ID}]}
echo ${sample_name}

crun angsd -i ${INDIR}/${sample_name}.bam -anc ${REF} -dosaf 1 -gl 1 -out ${sample_name}_rescaled

crun realSFS ${sample_name}_rescaled.saf.idx > ${sample_name}.ml

```
