args 		<- commandArgs(TRUE)
sample 		<- args[1]
reads 		<- read.table(paste0("Reads/",sample,".reads"),sep="\t",header=F,check.names=F,stringsAsFactors=FALSE)
reads_ETS 	<- reads[grepl("SASI",reads[,1]),]
reads_ETS_filt 	<- reads_ETS[reads_ETS[,3]>0,]
if(nrow(reads_ETS_filt)>0){
	ETS_df	<- reads_ETS_filt[,1]
	ETS_df	<- data.frame(sampleID=sample,ETS_df,stringsAsFactors=FALSE)
	ETS_df	<- data.frame(ETS_df,ETS_reads=reads_ETS_filt[,3],stringsAsFactors=FALSE)
	ETS_df	<- data.frame(ETS_df,perc=as.numeric(reads_ETS_filt[,3]/sum(reads_ETS_filt[,3])*100),stringsAsFactors=FALSE)
	ETS_df	<- data.frame(ETS_df,nr.found=nrow(reads_ETS_filt),over.1.perc=nrow(ETS_df[ETS_df$perc>1,]),stringsAsFactors=FALSE)
	write.table(ETS_df,paste0("Reads/",sample,".ETS.reads"),sep="\t",row.names=F,quote=F,col.names=F)
}
