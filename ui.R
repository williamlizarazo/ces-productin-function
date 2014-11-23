library(ggplot2)
library(data.table)
library(rCharts)
library(reshape2)
library(markdown)


library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("CES Production Function"),
        sidebarPanel(
                
                sliderInput("alpha","alpha",
                min=0, max=1, value=.1, step=.1),               
#                  sliderInput("gamma","gamma:",
#                             min=0, max=100, value=.5, step=.1),
                sliderInput("lambda","lambda:",
                             min=0, max=1, value=.5, step=.1),
                sliderInput("rho","rho:",
                             min=0.01, max=1, value=.5, step=.1),
  
                sliderInput("p1","Rotate Horizontal:",
                            min=0, max=180, value=40, step=10),
                sliderInput("p2","Rotate Vertical:",
                            min=0, max=180, value=20, step=10)
        ),
        mainPanel( plotOutput("p"),
                   plotOutput('con'))  
))
