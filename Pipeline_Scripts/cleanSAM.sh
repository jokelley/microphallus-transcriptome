#!/bin/bash
#PBS -k o
#PBS -l nodes=1:ppn=1,walltime=100:00
#PBS -M cej.jenkins@gmail.com
#PBS -m abe
#PBS -N bammie_sample20 
#PBS -j oe
#PBS -q gp


java -Xmx6G -jar /home/cornejo.lab/omar.cornejo/genomics_software/picard-master/dist/picard.jar CleanSam INPUT=/home/bio534/cjenkins/project/pop2/sample7/lib1/sample8.bam OUTPUT=/home/bio534/cjenkins/project/pop2/sample7/lib1/sample8.clean.bam VALIDATION_STRINGENCY=SILENT
java -Xmx6G -jar /home/cornejo.lab/omar.cornejo/genomics_software/picard-master/dist/picard.jar FixMateInformation INPUT=/home/bio534/cjenkins/project/pop2/sample7/lib1/sample8.clean.bam OUTPUT=/home/bio534/cjenkins/project/pop2/sample7/lib1/sample8.clean.fix.bam VALIDATION_STRINGENCY=SILENT
java -Xmx6G -jar /home/cornejo.lab/omar.cornejo/genomics_software/picard-master/dist/picard.jar ValidateSamFile INPUT=/home/bio534/cjenkins/project/pop2/sample7/lib1/sample8.clean.fix.bam OUTPUT=/home/bio534/cjenkins/project/pop2/sample7/lib1/sample8.validation VALIDATION_STRINGENCY=LENIENT

