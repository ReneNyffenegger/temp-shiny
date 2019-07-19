library(shiny)

options(shiny.reactlog = TRUE);

shinyApp(
   ui = fluidPage (

     actionButton(
        inputId = 'go',
        label   = 'Get time'
     ),

     verbatimTextOutput(outputId = 'tm')
   ),

   server = function(input, output, session) {

     observeEvent(input$go, {
       output$tm <- renderText(Sys.time());
     });

   }

);
