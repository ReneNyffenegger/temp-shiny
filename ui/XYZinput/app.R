ui <- fluidPage(

  titlePanel('Various ways to gather input from the user'),

  sidebarLayout(

    sidebarPanel(

      actionButton(
         inputId            = 'i_actionButton',
         label              = 'actionButton',
      #  icon               =  …,
      #  width              =  … 
      ),

      checkboxInput(
         inputId            = 'i_checkboxInput',
         label              = 'checkboxInput',
         value              =  TRUE
      ),

      checkboxGroupInput(
         inputId            = 'i_checkboxGroupInput',
         label              = 'checkboxGroupInput',
         choices            = c('foo', 'bar', 'baz'),
         selected           = c('foo',        'baz')
      ),

      dateInput(
         inputId            = 'i_dateInput',
         label              = 'dateInput',
         value              = '2019-08-28',
         min                = '2019-01-01',
         max                = '2019-12-31',
         format             = 'yyyy-mm-dd',  # This is the default format
         startview          = 'month',       # This is the default startView
         weekstart          =  0,            # This is the default Weekstart
      #  language           = 'en',
      #  width              =  …,
      #  autoclose          =  TRUE
      #  datesdisabled      =  NULL,
      #  daysofweekdisabled =  NULL
      ),

      dateRangeInput(
         inputId            = 'i_dateRangeInput',
         label              = 'dateRangeInput',
         min                = '2017-01-01',
         max                = '2019-12-31',
         start              = '2018-02-04',
         end                = '2018-02-09'
      ),

      fileInput(
         inputId            = 'i_fileInput',
         label              = 'fileInput',
         multiple           =  FALSE,
         accept             = c('text/csv', 'text/comma-separated-values,text/plain', '.csv')
      ),

      numericInput(
         inputId            = 'i_numericInput',
         label              = 'numericInput',
         value              =  10
      ),

      passwordInput(
        inputId             = 'i_passwordInput',
        label               = 'passwordInput',
        value               = 'mySecretGarden',
      # width               =  NULL,
        placeholder         = 'Hint hint hint'
      ),

      radioButtons(
         inputId            = 'i_radioButtons',
         label              = 'radioButtons',
         choices            = c('foo', 'bar', 'baz'),
         inline             =  TRUE
      ),

      selectInput(
         inputId            = 'i_selectInput',
         label              = 'selectInput',
         choices            = c('foo', 'bar', 'baz')
      ),

      sliderInput(
         inputId            = 'i_sliderInput',
         label              = 'sliderInput',
         min                =  1,
         max                =  50,
         value              =  30
      ),

      sliderInput(
         inputId            = 'i_sliderInput_range',
         label              = 'sliderInput (with range)',
         min                =  1,
         max                =  50,
         value              = c(15, 25)
      ),

      submitButton(  # NOTE: no inputId parameter.
         text               = 'submitButton',
      #  icon               =  …,
      #  width              =  …
      ),

      textAreaInput(
         inputId            = 'i_textAreaInput',
         label              = 'textAreaInput',
         value              = "line one\nline two\nline three",
      #  width              =  …
         height             = '80px',
      #  cols               =  …,
      #  rows               =  …,
         placeholder        = 'Hint hint hint',
         resize             = 'horizontal' # or both, or none, or vertical
      ),

      textInput   (
         inputId            = 'i_textInput',
         label              = 'textInput',
         value              = 'hello world'
      )

    ),

    mainPanel(
      tags$div('Choose whatever you like, nothing will ever change here')
    )
  )
)

server = function(input, output, session) {};

shinyApp(ui, server)
