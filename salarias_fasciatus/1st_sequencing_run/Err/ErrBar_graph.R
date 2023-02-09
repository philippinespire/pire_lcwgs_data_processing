#This ErrBar graph maker  was adapted from the ANGSD manual to create bar plots for Error estimation ANGSD

#set working directory
#setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
setwd("~/Documents/PIRE Project/Salarias_fasciatus_lcWGS")
getwd()

#OPTION 1 - 2 tables in 1 window
#Read in data table 
AlbErr <- as.numeric(read.table("AlbErr.error.chunkunordered", nrow=1))
DNA<-c("A","C","G","T")
names(AlbErr) <- as.vector((sapply(1:4,function(x) paste(DNA[x],DNA,sep="->"))))
AlbErrplot <- barplot(AlbErr, main = "Salarias fasciatus lcWGS Alb", xlab = "Bases", ylab = "Error", cex.axis = 0.75, cex.names = 0.5, ylim = c(0,0.02))

#Read in data table 
ContempErr <- as.numeric(read.table("ContempErr.error.chunkunordered", nrow=1))
DNA<-c("A","C","G","T")
names(ContempErr) <- as.vector((sapply(1:4,function(x) paste(DNA[x],DNA,sep="->"))))
ContempErrplot <- barplot(ContempErr, main = "Salarias fasciatus lcWGS Contemp", xlab = "Bases", ylab = "Error", cex.axis = 0.75, cex.names = 0.5, ylim = c(0,0.02))

#combining both in 1 window
par(mfrow=c(1,2))
barplot(AlbErr, main = "Sfa lcWGS Alb", xlab = "Bases", ylab = "Error", cex.axis = 0.6, cex.names = 0.5, las = 2, ylim = c(0,0.006))
barplot(ContempErr, main = "Sfa lcWGS Contemp", xlab = "Bases", ylab = "Error", cex.axis = 0.6, cex.names = 0.5, las = 2, ylim = c(0,0.006))

#OPTION 2: combining both Alb & Contemp side by side
df <- data.frame(
  DNA<-c("A","C","G","T"),
  ContempErr <- as.numeric(read.table("ContempErr.error.chunkunordered.csv", nrow=1)),
  AlbErr <- as.numeric(read.table("AlbErr.error.chunkunordered.csv", nrow=1))
)
AlbandContemp.Err <- t(cbind(df$AlbErr, df$ContempErr))
barplot(AlbandContemp.Err, main = "Sfa lcWGS", xlab = "bases", ylab = "error", beside=T, names.arg = as.vector((sapply(1:4,function(x) paste(DNA[x],DNA,sep="->")))), col=c("black","grey"), cex.axis = 0.9, cex.names = 0.7, ylim = c(0,0.02))
legend(x = "topright", legend = c("Albatross", "Contemporary"), fill = c("black", "grey"))

#NOTE: Adjust cex.axis = 0.9, cex.names = 0.9, ylim = c(0,0.02) to fix sizing on screen/plot
