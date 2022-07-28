#!/bin/bash
for sample in `cat samples.list | sort`; do

	module load bioinf/samtools
	module load bioinf/singularity/3.0
  simg= #singularity container
	work_dir= # work directory
	input_bam={BAMDIR}/$sample/bam/${sample}.bam #location of where bams are stored

	if [ -f $input_bam ]; then
		samtools idxstats $input_bam > $work_dir/Reads/${sample}.reads
		singularity exec $simg  Rscript ETS_Extract.R $sample
		if [ -f $work_dir/Reads/${sample}.ETS.reads ]; then
			cat $work_dir/Reads/${sample}.ETS.reads >> $work_dir/Total.reads
		else
			echo "$sample no reads found" >> output.txt
		fi
	else
		echo "$sample no bam found" >> output.txt
	fi
	#echo "Done!"
done
