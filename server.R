
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output,session) {

  output$distPlot <- renderPlot({
    
    # Read input parameters
    distype = input$Distribution
    size = input$SampleSize
    
    if(distype == "Normal")
    {
      randomvec <- rnorm(size, mean = as.numeric(input$Mean), sd = as.numeric(input$SD))
    }
    else
    {
      randomvec <- rexp(size, rate = 1/as.numeric(input$Lambda))
    }
    
    
    # draw the histogram with the selected input parameters
    hist(randomvec, col = 'pink', border = "yellow", main = "Histogram", xlab = "Random Vector")

  })

})
