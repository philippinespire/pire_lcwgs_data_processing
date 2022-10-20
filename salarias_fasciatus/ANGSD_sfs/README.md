# Site Frequency Spectrum with ANGSD 

---

In population genetics, a Site Frequency Spectrum is a distribution of allele frequencies in a given set of loci. The shape of the allele frequency spectrum is sensitive to demography, such as population size changes, which is why we deemed this analysis worthwhile for *Salarias fasciatus*.

We used our mkBGL.sbatch script to create the mkSFS.sbatch script, where we added '-doSaf -1' to our TODO list. 
Here is the code we used to create the SFS:

```bash 
# done on USER@wahab.hpc.odu.edu
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus
# ANGSD outputs files to the mkSFS dir, so it may be usefiul to create this dir before running the script if you haven't already
mkdir mkSFS
# $1=fltrBAMdir $2=outPREFIX
sbatch scripts/mkSFS.sbatch fltrBAM Sfa-ABas-CBas_all_SFS
```
