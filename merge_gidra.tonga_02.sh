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
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0000.vcf > ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0000.vcf.gz;echo "bgzip 0000 chr${SGE_TASK_ID} done"
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_gidra.tonga/results/output_jomon_chr${SGE_TASK_ID}/0001.vcf > ~/hmiwa/analysis_gidra.tonga/results/output_chr${SGE_TASK_ID}/0001.vcf.gz;echo "bgzip 0001 chr${SGE_TASK_ID} done"




#pass
export PERL5LIB=/lustre7/home/hmiwa-spc/vcftools/src/perl/
export PATH=$PATH:/lustre7/home/hmiwa-spc/htslib-1.11/



/lustre7/home/hmiwa-spc/local/bin/vcf-merge --ref-for-missing 0/0 | singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -c > ~/hmiwa/analysis_gidra.tonga/data/gidra.tonga.gtonly.sedchr.cleaned.vcf.gz;echo "merge done: `date`"






~/hmiwa/downloads/Jomon/Jomon.merge.vcf.gz 


singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/downloads/1KG/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.vcf.gz;echo "done"
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools isec ~/hmiwa/downloads/1KG/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.vcf.gz ~/hmiwa/downloads/Jomon/Jomon.merge.vcf.gz -p output02 -n=2;echo "done"
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_jomonf3/output02/0000.vcf > ~/hmiwa/analysis_jomonf3/output02/0000.vcf.gz;echo "done"
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_jomonf3/output02/0001.vcf > ~/hmiwa/analysis_jomonf3/output02/0001.vcf.gz;echo "done"
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/analysis_jomonf3/output02/0000.vcf.gz;echo "done"
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/analysis_jomonf3/output02/0001.vcf.gz;echo "done"








gidra_names=(G06 G150 G164 G220 G282 G306 G412 G99 G05 G135 G152 G217 G256 G304 G326 G627)
#gidra

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
