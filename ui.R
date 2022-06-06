library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")
library("shinythemes")
library("htmltools")

advanced_data <- read.csv("data/nba_2021_22_advanced_stats.csv")
team_names <- advanced_data$Tm

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
          form paser clusters that have higher PC values.") 
    )
)

concept_2 <- tabPanel(
    "CONCEPT #2",
    titlePanel(
        h1("CONCEPT #2 HERE", align="Center")
    ),
    
    sidebarLayout(
        sidebarPanel(
            
        ),
        
        mainPanel(
            h2("SUMMARY OF PLOT TITLE"),
            p("foo"),
            h2("Findings"),
            p("bar"
            ) 
        )
    )
)

concept_3 <- tabPanel(
    "CONCEPT #3",
    titlePanel(
        h1("CONCEPT #3 HERE", align="Center")
    ),
    
    sidebarLayout(
        sidebarPanel(
            
        ),
        
        mainPanel(
            h2("SUMMARY OF PLOT TITLE"),
            p("foo"),
            h2("Findings"),
            p("bar"
            ) 
        )
    )
)

conclusion <- tabPanel(
    "Conclusion",
    titlePanel(
        h1("Conclusion", align="center")
    ),
    
    h3("Takeaway about Player Similarities", align="center"),
    p("Looking at the player similarities for each team we can notice that
      players with large postive PCA values the generally end being the top scoring
      players, which leads to a high player value"),
     
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