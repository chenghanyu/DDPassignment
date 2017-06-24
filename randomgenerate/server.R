#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    if (input$dist == "norm") {
        x <- rnorm(input$nsim, mean = as.numeric(input$mu), sd = as.numeric(input$sig))
    }  else if (input$dist == "binom") {
        x <- rbinom(input$nsim, size = as.numeric(input$n.trial), prob = as.numeric(input$prob))

    } else {
        x <- rgamma(input$nsim, shape = as.numeric(input$shape), rate = as.numeric(input$rate))
    }

    # generate bins based on input$bins from ui.R
    # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    if (input$density) {
        hist(x, breaks = input$bins, col = 'navy', border = 'white', 
             main = "", probability = TRUE)
        lines(density(x), col = "red", lwd = 2)
    } else {
        hist(x, breaks = input$bins, col = 'navy', border = 'white', main = "")
    }
  })
  
  mean.pred <- reactive({
      if (input$dist == "norm") {
          x <- rnorm(input$nsim, mean = as.numeric(input$mu), sd = as.numeric(input$sig))
      }  else if (input$dist == "binom") {
          x <- rbinom(input$nsim, size = as.numeric(input$n.trial), prob = as.numeric(input$prob))
          
      } else {
          x <- rgamma(input$nsim, shape = as.numeric(input$shape), rate = as.numeric(input$rate))
      }
      mean(x)
  })
  
  sd.pred <- reactive({
      if (input$dist == "norm") {
          x <- rnorm(input$nsim, mean = as.numeric(input$mu), sd = as.numeric(input$sig))
      }  else if (input$dist == "binom") {
          x <- rbinom(input$nsim, size = as.numeric(input$n.trial), prob = as.numeric(input$prob))
          
      } else {
          x <- rgamma(input$nsim, shape = as.numeric(input$shape), rate = as.numeric(input$rate))
      }
      sd(x)
  })
  
  
  output$emmean <- renderText({
      mean.pred()
  })
  
  output$emvar <- renderText({
      sd.pred()
  })
  
})
