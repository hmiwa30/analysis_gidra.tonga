#!/hmiwa/
#$ -cwd
#$ -V
#$ -l medium
#$ -l d_rt=192:00:00
#$ -l s_rt=192:00:00
#$ -l s_vmem=352G
#$ -l mem_req=352G
#$ -S /bin/bash
#$ -o ~/hmiwa/log/merge_gidra.tonga_01.o
#$ -e ~/hmiwa/log/merge_gidra.tonga_01.e
#$ -N mergeg+t
echo "start: `date`"
#pass
export PERL5LIB=/lustre7/home/hmiwa-spc/vcftools/src/perl/
export PATH=$PATH:/lustre7/home/hmiwa-spc/htslib-1.11/
#merge
/lustre7/home/hmiwa-spc/local/bin/vcf-merge --ref-for-missing 0/0 ~/hmiwa/analysis_gidra.tonga/data/G05_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G06_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G99_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G135_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G150_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G152_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G164_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G217_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G220_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G256_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G282_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G304_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G306_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G326_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G412_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G627_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T03_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t21_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t38_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T47_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t51_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t69_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T76_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T82_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T85_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t112_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T120_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t138_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T150_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T153_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t159_sorted.genome.gtonly.sedchr.cleaned.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t160_sorted.genome.gtonly.sedchr.cleaned.vcf.gz | singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -c > ~/hmiwa/analysis_gidra.tonga/data/gidra.tonga.gtonly.sedchr.cleaned.vcf.gz;echo "merge done: `date`"
#index
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/analysis_gidra.tonga/data/gidra.tonga.gtonly.vcf.gz;echo "index done: `date`"
echo "finish: `date`"
#please do "qsub" under ~/hmiwa
