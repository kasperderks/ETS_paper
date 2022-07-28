library(SNPlocs.Hsapiens.dbSNP144.GRCh37)
library(VariantAnnotation)
library(vcfR)
library(snpStats)
library(data.table)
library(QDNAseq)
library(Biobase)
options(scipen=999)

tot_df <- data.frame()
GATK_file <- # path to g.vcf containing samples of interest
  fam_vcf2           <- read.vcfR (GATK_file, "hg19")
  famDP2            <- extract.gt(fam_vcf2,element='DP')
  for( col in 1:ncol(famDP2)){
   gemid <- mean(as.numeric(na.omit(famDP2[,col])))
   sd_smp <- sd(as.numeric(na.omit(famDP2[,col])))
   cat( colnames(famDP2)[col], "\n")
   groep <- overview[overview[,"ID"]%in%colnames(famDP2)[col],"group"]
   if (length(groep)>=1){
   smp_df <- data.frame(ID=colnames(famDP2)[col],mean_sample=gemid,sd=sd_smp,family=family,group=groep,stringsAsFactors=FALSE)
   tot_df <- rbind(tot_df,smp_df)
   }
 }
}

write.table(tot_df,"Total_depth.txt",row.names=F,quote=F)


