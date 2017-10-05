###
# Demultiplexing reads with with sabre
###

####
# DISCLAIMER: This code is an example of the code used in Tabima et al., 2017 (MPMI). 
# The demultiplexed reads are available in NBCI, this code is for illustrative purposes
# only. Please follow the instructions at the sabre GitHub page: 
# https://github.com/najoshi/sabre
####

#Single end reads
home/bpp/tabimaj/bin/sabre-master/sabre se -f SE_Illumina.fastq.gz -r /SE_Illumina.fastq.gz -b barcodes_SE -u unknown_barcodes_SE.fastq

# Paired end reads
home/bpp/tabimaj/bin/sabre-master/sabre pe -f PE_Illumina_R1.fastq.gz -r PE_Illumina_R1.fastq.gz -b barcodes_PE -u unknown_barcodes_PE_1.fastq -w unknown_barcodes_PE_2.fastq
