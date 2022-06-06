library(ggplot2)
library(plotly)
library(shiny)
library(dplyr)
library(rsconnect)
library(tidyverse)

data1 <- read.csv("data/2021-2022 NBA Player Stats - Playoffz.csv")

#plot1 <- ggplot(data2, aes(x=Pos, y=PTS, color=Pos)) +
   # geom_beeswarm(cex=0.9, na.rm=TRUE) + ylim(0, 60) +
   # labs(title="Points Per Game vs Postion", x="position",
   #      y="points per game") +
   # scale_color_discrete(name = "Position")
server <- function(input, output) {

output$scatter_plot <- renderPlotly({
    
    scatter_plot <- ggplot(data = alc_data) +
        geom_point(mapping = aes(x = AGE, y = PTS, color = POS)) +geom_smooth(aes(x= age , y = PTS), se = FALSE) + 
        labs(title = "Points Scored Based on Age and Position", x = "Age", y = "Average Points Scored per Game", color = "Selevted Position")
    
    scatter_plotly_plot <- ggplotly(scatter_plot)
    
    return(scatter_plotly_plot)
})
output$description <- renderText({
    
    if (input$variable == "C"){
        return("Center")
    }
    else if(input$variable == "SG"){
        return("Shooting Guard")
    }
    else if(input$variable == "PG"){
        return("Point Guard")
    }
    else if(input$variable == "SF"){
        return("Small FOrward")
    }
    else if(input$variable == "PF"){
        return("Power Forward")
    }
})
}

