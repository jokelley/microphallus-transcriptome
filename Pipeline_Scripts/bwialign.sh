#!/bin/bash
#PBS -k o
#PBS -l nodes=1:ppn=1,walltime=100:00
#PBS -M cej.jenkins@gmail.com
#PBS -m abe
#PBS -N bwie_1 
#PBS -j oe
#PBS -q gp



export PATH=$PATH:/home/cornejo.lab/omar.cornejo/genomics_software/bwa-0.7.12

bwa aln /home/cornejo.lab/omar.cornejo/ref_genome/unicorn.fas /home/cornejo.lab/omar.cornejo/simu_reads/sample1_pop1.sim_reads_1.fastq > /home/bio534/cjenkins/project/pop1/sample1/lib1/sample1_pop1.sim_reads_1.sai

bwa aln /home/cornejo.lab/omar.cornejo/ref_genome/unicorn.fas /home/cornejo.lab/omar.cornejo/simu_reads/sample1_pop1.sim_reads_2.fastq > /home/bio534/cjenkins/project/pop1/sample1/lib1/sample1_pop1.sim_reads_2.sai