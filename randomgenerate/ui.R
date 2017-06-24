library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Random Number Generation for Normal, Binomial and Gamma distribution"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        selectInput("dist", "Select the distribution to be simulated.", 
                    c("Normal" = "norm",
                      "Binomial" = "binom",
                      "Gamma" = "gamma")),
        conditionalPanel(
            condition = "input.dist == 'norm'",
            sliderInput("mu",  "Mean of the normal distribution", min = -1000, max = 1000, value = 0,
                        step = 0.1),
            # textInput("mu", "Mean of the normal distribution", value = "0"),
            sliderInput("sig", "Standard deviation of the normal distribution", min = 0.1, max = 100,
                      value = 1, step = 0.1)
        ),
        
        conditionalPanel(
            condition = "input.dist == 'binom'",
            textInput("n.trial", "Number of trials", value = "10"),
            textInput("prob", "Probability of success", 
                      value = "0.5")
        ),
        
        conditionalPanel(
            condition = "input.dist == 'gamma'",
            textInput("shape", "Value of shape parameter", value = "1"),
            textInput("rate", "Value of rate parameter", 
                      value = "1")
        ),
        
        numericInput("nsim", "How many random draws should be generated?", 
                     value = 1000, min = 100, max = 10000, step = 50),
        
        sliderInput("bins", "Number of bins:", min = 5, max = 150, value = 30),
        
        conditionalPanel(
            condition = "input.dist != 'binom'",
            checkboxInput("density", "Add density", FALSE)
        ),
        
        submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        conditionalPanel(
            condition = "input.dist == 'norm'",
            h3("Histogram of Normal")
        ),
        conditionalPanel(
            condition = "input.dist == 'binom'",
            h3("Histogram of Binomial")
        ),
        conditionalPanel(
            condition = "input.dist == 'gamma'",
            h3("Histogram of Gamma")
        ),

        plotOutput("distPlot"),
        h3("Empirical mean is:"),
        textOutput("emmean"),
        h3("Empirical variance is:"),
        textOutput("emvar")
    )
  )
))
