# ETS_paper

1) breadth of coverage
To extract the breadth of coverage the samtools is used and using the families list we found the bam files of all the samples.

2) depth over coverage
To calculate the depth of coverage (depth_of_coverage_ETS.sh) the g.vcf files of the families are retrieved and thereof the depth is calculated using an R script

3) Allelic drop in or allelic drop out
To determine the ADO (allelic drop out) or ADI (allelic drop in) frequencies in the samples we loaded in the rda files per family and extracted the qcbyparents matrix to determine the ADO and ADI for all chromosomes.

4) Extraction of the ETS from the samples
To extract the ETS from the bam files the samtools is used with the idxstats function (ETS_SASI_idxstats.sh) and the extracted reads per chromosome are written to a .reads file and further processed using an R script (ETS_Extract.R). Resulting in the file Total.reads containing the sample name, which ETS was found, how many total reads where sequenced for that sample, number of ETS_reads, percentages of the ETS per sample identified
