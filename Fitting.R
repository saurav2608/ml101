# Define the UI
library(shiny)
ui <- bootstrapPage(
  sliderInput('a', 'Bias', value = 0, min = -100, max = 100, step = 1),
  sliderInput('b', 'Weights', value = 1, min = -1, max = 10, step = .1),
  
  plotOutput('plot')
)


# Define the server code
server <- function(input, output) {
  x <- seq(1:100)
  y <- x^1.2 + rnorm(100, 0, 50)
  output$plot <- renderPlot({
    plot(y,x)
    abline(input$a, input$b)
  })
}

# Return a Shiny app object
shinyApp(ui = ui, server = server)