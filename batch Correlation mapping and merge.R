library(openxlsx)
dev.off()
rm(list=ls())
a<- openxlsx::read.xlsx('相关性分析.xlsx',1,rowNames=TRUE,colNames = TRUE)



num<- seq(1,length(a),3)
myfunction<- function (i,a){
  
    b=i+2
    rt<- a[,i:b]
    M <- cor(rt)
    ggcorrplot(M,type = "upper",tl.cex=8)+
      theme(legend.text = element_text(size = 7),
            legend.key.size=unit(3,'mm'),
            legend.title = element_text(size=7))
   
}

p1<- lapply(num, myfunction,a)
library(cowplot)
plot_grid(plotlist=p1,nrow =4,labels = LETTERS[1:16],label_size = 7)
