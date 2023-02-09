#!/bin/bash

#set dummy vars

MAPPING_MIN_QUALITY=30
SAMTOOLS_VIEW_F=4
SAMTOOLS_VIEW_f2=0
SAMTOOLS_VIEW_Fcustom=0
SAMTOOLS_VIEW_fcustom=0

FILTER_MIN_AS=50
FILTER_MIN_AS_LEN=100

SOFT_CLIP_CUT=no
FILTER_ORPHANS=no

NUMProc=4

filterSamFLAGS(){
        local INFILE=$1
        local MAPPING_MIN_QUALITY=$2
        local SAMTOOLS_VIEW_F=$3
        local SAMTOOLS_VIEW_f2=$4
        local SAMTOOLS_VIEW_Fcustom=$5
        local SAMTOOLS_VIEW_fcustom=$6

        # echo  $INFILE $MAPPING_MIN_QUALITY $SAMTOOLS_VIEW_F $SAMTOOLS_VIEW_f2 $SAMTOOLS_VIEW_Fcustom $SAMTOOLS_VIEW_fcustom

        #Filter 1: remove reads based on samtools flags
        #echo "";echo "  "`date` " Applying Filter 1: removing paired reads mapping to different contigs, secondary, and supplementary alignments..."

        #MAPPING_MIN_QUALITY=1
        #SAMTOOLS_VIEW_F=0
        #SAMTOOLS_VIEW_f2=0
        #SAMTOOLS_VIEW_Fcustom=0
        #SAMTOOLS_VIEW_fcustom=1
        filterMapQUAL="-q $MAPPING_MIN_QUALITY"
        filterSamFLAGS="-F $SAMTOOLS_VIEW_F -f $SAMTOOLS_VIEW_f2"
        filterCustomSamFLAGS="-F $SAMTOOLS_VIEW_Fcustom -f $SAMTOOLS_VIEW_fcustom"
        #echo " ";echo "          samtools view -h1 $filterMapQUAL $filterSamFLAGS $filterCustomSamFLAGS"
        # samtools view -h $filterMapQUAL $filterSamFLAGS $filterCustomSamFLAGS reads3.test.basic-RAW.bam | less -S
        # ls *$CUTOFFS-RAW.bam | sed 's/\-RAW.bam//g' | parallel --no-notice -j $NUMProc "samtools view -h1 $filterMapQUAL $filterSamFLAGS $filterCustomSamFLAGS {}-RAW.bam "
        samtools view -h $filterMapQUAL $filterSamFLAGS $filterCustomSamFLAGS $INFILE 2>/dev/null
}
export -f filterSamFLAGS

filterAS(){
        local FILTER_MIN_AS=$1
        local FILTER_MIN_AS_LEN=$2

        # Filter 2: remove reads based on alignment score relative to read length
        # echo "";echo "  "`date` " Applying Filter 2: removing reads with low alignment score relative to read length..."

        # filter bam files by alignment score with respect to read length
        # should be run after other filters
        awk -v as_threshold="$FILTER_MIN_AS" -v as_length="$FILTER_MIN_AS_LEN" '
          BEGIN { FS="\t"; OFS="\t" }  # Set the field separator and output field separator
          /^@/ { print }  # Print header lines
          {
                # Extract the read name and read length
                read_name = $1
                #read_length = length($10)

                # Extract the read length from CIGAR so that hard clipping cant make a read appear shorter than it is to the filter
                read_length = 0
                n = split($6,a,"[MIDNSHP=X]");
                for(i=1; i <= n; i++) {
                        if(a[i]~/[0-9]+/) {
                                read_length += a[i];
                        }
                }

                # Search for the AS field and extract the alignment score
                alignment_score = 0
                for (i = 2; i <= NF; i++) {
                  if (match($i, "AS:i:")) {
                        n = split($i, a, ":")
                        alignment_score = a[n]
                        break
                  }
                }

                # Compute the threshold based on the read length
                threshold = as_threshold * read_length / as_length

                # Print the line if the alignment score is above the threshold
                if (alignment_score >= threshold) {
                  #print threshold, $0
                  print
                }
          }
        ' |
        # remove duplicate header lines
        awk '!seen[$0]++ == 1'
}
export -f filterAS

filterSoftClipTOTAL(){
        local SOFT_CLIP_CUT=$1

        # Filter 3: remove reads with too many soft clipped bases...
        # echo "";echo "  "`date` " Applying Filter 3: removing reads with too many soft clipped bases..."
        awk -v soft_clip_cut="$SOFT_CLIP_CUT" '
          {
                modified_cigar = $6;
                gsub(/[0-9]+[A-HJ-Z]/, "", modified_cigar);
                n = split(modified_cigar, C, /I/);
                soft_clip_total = 0;
                for (i = 1; i <= n; i++) {
                        soft_clip_total += C[i];
                }
                if (soft_clip_total <= soft_clip_cut) {
                  # print soft_clip_total, modified_cigar, $1, $2, $3, $4, $5, $6
                  print
                }
          }
        '
}
export -f filterSoftClipTOTAL

filterORPHANS(){
        awk '
                BEGIN {FS="\t"; OFS="\t"} # Set the field separator and output field separator
                {
                        if($1 ~ /^@/) {
                                print; next
                        } else {
                                c[$1]++;
                                l[$1,c[$1]]=$0
                        }
                } END {
                        for (i in c) {
                                if (c[i] > 1) {
                                        for (j = 1; j <= c[i]; j++) {
                                                print l[i,j]
                                        }
                                }
                        }
                }
        '
}
export -f filterORPHANS


FILTERBAM(){
        #Function for filtering BAM files
        parallel --record-env
        if [[ "$SOFT_CLIP_CUT" != "no" && "$FILTER_ORPHANS" != "no" ]]; then
                echo "";echo "  "`date` " Filtering bam files by Samtools Flags, Soft Clipped Bases, Alignment Scores relative to Read Length, and Orphans..."
                ls *$CUTOFFS-RAW.bam | \
                        sed 's/\-RAW.bam//g' | \
                        parallel --no-notice --env _ -j $NUMProc "filterSamFLAGS {}-RAW.bam $MAPPING_MIN_QUALITY $SAMTOOLS_VIEW_F $SAMTOOLS_VIEW_f2 $SAMTOOLS_VIEW_Fcustom $SAMTOOLS_VIEW_fcustom | filterAS $FILTER_MIN_AS $FILTER_MIN_AS_LEN | filterSoftClipTOTAL $SOFT_CLIP_CUT | filterORPHANS | samtools view -b -o {}-RG.bam "
        elif [[ "$SOFT_CLIP_CUT" == "no" && "$FILTER_ORPHANS" != "no" ]]; then
                echo "";echo "  "`date` " Filtering bam files by Samtools Flags, Alignment Scores relative to Read Length, and Orphans..."
                ls *$CUTOFFS-RAW.bam | \
                        sed 's/\-RAW.bam//g' | \
                        parallel --no-notice --env _ -j $NUMProc "filterSamFLAGS {}-RAW.bam $MAPPING_MIN_QUALITY $SAMTOOLS_VIEW_F $SAMTOOLS_VIEW_f2 $SAMTOOLS_VIEW_Fcustom $SAMTOOLS_VIEW_fcustom | filterAS $FILTER_MIN_AS $FILTER_MIN_AS_LEN | filterORPHANS | samtools view -b -o {}-RG.bam "
        elif [[ "$SOFT_CLIP_CUT" != "no" && "$FILTER_ORPHANS" == "no" ]]; then
                echo "";echo "  "`date` " Filtering bam files by Samtools Flags, Soft Clipped Bases, and Alignment Scores relative to Read Length..."
                ls *$CUTOFFS-RAW.bam | \
                        sed 's/\-RAW.bam//g' | \
                        parallel --no-notice --env _ -j $NUMProc "filterSamFLAGS {}-RAW.bam $MAPPING_MIN_QUALITY $SAMTOOLS_VIEW_F $SAMTOOLS_VIEW_f2 $SAMTOOLS_VIEW_Fcustom $SAMTOOLS_VIEW_fcustom | filterAS $FILTER_MIN_AS $FILTER_MIN_AS_LEN | filterSoftClipTOTAL $SOFT_CLIP_CUT | samtools view -b -o {}-RG.bam "
        elif [[ "$SOFT_CLIP_CUT" == "no" && "$FILTER_ORPHANS" == "no" ]]; then
                echo "";echo "  "`date` " Filtering bam files by Samtools Flags and Alignment Scores relative to Read Length..."
                ls *$CUTOFFS-RAW.bam | \
                        sed 's/\-RAW.bam//g' | \
                        parallel --no-notice --env _ -j $NUMProc "filterSamFLAGS {}-RAW.bam $MAPPING_MIN_QUALITY $SAMTOOLS_VIEW_F $SAMTOOLS_VIEW_f2 $SAMTOOLS_VIEW_Fcustom $SAMTOOLS_VIEW_fcustom | filterAS $FILTER_MIN_AS $FILTER_MIN_AS_LEN | samtools view -b -o {}-RG.bam "
        fi
        #Index the filtered bam files
        echo "";echo "  "`date` " Indexing the filtered BAM files..."
        ls *$CUTOFFS-RG.bam | parallel --no-notice -j $NUMProc "samtools index {}"
        echo "";echo "  "`date` " Filtering complete!"
}
