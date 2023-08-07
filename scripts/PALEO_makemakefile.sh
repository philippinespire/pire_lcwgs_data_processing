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

cut -d'	' -f2 ${DECODE} | cut -c 1-12 > indnames.txt

if [ $NRUNS = "one" ]
then
  sed 1d indnames.txt | while read ind; do
  echo "${ind}:"
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
  echo "${ind}:"
  echo "  ${ind}:"
  echo "    ${ind}_Lib1:"
  filename1=$(ls /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/fq_raw/*1.fq.gz | grep "${ind}" | sed 's/1.fq.gz/{Pair}.fq.gz/g')
  echo "      Lane_1: ${filename1}"
  echo "    ${ind}_Lib2:"
  filename2=$(ls /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/2nd_sequencing_run/fq_raw/*1.fq.gz | grep "${ind}" | sed 's/1.fq.gz/{Pair}.fq.gz/g')
  echo "      Lane_1: ${filename2}"
  echo -e "\n"
done >> makefile.yaml
fi

if [ $NRUNS = "three" ]
then
  sed 1d indnames.txt | while read ind; do
  echo "${ind}:"
  echo "  ${ind}:"
  echo "    ${ind}_Lib1:"
  filename1=$(ls /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/1st_sequencing_run/fq_raw/*1.fq.gz | grep "${ind}" | sed 's/1.fq.gz/{Pair}.fq.gz/g')
  echo "      Lane_1: ${filename1}"
  echo "    ${ind}_Lib2:"
  filename2=$(ls /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/2nd_sequencing_run/fq_raw/*1.fq.gz | grep "${ind}" | sed 's/1.fq.gz/{Pair}.fq.gz/g')
  echo "      Lane_1: ${filename2}"
  echo "    ${ind}_Lib3:"
  filename3=$(ls /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/salarias_fasciatus/3rd_sequencing_run/fq_raw/*1.fq.gz | grep "${ind}" | sed 's/1.fq.gz/{Pair}.fq.gz/g')
  echo "      Lane_1: ${filename3}"
  echo -e "\n"
done >> makefile.yaml
fi

