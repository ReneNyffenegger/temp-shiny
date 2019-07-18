ui <- fluidPage(

  selectInput(
     inputId = 'dataset',
     label   = 'Choose wisely',
     choices = c('diamonds', 'rock', 'pressure', 'cars')
  ),

  conditionalPanel(
     condition    = "output.nrows",
     checkboxInput("headonly", "Only use first 1000 rows")
  )

);

server <- function(input, output, session) {

  INPUT <- reactive({

    switch(input$dataset,
           "rock"     = rock,
           "pressure" = pressure,
           "cars"     = cars
    )

  });
  
  output$nrows <- reactive({
    nrow(INPUT())
  });
  
  outputOptions(output, "nrows", suspendWhenHidden = FALSE)  
}

shinyApp(
  ui,
  server
)
