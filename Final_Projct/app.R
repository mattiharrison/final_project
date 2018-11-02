library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Wage vs. University"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("Wage",
                     "Wages",
                     min = 1000,
                     max = 400000,
                     value = 5000)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      Harvard <- read_csv("../Harvard- Data USA Cart.csv")
      
      Harvard_clean %>% 
        ggplot(aes(x=avg_wage_2014, y= num_ppl_2014)) + geom_point() + scale_y_log10() + labs(title = "Harvard, Average Wage vs. Number of People", subtitle = "2014", x= "Wage", y= "Enrolled Students")
  
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

