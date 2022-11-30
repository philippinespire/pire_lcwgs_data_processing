#This ErrBar graph maker  was adapted from the ANGSD manual to create bar plots for Error estimation ANGSD

#set working directory
#setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
setwd("~/Documents/PIRE Project/Salarias_fasciatus LCWGS")
getwd()

#Read in data table 
AlbErr <- as.numeric(read.table("AlbErr.error.chunkunordered.csv", nrow=1))
DNA<-c("A","C","G","T")
names(AlbErr) <- as.vector((sapply(1:4,function(x) paste(DNA[x],DNA,sep="->"))))
barplot(AlbErr, main = "Salarias fasciatus lcWGS Alb", xlab = "Bases", ylab = "Error", cex.axis = 0.75, cex.names = 0.5)

#Read in data table 
ContempErr <- as.numeric(read.table("ContempErr.error.chunkunordered.csv", nrow=1))
DNA<-c("A","C","G","T")
names(ContempErr) <- as.vector((sapply(1:4,function(x) paste(DNA[x],DNA,sep="->"))))
barplot(ContempErr, main = "Salarias fasciatus lcWGS Contemp", xlab = "Bases", ylab = "Error", cex.axis = 0.75, cex.names = 0.5)
