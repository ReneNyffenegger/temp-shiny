library(shiny)

shinyApp(
   ui     = fluidPage (
     #
     # Show all defined HTML tags that can be 
     # used in shiny in an unordered list:
     #
       tags$ul(
         lapply(names(tags), tags$li)
       )
   ),

   server = function(input, output, session) {}

);
