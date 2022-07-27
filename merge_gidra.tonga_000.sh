#!/hmiwa/
#$ -cwd
#$ -V
#$ -l medium
#$ -l d_rt=192:00:00
#$ -l s_rt=192:00:00
#$ -l s_vmem=320G
#$ -l mem_req=320G
#$ -S /bin/bash
#$ -o ~/hmiwa/log/merge_gidra.tonga_000.o
#$ -e ~/hmiwa/log/merge_gidra.tonga_000.e
#$ -t 1-16:1
#$ -N vcfset_G&T
gidra_names=(G06 G150 G164 G220 G282 G306 G412 G99 G05 G135 G152 G217 G256 G304 G326 G627)
#gidra
echo "start: `date` ${gidra_names[$SGE_TASK_ID-1]}"
#gunzip
gunzip -f ~/hmiwa/analysis_gidra.tonga/data/${gidra_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.sedchr.vcf.gz;echo "${gidra_names[$SGE_TASK_ID-1]} gunzip done: `date`"
#sed
sed -e 's/GT\t0$/GT\t0\/0/g' -e 's/GT\t\.$/GT\t0\/0/g' -e 's/GT\t1$/GT\t1\/1/g' ~/hmiwa/analysis_gidra.tonga/data/${gidra_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.sedchr.vcf > ~/hmiwa/analysis_gidra.tonga/data/${gidra_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.sedchr.cleaned.vcf;echo "${gidra_names[$SGE_TASK_ID-1]} sed done: `date`"
#bgzip
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_gidra.tonga/data/${gidra_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.sedchr.vcf;echo "${gidra_names[$SGE_TASK_ID-1]} bgzip done: `date`"
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_gidra.tonga/data/${gidra_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.sedchr.cleaned.vcf;echo "${gidra_names[$SGE_TASK_ID-1]} bgzip done: `date`"
#index
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/analysis_gidra.tonga/data/${gidra_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.sedchr.cleaned.vcf.gz;echo "${gidra_names[$SGE_TASK_ID-1]} index done: `date`"
echo "finish: `date` ${gidra_names[$SGE_TASK_ID-1]}"
tonga_names=(T03 T120 T150 t159 t21 T47 t69 T82 t112 t138 T153 t160 t38 t51 T76 T85)
#tonga
echo "start: `date` ${tonga_names[$SGE_TASK_ID-1]}"
gunzip -f ~/hmiwa/analysis_gidra.tonga/data/${tonga_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.sedchr.vcf.gz;echo "${tonga_names[$SGE_TASK_ID-1]} gunzip done: `date`"
#sed
sed -e 's/GT\t0$/GT\t0\/0/g' -e 's/GT\t\.$/GT\t0\/0/g' -e 's/GT\t1$/GT\t1\/1/g' ~/hmiwa/analysis_gidra.tonga/data/${tonga_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.sedchr.vcf > ~/hmiwa/analysis_gidra.tonga/data/${tonga_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.sedchr.cleaned.vcf;echo "${tonga_names[$SGE_TASK_ID-1]} sed done: `date`"
#bgzip
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_gidra.tonga/data/${tonga_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.sedchr.vcf;echo "${tonga_names[$SGE_TASK_ID-1]} bgzip done: `date`"
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_gidra.tonga/data/${tonga_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.sedchr.cleaned.vcf;echo "${tonga_names[$SGE_TASK_ID-1]} bgzip done: `date`"
#index
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/analysis_gidra.tonga/data/${tonga_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.sedchr.cleaned.vcf.gz;echo "${tonga_names[$SGE_TASK_ID-1]} index done: `date`"
echo "finish: `date` ${tonga_names[$SGE_TASK_ID-1]}"
#please do "qsub" under ~/hmiwa
