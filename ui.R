

library(shiny)
library(shinydashboard)
shinyUI (fluidPage((titlePanel("House Pricing Dataset")),
                   tabPanel("Selection",
                            sidebarLayout(
                              sidebarPanel(
                                
                                #selectInput( "Garage_Area","Garage Area(in Sqt):",choices = data$GarageArea),
                                selectInput( "Fireplace",
                                             "Number of Fireplaces:",
                                             choices = data$Fireplaces,selected = NULL),
                                sliderInput("Sale_Price","Select Sale Price Range of the House",min=34900,
                                            max=755000,value=c(50,100)),
                                radioButtons("Building_type",label="Select Building Type:",
                                             choices = levels(data$BldgType),
                                             selected = NULL,inline = FALSE, width = NULL, choiceNames = NULL,
                                             choiceValues = NULL)
                                
                              ),
                              
                              mainPanel(
                                tabsetPanel(type="tab",
                                            tabPanel("Data",tableOutput("Data")),
                                            tabPanel("Summary",verbatimTextOutput("Summary")),
                                            tabPanel("Bar Graph",plotOutput("Bar_Graph")),
                                            tabPanel("ScatterPlot",plotOutput("Scatter_Plot"))
                                            
                                            
                                            
                                )
                              )
                            )
                   )
)
)
