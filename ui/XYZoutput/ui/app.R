library(shiny)

shinyApp(

   ui = fluidPage (
      uiOutput('dynamic_controls')
   ),

   server = function(input, output, session) {
      output$dynamic_controls <- renderUI({

         numericInput(
           inputId = 'i_num',
           label   = 'Enter a number',
           value   =  10
         )

      });
   }

);
