ui <- fluidPage(

  titlePanel('Title'),

    sidebarLayout(

      sidebarPanel(
         tags$div('In a', tags$i('sidebar layout'), 'the sidebar is usually used to gather the input-values from a user.'),
         tags$div('This is the place where the input controls (such as', tags$code('selectInput()'),') should be placed.'),
         tags$p(),

         selectInput(inputId = 'input_one',
            label   = 'Choose Wisely',
            choices = c('foo', 'bar', 'baz')
         ),
         selectInput(inputId = 'input_two',
            label   = 'Choose again',
            choices = c('foo', 'bar', 'baz')
         )
      ),

      mainPanel(
        verbatimTextOutput('mainPanelText')
      ),

      position = 'left',
      fluid    =  TRUE

    )
);

server = function(input, output, session) {
               output$mainPanelText <- renderText(
'The main Panel is usually used to display the
data that is calculated in the server function.');
};

shinyApp(ui, server)
