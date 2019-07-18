library(shiny)

shinyApp(

   ui = fluidPage (
      uiOutput('dynamic_controls')
   ),

   server = function(input, output, session) {
      output$dynamic_controls <- renderUI({

      tagList(
         numericInput(
           inputId = 'i_num',
           label   = 'Enter a number',
           value   =  10
         ),
         numericInput(
           inputId = 'i_num_2',
           label   = 'Enter another number',
           value   =  10
         )
        );

      });
   }

);
