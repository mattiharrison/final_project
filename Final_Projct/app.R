library(shiny)
library(tidyverse)
library(tidytext)

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
      Harvard    <- read_csv("../Harvard- Data USA Cart.csv")
      
      Harvard %>% 
        select(soc_name, cip_name, cip_id, avg_wage_2014, avg_wage_2015,
               avg_wage_2016, num_ppl_2014, num_ppl_2015, num_ppl_2016) %>% 
        ##filter(avg_wage_2014 >= input$avg_wage_2014) %>% 
        ggplot(aes(x=avg_wage_2014, y= num_ppl_2014)) + geom_point() + 
        scale_y_log10() + labs(title = "Harvard, Average Wage vs. Number of People", 
                               subtitle = "2014", x= "Wage", 
                               y= "Enrolled Students")
  
   })
}
server <- function(input, output) {
     
    output$distPlot <- renderPlot({
       # generate bins based on input$bins from ui.R
   Berkeley <- read_csv("../Berkeley- Data USA Cart.csv")
   
      Berkeley %>% 
        select(soc_name, cip_name, cip_id, avg_wage_2014, avg_wage_2015,
               avg_wage_2016, num_ppl_2014, num_ppl_2015, num_ppl_2016) %>% 
        ggplot(aes(x=avg_wage_2014, y= num_ppl_2014)) + geom_point() + 
        scale_y_log10() + labs(title = "Berkeley, Average Wage vs. Number of People", 
                               subtitle = "2014", x= "Wage", 
                               y= "Enrolled Students")
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

