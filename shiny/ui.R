ui <- pageWithSidebar(
  
  # App title ----
  headerPanel(
    "Baseball Pitch Prediction"
  ),
  
  sidebarPanel(
    p("Fill in the game scenario"),
    numericInput("s_count", "Strike Count", 0, min = 0, max = 2, step = 1),
    numericInput("b_count", "Ball Count", 0, min = 0, max = 3, step = 1),
    textInput("last_ff_not", "Previous Pitch", value = "FF", width = NULL, placeholder = NULL),
    numericInput("on_1b", "Runner on First Base(1 for yes/0 for no)", 0, min = 0, max = 1, step = 1),
    numericInput("on_2b", "Runner on Second Base(1 for yes/0 for no)", 0, min = 0, max = 1, step = 1),
    numericInput("on_3b", "Runner on Third Base(1 for yes/0 for no)", 0, min = 0, max = 1, step = 1),
    textInput("stand", "Batter Stance(R/L)", value = "R", width = NULL, placeholder = NULL),
    textInput("p_throws", "Pitcher Stance(R/L)", value = "R", width = NULL, placeholder = NULL),
    
    actionButton("go", "Click Here To Predict Next Pitch!!!"),
  ),
  
  # Main panel for displaying outputs ----
  mainPanel(
    tableOutput(outputId = "table")
  )
)
