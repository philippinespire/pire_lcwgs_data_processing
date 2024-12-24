# currently throwing some errors related missing individuals in particular runs but producing a proper makefile
# to run use sh PALEO_makemakefile.sh [species lcwgs directory] [subdirectory within this to use for PALEOMIX processing/output] [species code] [absolute path to reference location] [absolute path to decode file with all individuals to use] [number of sequencing runs to process; currently "one", "two", or "three"]
# after makefile has been produced navigate to PALEODIR and run PALEOMIX sbatch script: sbatch home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/run_PALEOMIX.sbatch

SPDIR=$1
PALEODIR=$2
SPCODE=$3
REFLOC=$4
DECODE=$5
NRUNS=$6

mkdir -p ${SPDIR}/${PALEODIR}

cd ${SPDIR}/${PALEODIR}

cp /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/scripts/PALEO_makefile_template.yaml .
mv PALEO_makefile_template.yaml makefile.yaml

echo "  ${SPCODE}:" >> makefile.yaml
echo "    Path: ${REFLOC}" >> makefile.yaml
echo -e "\n" >> makefile.yaml

echo "${SPCODE}_lcWGS:" >> makefile.yaml

cut -d'	' -f2 ${DECODE} | cut -c 1-12 > indnames.txt

if [ $NRUNS = "one" ]
then
  sed 1d indnames.txt | while read ind; do
  echo "  ${ind}:"
  echo "    ${ind}_Lib1:"
  filename1=$(ls /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/fq_raw/*1.fq.gz | grep "${ind}" | sed 's/1.fq.gz/{Pair}.fq.gz/g')
  echo "      Lane_1: ${filename1}"
  echo -e "\n"
done >> makefile.yaml
fi

if [ $NRUNS = "two" ]
then
  sed 1d indnames.txt | while read ind; do
  echo "  ${ind}:"
  echo "    ${ind}_Lib1:"
  filename1=$(ls /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/fq_raw/*1.fq.gz | grep "${ind}" | sed 's/1.fq.gz/{Pair}.fq.gz/g')
  echo "      Lane_1: ${filename1}"
  filename2=$(ls /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/2nd_sequencing_run/fq_raw/*1.fq.gz | grep "${ind}" | sed 's/1.fq.gz/{Pair}.fq.gz/g')
  if [ $filename2 != "" ] 
  then 
    echo "    ${ind}_Lib2:"
    echo "      Lane_1: ${filename2}" 
  fi
  echo -e "\n"
done >> makefile.yaml
fi

if [ $NRUNS = "three" ]
then
  sed 1d indnames.txt | while read ind; do
  echo "  ${ind}:"
  echo "    ${ind}_Lib1:"
  filename1=$(ls /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/fq_raw/*1.fq.gz | grep "${ind}" | sed 's/1.fq.gz/{Pair}.fq.gz/g')
  echo "      Lane_1: ${filename1}"
  filename2=$(ls /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/2nd_sequencing_run/fq_raw/*1.fq.gz | grep "${ind}" | sed 's/1.fq.gz/{Pair}.fq.gz/g')
  if [ $filename2 != "" ] 
  then 
    echo "    ${ind}_Lib2:"
    echo "      Lane_1: ${filename2}" 
  fi
  filename3=$(ls /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/3rd_sequencing_run/fq_raw/*1.fq.gz | grep "${ind}" | sed 's/1.fq.gz/{Pair}.fq.gz/g')
  if [ $filename3 != "" ]
  then
    echo "    ${ind}_Lib3:"
    echo "      Lane_1: ${filename3}"
  fi
  echo -e "\n"
done >> makefile.yaml
fi

