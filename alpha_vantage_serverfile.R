library(shiny)

server <- function(input, output) {
  
  storage <- reactiveValues()
  storage$dataframe <- data.frame()
  
  output$check_intraday <- renderUI({
    if(input$span == ""){
      return()
    } else if (input$span == "TIME_SERIES_INTRADAY"){
      radioButtons("int","Intervals",choices = c("1min", "5min", "15min", "30min", "60min"),selected = "1min")
    }
  })
  
  output$check_daily <- renderUI({
    if(input$span == ""){
      return()
    } else if (input$span == "TIME_SERIES_DAILY"){
      radioButtons("int1","Intervals",choices = c("full", "compact"),selected = "compact")
    }
  })
  
  output$click_button <- renderUI({
    if(input$span == ""){
      return()
    } else {
      actionButton("button","Button")
    }
  })
  
  # observeEvent(input$button,{
  #   if (input$span != "") {
  #     storage$dataframe <- av_get(symbol     = "MSFT",
  #                                 av_fun     = input$span,
  #                                 interval   = input$int,
  #                                 outputsize = "full")
  #   } else {
  #     return()
  #   }
  # })
  
  observeEvent(input$button,{
    if (input$span == "TIME_SERIES_INTRADAY") {
      storage$dataframe <- av_get(symbol     = "MSFT",
                                  av_fun     = "TIME_SERIES_INTRADAY",
                                  interval   = input$int)
    } else if (input$span == "TIME_SERIES_DAILY"){
      storage$dataframe <- av_get(symbol     = "MSFT",
                                  av_fun     = "TIME_SERIES_DAILY",
                                  outputsize = input$int1)
    } else
      return()
  })
  
  output$display <- DT::renderDataTable(
    datatable(
      storage$dataframe,selection = 'single',rownames = FALSE,escape = FALSE,extensions = c('Buttons'),
      class = "compact  nowrap  stripe  hover ",options = list(scrollX = TRUE,paging = TRUE,dom = 'Bfrtip',buttons = c('excel'),
                                                               pageLength = 100,sScrollY = '80vh',columnDefs = list(list(width = '100px',className = 'dt-center',targets = c(0, 1, 2))),
                                                               buttons = list('copy','print',list(
                                                                 extend = 'collection',
                                                                 buttons = c('csv', 'excel', 'pdf'),
                                                                 text = 'Download')))))
  
  
  
  
}

