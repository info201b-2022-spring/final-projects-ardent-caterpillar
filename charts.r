library(ggplot2)
library(dplyr)
library(stringr)
library(ggbeeswarm)

data1 <- read.csv("data/2021-2022 NBA Player Stats - Playoffz.csv")
data2 <- read.csv("data/NBA_2018_per_poss.csv")
data3 <- read.csv("data/nba3_2021_22_corrections.csv")

plot1 <- ggplot(data2, aes(x=Pos, y=PTS, color=Pos)) +
                geom_beeswarm(cex=0.9, na.rm=TRUE) + ylim(0, 60) +
                labs(title="Points Per Game vs Postion", x="position",
                     y="points per game") +
                scale_color_discrete(name = "Position")

plot2 <- ggplot(data = data1) + 
    geom_col(mapping = aes(x = Age, y = FT.)) +
    labs(title="Free throws per game vs Age", 
         y="Free Throw count")

plot3 <- ggplot(data = data1) + 
    geom_point(mapping = aes(x = FTA, y = FT., color = Age)) +
    labs(title = "Free throw count vs Free throw attempts",
         x="Free throw attempts per game", y="Free Throw count") 
    
