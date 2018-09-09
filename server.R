library(shiny)
library(plotly)
goal <- 30000
col <- "#DD4B39"

shinyServer(function(input, output) {
  
  total <- as.numeric( 
    httr::content(
      httr::GET("http://ww2.amstat.org/misc/test.cfm"),
      as = "text", encoding = "UTF-8"
    )
  )
  
  output$total <- renderText({
    scales::dollar(total)
  })
  output$remaining <- renderText({
    scales::dollar(goal - total)
  })
  
  plot_total <- min(goal, total) + 5000
  diff <- goal - plot_total + 5000
  
  d <- data.frame(x = c(1, 1),
                  y = c(plot_total, diff),
                  label = c("Raised", "Goal"),
                  amt = scales::dollar(c(total, goal)))
  
  output$plot <- renderPlotly({
    plot_ly(d, x = ~ x, y = ~ y, type = "bar",
            marker = list(color = c(col, "white"),
                          line = list(color = c("black"),
                                      width = 2)),
            hoverinfo = "text",
            text = ~ paste(label, amt)) %>%
      layout(
        title = "How are we doing?",
        margin = list(
          t = 50
        ),
        shapes = list(
          list(type = "circle",
               xref = "x", x0 = 0.4, x1 = 1.6,
               yref = "y", y0 = - 5000, y1 = 5000,
               fillcolor = col, line = list(color = "black")),
          list(type = "rect",
               xref = "x", x0 = 0.63, x1 = 1.37,
               yref = "y", y0 = 0, y1 = 5100,
               fillcolor = col, line = list(color = col))
        ),
        yaxis = list(
          scaleanchor = "x",
          domain = c(0, 50000),
          scaleratio = 1/10000,
          zeroline = FALSE,
          title = "",
          tickvals = seq(5000, goal + 5000, by = 5000),
          ticktext = scales::dollar(seq(0, goal, by = 5000))
          
        ),
        xaxis = list(
          zeroline = FALSE,
          showline = FALSE,
          showticklabels = FALSE,
          showgrid = FALSE,
          title = ""
        ),
        barmode = "stack") %>%
      config(displayModeBar = FALSE)
  })
})


