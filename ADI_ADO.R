sink("ADO_ADI_out")
rda 	<-  #path to rda file
print(rda)

load(rda)
ADO_ADI_df <-t(as.data.frame(QCbyParents,stringsAsFactors=FALSE))
write.table(ADO_ADI_df,"Total_ADO_ADI.txt",row.names=F,quote=F)

sink()
