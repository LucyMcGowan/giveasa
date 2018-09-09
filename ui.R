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
    box(width = 9,
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
    ))
)
dashboardPage(
  dashboardHeader(disable = TRUE),
  dashboardSidebar(collapsed = TRUE),
  body
)

