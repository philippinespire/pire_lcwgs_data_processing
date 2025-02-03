#!/bin/bash 

#script for merging bam files from individuals sequenced over 2 runs 
#assumes: 
#file structure – 2 folders (1st_sequencing_run/mkBAM and 2nd_sequencing_run) in species cssl directory 
#individual names are 1st 12 characters in bam filenames 
#example: bash runmerge_2runs_cssl_array.bash /home/e1garcia/shotgun_PIRE/pire_cssl_data_processing/gazza_minuta Gmi

speciesdir=$1 
speciescode=$2 

mkdir -p ${speciesdir}/mergebams_run1run2_GenErode_historical_rescaled

ls -1 ${speciesdir}/1st_sequencing_run/GenErode_*/results/historical/mapping/*/${speciescode}*.merged.rmdup.merged.realn.rescaled.bam | xargs -n1 basename | cut -c 1-10 > ${speciesdir}/mergebams_run1run2_GenErode_historical_rescaled/1strun_samps 
ls -1 ${speciesdir}/2nd_sequencing_run/GenErode_*/results/historical/mapping/*/${speciescode}*.merged.rmdup.merged.realn.rescaled.bam | xargs -n1 basename | cut -c 1-10 > ${speciesdir}/mergebams_run1run2_GenErode_historical_rescaled/2ndrun_samps 

comm -1 -2 ${speciesdir}/mergebams_run1run2_GenErode_historical_rescaled/1strun_samps ${speciesdir}/mergebams_run1run2_GenErode_historical_rescaled/2ndrun_samps > ${speciesdir}/mergebams_run1run2_GenErode_historical_rescaled/run1run2_samps.txt 
comm -2 -3 ${speciesdir}/mergebams_run1run2_GenErode_historical_rescaled/1strun_samps ${speciesdir}/mergebams_run1run2_GenErode_historical_rescaled/2ndrun_samps > ${speciesdir}/mergebams_run1run2_GenErode_historical_rescaled/run1only_samps.txt 
comm -1 -3 ${speciesdir}/mergebams_run1run2_GenErode_historical_rescaled/1strun_samps ${speciesdir}/mergebams_run1run2_GenErode_historical_rescaled/2ndrun_samps > ${speciesdir}/mergebams_run1run2_GenErode_historical_rescaled/run2only_samps.txt 

SCRIPTPATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) 

samps2merge=$( cat ${speciesdir}/mergebams_run1run2_GenErode_historical_rescaled/run1run2_samps.txt )
samps2merge=($samps2merge) 

sbatch --array=0-$((${#samps2merge[@]}-1)) $SCRIPTPATH/runmerge_2runs_GenErode_array_historical_rescaled.sbatch ${speciesdir} 
