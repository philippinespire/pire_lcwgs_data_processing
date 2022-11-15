I built everything you asked for except for IBSrelate, it is not so much as a package. It's two R function, it’s best if you keep it with your R code,  I feel it's a bit weird set them in R_LIBS_USERS or R_LIBS_SITE.

To use this package, please load module with command:

```bash
enable_lmod
module load container_env ngsTools
```

And as usual, run command with "crun" prepend to it, for example:

                crun angsd
crun fastNGSadmix

There are a lot of R script within these packages, so if you see the document call for something like:

                Rscript xxxxx/script.R

You can try:

                crun script.R

Without Rscript and the path led to the script, directly use crun script_name.R should work for most of them. If you cannot find anything, please let me know.

I installed all dependencies that I can see for R, python, and Perl, however, there are just too many of them, so again let me know if anything is missing. 

Min

---

No problem, I added angsd 0.937. This new one is installed in /opt/angsd, while I kept the original one in /opt/ngsTools/angsd. The new angsd will be picked when you run "angsd" command by default.

Although I think it is very unlikely, ngsTools indeed called for that 0.929 version, so in case it breaks you can still explicitly call the 0.929 by using a full path:

    crun /opt/ngsTools/angsd/angsd


Please give it a try.

Best,
Min Dong

---

Hi Dr. Bird, Jordan,

Ok, all 4 packages you mentioned are already installed last time, you can launch them with following commands:

      enable_lmod
module load container_env ngsTools

      crun NGSadmix
      crun realSFS
      crun ngsLD
      crun ngsRelate

pcangsd is also installed into ngsTools module, so no per user installation needed, here is how to launch it:

      enable_lmod
module load container_env ngsTools

      crun pcangsd -b $input \
        --threads 40 \
        --out $outdir \
        --selection \
        --pcadapt \
        --maf_save

The command seems to be working correctly:

PCAngsd v.1.10.
Jonas Meisner and Anders Albrechtsen.
Using 40 thread(s).
…
Saved covariance matrix as ./out_PCAgsd.cov (Text).

Performing selection scan (FastPCA) for 1 PCs.
Saved test statistics as ./out_PCAgsd.selection.npy (Binary).

Performing selection scan (pcadapt) using 1 PCs.
Saved z-scores as ./out_PCAgsd.pcadapt.zscores.npy (Binary).
Use provided script for obtaining p-values (pcadapt.R).

Saved minor allele frequencies as ./out_PCAgsd.maf.npy (Binary)

I have updated your job script, please give it a try.

