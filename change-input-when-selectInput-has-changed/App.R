#
# https://stackoverflow.com/questions/48519138/selectinput-value-update-based-on-previous-selectinput-in-r-shiny
#
library(shiny)
library(shinydashboard)

candyData <- read.table(
text = '
Brand       Candy           value
Mars        100Grand        Choc1
Netle       100Grand        Choc2
Nestle      Crunch          Choc3',
header           = TRUE,
stringsAsFactors = FALSE)


submenuUI <- function(id) {
   ns <- NS(id);
   tagList(
      box(title = "Data", status = "primary", solidHeader = T, width = 12,
          fluidPage(
             fluidRow(
                column(2, offset = 0, style='padding:1px;', selectInput(ns("Select1"),"select1",unique(candyData$Brand))),
                column(2, offset = 0, style='padding:1px;', selectInput(ns("Select2"),"select2",choices = NULL)),
                column(2, offset = 0, style='padding:1px;', selectInput(ns("Select3"),"select3",choices = NULL ))
             )
          )
      )
   )
}

submenuServ <- function(input, output, session){

   observeEvent(input$Select1, {
     updateSelectInput(session,'Select2',
     choices=unique(candyData$Candy[candyData$Brand==input$Select1]))
   })

   observeEvent(input$Select2,{
      updateSelectInput(session,'Select3', 
      choices=unique(candyData$value[candyData$Brand==input$Select1 & candyData$Candy==input$Select2]))
   })
}


# submenuServ <- function(input, output, session){
#     observeEvent(input$Select1,{
#         updateSelectInput(session,'Select2',
#                           choices=unique(candyData$Candy[candyData$Brand==input$Select1]))
#     })
#     observeEvent(c(input$Select1, input$Select2),{
#         updateSelectInput(session,'Select3',
#                           choices=unique(candyData$value[candyData$Brand==input$Select1 &
#                                                              candyData$Candy==input$Select2]))
#     })
# }

ui <- dashboardPage(
   dashboardHeader(),
   dashboardSidebar(
     sidebarMenu(
        shinyjs::useShinyjs(),
        id = "tabs",
        menuItem(
         'Item 1',
          icon = icon("bar-chart-o"),
          shinyjs::hidden(menuSubItem("dummy", tabName = "dummy")),

          menuSubItem('Sub-item 1', tabName = 'subitem1')
        )
      )
  ),
  dashboardBody(
    tabItems(
      tabItem("dummy"),
      tabItem("subitem1", submenuUI('submenu1'))
    )
  )
)

server <- function(input, output,session) {
  callModule(submenuServ, 'submenu1')
}

shinyApp(
   ui     = ui,
   server = server
)
