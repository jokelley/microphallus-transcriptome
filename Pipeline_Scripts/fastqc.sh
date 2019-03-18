#!/bin/bash
#PBS -k o
#PBS -l nodes=1:ppn=1,walltime=20:00
#PBS -M cej.jenkins@gmail.com
#PBS -m abe
#PBS -N fastqc-monkR1 
#PBS -j oe
#PBS -q gp

export PATH=$PATH:/home/cornejo.lab/omar.cornejo/genomics_software/FastQC

fastqc --outdir /home/bio534/cjenkins/fastqc-2015-01-28 --noextract --nogroup /home/bio534/cjenkins/MicrophallusProject/MicrophallusTranscriptomes/ReferenceTranscriptome/reference.fastq
