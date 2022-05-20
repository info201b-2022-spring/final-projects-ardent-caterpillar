library(ggplot2)
library(dplyr)
library(stringr)

data1 <- read.csv("data/nba3_2021_22_corrections.csv")
data2 <- read.csv("data/NBA_2018_per_poss.csv")
data3 <- read.csv("data/2021-2022 NBA Player Stats - Playoffz.csv")

#Aggragate Table 1 Script 

by_data1 <- nba3_2021_22_corrections.csv %>% group_by(data1)

by_data1

by_data1 %>% summarise(
  disp = mean(disp),
  hp = mean(hp)
)
by_data1 %>% filter(disp == max(disp))

by_vs_am <- data1 %>% group_by(vs, am)
by_vs <- by_vs_am %>% summarise(n = n())
by_vs
by_vs %>% summarise(n = sum(n))

by_vs %>%
  ungroup() %>%
  summarise(n = sum(n))

data1 %>% group_by(vsam = vs + am)

by_data1 %>%
  group_by(vs, am) %>%
  group_vars()

by_data1 %>%
  group_by(vs, am, add = TRUE) %>%
  group_vars()

#Aggragate Table 2 Script 

by_data2 <- NBA_2018_per_poss.csv %>% group_by(data1)

by_data2

by_data2 %>% summarise(
  disp = mean(disp),
  hp = mean(hp)
)
by_data2 %>% filter(disp == max(disp))

by_vs_am <- data2 %>% group_by(vs, am)
by_vs <- by_vs_am %>% summarise(n = n())
by_vs
by_vs %>% summarise(n = sum(n))

by_vs %>%
  ungroup() %>%
  summarise(n = sum(n))

data2 %>% group_by(vsam = vs + am)

by_data2 %>%
  group_by(vs, am) %>%
  group_vars()

by_data2 %>%
  group_by(vs, am, add = TRUE) %>%
  group_vars()

#Aggragate Table 3 Script 

by_data3 <- NBA_2018_per_poss.csv %>% group_by(data1)

by_data3

by_data3 %>% summarise(
  disp = mean(disp),
  hp = mean(hp)
)
by_data3 %>% filter(disp == max(disp))

by_vs_am <- data3 %>% group_by(vs, am)
by_vs <- by_vs_am %>% summarise(n = n())
by_vs
by_vs %>% summarise(n = sum(n))

by_vs %>%
  ungroup() %>%
  summarise(n = sum(n))

data3 %>% group_by(vsam = vs + am)

by_data3 %>%
  group_by(vs, am) %>%
  group_vars()

by_data3 %>%
  group_by(vs, am, add = TRUE) %>%
  group_vars()
