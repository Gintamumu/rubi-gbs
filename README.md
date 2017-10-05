# GBS script repository for Phytophthora rubi and P. fragariae

This site includes:

**Scripts**:

- Script for demultiplexing in `sabre` (Step1_sabre.sh)
- Scripts mapping reads against reference genome using `bowtie2` (Step2_Bowtie.sh)
- Scripts for creating VCF files in `GATK-HC` (Step3_GATK_preparation.sh and Step4_GATK_vcf.sh)
- R scripts for filtering variants, and population genetic analysis (Step5_Data_Processing.Rmd)

**Datasets**:
- CSV file with all population information for each sample (Rub_frag_list.csv)
- Text file with read information per sample (reads.txt)
