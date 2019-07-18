ui <- fluidPage(

  selectInput(
     inputId = 'panel',
     label   = 'Choose Panel',
     choices = c('Panel one'   = 'pnl_1',
                 'Panel two'   = 'pnl_2',
                 'Panel three' = 'pnl_3'
                )
  ),

  conditionalPanel(
  #
  #  conditionalPanel() wraps a set of UI elements that
  #  then can be dynamically shown/hidden depending on
  #  the value of a JavaScript expression.
  #
  #  condition:
  #      The JavaScript expression that determines
  #      whether the widgets are shown.
  #      The JavaScript objects(?) input and output
  #      reflect the current respective values.
  #
     condition    = 'output.show_panel == 1',
     tags$div('This is the first Panel')
  ),

  conditionalPanel(
     condition    = 'output.show_panel == 2',
     tags$div('This is the second Panel')
  ),

  conditionalPanel(
     condition    = 'output.show_panel == 3',
     tags$div('This is the third Panel')
  )

);

server <- function(input, output, session) {

  output$show_panel <- reactive({

    switch(input$panel,
           'pnl_1'    = 1,
           'pnl_2'    = 2,
           'pnl_3'    = 3
    )

  });

  outputOptions(output, 'show_panel', suspendWhenHidden = FALSE)
};

shinyApp(ui, server)
