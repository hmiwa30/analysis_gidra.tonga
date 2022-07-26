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
#$ -t 1-22:1
#$ -N mergeg+t+1KG
echo "start: `date` chr${SGE_TASK_ID}"
#merge
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools merge --missing-to-ref ~/hmiwa/downloads/1KG/ALL.chr${SGE_TASK_ID}.phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G05_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G06_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G99_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G135_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G150_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G152_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G164_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G217_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G220_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G256_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G282_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G304_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G306_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G326_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G412_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/G627_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T03_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t21_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t38_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T47_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t51_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t69_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T76_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T82_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T85_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t112_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T120_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t138_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T150_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/T153_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t159_sorted.genome.gtonly.sedchr.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/t160_sorted.genome.gtonly.sedchr.vcf.gz | singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -c > ~/hmiwa/analysis_gidra.tonga/results/1kgphase3.gidra.tonga.chr${SGE_TASK_ID}.gtonly.vcf.gz;echo " merge chr${SGE_TASK_ID} done: `date`"
#index
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/analysis_gidra.tonga/results/1kgphase3.gidra.tonga.chr${SGE_TASK_ID}.gtonly.vcf.gz;echo "index chr${SGE_TASK_ID} done: `date`"
echo "finish: `date` chr${SGE_TASK_ID}"
#please do "qsub" under ~/hmiwa
