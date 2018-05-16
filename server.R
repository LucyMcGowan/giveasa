library(shiny)
library(scales)
library(googlesheets)
library(dplyr)
library(plotrix)

googlesheets::gs_auth(token = "shiny_app_token.rds")
shinyServer(function(input, output) {
  
  d <- gs_url("https://docs.google.com/spreadsheets/d/1L_KwDsxh7fj8Djd6KSmZ1r5pbrQGWqfg4ZnS6IXI2xk/edit?usp=sharing") %>%
    gs_read() 
  
  df <- d %>%
    summarise(total = sum(Amount, na.rm = TRUE)) %>%
    mutate(funds = "funds") 
  
  output$total <- renderText({
    dollar(df$total)
  })
  output$remaining <- renderText({
    dollar(30000 - df$total)
  })
  output$plot <- renderPlot({
    barplot(df$total, xlim = c(0.1, 5), ylim = c(-10000, 30000), col = 2, border = 2, xaxt = "n", yaxt = "n")
    draw.ellipse(0.7, -2000, 0.6, 6000, col = 2, border = 2)
    rect(0.2, df$total, 1.2, 30000, col = "white", border = NA)
    rect(0.2, 0, 1.2, 30000, border = 2)
    axis(2, at = seq(0, 30000, by = 5000), las = 2)
  })
})
