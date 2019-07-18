ui <- fluidPage(

  selectInput(
     inputId = 'panel',
     label   = 'Choose Panel',
#    choices = c('diamonds', 'rock', 'pressure', 'cars')
     choices = c('Panel one' = 'pnl_1', 'Panel two' = 'pnl_2', 'Panel three' = 'pnl_3')
  ),

  conditionalPanel(
  #
  #  conditionalPanel() wraps a set of UI elements that
  #  then can be dynamically shown/hidden depending on
  #  the value of a JavaScript expression
  #
  #  condition:
  #      The JavaScript expression that determines
  #      whether the widgets are shown.
  #      The JavaScript objects(?) input and output
  #      reflect the current respective values.
  #
     condition    = 'output.nrows',
     checkboxInput("headonly", "Only use first 1000 rows")
  )

);

server <- function(input, output, session) {

  INPUT <- reactive({

    switch(input$panel,
#          'pnl_1'    = rock,
           'pnl_2'    = pressure,
           'pnl_3'    = cars
    )

#   switch(input$panel,
#          "rock"     = rock,
#          "pressure" = pressure,
#          "cars"     = cars
#   )

  });
  
  output$nrows <- reactive({
    nrow(INPUT())
  });
  
  outputOptions(output, "nrows", suspendWhenHidden = FALSE)  
};

shinyApp(ui, server)
