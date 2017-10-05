#!/bin/bash

#$ -cwd
#$ -S /bin/bash
#$ -N gatk_step1
#$ -o gatkout_step1
#$ -e gatkerr_step1
#$ -l mem_free=2G
#$ -V
#$ -t 1-164:1

i=$(expr $SGE_TASK_ID - 1)

PATH=~/bin/:$PATH

BAMS=( `cat bams_clean.txt`)

IFS=';' read -a arr <<< "${BAMS[$i]}"

REF="/nfs0/Grunwald_Lab/home/tabimaj/GBS/barcoded/rubi/Pr4671.fa"

echo -n "Running on: "
hostname
echo "SGE job id: $JOB_ID"
date

echo
echo "Path:"
echo $PATH
echo


export _JAVA_OPTIONS="-XX:ParallelGCThreads=1"

# https://www.broadinstitute.org/gatk/guide/article?id=38

mkdir -p intervals/
mkdir -p indels/

# Creating intervals
CMD="/raid1/home/bpp/tabimaj/bin/jre1.8.0_25/bin/java -Xmx2g -jar /raid1/home/bpp/tabimaj/bin/GenomeAnalysisTK.jar -T RealignerTargetCreator -R /nfs0/Grunwald_Lab/home/tabimaj/GBS/barcoded/rubi/Pr4671.fa -I ${arr[1]} -o indels/${arr[0]}.intervals" 
eval $CMD
$CMD 1>>${arr[0]}_1.out 2>>${arr[0]}_1.err

# Realigning with indels
# CMD="/raid1/home/bpp/tabimaj/bin/jre1.8.0_25/bin/java -Xmx4g -Djava.io.tmpdir=/data -jar /raid1/home/bpp/tabimaj/bin/GenomeAnalysisTK.jar -T IndelRealigner -R /home/bpp/tabimaj/Grunwald_Lab/home/tabimaj/genomes_rf/Mapping_2015/Psojae_P6497_Genome.fasta -I ${arr[1]} -targetIntervals indels/${arr[0]}.intervals -o bams/${arr[0]}.bam --consensusDeterminationModel USE_READS -LOD 0.4"
# echo $CMD
# $CMD 1>>${arr[0]}_2.out 2>>${arr[0]}_2.err

date

