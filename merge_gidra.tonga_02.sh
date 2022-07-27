#!/hmiwa/
#$ -cwd
#$ -V
#$ -l medium
#$ -l d_rt=192:00:00
#$ -l s_rt=192:00:00
#$ -l s_vmem=352G
#$ -l mem_req=352G
#$ -S /bin/bash
#$ -o ~/hmiwa/log/merge_gidra.tonga_02.o
#$ -e ~/hmiwa/log/merge_gidra.tonga_02.e
#$ -t 1-22:1
#$ -N bcfisec_GT
echo "start: `date` ${SGE_TASK_ID}"
#isec
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools isec ~/hmiwa/downloads/1KG/ALL.chr${SGE_TASK_ID}.phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/gidra.tonga.gtonly.sedchr.cleaned.vcf.gz -p ~/hmiwa/analysis_gidra.tonga/results/output_chr${SGE_TASK_ID} -n=2;echo "isec chr${SGE_TASK_ID} done"
#bgzip
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_gidra.tonga/results/output_chr${SGE_TASK_ID}/0000.vcf > ~/hmiwa/analysis_gidra.tonga/results/output_chr${SGE_TASK_ID}/0000.vcf.gz;echo "bgzip 0000 chr${SGE_TASK_ID} done"
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_gidra.tonga/results/output_chr${SGE_TASK_ID}/0001.vcf > ~/hmiwa/analysis_gidra.tonga/results/output_chr${SGE_TASK_ID}/0001.vcf.gz;echo "bgzip 0001 chr${SGE_TASK_ID} done"
#index
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/analysis_gidra.tonga/results/output_chr${SGE_TASK_ID}/0000.vcf.gz;echo "index 0000 chr${SGE_TASK_ID} done"
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/analysis_gidra.tonga/results/output_chr${SGE_TASK_ID}/0001.vcf.gz;echo "index 0001 chr${SGE_TASK_ID} done"
#isec jomon
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools isec ~/hmiwa/downloads/1KG/ALL.chr${SGE_TASK_ID}.phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.vcf.gz ~/hmiwa/downloads/Jomon/Jomon.merge.vcf.gz ~/hmiwa/analysis_gidra.tonga/data/gidra.tonga.gtonly.sedchr.cleaned.vcf.gz -p ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID} -n=3;echo "isec jomon chr${SGE_TASK_ID} done"
#bgzip jomon
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0000.vcf > ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0000.vcf.gz;echo "bgzip 0000 chr${SGE_TASK_ID} done"
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0001.vcf > ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0001.vcf.gz;echo "bgzip 0001 chr${SGE_TASK_ID} done"
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0002.vcf > ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0002.vcf.gz;echo "bgzip 0002 chr${SGE_TASK_ID} done"
#index jomon
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0000.vcf.gz;echo "index 0000 chr${SGE_TASK_ID} done"
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0001.vcf.gz;echo "index 0001 chr${SGE_TASK_ID} done"
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0002.vcf.gz;echo "index 0002 chr${SGE_TASK_ID} done"
#pass
export PERL5LIB=/lustre7/home/hmiwa-spc/vcftools/src/perl/
export PATH=$PATH:/lustre7/home/hmiwa-spc/htslib-1.11/
#merge
/lustre7/home/hmiwa-spc/local/bin/vcf-merge --ref-for-missing 0/0 ~/hmiwa/analysis_gidra.tonga/results/output_chr${SGE_TASK_ID}/0000.vcf.gz ~/hmiwa/analysis_gidra.tonga/results/output_chr${SGE_TASK_ID}/0001.vcf.gz | singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -c > ~/hmiwa/analysis_gidra.tonga/results/1kg.gidra.tonga.chr${SGE_TASK_ID}.gtonly.sedchr.cleaned.vcf.gz;echo "merge chr${SGE_TASK_ID} done: `date`"
#merge jomon
/lustre7/home/hmiwa-spc/local/bin/vcf-merge --ref-for-missing 0/0 ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0000.vcf.gz ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0001.vcf.gz ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0002.vcf.gz | singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -c > ~/hmiwa/analysis_gidra.tonga/results/1kg.jomon.gidra.tonga.chr${SGE_TASK_ID}.gtonly.sedchr.cleaned.vcf.gz;echo "merge jomon chr${SGE_TASK_ID} done: `date`"
echo "finish: `date` ${SGE_TASK_ID}"
#please do "qsub" under ~/hmiwa
