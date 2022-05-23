library(ggplot2)
library(dplyr)
library(stringr)

data1 <- read.csv("data/nba3_2021_22_corrections.csv")
data2 <- read.csv("data/NBA_2018_per_poss.csv")
data3 <- read.csv("data/2021-2022 NBA Player Stats - Playoffz.csv")

# This chart shows the relationship between the amount of point scored with respect to a players age and position
plot1 <- ggplot(data = data3) + geom_point(mapping = aes(x = PTS, y = Age, color = Pos ))
plot1
# We can see from the plot that as the age of the players increases less points on average are scored and some positions
# have a higher priority of scoring points over others

# This chart shows the relationshup between the age of a player and the amount of freethrows that are taken
plot2 <- ggplot(data = data3) + geom_col(mapping = aes(x = Age, y = FT.))
plot2
# As shown by the data we know that as age increases the amount of free throws the average player attempts is lessened after 
# their 30's

# This chart shows the relationship between the success of free throws and total attempts based on a players age
plot3 <- ggplot(data = data2) + geom_point(mapping = aes(x = FTA, y = FT., color = Age))
plot3
# This chart shows that there is hard to find a correlation between the success of free throws from a players age
