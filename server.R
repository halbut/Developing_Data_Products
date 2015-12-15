library(shiny)
library(quantmod)

shinyServer(function(input, output) {

  stocks <- reactive({
    cbind(getSymbols(input$stock1, src = "yahoo", 
                               from = input$dates[1],
                               to = input$dates[2],
                               auto.assign = FALSE),
          getSymbols(input$stock2, src = "yahoo", 
                               from = input$dates[1],
                               to = input$dates[2],
                               auto.assign = FALSE))
  })
  
  output$plot <- renderPlot({
      chartSeries(stocks(), theme = chartTheme("white"), legend=TRUE)
  })
  
})
