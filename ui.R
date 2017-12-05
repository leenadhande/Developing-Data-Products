
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Applicaion to show the distribution histograms"),

  # Sidebar with a inputs
  sidebarLayout(
    sidebarPanel(
      selectInput("Distribution", "Please Select Distribution Type", choices=c("Normal", "Exponential")),
      sliderInput("SampleSize","Please Select Sample Size",min = 10,max = 100,value = 30),
      conditionalPanel(condition="input.Distribution == 'Normal'",
                       textInput("Mean", "Please Select the mean",10),
                       textInput("SD", "Please Select Standard Deviation",3))  ,
      conditionalPanel(condition="input.Distribution == 'Exponential'",
                       textInput("Lambda", "Please Select Exponential Lambda",10)) 
      
      ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
