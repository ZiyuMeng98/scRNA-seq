# 单细胞程序 → 组织验证 → 药物重定位分析脚本

## 脚本名称
`single_cell_program_bulk_validation_drug_repurposing_pipeline.R`

## 功能概述
本脚本将单细胞转录组学中发现的“核心细胞程序/关键分子轴”投射至 bulk RNA‑seq 数据中，完成三个层层递进的转化研究任务：

1. **组织层面验证方向一致性**  
   利用 GSVA / ssGSEA 将单细胞来源的基因模块（如纤维化程序、炎症程序）转化为每个 bulk 样本的活性得分，并通过 Boxplot 与统计检验比较处理组与对照组的差异，确认模块在组织整体水平的变化方向与单细胞中发现的特征一致。

2. **构建可迁移的样本级评分（biomarker 潜力评估）**  
   将程序基因集映射至人类同源基因，并封装为标准化评分函数，使得该评分系统可以跨平台、跨队列重复使用，作为泛化的疾病亚型或严重程度评分工具。

3. **生成疾病分子签名用于药物重定位（CMap/L1000）**  
   基于 bulk 差异表达分析得到的疾病上/下调基因，转换为人类同源基因列表，输入 LINCS/CMap 数据库，寻找能“逆转”疾病表达谱的候选药物，为老药新用提供计算支持。

## 运行环境
- R ≥ 4.0
- 必需R包：DESeq2, GSVA, clusterProfiler, org.Mm.eg.db, biomaRt, ggplot2, enrichplot 等
- 若进行药物重定位还需安装 signatureSearch (Bioconductor)

## 输入文件（脚本内需要预先提供）
- 标准化处理后的 bulk 表达矩阵（DESeq2 的 vst 或 rlog 矩阵）
- 样本分组信息表（例如 coldata，包含 condition 列）
- 单细胞来源的基因程序列表（小鼠基因 symbol）
- 差异表达分析结果（DESeq2 的 res 对象）
- 物种同源基因对照表（小鼠‑人类，由 biomaRt 在线生成）

## 运行步骤
1. 按照注释修改脚本开头的用户自定义参数区（如程序基因集、分组名称、富集分析阈值等）。
2. 在 R 环境中依次运行三个模块的代码块，或整体 source 该脚本。
3. 检查输出图形与表格，确认无报错后保存结果。

## 输出说明
- `ssGSEA_scores.csv` — 每个样本在所有程序上的 ssGSEA 得分表
- `program_validation_boxplots.pdf` — 各个程序在对照/处理组的盒形图
- `human_program_genes.csv` — 转换为人类同源基因的程序列表
- `disease_up_genes.txt` 与 `disease_down_genes.txt` — 用于 CMap/L1000 查询的上调与下调基因签名
- （可选）`cnetplot_GO.pdf`, `cnetplot_KEGG.pdf` — 基因‑通路网络图

## 注意事项
- 如果单细胞程序使用的是人类基因，可略过小鼠→人映射步骤。
- ssGSEA 的 `kcdf` 参数需根据输入矩阵的类型调整（log‑normalized 矩阵用 Gaussian，counts 用 Poisson）。
- 在线查询 CMap/L1000 需要稳定网络，也可在脚本中使用 `signatureSearch` 包进行本地或半自动分析。

## 维护者
（填写你的名字/邮箱）
