library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")
library("shinythemes")
library("htmltools")

data1 <- read.csv("data/2021-2022 NBA Player Stats - Playoffz.csv")

introduction <- tabPanel(
    "About",
    titlePanel(
        h1("NBA Data Analysis", align = "center")
    ),
    
    mainPanel(
        img(src="https://besthqwallpapers.com/Uploads/28-3-2022/196507/nba-carbon-logo-4k-grunge-art-national-basketball-association-carbon-background.jpg", width="100%", align="center"), 
        h1("Summary of addressed concepts:", align = "center"),
        h2("ENTER CONCEPT #1 HERE: "),
        p("Foo  
        
        "),
        h2("ENTER CONCEPT #2 HERE: "),
        p("Bar
        
        "),
        h2("ENTER CONCEPT #2 HERE: "),
        p("Bam
        
        "),
    )
)

# Chart 1 page - map
concept_1 <- tabPanel(
    "PCA of Player Corrleation",
    titlePanel(
        h1("Principal component analysis of Players", align="Center")
    ),
    
    sidebarLayout(
        sidebarPanel(
            textInput(
                inputId="PCA",    
                label="foo",
                value="LAL"
            )    
        ),
        
        mainPanel(
            h2("SUMMARY OF PLOT TITLE"),
            p("foo"),
            plotlyOutput("plot"),
            h2("Findings"),
            p("bar"
            ) 
        )
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

#concept_2 <- tabPanel(
 #   "CONCEPT #2",
  #  titlePanel(
   #     h1("CONCEPT #2 HERE", align="Center")
    #),
    #
    #sidebarLayout(
     #   sidebarPanel(
            
      #  ),
        
       # mainPanel(
        #    h2("Points Scored VS Age by Position"),
         #   p("foo"),
          #  h2("Findings"),
           # p("bar"
            #) 
        #)
#    )
#)

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
    p("From "
    )
)

conclusion <- tabPanel(
    "Conclusion",
    titlePanel(
        h1("Conclusion", align="center")
    ),
    
    h3("Takeaway one", align="center"),
    p("foo"),
     
    h3("Takeaway two", align="center"),
    p("bar"),
    
    h3("Takeaway three", align="center"),
    p("bam")
)


ui <- navbarPage(
    "NBA Player Analysis",
    theme = shinytheme("slate"),
    introduction,
    concept_1,
    concept_2,
    concept_3,
    conclusion
)