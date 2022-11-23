#This ErrBar graph maker  was adapted from the ANGSD manual to create bar plots for Error estimation ANGSD

#set working directory
#setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
setwd("~/Documents/PIRE Project/Salarias_fasciatus CSSL")
getwd()

#Read in data table 
Err <- as.numeric(read.table("out_Errtest.error.chunkunordered.csv", nrow=1))
DNA<-c("A","C","G","T")
names(Err) <- as.vector((sapply(1:4,function(x) paste(DNA[x],DNA,sep="->"))))
barplot(Err, main = "Salarias fasciatus CSSL", xlab = "Bases", ylab = "Error", cex.axis = 0.75, cex.names = 0.5)
