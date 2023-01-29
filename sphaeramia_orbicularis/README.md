# Sphaeramia orbicularis lcWGS 
### Kevin Labrador
#


##1. Pre-processing


This follows the instructions from [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing/blob/main/README.md).

<details>
	<summary>Housekeeping</summary>

1. Setup Computer 
	- Computer set-up following C.Bird's [instructions](https://github.com/kllabrador/TAMUCC_GCL_Bioinformatics/blob/main/ComputerSetUp.md)
  
2. Go to [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing/blob/main/README.md). Follow instructions.

3. Identify HPC being used: Wahab
  
4. Log-in to Wahab

```bash
ssh hpc-0289@wahab.hpc.odu.edu
# Refer to private notes for password
```
</details>


<details>
	<summary>Set up directory</summary>
	
- Go to E.Garcia's directory 
- All directories have already been prepared beforehand, so there is no need to create a personal subdirectory.

```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_orbicularis
```

- Go to the assigned working directories and create the following subdirs:
  
```bash
mkdir fq_fp1 fq_fp1_clmp fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd
```
</details>


<details>
	<summary>Download data from TAMUCC grid</summary>

> This was already done by E.Garcia.

</details>


<details>
	<summary>Proofread the decode file(s)</summary>

- Review the decode file

```bash
cd ./fq_raw
less *SequenceNameDecode.txt
```

>The naming convention for the decode file's Extraction_ID was not followed. Details are as follows:
>> whitespace within name (e.g., `Sor-Acan_049-Ex1-1E -lcwgs-1-T`)

> Is the dataset complete?
>> No, there is an excess of samples. It should be 221, not 223
>> There were sequences from an old sequencing run that were transferred that should not have been (S.Magnuson)

> Delete the following sequences from the fq_raw directory:
>> SoC0301809F
>> SoC0301809G
>> SoC0301809H

```
#!bin/bash

sequence_dir="/home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_orbicularis/fq_raw"
#seqID=("SoC0301809F" "SoC0301809G" "SoC0301809H") # This only records G and H, not F, which is weird.
seqID=("SoC0301809")
outfile="delete_seq.out"

for file in $(find $sequence_dir -name "*.fq.gz"); do
        for seqID in "${seqID[@]}"; do
                if [[ $file =~ $seqID ]]; then
                        echo "Deleting file: $file" >> $outfile
                        rm -i $file
                        break
                fi
        done
done

```

> Download "SoC0604808A" data  from TAMUCC grid

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_orbicularis/fq_raw

wget https://gridftp.tamucc.edu/genomics/20230123_PIRE-Sor-lcwgs-testlane/SoC0604808A_CKDL220033557-1A_HJFC3CCX2_L4_1.fq.gz
wget https://gridftp.tamucc.edu/genomics/20230123_PIRE-Sor-lcwgs-testlane/SoC0604808A_CKDL220033557-1A_HJFC3CCX2_L4_2.fq.gz
```

> Recheck dataset. There should be 221 samples.
>> Yes. There are 221 samples.

> Are there duplicate of libraries?
>> No	

</details>


<details>
	<summary>Edit the decode file</summary>

> Decode file was renamed (*original_deprecated.txt), and copy was then created (*fixed.txt) and edited as per naming convention.
>> Second underscore was changed into a dash
    
```
mv Sor_lcwgsTestLane_SequenceNameDecode.txt Sor_lcwgsTestLane_SequenceNameDecode_original_deprecated.txt
cp *deprecated.txt Sor_lcwgsTestLane_SequenceNameDecode_fixed.txt

sed "s/ \-/\-/" *fixed.txt

# Check if the naming error is fixed. If so,
sed -i "s/ \-\/\-/" *fixed.txt
```
</details>


<details>
	<summary>Make a copy for the fq_raw files prior to renaming.</summary>

```
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_orbicularis
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_orbicularis/fq_raw

cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_orbicularis/fq_raw
screen cp ./* /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_orbicularis/fq_raw

# `ctrl+A` and then `d` to detach from `screen` terminal

```

</details>


<details>
	<summary>Perform a renaming dry run</summary>

- Use the fixed decode file to rename the raw `fq.gz` files. Use the pre-written bash script for renaming.
  
```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_orbicularis/fq_raw
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Sor_lcwgsTestLane_SequenceNameDecode_fixed.txt
```

</details>


<details>
	<summary>Rename the files for real</summary>

```bash

bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash  Sor_lcwgsTestLane_SequenceNameDecode_fixed.txt rename
			
#you will need to say y 2X
```

</details>


<details>
	<summary> Check the quality of the data. Run `fastqc`</summary>

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_orbicularis>
sbatch --mail-user=klabrador@islander.tamucc.edu --mail-type=END /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/Multi_FASTQC.sh "fq_raw" "fqc_raw_report" "fq.gz"
```
> Job submitted
>> jobID: 1224222
>> jobFinished; Runtime = 

### MultiQC output

```
Potential Issues:
	* % duplication 
		* Alb: 16.50 - 28.20%
	* GC Content 
		* Alb: 46 - 47%
	* number of reads 
		* Alb: 18 - 31.7 M
```
> Ask Chris how to detect "potential issues".

</details>


<details>
	<summary>First trim</summary>

- Execute `runFASTP_1st_trim.sbatch`

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/sphaeramia_orbicularis

sbatch --mail-user=klabrador@islander.tamucc.edu --mail-type=END ../../pire_fq_gz_processing/runFASTP_1st_trim.sbatch fq_raw fq_fp1
```
> Job submitted
>> jobID: 1224228



</details>



