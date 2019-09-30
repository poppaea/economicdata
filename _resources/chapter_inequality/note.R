---
output: html_notebook
---
```{r}
  # read data
library(tidyverse)
# load data from the world inequality database
df<-read_csv("https://www.dropbox.com/s/3lgkhahh37dazzv/wid.csv?dl=1")
# select UK
df_uk<-df%>%filter(Country=="United Kingdom")
# Create line chart of income shares
ggplot(df_uk,aes(x=Year,y=incomeshare,colour=measure))+
  geom_line(size=1.5)+ylim(0,0.3)+
  theme(panel.background = element_blank(),panel.grid.major = element_blank(),legend.position="top",
  axis.ticks.x=element_blank(),axis.ticks.y=element_blank(),legend.key=element_blank())+
  labs(x="Year",y="Income share", colour=" ", title="Income shares in the UK", 
       subtitle="Source: World Inequality Database")+
  scale_color_manual(labels = c("Bottom 50%", "Top 1%"), values=c("red","blue"))
```
