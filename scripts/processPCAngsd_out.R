## Tsang modified from http://www.popgen.dk/software/index.php/PCAngsdTutorial

#### INITIALIZE ####
#setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(RcppCNPy) # Numpy library for R

#### READ IN ARGUMENTS FROM COMMAND LINE ####
args = commandArgs(trailingOnly=TRUE)
# inFILECov="../salarias_fasciatus/PCAngsd/out_PCAgsd.cov"
# inFILEsel="../salarias_fasciatus/PCAngsd/out_PCAgsd.selection.npy"
# inFILEmaf="../salarias_fasciatus/PCAngsd/out_PCAgsd.maf.npy"
# popMAP="../salarias_fasciatus/fltrBAM/popmap_sfa.tsv"
#sites="../data/sites"
inFILECov=args[1]
inFILEsel=args[2]
inFILEmaf=args[3]
popMAP=args[4]
sites=args[5]

#### Cov plot ####
cov <- as.matrix(read.table(inFILECov))
e <- eigen(cov)
ID <- read.table(popMAP,
                 head=T)
#setting color
col_pop <- recode(ID$POP,
                  `Sfa-ABas`="red",
                  `Sfa-CBas`="black")

#Plotting
pdf("PCAngsd_BOS_Cov_PC1.2.3.pdf")
PC1 <- 100*e$values[1]/sum(e$values)
PC2 <- 100*e$values[2]/sum(e$values)
PC3 <- 100*e$values[3]/sum(e$values)

#PC1.2
plot(e$vectors[,1:2],pch=20, col=col_pop,cex=1.6, xlab=paste("PC-1 (",round(PC1,2),sep = " ","%)"), ylab=paste("PC-2 (",round(PC2,2),sep = " ","%)"))
text(e$vectors[,1:2],ID$INDV, cex=0.5, pos=3)
legend("topleft",legend=c("Sfa-ABas","Sfa-CBas"),col=c("red","black"),pch=20, cex=1)

#PC2.3
plot(e$vectors[,2:3],pch=20, col=col_pop,cex=1.6, xlab=paste("PC-2 (",round(PC2,2),sep = " ","%)"), ylab=paste("PC-3 (",round(PC3,2),sep = " ","%)"))
text(e$vectors[,2:3],ID$INDV, cex=0.5, pos=3)
legend("topleft",legend=c("Sfa-ABas","Sfa-CBas"),col=c("red","black"),pch=20, cex=1)

#PC1.3
plot(e$vectors[,c(1,3)],pch=20, col=col_pop,cex=1.6, xlab=paste("PC-1 (",round(PC1,2),sep = " ","%)"), ylab=paste("PC-3 (",round(PC3,2),sep = " ","%)"))
text(e$vectors[,c(1,3)],ID$INDV, cex=0.5, pos=3)
legend("topleft",legend=c("Sfa-ABas","Sfa-CBas"),col=c("red","black"),pch=20, cex=1)
dev.off()

################################

## function for QQplot
qqchi<-function(x,...){
lambda<-round(median(x)/qchisq(0.5,1),2)
  qqplot(qchisq((1:length(x)-0.5)/(length(x)),1),x,ylab="Observed",xlab="Expected",...);abline(0,1,col=2,lwd=2)
legend("topleft",paste("lambda=",lambda))
}

### read in seleciton statistics (chi2 distributed)
s<-npyLoad(inFILEsel)
s_maf<-npyLoad(inFILEmaf)
## make QQ plot to QC the test statistics
pdf("qqplots_s.maf.pdf")
qqchi(s[,2])
qqchi(s_maf)
dev.off()
# convert test statistic to p-value
pval<-1-pchisq(s[,2],1)
pval.maf<-1-pchisq(s_maf,1)
## read positions 
p<-read.table(sites,colC=c("factor","integer"))
names(p)<-c("chr","pos")
## make manhatten plot
pdf("manhatten_plot_from_PCAngsd_BOS_filtered.selection.pdf")
plot(-log10(pval),col=p$chr,xlab="Chromosomes",main="Manhattan plot selection")
dev.off()
pdf("manhatten_plot_from_PCAngsd_BOS_filtered.maf.pdf")
plot(-log10(pval.maf),col=p$chr,xlab="Chromosomes",main="Manhattan plot maf")
dev.off()
