# clear workspace
rm(list=ls())
# load packages
library(tidyverse)
# simulate income from a normal distribution
df<-tibble(income=rnorm(100000,40,2))
ggplot(data=df,aes(x=income)) + 
  geom_histogram( bins=100,fill="black", col="white")+
  theme(panel.background = element_blank(),panel.grid.major = element_blank(),
        axis.ticks.x=element_blank(),axis.ticks.y=element_blank())+
  labs(x="Income in thousand £",y="Frequency")
  ggsave("hist1.png")
  


# simulate data from a transformed normal distribution (exp)
df<-tibble(income=exp(rnorm(100000,log(40),0.5)))
summary(df)
ggplot(data=df,aes(x=income)) + 
  geom_histogram( bins=100,fill="black", col="white")+
  theme(panel.background = element_blank(),panel.grid.major = element_blank(),
        axis.ticks.x=element_blank(),axis.ticks.y=element_blank())+
    labs(x="Income in thousand £",y="Frequency")
  ggsave("hist2.png")


# income share
percentiles<-df%>%
  mutate(income_percentile = ntile(income,100))%>%
  group_by(income_percentile)%>%
  summarise(income=sum(income))%>%
  mutate(income_share=income/sum(income))
  ggplot(percentiles,aes(x=income_percentile,y=income_share))+geom_line(size=1.5)

  
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