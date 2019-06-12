## sample of what the table looks like

     GroupID                Category       Term                                             Description      LogP Log.q.value.
1  1_Summary GO Biological Processes GO:0016054                          organic acid catabolic process -2.968393   0.00000000
2  2_Summary GO Biological Processes GO:1903532                positive regulation of secretion by cell -2.583714   0.00000000
3  3_Summary GO Biological Processes GO:0043009                          chordate embryonic development -2.053961   0.00000000
4   2_Member GO Biological Processes GO:0099519               dense core granule cytoskeletal transport -3.311542  -0.04275441
5   2_Member GO Biological Processes GO:0060025                         regulation of synaptic activity -2.834613  -0.04275441
6  1_Summary GO Biological Processes GO:0051056 regulation of small GTPase mediated signal transduction -3.458737   0.00000000
7   2_Member GO Biological Processes GO:0050848                regulation of calcium-mediated signaling -3.025228   0.00000000
8  3_Summary GO Biological Processes GO:0032970              regulation of actin filament-based process -3.191542   0.00000000
9  5_Summary GO Biological Processes GO:0060485                                  mesenchyme development -2.161390   0.00000000
10 1_Summary GO Biological Processes GO:0007435                            salivary gland morphogenesis -4.291400  -0.31108379
11  2_Member GO Biological Processes GO:0021917                    somatic motor neuron fate commitment -3.463333  -0.31108379
12  1_Member GO Biological Processes GO:0006935                                              chemotaxis -3.058766  -0.31108379
13  2_Member GO Biological Processes GO:0061072                                      iris morphogenesis -2.509614  -0.21880009
14 3_Summary GO Biological Processes GO:0090292            nuclear matrix anchoring at nuclear membrane -2.986342  -0.31108379
15 6_Summary GO Biological Processes GO:0019388                             galactose catabolic process -2.463921  -0.18909608
16 5_Summary GO Biological Processes GO:0015886                                          heme transport -2.509614  -0.21880009
   InTerm_InList                    Genes                     Symbols            Type
1          3/267 3373,6342,8372,3981,9446 HYAL1,SCP2,HYAL3,LIG4,GSTO1    Diencephalon
2          3/364           43,8372,399687           ACHE,HYAL3,MYO18A    Diencephalon
3          3/564          3373,3981,10395             HYAL1,LIG4,DLC1    Diencephalon
4            1/1                    55638                        SYBU Cerebral_Cortex
5            1/3                    55638                        SYBU Cerebral_Cortex
6          3/307     3084,3925,58480,2009        NRG1,STMN1,RHOU,EML1 Cerebral_Cortex
7           2/98                3084,5144                  NRG1,PDE4D Cerebral_Cortex
8          3/379          3925,5144,58480            STMN1,PDE4D,RHOU Cerebral_Cortex
9          2/270               3084,60412                  NRG1,EXOC4 Cerebral_Cortex
10          2/32         5080,10371,57509           PAX6,SEMA3A,MTUS1      Cerebellum
11           1/1                     5080                        PAX6      Cerebellum
12         3/601         5080,10371,57509           PAX6,SEMA3A,MTUS1      Cerebellum
13           1/9                     5080                        PAX6      Cerebellum
14           1/3                    23345                       SYNE1      Cerebellum
15          1/10                     5236                        PGM1      Cerebellum
16           1/9                     9429                       ABCG2      Cerebellum


## plotting code
library(ggplot2)
ggplot(bp, aes(x=-1*LogP, y=factor(Description))) + 
       geom_point(aes(size=-1*LogP,color=Type)) +
       facet_wrap(~Type) +
       xlim(1.2, 4.7) +
       scale_size(range = c(3,6.6)) +
       theme_bw() +
       theme(axis.text.y = element_text(size = 12))

## Scatter plot
save.image("~/Go/Gop/Btissue_session.RData")
load("~/ennan/hNSC_and_Somatics/Scr_SATS/geneExprDistribution/scatter/scatter.RData")
      
p2 + geom_point(aes(F2$NSC_FPKM, F2$Somatic_FPKM), color="#FF6A6A", size=2.3) +
     geom_point(aes(Fls2$NSC_FPKM, Fls2$Somatic_FPKM), size= 1.2, color="orange") +
     theme_bw() +
     scale_y_continuous(breaks = c(0,2,4,6,8,10)) +
     scale_x_continuous(breaks = c(0,2,4,6,8,10)) +
     coord_cartesian(ylim = c(0,10), xlim = c(0,10))
