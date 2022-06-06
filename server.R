library(dplyr)
library(shiny)
library(plotly)
library(ggplot2)

source("chart_1.R")

data1 <- read.csv("data/2021-2022 NBA Player Stats - Playoffz.csv")
data2 <- read.csv("data/nba3_2021_22_corrections.csv")

server <- function(input, output) {
   output$plot <- renderPlotly(
       {
          get_pca(input$PCA) 
       }
   )
   output$scatter_plot <- renderPlotly({
      data1<- data1 %>% filter(Pos %in% input$user_category)
       
       scatter_plot <- ggplot(data = data1) +
           geom_point(mapping = aes(x = Age, y = PTS, color = Pos)) + geom_smooth(aes(x= Age , y = PTS), se = FALSE) + 
           labs(title = "Points Scored Based on Age and Position", x = "Age", y = "Average Points Scored per Game", color = "Selevted Position")
       
       scatter_plotly_plot <- ggplotly(scatter_plot)
       
       return(scatter_plotly_plot)
   })
   output$description <- renderText({
       
       if (input$user_category== "C"){
           return("Center")
       }
       else if(input$user_category == "SG"){
           return("Shooting Guard")
       }
       else if(input$user_category == "PG"){
           return("Point Guard")
       }
       else if(input$user_category == "SF"){
           return("Small FOrward")
       }
       else if(input$user_category == "PF"){
           return("Power Forward")
       }
   })
   output$scatter_plotl <- renderPlotly({
     plotThree <- ggplot(data2filter) + 
       geom_point(mapping = aes(x = Age, y = pct3PA, color = Pos)) +
       labs(x = "Age", y = "3pt attempts taken per game", color = "User selected position")
     
     turnToPlotly <- ggplotly(scatter_plot)
     
     return(turnToPlotly)
   })
}
