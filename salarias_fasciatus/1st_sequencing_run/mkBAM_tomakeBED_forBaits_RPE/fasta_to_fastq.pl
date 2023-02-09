## Eric Garcia's Notes
## I am trying to calculate the coverage for the bait regions. 
##
## For this, I need a bed file for the baits but since Sde was one of the first species to be processed with probes, arborbio did not send us a bed file.
##
## I am generating one:
## 1. found the bait sequences, Bird_Final_Baits_GC_55-36_choosen_baits.fas
## 2. converting Bird_Final_Baits_GC_55-36_choosen_baits.fas to Sde_choosen_baits.fq with fasta_to_fastq.pl
##  (https://code.google.com/archive/p/fasta-to-fastq/)
##  (https://code.google.com/archive/p/fasta-to-fastq/downloads)
## Execute:
##  perl fasta_to_fastq.pl Bird_Final_Baits_GC_55-36_choosen_baits.fasta > Sde_choosen_baits.fq
## 3. compressing to get Sde_choosen_baits.fq.gz format, gzip Sde_choosen_baits.fq
## 4. creating mkBAM_tomake_baitBED , following dDocent mkBAM as usual


#Copyright (c) 2010 LUQMAN HAKIM BIN ABDUL HADI (csilhah@nus.edu.sg)
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files 
#(the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, 
#merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is 
#furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
#OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
#LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
#IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#!/usr/bin/perl
use strict;

my $file = $ARGV[0];
open FILE, $file;

my ($header, $sequence, $sequence_length, $sequence_quality);
while(<FILE>) {
        chomp $_;
        if ($_ =~ /^>(.+)/) {
                if($header ne "") {
                        print "\@".$header."\n";
                        print $sequence."\n";
                        print "+"."\n";
                        print $sequence_quality."\n";
                }
                $header = $1;
		$sequence = "";
		$sequence_length = "";
		$sequence_quality = "";
        }
	else { 
		$sequence .= $_;
		$sequence_length = length($_); 
		for(my $i=0; $i<$sequence_length; $i++) {$sequence_quality .= "I"} 
	}
}
close FILE;
print "\@".$header."\n";
print $sequence."\n";
print "+"."\n";
print $sequence_quality."\n";

