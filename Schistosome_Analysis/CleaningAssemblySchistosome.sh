#!/bin/bash
#PBS -k o
#PBS -l nodes=1:ppn=1,walltime=48:00:00
#PBS -M cej.jenkins@gmail.com
#PBS -m abe
#PBS -N allreadsassembled
#PBS -j oe
#PBS -q gp

module load java

/home/cornejo.lab/omar.cornejo/genomics_software/samtools-1.2/samtools view -ubhSt /home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/Schistosoma_mansoni/Schistosoma_mansoni_v5.2.fa /home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.sam -o /home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.bam

java -Xmx16G -jar /home/cornejo.lab/omar.cornejo/genomics_software/picard-master/dist/picard.jar CleanSam INPUT=/home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.bam OUTPUT=/home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.clean.bam VALIDATION_STRINGENCY=SILENT

java -Xmx16G -jar /home/cornejo.lab/omar.cornejo/genomics_software/picard-master/dist/picard.jar FixMateInformation INPUT=/home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment//AllReads/All_Reads.clean.bam OUTPUT=/home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.clean.fix.bam VALIDATION_STRINGENCY=SILENT

java -Xmx16G -jar /home/cornejo.lab/omar.cornejo/genomics_software/picard-master/dist/picard.jar ValidateSamFile INPUT=/home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.clean.fix.bam OUTPUT=/home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.validation VALIDATION_STRINGENCY=LENIENT

java -Xmx16G -jar /home/cornejo.lab/omar.cornejo/genomics_software/picard-master/dist/picard.jar CollectAlignmentSummaryMetrics INPUT=/home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.clean.fix.bam OUTPUT=/home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.metrics VALIDATION_STRINGENCY=LENIENT

java -Xmx16G -jar /home/cornejo.lab/omar.cornejo/genomics_software/picard-master/dist/picard.jar SortSam INPUT=/home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.clean.fix.bam OUTPUT=/home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.clean.fix.sorted.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=LENIENT

java -Xmx16G -jar /home/cornejo.lab/omar.cornejo/genomics_software/picard-master/dist/picard.jar MarkDuplicates INPUT=/home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.clean.fix.sorted.bam OUTPUT=/home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.F.bam VALIDATION_STRINGENCY=LENIENT REMOVE_DUPLICATES=TRUE METRICS_FILE=/home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.DUP_METRICS.OUT

/home/cornejo.lab/omar.cornejo/genomics_software/samtools-1.2/samtools index /home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.F.bam

/home/cornejo.lab/omar.cornejo/genomics_software/samtools-1.2/samtools idxstats /home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.F.bam > /home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.IDXSTATS

/home/cornejo.lab/omar.cornejo/genomics_software/bamtools-master/bin/bamtools-2.3.0 stats -in /home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.F.bam > /home/genomics/cjenkins/MicrophallusProject/MicrophallusAlign/SchistosomaAlignment/AllReads/All_Reads.STATS

