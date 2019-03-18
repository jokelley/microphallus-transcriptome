#!/bin/bash
#PBS -k o
#PBS -l nodes=1:ppn=1,walltime=1440:00
#PBS -M cej.jenkins@gmail.com
#PBS -m abe
#PBS -N trimgalore-undetermined 
#PBS -j oe
#PBS -q gp

module load python

PATH=$PATH:/home/cornejo.lab/omar.cornejo/genomics_software/FastQC
PATH=$PATH:/home/cornejo.lab/omar.cornejo/genomics_software/trim_galore
export PATH=$PATH:/home/cornejo.lab/omar.cornejo/genomics_software/cutadapt-1.7.1/bin

trim_galore --quality 20 --fastqc --fastqc_args "--nogroup --noextract --outdir /home/bio534/cjenkins/TrimGalore-2015-02-04" --adapter AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT --adapter2 AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT  --stringency 6 --paired --gzip --length 50 --clip_R1 15 --clip_R2 15 --output_dir /home/bio534/cjenkins/TrimGalore-2015-02-04 /home/cornejo.lab/omar.cornejo/pop_gen_class/Undetermined_S0_L001_R1_001.fastq.gz /home/cornejo.lab/omar.cornejo/pop_gen_class/Undetermined_S0_L001_R2_001.fastq.gz