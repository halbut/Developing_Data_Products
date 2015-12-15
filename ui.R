library(shiny)

shinyUI(fluidPage(

  titlePanel("Stock Comparison App"),

  sidebarLayout(

    sidebarPanel(
      
      helpText("Enter two stocks to compare"),
      
      textInput("stock1", "Stock Symbol #1", "AAPL"),
      
      textInput("stock2", "Stock Symbol #2", "MSFT"),
      
      dateRangeInput("dates",
                     "Date range",
                     start = as.character(Sys.Date()-200),
                     end = as.character(Sys.Date()-3)),
    
      actionButton("get", "Update Graph")
    ),

    mainPanel(    

      plotOutput("plot"),
      
      h2("Directions:", align="center"),
      
      p("Please enter two stocks symbols and select the date range you would like them compared."),

      p("You may optionally enter just one stocks symbol, and the App will display it alone."),
      
      p("The graph should update itself automatically, but if it fails, please click the uptate button.")
    )
  )
))
