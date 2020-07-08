
############ Setting up the Directory ################################################################

getwd()
setwd("C:/Users/sindh/Desktop/2nd Quarter/Data Communication n Visualization/Week 5 Assignment/HousePrice_Dashbaord")

########### Reading House_Price.csv File ############################################################
data<- read.csv("C:/Users/sindh/Desktop/2nd Quarter/Data Communication n Visualization/Week 5 Assignment/HousePrice_Dashbaord/House_Price_data.csv")
head(data)
View(data)

############## Filtering out variables ##############################################################
SalePrice<- data$SalePrice
House_Style<- data$HouseStyle
Year<- data$YearBuilt
Overall_quality<- data$OverallQual
BldgType<- data$BldgType
Neighbour<- data$Neighborhood

##################### Setting up Data Frame ########################################################
df<- data.frame(Overall_quality,SalePrice,House_Style,Year,BldgType,Neighbour)
head(df)

df<-na.omit(df)
levels(df$House_Style)
levels(df$BldgType)

################ Changing all Categorical Variables into Numeric ###################################
df$House_Style<- as.numeric(df$House_Style)
head(df$House_Style)
tail(df$House_Style)
head(df)
factor(df$House_Style)

df$BldgType <- as.numeric(df$BldgType)
head_bldgtype<- head(df$BldgType)
head(df)
factor(df$BldgType)


############ K-means Clustering ##################################################################

n_clusters<- 5
clusters<- kmeans(df[,2:5],n_clusters,nstart = 30)
head(clusters)

clusters<-clusters$cluster
clusters<- factor(clusters)
print(table(df$Neighbour,clusters))
print(table(df$Year,clusters))

####################### Plotting the Cluster #####################################################

library(ggplot2)
library(plotly)
ggplot<- ggplot(data = df,aes(x= Year,y=SalePrice,
                              colour= clusters))+
geom_point(data = df,aes(),size=3)+
  theme_classic()+
  theme(legend.position = "right")+theme(legend.background = element_rect(fill="lightpink", 
  size=0.5, linetype="solid"))+ggtitle("House Pricing Plot: Year vs Sale Price of House")
                                                                    
ggplotly(ggplot)

install.packages("ggthemes")
library(ggthemes)

ggplot <- ggplot(data = df,aes(x= House_Style,y=Overall_quality,colour=clusters))+coord_flip()+
        geom_bar(stat="identity",data = df,aes(),size=1)+
       theme_classic()+theme(legend.position = "right")+
      theme(legend.background = element_rect(fill="lightyellow"))+
        ggtitle("House Pricing Plot: Overall Qualiity vs House Style")
      

ggplotly(ggplot)
