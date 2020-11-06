library(shiny)
library(tidyverse)

library(tidyverse)
library(broom)
library(modelr)
library(e1071)
library(randomForest)
library(rsample)
library(caret)

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
      p_throws = input$p_throws
    )
  })
  
  
  output$table <- renderTable({
    results <- getResults()
    
    # we need to write to make prediction on results, output on table below
    # save the model to a file
    # load svm in server
    # use predict function on results
    
    model <- readRDS("../model.rds")

    testResults <-
      tibble(
        s_count = 1,
        b_count = 0,
        pitch_num =  2,
        last_ff_not = 'OTHER',
        on_1b = 0,
        on_2b = 0,
        on_3b = 0,
        stand = 'R',
        p_throws = 'R'
      )
    
    test_df <- df_final_100 %>% select(-pitcher_id) %>% distinct()
    
    new = bind_rows(results, test_df)
    
    new = new %>% select(-fastball)
    
    prediction <- predict(model, newdata = new)
    
    tibble(
      'Prediction' = as.character((prediction[1]))
    )
    
   
  })
  
}
