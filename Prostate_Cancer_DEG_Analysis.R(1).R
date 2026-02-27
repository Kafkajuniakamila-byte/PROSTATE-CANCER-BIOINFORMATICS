> # Install BiocManager jika belum ada
  > if (!requireNamespace("BiocManager", quietly = TRUE))
    +     install.packages("BiocManager")
> 
  > # Install package Bioconductor
  > BiocManager::install(c(
    +   "GEOquery",
    +   "limma",
    +   "affy",
    +   "hgu133plus2.db",
    +   "annotate",
    +   "clusterProfiler",
    +   "org.Hs.eg.db",
    +   "EnhancedVolcano",
    +   "pheatmap"
    + ))
'getOption("repos")' replaces Bioconductor standard repositories, see
'help("repositories", package = "BiocManager")' for details.
Replacement repositories:
  CRAN: https://cran.rstudio.com/
  Bioconductor version 3.22 (BiocManager 1.30.27), R 4.5.2 (2025-10-31 ucrt)
Installing package(s) 'affy', 'hgu133plus2.db', 'EnhancedVolcano'
also installing the dependencies ‘affyio’, ‘preprocessCore’
trying URL 'https://bioconductor.org/packages/3.22/bioc/bin/windows/contrib/4.5/affyio_1.80.0.zip'
trying URL 'https://bioconductor.org/packages/3.22/bioc/bin/windows/contrib/4.5/preprocessCore_1.72.0.zip'
trying URL 'https://bioconductor.org/packages/3.22/bioc/bin/windows/contrib/4.5/affy_1.88.0.zip'
trying URL 'https://bioconductor.org/packages/3.22/bioc/bin/windows/contrib/4.5/EnhancedVolcano_1.28.2.zip'
package ‘affyio’ successfully unpacked and MD5 sums checked
package ‘preprocessCore’ successfully unpacked and MD5 sums checked
package ‘affy’ successfully unpacked and MD5 sums checked
package ‘EnhancedVolcano’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\USER\AppData\Local\Temp\Rtmp6Byf4G\downloaded_packages
installing the source package ‘hgu133plus2.db’
trying URL 'https://bioconductor.org/packages/3.22/data/annotation/src/contrib/hgu133plus2.db_3.13.0.tar.gz'
Content type 'application/x-gzip' length 2240377 bytes (2.1 MB)
downloaded 2.1 MB

* installing *source* package 'hgu133plus2.db' ...
** this is package 'hgu133plus2.db' version '3.13.0'
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (hgu133plus2.db)

The downloaded source packages are in
‘C:\Users\USER\AppData\Local\Temp\Rtmp6Byf4G\downloaded_packages’
Installation paths not writeable, unable to update packages
path: C:/Program Files/R/R-4.5.2/library
packages:
  cluster, foreign, lattice, mgcv, survival
Warning message:
  package(s) not installed when version(s) same as or greater than current; use
`force = TRUE` to re-install: 'GEOquery' 'limma' 'annotate' 'clusterProfiler'
'org.Hs.eg.db' 'pheatmap' 

> library(GEOquery)
Loading required package: Biobase
Loading required package: BiocGenerics
Loading required package: generics

Attaching package: ‘generics’

The following objects are masked from ‘package:base’:
  
  as.difftime, as.factor, as.ordered, intersect, is.element, setdiff,
setequal, union


Attaching package: ‘BiocGenerics’

The following objects are masked from ‘package:stats’:
  
  IQR, mad, sd, var, xtabs

The following objects are masked from ‘package:base’:
  
  anyDuplicated, aperm, append, as.data.frame, basename, cbind,
colnames, dirname, do.call, duplicated, eval, evalq, Filter, Find,
get, grep, grepl, is.unsorted, lapply, Map, mapply, match, mget,
order, paste, pmax, pmax.int, pmin, pmin.int, Position, rank, rbind,
Reduce, rownames, sapply, saveRDS, table, tapply, unique, unsplit,
which.max, which.min

Welcome to Bioconductor

Vignettes contain introductory material; view with
'browseVignettes()'. To cite Bioconductor, see 'citation("Biobase")',
and for packages 'citation("pkgname")'.

Setting options('download.file.method.GEOquery'='auto')
Setting options('GEOquery.inmemory.gpl'=FALSE)
> library(limma)

Attaching package: ‘limma’

The following object is masked from ‘package:BiocGenerics’:
  
  plotMA
> library(affy)
> library(hgu133plus2.db)
Loading required package: AnnotationDbi
Loading required package: stats4
Loading required package: IRanges
Loading required package: S4Vectors

Attaching package: ‘S4Vectors’

The following object is masked from ‘package:utils’:
  
  findMatches

The following objects are masked from ‘package:base’:
  
  expand.grid, I, unname


Attaching package: ‘IRanges’

The following object is masked from ‘package:grDevices’:
  
  windows

Loading required package: org.Hs.eg.db
> library(annotate)
Loading required package: XML
> library(clusterProfiler)

clusterProfiler v4.18.4 Learn more at https://yulab-smu.top/contribution-knowledge-mining/
  
  Please cite:
  
  Guangchuang Yu, Li-Gen Wang, Yanyan Han and Qing-Yu He. clusterProfiler:
  an R package for comparing biological themes among gene clusters. OMICS: A
Journal of Integrative Biology. 2012, 16(5):284-287

Attaching package: ‘clusterProfiler’

The following object is masked from ‘package:AnnotationDbi’:
  
  select

The following object is masked from ‘package:IRanges’:
  
  slice

The following object is masked from ‘package:S4Vectors’:
  
  rename

The following object is masked from ‘package:stats’:
  
  filter
> library(org.Hs.eg.db)
> library(EnhancedVolcano)
Loading required package: ggplot2
Loading required package: ggrepel
> library(pheatmap)
> gse <- getGEO("GSE55945", GSEMatrix = TRUE)
Found 1 file(s)
GSE55945_series_matrix.txt.gz
|--------------------------------------------------|
  |==================================================|
  |--------------------------------------------------|
  |==================================================|
  > data <- gse[[1]]
> exprs_data <- exprs(data)
> pheno_data <- pData(data)
> table(pheno_data$source_name_ch1)

benign tissue 
8 
malignant tissue_TMPRSS2:ERG fusion negative 
7 
malignant tissue_TMPRSS2:ERG fusion positive 
6 
> summary(exprs_data)
GSM1348933          GSM1348934          GSM1348935          GSM1348936       
Min.   :    3.419   Min.   :    3.237   Min.   :    3.523   Min.   :    3.322  
1st Qu.:   14.626   1st Qu.:   13.245   1st Qu.:   16.779   1st Qu.:   15.747  
Median :   45.684   Median :   44.139   Median :   47.792   Median :   47.578  
Mean   :  287.203   Mean   :  295.452   Mean   :  264.513   Mean   :  269.656  
3rd Qu.:  194.862   3rd Qu.:  205.276   3rd Qu.:  171.624   3rd Qu.:  179.804  
Max.   :23528.110   Max.   :24631.660   Max.   :25642.568   Max.   :23302.160  
GSM1348937          GSM1348938          GSM1348939          GSM1348940       
Min.   :    3.283   Min.   :    3.314   Min.   :    2.991   Min.   :    3.328  
1st Qu.:   13.524   1st Qu.:   13.112   1st Qu.:   14.467   1st Qu.:   13.864  
Median :   44.761   Median :   44.650   Median :   38.652   Median :   45.965  
Mean   :  294.861   Mean   :  296.734   Mean   :  285.068   Mean   :  281.512  
3rd Qu.:  204.251   3rd Qu.:  207.131   3rd Qu.:  162.208   3rd Qu.:  204.625  
Max.   :23572.045   Max.   :23770.084   Max.   :28417.197   Max.   :23445.137  
GSM1348941          GSM1348942          GSM1348943          GSM1348944      
Min.   :    3.326   Min.   :    3.308   Min.   :    3.281   Min.   :    3.24  
1st Qu.:   13.352   1st Qu.:   13.717   1st Qu.:   14.341   1st Qu.:   13.60  
Median :   45.802   Median :   45.639   Median :   47.025   Median :   45.08  
Mean   :  296.600   Mean   :  293.148   Mean   :  283.226   Mean   :  290.77  
3rd Qu.:  205.818   3rd Qu.:  199.652   3rd Qu.:  198.817   3rd Qu.:  206.40  
Max.   :23069.385   Max.   :25575.996   Max.   :24974.438   Max.   :22206.86  
GSM1348945          GSM1348946          GSM1348947         GSM1348948       
Min.   :    2.918   Min.   :    3.265   Min.   :    3.46   Min.   :    2.867  
1st Qu.:   14.703   1st Qu.:   14.049   1st Qu.:   14.11   1st Qu.:   12.313  
Median :   43.486   Median :   45.620   Median :   46.23   Median :   46.990  
Mean   :  285.425   Mean   :  288.831   Mean   :  280.04   Mean   :  293.654  
3rd Qu.:  181.555   3rd Qu.:  206.544   3rd Qu.:  200.95   3rd Qu.:  215.968  
Max.   :26024.994   Max.   :24179.460   Max.   :25607.46   Max.   :22689.140  
GSM1348949         GSM1348950          GSM1348951          GSM1348952       
Min.   :    3.21   Min.   :    3.335   Min.   :    3.308   Min.   :    3.172  
1st Qu.:   13.28   1st Qu.:   13.148   1st Qu.:   13.509   1st Qu.:   12.832  
Median :   44.99   Median :   44.970   Median :   45.064   Median :   47.540  
Mean   :  296.18   Mean   :  296.023   Mean   :  292.200   Mean   :  295.738  
3rd Qu.:  206.04   3rd Qu.:  206.163   3rd Qu.:  199.993   3rd Qu.:  208.375  
Max.   :23317.74   Max.   :22243.130   Max.   :22400.830   Max.   :23770.084  
GSM1348953       
Min.   :    3.012  
1st Qu.:   13.798  
Median :   45.027  
Mean   :  292.278  
3rd Qu.:  201.592  
Max.   :26768.490  
> exprs_data <- log2(exprs_data + 1)
> group <- factor(c(rep("Normal",10), rep("Tumor",11)))
> design <- model.matrix(~0 + group)
> colnames(design) <- levels(group)
> design
Normal Tumor
1       1     0
2       1     0
3       1     0
4       1     0
5       1     0
6       1     0
7       1     0
8       1     0
9       1     0
10      1     0
11      0     1
12      0     1
13      0     1
14      0     1
15      0     1
16      0     1
17      0     1
18      0     1
19      0     1
20      0     1
21      0     1
attr(,"assign")
[1] 1 1
attr(,"contrasts")
attr(,"contrasts")$group
[1] "contr.treatment"

> fit <- lmFit(exprs_data, design)
> 
  > contrast.matrix <- makeContrasts(Tumor-Normal, levels=design)
> fit2 <- contrasts.fit(fit, contrast.matrix)
> 
  > fit2 <- eBayes(fit2)
> 
  > deg <- topTable(fit2, adjust="fdr", number=Inf)
> head(deg)
logFC  AveExpr         t      P.Value adj.P.Val        B
224316_at    0.6844975 7.425011  6.036687 4.198388e-06 0.1475856 3.876985
203599_s_at  0.7408943 8.198362  5.912077 5.631198e-06 0.1475856 3.639601
213658_at    0.9063265 7.005173  5.520315 1.432333e-05 0.1475856 2.878268
220004_at    1.7382320 5.106300  5.422681 1.811633e-05 0.1475856 2.685208
1555826_at  -1.0252871 6.741757 -5.369253 2.060877e-05 0.1475856 2.579038
215887_at   -0.6159349 7.494650 -5.350820 2.154715e-05 0.1475856 2.542326
> deg_filtered <- deg[deg$adj.P.Val < 0.05 & abs(deg$logFC) > 1, ]
> upregulated <- deg_filtered[deg_filtered$logFC > 1, ]
> downregulated <- deg_filtered[deg_filtered$logFC < -1, ]
> deg_filtered$GeneSymbol <- mapIds(
  +     hgu133plus2.db,
  +     keys = rownames(deg_filtered),
  +     column = "SYMBOL",
  +     keytype = "PROBEID",
  +     multiVals = "first"
  + )
Error in mapIds_base(x, keys, column, keytype, ..., multiVals = multiVals) : 
  mapIds must have at least one key to match against.

> nrow(deg_filtered)
[1] 0
> deg_filtered <- deg[deg$P.Value < 0.05 & abs(deg$logFC) > 0.5, ]
> nrow(deg_filtered)
[1] 2988
> deg_filtered$GeneSymbol <- mapIds(
  +     hgu133plus2.db,
  +     keys = rownames(deg_filtered),
  +     column = "SYMBOL",
  +     keytype = "PROBEID",
  +     multiVals = "first"
  + )
'select()' returned 1:many mapping between keys and columns
> EnhancedVolcano(deg,
                  +                 lab = rownames(deg),
                  +                 x = 'logFC',
                  +                 y = 'adj.P.Val',
                  +                 pCutoff = 0.05,
                  +                 FCcutoff = 1)
Warning messages:
  1: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
ℹ Please use `linewidth` instead.
ℹ The deprecated feature was likely used in the EnhancedVolcano package.
Please report the issue to the authors.
This warning is displayed once per session.
Call lifecycle::last_lifecycle_warnings() to see where this warning was generated. 
2: The `size` argument of `element_line()` is deprecated as of ggplot2 3.4.0.
ℹ Please use the `linewidth` argument instead.
ℹ The deprecated feature was likely used in the EnhancedVolcano package.
Please report the issue to the authors.
This warning is displayed once per session.
Call lifecycle::last_lifecycle_warnings() to see where this warning was generated. 

> deg_filtered <- deg[deg$P.Value < 0.05 & abs(deg$logFC) > 0.5, ]
> EnhancedVolcano(deg,
                  +                 lab = rownames(deg),
                  +                 x = 'logFC',
                  +                 y = 'P.Value',
                  +                 pCutoff = 0.05,
                  +                 FCcutoff = 0.5)
> EnhancedVolcano(deg,
                  +                 lab = deg$GeneSymbol,
                  +                 x = 'logFC',
                  +                 y = 'P.Value',
                  +                 pCutoff = 0.01,
                  +                 FCcutoff = 1,
                  +                 pointSize = 2.5,
                  +                 labSize = 3)
Error in `geom_text()`:
  ! Problem while setting up geom.
ℹ Error occurred in the 4th layer.
Caused by error in `compute_geom_1()`:
  ! `geom_text()` requires the following missing aesthetics: label.
Run `rlang::last_trace()` to see where the error occurred.

> top50 <- rownames(deg_filtered)[1:50]
> pheatmap(exprs_data[top50, ],
           +          scale="row",
           +          annotation_col=data.frame(Group=group))
Error in check.length("fill") : 
  'gpar' element 'fill' must not be length 0

> ncol(exprs_data)
[1] 21
> length(group)
[1] 21
> top50 <- rownames(deg_filtered)[1:50]
> 
  > annotation_col <- data.frame(Group = group)
> rownames(annotation_col) <- colnames(exprs_data)
> 
  > pheatmap(exprs_data[top50, ],
             +          scale = "row",
             +          annotation_col = annotation_col)
> gene_list <- deg_filtered$GeneSymbol
> gene_entrez <- bitr(gene_list,
                      +                     fromType="SYMBOL",
                      +                     toType="ENTREZID",
                      +                     OrgDb=org.Hs.eg.db)
> ego <- enrichGO(gene         = gene_entrez$ENTREZID,
                  +                 OrgDb        = org.Hs.eg.db,
                  +                 ont          = "BP",
                  +                 pAdjustMethod= "BH",
                  +                 pvalueCutoff = 0.05)
--> No gene can be mapped....
--> Expected input gene ID: 1387,26168,8309,7320,253017,332
--> return NULL...
> 
  > dotplot(ego)
Error: unable to find an inherited method for function ‘dotplot’ for signature ‘object = "NULL"’

> nrow(deg_filtered)
[1] 2988
> head(deg_filtered$GeneSymbol)
NULL
> gene_entrez <- bitr(deg_filtered$GeneSymbol,
                      +                     fromType="SYMBOL",
                      +                     toType="ENTREZID",
                      +                     OrgDb=org.Hs.eg.db)
> 
  > nrow(gene_entrez)
[1] 0
> gene_symbols <- deg_filtered$GeneSymbol
> gene_symbols <- gene_symbols[!is.na(gene_symbols)]
> gene_symbols <- unique(gene_symbols)
> 
  > gene_entrez <- bitr(gene_symbols,
                        +                     fromType="SYMBOL",
                        +                     toType="ENTREZID",
                        +                     OrgDb=org.Hs.eg.db)
> 
  > nrow(gene_entrez)
[1] 0
> head(deg_filtered$GeneSymbol)
NULL
> table(is.na(deg_filtered$GeneSymbol))
< table of extent 0 >
  > keytype = "PROBEID"
> head(rownames(deg_filtered))
[1] "224316_at"   "203599_s_at" "213658_at"   "220004_at"   "1555826_at" 
[6] "215887_at"  
> library(hgu133plus2.db)
> 
  > probe_ids <- rownames(deg_filtered)
> 
  > gene_symbols <- mapIds(hgu133plus2.db,
                           +                        keys = probe_ids,
                           +                        column = "SYMBOL",
                           +                        keytype = "PROBEID",
                           +                        multiVals = "first")
'select()' returned 1:many mapping between keys and columns
> 
  > head(gene_symbols)
224316_at 203599_s_at   213658_at   220004_at  1555826_at   215887_at 
NA      "WBP4"          NA     "DDX43"     "BIRC5"    "ZNF277" 
> gene_symbols <- gene_symbols[!is.na(gene_symbols)]
> gene_symbols <- unique(gene_symbols)
> 
  > length(gene_symbols)
[1] 1970
> library(clusterProfiler)
> library(org.Hs.eg.db)
> 
  > gene_entrez <- bitr(gene_symbols,
                        +                     fromType = "SYMBOL",
                        +                     toType = "ENTREZID",
                        +                     OrgDb = org.Hs.eg.db)
'select()' returned 1:1 mapping between keys and columns
> 
  > nrow(gene_entrez)
[1] 1970
> ego <- enrichGO(gene          = gene_entrez$ENTREZID,
                  +                 OrgDb         = org.Hs.eg.db,
                  +                 ont           = "BP",
                  +                 pvalueCutoff  = 0.1)
> 
  > head(ego)
ID                 Description GeneRatio   BgRatio RichFactor
GO:0003012 GO:0003012       muscle system process   98/1653 485/18860  0.2020619
GO:0031589 GO:0031589     cell-substrate adhesion   78/1653 369/18860  0.2113821
GO:0006936 GO:0006936          muscle contraction   75/1653 372/18860  0.2016129
GO:0042692 GO:0042692 muscle cell differentiation   82/1653 441/18860  0.1859410
GO:0055001 GO:0055001     muscle cell development   48/1653 206/18860  0.2330097
GO:0007409 GO:0007409                axonogenesis   84/1653 472/18860  0.1779661
FoldEnrichment   zScore       pvalue     p.adjust       qvalue
GO:0003012       2.305437 9.027264 2.349201e-15 1.343508e-11 1.128358e-11
GO:0031589       2.411777 8.488718 1.529873e-13 4.374672e-10 3.674111e-10
GO:0006936       2.300314 7.850874 5.332790e-12 1.016608e-08 8.538078e-09
GO:0042692       2.121505 7.386364 4.257505e-11 6.087168e-08 5.112367e-08
GO:0055001       2.658538 7.418502 2.360503e-10 2.318102e-07 1.946880e-07
GO:0007409       2.030515 7.027504 2.432000e-10 2.318102e-07 1.946880e-07
geneID
GO:0003012 5465/55959/408/800/7168/4638/7169/23336/7871/114907/857/4629/5144/10611/148/54795/9475/5058/4660/1837/801/93649/6332/1908/152/57158/23327/493/775/9215/1264/3778/11280/6546/2775/2628/2316/6769/1756/4636/477/25802/2257/1674/274/51676/10398/23493/10335/5350/140628/5997/8082/26509/2146/5592/10052/818/3760/1136/6326/781/4089/2308/124093/776/59/3764/3673/2309/5286/2982/816/7171/309/6865/4211/32/6444/6833/6330/287/2946/3488/5578/219931/5733/1909/3572/8912/3757/6525/5028/1291/2934/6442/23704/7124
GO:0031589                                                                                      11037/6251/7414/2047/55742/673/90102/10979/10580/11149/4811/5747/284/3204/23189/9475/10630/8613/8829/81848/9358/3696/811/5295/23603/7264/3694/2316/55966/2824/5340/1029/8573/87/3678/9200/613/5212/2042/83700/596/4739/1308/25890/84962/8322/84168/8324/3680/8910/3690/1305/9480/30008/2294/11117/2633/4059/79625/3673/302/133584/7205/11170/3679/146183/55679/1845/29780/10018/3672/3912/6385/2192/6237/10174/558/10391
GO:0006936                                                                                                                      55959/800/7168/4638/7169/23336/7871/857/4629/5144/148/54795/9475/4660/1837/801/93649/6332/1908/152/57158/23327/493/775/9215/1264/3778/11280/6546/2775/2316/6769/1756/4636/477/25802/2257/1674/274/10398/10335/5350/5997/8082/26509/5592/10052/3760/1136/6326/781/124093/776/59/3764/3673/5286/2982/7171/309/6865/6444/6330/287/2946/219931/5733/1909/8912/3757/6525/2934/6442/23704/7124
GO:0042692                                                           5465/6443/113622/1465/64091/858/11149/7168/4811/55909/4629/4204/10611/148/5058/3192/9474/5239/1073/93649/80206/811/93166/9215/2318/57462/6546/1048/10938/1756/87/4775/25802/274/51177/51676/10398/596/23493/10290/348093/5997/2146/5592/8324/51804/84525/170689/4773/4089/168620/11155/30008/2294/9444/1466/3764/50507/10529/3280/11096/23345/84033/9518/80000/4211/6444/287/983/2254/4776/650/3488/2263/1909/3912/1827/30846/8912/55544/1291/55897
GO:0055001                                                                                                                                                                                                                                                       5465/6443/113622/1465/858/11149/7168/55909/4629/10611/148/5058/3192/9474/5239/1073/80206/9215/2318/57462/6546/1756/87/25802/274/51676/10398/596/23493/5997/5592/51804/4773/4089/11155/30008/1466/10529/3280/84033/4211/6444/287/983/4776/1909/1827/1291
GO:0007409                                                       9706/5063/7414/2047/4131/23022/8609/673/8543/5747/1600/1272/9423/5058/55740/107/2044/8829/79633/7042/3730/288/1908/23111/8153/80031/11280/9037/2045/8851/9331/4882/91624/10512/25894/2676/115557/9241/4804/10090/2042/84189/9638/10752/596/4130/60/1952/4693/54413/5592/7473/9201/56978/10479/348/6285/4089/4915/2115/8828/10371/9378/4692/4744/885/284656/6585/153478/4137/2737/57216/4747/5781/2051/2263/5578/1909/4135/4753/151449/26050/7976/347733
Count
GO:0003012    98
GO:0031589    78
GO:0006936    75
GO:0042692    82
GO:0055001    48
GO:0007409    84
> dotplot(ego, showCategory = 15)
> go_result <- as.data.frame(ego)
> write.csv(go_result, "GO_results.csv", row.names = FALSE)
> ekegg <- enrichKEGG(gene         = gene_entrez$ENTREZID,
                      +                     organism     = "hsa",
                      +                     pvalueCutoff = 0.05)
Reading KEGG annotation online: "https://rest.kegg.jp/link/hsa/pathway"...
Reading KEGG annotation online: "https://rest.kegg.jp/list/pathway/hsa"...
> 
  > head(ekegg)
category                     subcategory
hsa04820                   Cellular Processes                   Cell motility
hsa05414                       Human Diseases          Cardiovascular disease
hsa05410                       Human Diseases          Cardiovascular disease
hsa04510                   Cellular Processes Cellular community - eukaryotes
hsa05034                       Human Diseases            Substance dependence
hsa04022 Environmental Information Processing             Signal transduction
ID                  Description GeneRatio  BgRatio RichFactor
hsa04820 hsa04820 Cytoskeleton in muscle cells    59/824 233/9564  0.2532189
hsa05414 hsa05414       Dilated cardiomyopathy    32/824 105/9564  0.3047619
hsa05410 hsa05410  Hypertrophic cardiomyopathy    30/824  99/9564  0.3030303
hsa04510 hsa04510               Focal adhesion    46/824 203/9564  0.2266010
hsa05034 hsa05034                   Alcoholism    43/824 191/9564  0.2251309
hsa04022 hsa04022   cGMP-PKG signaling pathway    39/824 166/9564  0.2349398
FoldEnrichment   zScore       pvalue     p.adjust       qvalue
hsa04820       2.939060 9.200471 1.257532e-14 4.313334e-12 3.282820e-12
hsa05414       3.537309 8.026947 9.689671e-11 1.661779e-08 1.264757e-08
hsa05410       3.517211 7.730042 4.381623e-10 5.009656e-08 3.812781e-08
hsa04510       2.630111 7.207907 6.415973e-10 5.501697e-08 4.187267e-08
hsa05034       2.613048 6.914006 2.898472e-09 1.988352e-07 1.513308e-07
hsa04022       2.726898 6.891408 4.447432e-09 2.542449e-07 1.935023e-07
geneID
hsa04820 7414/6443/171024/1465/7168/4811/7169/4629/72/10611/85301/6711/1837/3696/288/1288/2318/3694/9672/23002/2273/1729/1756/4636/477/3678/25802/8572/1674/56776/10398/60/8082/9260/270/3680/4001/8910/3690/11155/1466/3673/10529/23345/7171/1292/84033/6444/3679/23500/287/2200/3672/6385/2192/1291/1286/6383/6442
hsa05414                                                                                                                                                    6443/7168/7169/107/1837/3696/7042/775/111/3694/6546/1756/3678/1674/60/5350/8082/7043/781/3680/8910/3690/776/3673/7171/6444/3679/153/3672/6442/7124/93589
hsa05410                                                                                                                                                           6443/7168/7169/1837/3696/7042/775/3694/6546/1756/3678/1674/5563/60/8082/7043/5565/781/3680/8910/3690/776/3673/7171/6444/3679/3672/6442/7124/93589
hsa04510                                                                           5063/7414/55742/673/858/5906/4638/5747/857/9475/5058/4660/8395/3696/1288/5295/3694/2316/1729/87/4636/3371/3678/5579/56034/10398/596/60/894/4659/53358/5228/3680/3690/3909/3673/1292/3918/3679/29780/5578/3672/3912/4233/1291/1286
hsa05034                                                                                 8336/8339/8347/8357/8351/8360/3012/673/8367/8366/85236/8362/8365/8345/54145/8346/8342/8329/8363/801/8344/8331/3017/111/6571/9586/8337/2775/8343/8330/810/3013/92815/4129/10681/64764/53358/4915/10645/90993/6531/55766/2786
hsa04022                                                                                                                  4638/3708/148/9475/107/801/7225/152/493/775/111/3778/9586/6546/4882/4880/4775/477/291/3779/10398/810/10335/5350/5997/5592/64764/3667/4659/4773/90993/776/3764/2767/2982/8654/153/4776/1909
Count
hsa04820    59
hsa05414    32
hsa05410    30
hsa04510    46
hsa05034    43
hsa04022    39
> dotplot(ekegg, showCategory = 15)
> kegg_result <- as.data.frame(ekegg)
> write.csv(kegg_result, "KEGG_results.csv", row.names = FALSE)
> head(go_result[, c("Description","p.adjust")])
Description     p.adjust
GO:0003012       muscle system process 1.343508e-11
GO:0031589     cell-substrate adhesion 4.374672e-10
GO:0006936          muscle contraction 1.016608e-08
GO:0042692 muscle cell differentiation 6.087168e-08
GO:0055001     muscle cell development 2.318102e-07
GO:0007409                axonogenesis 2.318102e-07
> n_up <- sum(deg_filtered$logFC > 0.5)
> n_down <- sum(deg_filtered$logFC < -0.5)
> 
  > n_up
[1] 2012
> n_down
[1] 976
> top10 <- deg_filtered[order(deg_filtered$P.Value), ][1:10, ]
> top10[, c("GeneSymbol","logFC","P.Value")]
Error in `[.data.frame`(top10, , c("GeneSymbol", "logFC", "P.Value")) : 
  undefined columns selected

> colnames(deg_filtered)
[1] "logFC"     "AveExpr"   "t"         "P.Value"   "adj.P.Val" "B"        
> deg_filtered$GeneSymbol <- mapIds(hgu133plus2.db,
                                    +                                   keys = rownames(deg_filtered),
                                    +                                   column = "SYMBOL",
                                    +                                   keytype = "PROBEID",
                                    +                                   multiVals = "first")
'select()' returned 1:many mapping between keys and columns
> colnames(deg_filtered)
[1] "logFC"      "AveExpr"    "t"          "P.Value"    "adj.P.Val"  "B"         
[7] "GeneSymbol"
> top10 <- deg_filtered[order(deg_filtered$P.Value), ][1:10, ]
> 
  > top10[, c("GeneSymbol","logFC","P.Value")]
GeneSymbol      logFC      P.Value
224316_at         <NA>  0.6844975 4.198388e-06
203599_s_at       WBP4  0.7408943 5.631198e-06
213658_at         <NA>  0.9063265 1.432333e-05
220004_at        DDX43  1.7382320 1.811633e-05
1555826_at       BIRC5 -1.0252871 2.060877e-05
215887_at       ZNF277 -0.6159349 2.154715e-05
217753_s_at      RPS26 -0.7384054 2.335883e-05
229222_at        ACSS3  1.3092940 2.394076e-05
207528_s_at    SLC7A11 -0.9907224 2.664834e-05
204063_s_at       ULK2  0.5672282 2.873869e-05
> top10[, c("GeneSymbol","logFC","P.Value")]
GeneSymbol      logFC      P.Value
224316_at         <NA>  0.6844975 4.198388e-06
203599_s_at       WBP4  0.7408943 5.631198e-06
213658_at         <NA>  0.9063265 1.432333e-05
220004_at        DDX43  1.7382320 1.811633e-05
1555826_at       BIRC5 -1.0252871 2.060877e-05
215887_at       ZNF277 -0.6159349 2.154715e-05
217753_s_at      RPS26 -0.7384054 2.335883e-05
229222_at        ACSS3  1.3092940 2.394076e-05
207528_s_at    SLC7A11 -0.9907224 2.664834e-05
204063_s_at       ULK2  0.5672282 2.873869e-05
> up_genes <- deg_filtered[deg_filtered$logFC > 0.5, ]
> up_symbols <- na.omit(up_genes$GeneSymbol)
> 
  > up_entrez <- bitr(unique(up_symbols),
                      +                   fromType="SYMBOL",
                      +                   toType="ENTREZID",
                      +                   OrgDb=org.Hs.eg.db)
'select()' returned 1:1 mapping between keys and columns
> 
  > ego_up <- enrichGO(up_entrez$ENTREZID,
                       +                    OrgDb=org.Hs.eg.db,
                       +                    ont="BP",
                       +                    pvalueCutoff=0.05)
> 
  > dotplot(ego_up, showCategory=10)
> down_genes <- deg_filtered[deg_filtered$logFC < -0.5, ]
> down_symbols <- na.omit(down_genes$GeneSymbol)
> 
  > down_entrez <- bitr(unique(down_symbols),
                        +                     fromType="SYMBOL",
                        +                     toType="ENTREZID",
                        +                     OrgDb=org.Hs.eg.db)
'select()' returned 1:1 mapping between keys and columns
> 
  > ego_down <- enrichGO(down_entrez$ENTREZID,
                         +                      OrgDb=org.Hs.eg.db,
                         +                      ont="BP",
                         +                      pvalueCutoff=0.05)
> 
  > dotplot(ego_down, showCategory=10)
> write.csv(deg_filtered, "DEG_results.csv")
> write.csv(top10, "Top10_genes.csv")
> gene_symbols <- na.omit(deg_filtered$GeneSymbol)
> gene_symbols <- unique(gene_symbols)
> 
  > write.table(gene_symbols,
                +             file="gene_list_STRING.txt",
                +             quote=FALSE,
                +             row.names=FALSE,
                +             col.names=FALSE)
> top_genes <- deg_filtered[order(deg_filtered$P.Value), ][1:300, ]
> 
  > gene_symbols <- na.omit(top_genes$GeneSymbol)
> gene_symbols <- unique(gene_symbols)
> 
  > write.table(gene_symbols,
                +             file="Top300_STRING.txt",
                +             quote=FALSE,
                +             row.names=FALSE,
                +             col.names=FALSE)
> > # Install BiocManager jika belum ada
  Error: unexpected '>' in ">"

> hub_genes <- c("H3C10","H3C4","H4C2","H4C4","H4C5",
                 +                "H4C12","H4C8","H2AC17","H2AC8","H2BC4")
> library(clusterProfiler)
> library(org.Hs.eg.db)
> 
  > hub_entrez <- bitr(hub_genes,
                       +                    fromType = "SYMBOL",
                       +                    toType = "ENTREZID",
                       +                    OrgDb = org.Hs.eg.db)
'select()' returned 1:1 mapping between keys and columns
> 
  > hub_entrez
SYMBOL ENTREZID
1   H3C10     8357
2    H3C4     8351
3    H4C2     8366
4    H4C4     8360
5    H4C5     8367
6   H4C12     8362
7    H4C8     8365
8  H2AC17     8336
9   H2AC8     3012
10  H2BC4     8347
> ego_hub <- enrichGO(gene          = hub_entrez$ENTREZID,
                      +                     OrgDb         = org.Hs.eg.db,
                      +                     ont           = "BP",
                      +                     pvalueCutoff  = 0.1)
> 
  > head(ego_hub)
ID                                            Description
GO:0061644 GO:0061644    protein localization to CENP-A containing chromatin
GO:0006334 GO:0006334                                    nucleosome assembly
GO:0034728 GO:0034728                                nucleosome organization
GO:0071459 GO:0071459 protein localization to chromosome, centromeric region
GO:0065004 GO:0065004                           protein-DNA complex assembly
GO:0071824 GO:0071824                       protein-DNA complex organization
GeneRatio   BgRatio RichFactor FoldEnrichment   zScore       pvalue
GO:0061644      6/10  18/18860 0.33333333      628.66667 61.36284 6.228316e-17
GO:0006334      8/10 120/18860 0.06666667      125.73333 31.57127 9.437566e-17
GO:0034728      8/10 140/18860 0.05714286      107.77143 29.20585 3.347130e-16
GO:0071459      6/10  41/18860 0.14634146      276.00000 40.60037 1.502258e-14
GO:0065004      8/10 245/18860 0.03265306       61.58367 21.98421 3.183788e-14
GO:0071824      8/10 265/18860 0.03018868       56.93585 21.12121 6.005856e-14
p.adjust       qvalue                                  geneID Count
GO:0061644 1.321259e-15 2.483570e-16           8366/8360/8367/8362/8365/3012     6
GO:0006334 1.321259e-15 2.483570e-16 8357/8351/8366/8360/8367/8362/8365/8347     8
GO:0034728 3.123988e-15 5.872158e-16 8357/8351/8366/8360/8367/8362/8365/8347     8
GO:0071459 1.051580e-13 1.976655e-14           8366/8360/8367/8362/8365/3012     6
GO:0065004 1.782921e-13 3.351355e-14 8357/8351/8366/8360/8367/8362/8365/8347     8
GO:0071824 2.802733e-13 5.268295e-14 8357/8351/8366/8360/8367/8362/8365/8347     8
> dotplot(ego_hub, showCategory = 10)
> ekegg_hub <- enrichKEGG(gene         = hub_entrez$ENTREZID,
                          +                         organism     = "hsa",
                          +                         pvalueCutoff = 0.1)
> 
  > head(ekegg_hub)
category           subcategory       ID
hsa05322                 Human Diseases        Immune disease hsa05322
hsa05034                 Human Diseases  Substance dependence hsa05034
hsa04613             Organismal Systems         Immune system hsa04613
hsa05203                 Human Diseases      Cancer: overview hsa05203
hsa03082 Genetic Information Processing            Chromosome hsa03082
hsa04217             Cellular Processes Cell growth and death hsa04217
Description GeneRatio  BgRatio RichFactor
hsa05322            Systemic lupus erythematosus     10/10 144/9564 0.06944444
hsa05034                              Alcoholism     10/10 191/9564 0.05235602
hsa04613 Neutrophil extracellular trap formation     10/10 196/9564 0.05102041
hsa05203                    Viral carcinogenesis      6/10 205/9564 0.02926829
hsa03082      ATP-dependent chromatin remodeling      2/10 117/9564 0.01709402
hsa04217                             Necroptosis      2/10 168/9564 0.01190476
FoldEnrichment    zScore       pvalue     p.adjust qvalue
hsa05322       66.41667 25.588726 4.369881e-19 3.495905e-18     NA
hsa05034       50.07330 22.162925 7.978507e-18 2.772147e-17     NA
hsa04613       48.79592 21.872573 1.039555e-17 2.772147e-17     NA
hsa05203       27.99220 12.638772 1.763002e-08 3.526004e-08     NA
hsa03082       16.34872  5.404090 6.262468e-03 1.001995e-02     NA
hsa04217       11.38571  4.393635 1.258223e-02 1.677631e-02     NA
geneID Count
hsa05322 8357/8351/8366/8360/8367/8362/8365/8336/3012/8347    10
hsa05034 8357/8351/8366/8360/8367/8362/8365/8336/3012/8347    10
hsa04613 8357/8351/8366/8360/8367/8362/8365/8336/3012/8347    10
hsa05203                     8366/8360/8367/8362/8365/8347     6
hsa03082                                         8336/3012     2
hsa04217                                         8336/3012     2
> dotplot(ekegg_hub, showCategory = 10)