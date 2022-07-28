module load samtools/1.2 # load samtools
module load gcc/4.8.2 #load gcc

workdir="" #output directory

touch $workdir/ETS_paper/depth_of_coverage_summary.txt;

MIN_COVERAGE_DEPTH=2
while IFS= read -r family; do
 echo $family >> $workdir/ETS_paper/breadth_min_coverage_2_summary.txt; 
 while IFS= read -r fam_member; do    
  echo $fam_member >> $workdir/ETS_paper/breadth_min_coverage_2_summary.txt;    
  samtools mpileup /ifs/data/diagnostics/nextseq/PGT/work/$family/bam/${fam_member}.bam | awk -v X="${MIN_COVERAGE_DEPTH}" '$4>=X' | wc -l >> $workdir/ETS_paper/breadth_min_coverage_2_summary.txt;  
 done < "$workdir/ETS_paper/family_files/Overview_${family}.txt"; #list of samples of a family
done < "$workdir/ETS_paper/Overview_families.txt" #list of families to be analysed

