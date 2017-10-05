#!/bin/bash
#$ -cwd
#$ -S /bin/bash
#$ -N gatk_vcf
#$ -o gatkout_vcf
#$ -e gatkerr_vcf
#$ -V
#$ -p -10
#$ -t 1-9434:1


i=$(expr $SGE_TASK_ID - 1)
PATH=~/bin/:$PATH
REF="/nfs1/BPP/Grunwald_Lab/home/tabimaj/GBS/barcoded/rubi/Pr4671.fa"
#IFS=';' read -a arr <<< "${BAMS[$i]}"

mkdir -p vcf_scaffolds/
export _JAVA_OPTIONS="-XX:ParallelGCThreads=1"

/raid1/home/bpp/tabimaj/bin/jre1.8.0_25/bin/java -Xmx2g -jar /raid1/home/bpp/tabimaj/bin/GenomeAnalysisTK.jar -T HaplotypeCaller -R $REF -L scaffold_$SGE_TASK_ID -I all_bams.list -o vcf_scaffolds/scaffold_$SGE_TASK_ID.vcf

date