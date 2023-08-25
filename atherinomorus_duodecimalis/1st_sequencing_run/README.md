## 1. Download data
Data downloaded from TAMUCC grid.

## 2. Proofread the decode files
818 forward reads, 818 reverse reads, but 824 listed in decode file.

## 3. Edit the decode file
TBD

## 4. Make a copy of the fq_raw files
Copying with `screen`.

## 5. Perform a renaming dry run.
Some of the original file names make it difficult to run the rename script as is, so I copied the rename script and edited it to work with all the files.

<details><summary>Expand for output.</summary>

```bash
TBD
```
</p>
</details>

## 6. Rename the files for real
TBD

## 7. Check the quality of your data.
TBD

<details><summary>Expand for MultiQC Output.</summary>

```bash
TBD
```
</p>
</details>

## 8. First trim.
TBD

<details><summary>Expand for MultiQC Output.</summary>

```bash
TBD
```
</p>
</details>

## 9. Remove duplicates with clumpify.

### 9a. Remove duplicates.
TBD

### 9b. Check duplicate removal success.
TBD

### 9c. Generate metadata on deduplicated FASTQ files.
TBD

<details><summary>Expand for MultiQC Output.</summary>

```bash
TBD
```
  
</p>
</details>

## 10. Second trim.
TBD

<details><summary>Expand for MultiQC Output.</summary>

```bash
TBD
```

</p>
</details>

## 11. Decontaminate files.
TBD

<details><summary>Expand for MultiQC Output.</summary>

```bash
insert multiqc output here
```

</p>
</details>

## 12. Execute RePair
TBD

<details><summary>Expand for MultiQC Output.</summary>

```bash
TBD
```

</p>
</details>

## 14. Clean Up
TBD
