# *Chromis viridis* lcWGS, test lane
### Kevin Labrador
#

## 1. Pre-processing


This follows the instructions from [pire_fq_gz_processing](https://github.com/philippinespire/pire_fq_gz_processing/blob/main/README.md).


<details>
        <summary>0. Set up directory</summary>

Run by klabrador on 2023-04-28

- Go to PIRE lcwgs directory on Wahab and create the appropriate subdirectory for the species.

```bash
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing
mkdir -p chromis_viridis/1st_sequencing_run/
```

- Go to the assigned working directory and create the following subdirs:

```bash
mkdir fq_raw fq_fp1 fq_fp1_clmp fq_fp1_clmp_fp2 fq_fp1_clmp_fp2_fqscrn fq_fp1_clmp_fp2_fqscrn_rprd
```

</details>


<details>
        <summary>1. Download data from TAMUCC grid</summary>

Run by klabrador on 2023-04-28

- dataset location @ https://gridftp.tamucc.edu/genomics/20230425_PIRE-Cvi-lcwgs-testlane/

```bash
sbatch /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/gridDownloader.sh . https://gridftp.tamucc.edu/genomics/20230425_PIRE-Cvi-lcwgs-testlane/
```

</details>


</details>


<details>
        <summary>2. Proofread the decode file(s)</summary>

Run by klabrador on 2023-04-28

- No. of samples = 104
- All files look good.


</details>


<details>
        <summary>3. Edit the decode file</summary>

Run by klabrador on 2023-04-28

- No need to edit the decode file.


</details>



<details>
        <summary>4. Make a copy of the `fq_raw` files prior to renaming </summary>

Run by klabrador on 2023-04-28

```
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/chromis_viridis/1st_sequencing_run
mkdir /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/chromis_viridis/1st_sequencing_run/fq_raw

# on wahab replace <yourPireDirPath> with /home/e1garcia/shotgun_PIRE
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/chromis_viridis/1st_sequencing_run/fq_raw
screen cp ./* /RC/group/rc_carpenterlab_ngs/shotgun_PIRE/pire_lcwgs_data_processing/chromis_viridis/fq_raw 

# `ctrl-a`  and then `d` to detach from the `screen` terminal

# look at your screen jobs running
screen -ls
```

</details>


<details>
        <summary>5. Perform a renaming dry run</summary>

Run by klabrador on 2023-04-28

```
cd /home/e1garcia/shotgun_PIRE/pire_lcwgs_data_processing/chromis_viridis/1st_sequencing_run/fq_raw

salloc
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Cvi_LCWGS-TestLane_SequenceNameDecode.tsv
```
- Looks good.

</details>


<details>
        <summary>6. Rename the files for real</summary>

Run by klabrador on 2023-04-28

```
bash /home/e1garcia/shotgun_PIRE/pire_fq_gz_processing/renameFQGZ.bash Cvi_LCWGS-TestLane_SequenceNameDecode.tsv rename
```




