library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")
library("shinythemes")
library("htmltools")

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
    "CONCEPT #1",
    titlePanel(
        h1("CONCEPT #1 HERE", align="Center")
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