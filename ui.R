library(shiny)
library(plotly)
library(shinydashboard)

body <- dashboardBody(
  fluidRow(
    box(width = 12, 
        img(
          src = "http://www.amstat.org/images/ASAImages/giving/GiveASAlogo.png")
        )
  ),
  fluidRow(
    box(
      width = 3,
      status = "primary", 
      plotlyOutput("plot")
    ),
    box(width = 6,
        status = "primary",
        valueBox(width = 12, 
                 uiOutput("total"), 
                 "Total raised",
                 icon("angle-double-up")),
        valueBox(width = 12, 
                 uiOutput("remaining"), 
                 "Total remaining", 
                 icon("bullseye"),
                 color = "red"),
        infoBox(width = 12,
                h3("Click here to donate"), 
                href = "https://ww2.amstat.org/giving/givenow.cfm", 
                color = "purple",
                icon = icon("money"))
    ),
    box(width = 3,
        status = "primary",
        HTML('<a class="twitter-timeline" data-height="500" 
             href="https://twitter.com/AmstatNews?ref_src=twsrc%5Etfw">
             Tweets by AmstatNews</a> <script async 
             src="https://platform.twitter.com/widgets.js" charset="utf-8">
             </script>')))
)
dashboardPage(
  dashboardHeader(disable = TRUE),
  dashboardSidebar(collapsed = TRUE),
  body
)

