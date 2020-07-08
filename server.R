library(shiny)
library(shinydashboard)
library(dplyr)
library(crosstalk)
library(ggplot2)
library(plotly)
library(tidyverse)
library(scales)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  react_data <- reactive({
    House_Style<- data$HouseStyle
    Neighborhood <- data$Neighborhood
    Building_type<- data$BldgType
    Sale_Price <- data$SalePrice
    Year <- data$YearBuilt
    Id<- data$Id
    Overall_quality<- data$OverallQual
    #Garage_area<- data$GarageArea
    #Garage_Type<- data$GarageType
    Fireplace<- data$Fireplaces
    final_1 <- data.frame(Id,House_Style,Neighborhood,Sale_Price,Year,Overall_quality,Fireplace,Building_type)
    final_1 <- na.omit(final_1)
    stateFilter <-filter(final_1,Building_type ==input$Building_type & Fireplace == input$Fireplace &
                           Sale_Price>=input$Sale_Price)
    
  })
  
  output$Data<- renderTable({
    react_data()
  })  
  
  output$Summary <- renderPrint({
    summary(react_data())
  })
  
  output$Bar_Graph  <- renderPlot({
    shared_data <- SharedData$new(react_data)
    g<- ggplot(shared_data, aes(x=House_Style, y=Overall_quality))+
      geom_bar(stat="identity",fill="steelblue")+coord_flip()+theme_classic()+
      ggtitle("House Pricing:Overall Quality according to House Style")+
      theme(plot.title = element_text(lineheight=9, face="bold"))
    print(g)
    
    
  })
  output$Scatter_Plot  <- renderPlot({
    shared_data <- SharedData$new(react_data)
    g<- ggplot(shared_data, aes(x=Sale_Price, y=Year))+
      geom_point(stat="identity",fill="purple")+coord_flip()+theme_classic()+
      ggtitle("House Pricing:  Selling Price according to Year")+
      theme(plot.title = element_text(lineheight=9, face="bold"))+
      scale_y_continuous(labels = comma)+scale_x_continuous(labels = comma)
    
    print(g)
    
  })
  
  
  
})
