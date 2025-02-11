winfst<-read.table("abas_sites_notrans_cbas_sites_notrans.window_fst.txt")

names(winfst)=c("chr","midPos","Nsites","fst")

chromlengths=read.table("ncbi_chromlengths")

names(chromlengths)=c("chr","length")

chromlengths$add=cumsum(chromlengths$length)-chromlengths$length

chromlengths$add[match(winfst$chr,chromlengths$chr)]

winfst$gPos=winfst$midPos+chromlengths$add[match(winfst$chr,chromlengths$chr)]

plot(winfst$gPos,winfst$fst,col=as.factor(winfst$chr),xlab="Chromosomes",ylab="Windowed Fst",pch=16,cex=0.5)

plot(winfst$Nsites,winfst$fst,col=as.factor(winfst$chr),xlab="NSites",ylab="Windowed Fst",pch=16,cex=0.5)

winfst_filt=winfst[winfst$Nsites>100,]

plot(winfst_filt$gPos,winfst_filt$fst,col=as.factor(winfst_filt$chr),xlab="Chromosomes",ylab="Windowed Fst",pch=16,cex=0.5)

quantile(winfst_filt$fst,prob=0.99)

winfst_filt_top1p=winfst_filt[winfst_filt$fst>quantile(winfst_filt$fst,prob=0.99),]

winfst_filt_top01p=winfst_filt[winfst_filt$fst>quantile(winfst_filt$fst,prob=0.999),]

