#!/bin/bash

#$ -cwd
#$ -S /bin/bash
#$ -N bt2b_AllGBS
#$ -l mem_free=10G
#$ -V
# #$ -h
#$ -t 1-8:1

mkdir -p sams
mkdir -p bams


i=$(expr $SGE_TASK_ID - 1)
PATH=$PATH:/raid1/home/bpp/knausb/bin/samtools-0.1.18/bcftools/
FILE=( `cat reads.txt`)
REF="/nfs0/Grunwald_Lab/home/tabimaj/GBS/barcoded/rubi/Pr4671.fa"
IFS=';' read -a arr <<< "${FILE[$i]}"
 CMD="/home/bpp/knausb/bin/bowtie2-2.0.6/bowtie2 -q --very-sensitive --no-unal --rg-id ${arr[0]}.sra --rg SM:${arr[0]} --local $REF -U ${arr[1]} -S sams/${arr[0]}.sam"
 echo $CMD
 $CMD
 echo ${FILE[$i]} >&2
 echo "\n"
# 
 echo "Bowtie2 done"
# date


pwd
#ls
# 
 	CMD="samtools view -bS -o bams/${arr[0]}.bam sams/${arr[0]}.sam"
 	echo $CMD
 	$CMD
 	CMD="samtools sort bams/${arr[0]}.bam bams/${arr[0]}.sorted"
 	echo $CMD
 	$CMD
 	CMD="samtools index bams/${arr[0]}.sorted.bam"
 	echo $CMD
 	$CMD
# 
 	echo "Samtools done"
 	date

# EOF.
