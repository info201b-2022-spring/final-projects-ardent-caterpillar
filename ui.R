library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")
library("shinythemes")
library("htmltools")

advanced_data <- read.csv("data/nba_2021_22_advanced_stats.csv")
team_names <- advanced_data$Tm
data1 <- read.csv("data/2021-2022 NBA Player Stats - Playoffz.csv")

introduction <- tabPanel(
    "About",
    titlePanel(
        h1("NBA Data Analysis", align = "center")
    ),
    
    mainPanel(
        img(src="https://besthqwallpapers.com/Uploads/28-3-2022/196507/nba-carbon-logo-4k-grunge-art-national-basketball-association-carbon-background.jpg", width="100%", align="center"), 
        h1("Summary of addressed concepts:", align = "center"),
        h2("How do players from the same team releate to each other: "),
        p("This question can be solved using a fundemental machine learning 
           learning technique called Principal Compmenent Anyalsis. This
           technique summeraizes high dimension data into a dimension that can
           be plotted.
        "),
        h2("How does Age by Postion releate to Points Scored:"),
        p("This question can be solved by graphing the age vs the Average Points
           points scored per game to see the overall trends."
          ),
        h2("3 point attempts vs Age:"),
        p("This question can be solved by graphing a scatterplot showing the Age to 
          3 point attempt relation."
          ),
    )
)

# Chart 1 page - map
concept_1 <- tabPanel(
    "PCA of Player Corrleation",
    titlePanel(
        h1("Principal Component Analysis of Players", align="center")
    ),
    
    h2("Correlation between players graph"),
    fluidRow(
        column(8, align="center"),
        plotlyOutput("plot", width="50%", height="800px")
    ),
    
    selectInput(
        inputId="PCA",    
        label="Select a team",
        choices=team_names,
        selected=team_names[0]
    ),    
        
        
    mainPanel(
        p("This chart comes from an unsurpvised method of machine learning
          called principal component analysis (PCA). The way PCA works is that closer points are
          together, the higher they are corrleated. The more postive PC values we have
          the stronger impact they have within our orginal data"),
        h2("Findings"),
        p("We can see here that players that play simular postions such as
          safe guard are more correleated than Power Foward. All the defensive roles
          tend to form their own induval clusters with lower PC values, while the offensive postions
          form paser clusters that have higher PC values. We can also notice highly rated teams
          end up having the highest PC values. This makes sense as teams that are consiently
          doing well are going to have a stronger corrleation all togther. 
          Some outliers within this data may be caused by players who were benched
          or didnt recive much game time due to an injury. This is due to the fact the data
          spans the whole season and isn't normalized for each 32 minute time period.") 
    )
)

scatter_sidebar <- sidebarPanel(
  selectInput(
    inputId = "user_category",
    label = "Select Position",
    choices = data1$Pos,
    selected = "C",
    multiple = TRUE
  ),
  textOutput(outputId = "description")
)

scatter_main <- mainPanel(
  plotlyOutput(outputId = "scatter_plot")
)

concept_2 <- tabPanel(
  "Points Scored VS Age by Position",
  titlePanel(
      h1("Points Scored VS Age by Position", align="Center")
  ),
  sidebarLayout(
    scatter_sidebar,
    scatter_main,
  ),
  h2("Findings", align="Center"),
    p("From our observations it would seem that the positions have different
      life-spans for their primes. Centers for example score the most points
      in their younger years while SG score their best in their early 30's.
      We can deduce that positions put different amounts of strain on the athletes 
      body causing a shorter prime for more aggressive positions and causing
      more, shooting heavy positions to hone their skills into older age. The 
      Shooting Guard and Point Guard positions seem to be the greatest example of 
      what positions excel with an increase in age. This could be because they are
      more 3 points focused positions and spend much less time in the paint, where
      technique could play less of a role in score acquisition. On the flipside of this
      we can see the position of the Small Forward and the Center with diminishing returns with age
      presumably from injury from the more dangerous position. Lastly we can see 
      the Power Forward position is a mix of both with mostly linear progression with a
      strong spike in average points in the earlier years of the players career."
  )
)

concept_3 <- tabPanel(
    "3 point attempts vs Age",
    titlePanel(
        h1("3 point attempts vs Age", align="Center")
    ),
    sidebarLayout(
      scatter_sidebar,
      scatter_main,
    ),
    h2("Findings", align="Center"),
    p("The 3 point shot has not always been in the NBA. It is a relatively new thing
      in the NBA and we wanted to see if has any effect on the age of the players. You 
      would think the younger players would be shooting more 3 pointers, because it was 
      slowly gaining popularity. Through this graph you can see how age is affecting 3
       point attempts."
    )
)

conclusion <- tabPanel(
    "Conclusion",
    titlePanel(
        h1("Conclusion", align="center")
    ),
    
    h3("Takeaway about Player Similarities", align="center"),
    p("Looking at the player similarities for each team we can notice that
      players with large postive PC values the generally end being the top scoring
      players and offensive postions, which leads to a high player value. 
      This is due to the fact NBA postions and playstyles are everevolving and 
      currently lots of stock is put into offensive players that score while 
      later draft picks are used on defensive players. Overall this graph is very
      useful vislulizaing data corrleation between the players but it's important
      to acknowledge the shortcomings of PCA. PCA tends to underfit our data, having  
      low variance, where each compment may seem close but they are actually miles
      away from each other."),
     
    h3("Points Scored VS Age by Position", align="center"),
    p("According to our observations, the primes of the positions appear to have
    varied life periods. Centers, for example, have the highest point totals while
    they are younger, whereas SG have the highest point totals when they are in their 
    early 30s. We can deduce that different roles put athletes under varied amounts of stress.

body, resulting in a shorter prime for more aggressive positions, and

more, firing heavy situations as they get older to develop their talents The Shooting 
      Guard and Point Guard positions appear to be the best examples of positions that
      flourish as they become older. On the other hand, we can observe that the Small 
      Forward and Center positions have declining results as they become older, likely
      due to damage from the more risky position. Finally, we can see that the Power
      Forward position is a hybrid of the two, with largely linear evolution and a big 
      spike in average points early in the player's career."),
    
    h3("3 point attempts vs Age", align="Center"),
    p("One of the questions we asked at the start of our analysis was if age had any
      correlation to how many 3 pointers an NBA player attempted. We had asked this
      question because it seems to us that younger players tend to shoot more 3 pointers
      than older players. So after analyzing specific data from this past years season,
      we were able to find out that age does not affect the amount of 3 point attempts 
      taken."
),


ui <- navbarPage(
    "NBA Player Analysis",
    theme = shinytheme("slate"),
    introduction,
    concept_1,
    concept_2,
    concept_3,
    conclusion
)