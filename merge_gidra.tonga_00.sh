#!/hmiwa/
#$ -cwd
#$ -V
#$ -l medium
#$ -l d_rt=192:00:00
#$ -l s_rt=192:00:00
#$ -l s_vmem=352G
#$ -l mem_req=352G
#$ -S /bin/bash
#$ -o ~/hmiwa/log/merge_gidra.tonga_00.o
#$ -e ~/hmiwa/log/merge_gidra.tonga_00.e
#$ -t 1-16:1
gidra_names=(G06 G150 G164 G220 G282 G306 G412 G99 G05 G135 G152 G217 G256 G304 G326 G627)
#gidra
echo "start: `date` ${gidra_names[$SGE_TASK_ID-1]}"
#original index
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/downloads/Gidra/${gidra_names[$SGE_TASK_ID-1]}_sorted.genome.vcf.gz;echo "${gidra_names[$SGE_TASK_ID-1]} original index done: `date`"
#header
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools view --header-only ~/hmiwa/downloads/Gidra/${gidra_names[$SGE_TASK_ID-1]}_sorted.genome.vcf.gz > ~/hmiwa/analysis_gidra.tonga/data/${gidra_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.vcf;echo "${gidra_names[$SGE_TASK_ID-1]} header done: `date`"
#contents(GT)
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools query -f '%CHROM\t%POS\t%ID\t%REF\t%ALT\tGT[\t%GT]\n' ~/hmiwa/downloads/Gidra/${gidra_names[$SGE_TASK_ID-1]}_sorted.genome.vcf.gz >> ~/hmiwa/analysis_gidra.tonga/data/${gidra_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.vcf;echo "${gidra_names[$SGE_TASK_ID-1]} contents(GT) done: `date`"
#bgzip
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_gidra.tonga/data/${gidra_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.vcf;echo "${gidra_names[$SGE_TASK_ID-1]} bgzip done: `date`"
#index
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/analysis_gidra.tonga/data/${gidra_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.vcf.gz;echo "${gidra_names[$SGE_TASK_ID-1]} index done: `date`"
echo "finish: `date` ${gidra_names[$SGE_TASK_ID-1]}"
tonga_names=(T03 T120 T150 T159 T21 T47 T69 T82 T112 T138 T153 T160 T38 T51 T76 T85)
#tonga
echo "start: `date` ${tonga_names[$SGE_TASK_ID-1]}"
#original index
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/downloads/Tonga/${tonga_names[$SGE_TASK_ID-1]}_sorted.genome.vcf.gz;echo "${tonga_names[$SGE_TASK_ID-1]} original index done: `date`"
#header
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools view --header-only ~/hmiwa/downloads/Tonga/${tonga_names[$SGE_TASK_ID-1]}_sorted.genome.vcf.gz > ~/hmiwa/analysis_gidra.tonga/data/${tonga_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.vcf;echo "${tonga_names[$SGE_TASK_ID-1]} header done: `date`"
#contents(GT)
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools query -f '%CHROM\t%POS\t%ID\t%REF\t%ALT\tGT[\t%GT]\n' ~/hmiwa/downloads/Tonga/${tonga_names[$SGE_TASK_ID-1]}_sorted.genome.vcf.gz >> ~/hmiwa/analysis_gidra.tonga/data/${tonga_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.vcf;echo "${tonga_names[$SGE_TASK_ID-1]} contents(GT) done: `date`"
#bgzip
singularity exec /usr/local/biotools/h/htslib:1.9--hc238db4_4 bgzip -f ~/hmiwa/analysis_gidra.tonga/data/${tonga_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.vcf;echo "${tonga_names[$SGE_TASK_ID-1]} bgzip done: `date`"
#index
singularity exec /usr/local/biotools/b/bcftools-snvphyl-plugin:1.9--he673b24_1 bcftools index ~/hmiwa/analysis_gidra.tonga/data/${tonga_names[$SGE_TASK_ID-1]}_sorted.genome.gtonly.vcf.gz;echo "${tonga_names[$SGE_TASK_ID-1]} index done: `date`"
echo "finish: `date` ${tonga_names[$SGE_TASK_ID-1]}"
