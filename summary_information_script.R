library(dplyr)
library(stringr)

data1 <- read.csv("data/nba3_2021_22_corrections.csv")
data2 <- read.csv("data/NBA_2018_per_poss.csv")
data3 <- read.csv("data/2021-2022 NBA Player Stats - Playoffz.csv")

# Creates list of dataset information
summary_info <- list()
summary_info$num_observations <- nrow(data1)

# Highest 3pt percentage in the NBA
summary_info$threePercent <- max(data1$accuracy3P)

# Sorts out which position has the most 3pt attempts
summary_info$threePtAttempts <- filter(data1, pct3PA >= 0.7)
summary_info$threePtAttemptsPg <- filter(summary_info$threePtAttempts, Pos == "PG")
summary_info$threePtAttemptsSg <- filter(summary_info$threePtAttempts, Pos == "SG")
summary_info$threePtAttemptsSf <- filter(summary_info$threePtAttempts, Pos == "SF")

# Calculates and creates a column of points per minute 
summary_info$ptsPerMin <- mutate(data3, points_per_min = PTS / MP)

# Calculates max amount of steals for the 2018 NBA season
summary_info$maxSteals <- max(data2$STL)

# Calculates and creates a column of assists to turnover ratio
summary_info$turnoverAssist <- mutate(data3, turnAssistRatio = AST / TOV)

# Calculate and show max distance average.
summary_info$distance <- max(data1$Distance)
