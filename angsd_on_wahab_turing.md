I built everything you asked for except for IBSrelate, it is not so much as a package. It's two R function, it’s best if you keep it with your R code,  I feel it's a bit weird set them in R_LIBS_USERS or R_LIBS_SITE.

To use this package, please load module with command:

enable_lmod
module load container_nev ngsTools

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
