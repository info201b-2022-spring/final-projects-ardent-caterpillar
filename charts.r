library(ggplot2)
library(dplyr)
library(stringr)

data1 <- read.csv("data/nba3_2021_22_corrections.csv")
data2 <- read.csv("data/NBA_2018_per_poss.csv")
data3 <- read.csv("data/2021-2022 NBA Player Stats - Playoffz.csv")

plot1 <- ggplot(data = data3) + geom_point(mapping = aes(x = PTS, y = Age, color = Pos ))
plot1

plot2 <- ggplot(data = data3) + geom_col(mapping = aes(x = Age, y = FT.))
plot2

plot3 <- ggplot(data = data2) + geom_point(mapping = aes(x = FTA, y = FT., color = Age))
plot3
