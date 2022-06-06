library(dplyr)
library(shiny)
library(plotly)
library(ggplot2)

source("chart_1.R")

server <- function(input, output) {
   output$plot <- renderPlotly(
       {
          get_pca(input$PCA) 
       }
   )
}