#open R

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)

##Requires previous installation of the library RcppCNPy

library(RcppCNPy) # Numpy library for R

pop<-read.table("fltrBAM/popmap_sfa.tsv",
                header = TRUE)


q <- npyLoad("PCAngsd_admix/out_PCAngsd_admix.admix.3.F.npy") 

## order according to population
ord<-order(pop[,1])
barplot(t(q)[,ord],col=2:10,space=0,border=NA,xlab="Individuals",ylab="Admixture proportions")
text(tapply(1:nrow(pop),pop[ord,1],mean),-0.05,unique(pop[ord,1]),xpd=T)
abline(v=cumsum(sapply(unique(pop[ord,1]),function(x){sum(pop[ord,1]==x)})),col=1,lwd=1.2)

ggsave("./PCAngsd_admix.png", units = "in", height = 4, width = 6)
## close R
