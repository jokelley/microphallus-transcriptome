#!/bin/bash
#PBS -k o
#PBS -l nodes=1:ppn=1,walltime=120:00:00
#PBS -M cej.jenkins@gmail.com
#PBS -m abe
#PBS -N pop1_SNPS
#PBS -j oe
#PBS -q gp

module load jdk/1.7.0_51

/home/genomics/tools/trinityrnaseq-2.0.6/Trinity --seqType fq --max_memory 50G 
--single /home/genomics/cjenkins/MicrophallusProject/TrimGalore/reference_trimmed.fq.gz --CPU 6


