library(shiny)
library(tidyverse)

data <- 
  tibble()

# server logic
server <- function(input, output) {
  
  getResults <- eventReactive(input$go, {
    tibble(
      s_count = input$s_count,
      b_count = input$b_count,
      pitch_num = input$s_count + input$b_count + 1,
      last_ff_not = input$last_ff_not,
      on_1b = input$on_1b,
      on_2b = input$on_2b,
      on_3b = input$on_3b,
      stand = input$stand,
      p_throws = input$p_throws,
      pitcher_id = input$pitcher_id
    )
  })
  
  
  output$table <- renderTable({
    results <- getResults()
    
    # we need to write to make prediction on results, output on table below
    # save the model to a file
    # load svm in server
    # use predict function on results
    
    model <- readRDS("../model.rds")

    
    prediction <- predict(model,results)
    
    tibble(
      `_` = c("Note", "Probability"),
      `__` = c("The output below is from an SVM. -1 is not a fastball and 1 is a fastball", prediction)
    )
    
    
   
  })
  
}
