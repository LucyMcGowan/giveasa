library(shiny)
library(shinydashboard)

body <- dashboardBody(
  fluidRow(
    box(width = 12, 
        img(src = "http://www.amstat.org/images/ASAImages/giving/GiveASAlogo.png"))
  ),
  fluidRow(
    box(
      width = 6,
      height = 500,
      status = "primary", 
      plotOutput("plot")
    ),
    valueBox(width = 3, uiOutput("total"), "Total funding", icon("money")),
    valueBox(width = 3, uiOutput("remaining"), "Total remaining", icon("money"), color = "red"),
    infoBox(width = 6, h3("Click here to donate"), href = "https://ww2.amstat.org/giving/givenow.cfm", color = "purple", icon = icon("thumbs-up"))
  )
)
dashboardPage(
  dashboardHeader(disable = TRUE),
  dashboardSidebar(collapsed = TRUE),
  body
)

