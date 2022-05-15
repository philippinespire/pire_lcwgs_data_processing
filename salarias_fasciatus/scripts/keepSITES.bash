#!/bin/bash -l

# accept *.geno.gz file created by `angsd -doGeno 3` 
# and return a list of sites with at least 20 individuals in each pop sample

inFILE=$1 # test03.geno.gz
outFILE=$2  # mkBGL/test03.minIndPerPop20.sites

zcat $inFILE | \
sed -e 's/\t0\t/\t1\t/g' -e 's/\t0\t/\t1\t/g' | \
sed -e 's/\t\-1\t/\t0\t/g' -e 's/\t\-1\t/\t0\t/g' | \
sed -e 's/\t2\t/\t1\t/g' -e 's/\t2\t/\t1\t/g' | \
awk '{ for(i=4+1; i<=4+32; i++) {pop1_n+=$i}; for(j=4+1+32; j<=4+81; j++) {pop2_n+=$j}; print $1,$2,pop1_n,pop2_n;pop1_n="";pop2_n=""}' | \
awk '{if (($3 >= 20) && ($4 >=20)) {print $1,$2}}' > $outFILE
