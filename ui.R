library(shiny)
library(plotly)
library(shinydashboard)
library(emo)
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
      plotlyOutput("plot"),
      height = 525
    ),
    box(width = 6,
        status = "primary",
        height = 525,
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
                icon = icon("money")),
        HTML('<center><iframe
             src="https://www.youtube.com/embed/ZNpVBXsGHoE" 
             frameborder="0" allow="autoplay; encrypted-media" 
             allowfullscreen></iframe></center>')
    ),
    box(width = 3,
        status = "primary",
        height = 525,
        HTML('<a class="twitter-timeline" data-height="500" 
             href="https://twitter.com/AmstatNews?ref_src=twsrc%5Etfw">
             Tweets by AmstatNews</a> <script async 
             src="https://platform.twitter.com/widgets.js" charset="utf-8">
             </script>')))
)
tagList(
  dashboardPage(
  dashboardHeader(disable = TRUE),
  dashboardSidebar(collapsed = TRUE),
  body
),
tags$footer(
  HTML(glue::glue("&nbsp;Built with {emo::ji('heart')} by 
                  <a  target='_blank'
                  href = 'https://www.lucymcgowan.com'>Lucy D'Agostino McGowan</a>",
             .trim = FALSE)))
)

