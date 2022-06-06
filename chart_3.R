library(ggplot2)
library(plotly)
library(shiny)
library(dplyr)
library(rsconnect)
library(tidyverse)

# read data
data2 <- read.csv("data/nba3_2021_22_corrections.csv")

# graph
server <- function(input, output){
  output$scatter_plotl <- renderPlotly({
    plotThree <- ggplot(data2filter) + 
      geom_point(mapping = aes(x = Age, y = pct3PA, color = Pos)) +
      labs(x = "Age", y = "3pt attempts taken per game", color = "User selected position")
    
    turnToPlotly <- ggplotly(scatter_plot)
    
    return(turnToPlotly)
  })
}
