library(shiny)

shinyApp(
 #
 # ui     : how to GUI looks like
 #
   ui     = fluidPage (
              verbatimTextOutput(outputId = 'text')
            ),

 #
 # server : Prepare the data to be shown in the ui:
 #
   server = function(input, output, session) {
               output$text <- renderText('Some text');
            }

);
