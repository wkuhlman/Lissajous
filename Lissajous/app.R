#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
  titlePanel("Lissajous Pattern Generator"),
  
  
  sidebarLayout(
    
    # Input Panel-
    sidebarPanel(
      
      # Slider for A
      sliderInput(inputId = "A",
                  label = "A",
                  min = 1,
                  max = 10,
                  value = 2,
                  step = 0.2),
      
      # Slider for B
      sliderInput(inputId = "B",
                  label = "B",
                  min = 1,
                  max = 10,
                  value = 3,
                  step = 0.2),
      
      # Slider for C
      sliderInput(inputId = "C",
                  label = "C",
                  min = 0,
                  max = 2,
                  value = 0.5,
                  step = 0.1),
      
      radioButtons("color", 
                   "Color",
                   c("Red" = "red",
                     "Green" = "green",
                     "Blue" = "blue",
                     "Black" = "black"))
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        h3('Description:'),p('This app generates a Lissajous plot using the equations x = sin(At) 
and y = sin(Bt + C)'),
        h3('Instructions:'),'Adjust the sliders on the left to change the values of A, B, and C. Use the radio buttons to change the line color.',
        plotOutput(outputId = "LissPlot"),
        h3('More Info:'),'check out the code and other documentation at GitHub',
        a('https://github.com/wkuhlman/lissajous/tree/gh-pages')
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  output$LissPlot <- renderPlot({
    
    A <- input$A
    B <- input$B
    C <- input$C
    color <- input$color
    
    t <- 0:20000/200
    x <- sin(A*t)
    y <- sin(B*t + C)
    
    plot(x,y,lty=1,col=color,xlab="x",ylab="y", type="l", asp=1)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

