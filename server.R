library(shiny)

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
    scales::dollar(30000 - total)
  })
  df <- data.frame(total = total)
  output$plot <- renderPlot({
    barplot(
      df$total,
      xlim = c(0.1, 1.5),
      ylim = c(-10000, 30000), 
      col = 2, 
      border = 2,
      xaxt = "n", 
      yaxt = "n",
      asp = 1/15000
    )
    plotrix::draw.ellipse(0.7, -2000, 0.6, 6000, col = 2, border = 2)
    rect(0.2, df$total, 1.2, 30000, col = "white", border = NA)
    rect(0.2, 0, 1.2, 30000, border = 2, lwd = 3)
    axis(2, at = seq(0, 30000, by = 5000), las = 2, lwd = 3,
         labels = sprintf("$%s", seq(0, 30000, by = 5000))
    )
  })
})
