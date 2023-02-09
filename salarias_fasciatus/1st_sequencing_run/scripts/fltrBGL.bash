#!/bin/bash -l

bglFile=$1
sitesFile=$2
outFile=$(echo $bglFile | sed 's/\.beagle\.gz/_fltrd\.beagle/')

# comm <(gunzip $bglFile) $sitesFile | gzip > ${outFile}.gz

cat $sitesFile | tr -s " " "_" > ${sitesFile}.txt

zgrep -m1 -f ${sitesFile}.txt $bglFile | gzip > ${outFile}.gz
