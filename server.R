library(shiny)

server <- function(input, output) {

  storage <- reactiveValues()
  storage$dataframe <- data.frame()
  storage$plot <- data.frame()


# Low, High , Open and Close
output$measures <- renderUI({
    if(input$ticker == ""){
      return()
    } else {
      radioButtons("measure","Measures",choices = c("All","low", "high", "close", "open"),selected = "All")
    }
  })

# Action Button
output$click_button <- renderUI({
  if(input$ticker == ""){
    return()
  } else {
    actionButton("button","Button")
  }
})


# Intervals of data
output$interval <- renderUI({
  if(input$ticker == ""){
    return()
  } else {
    dateRangeInput("int", "Interval", start = (Sys.Date() - 365),end = Sys.Date(),format = "mm/dd/yyyy", min = "2010-01-01", max = Sys.Date())
  }
})



observeEvent(input$button,{
  if (input$ticker != "") {
    storage$dataframe <- tq_get(input$ticker, from = input$int[1], to = input$int[2])
    storage$dataframe <- storage$dataframe[rev(order(storage$dataframe$date)),]
  } else
    return()
})

output$display <- DT::renderDataTable(
      datatable(
      storage$dataframe,selection = 'single',rownames = FALSE,escape = FALSE,extensions = c('Buttons'),
      class = "compact  nowrap  stripe  hover ",options = list(scrollX = TRUE,paging = TRUE,dom = 'Bfrtip',buttons = c('excel'),
      pageLength = 100,sScrollY = '80vh',columnDefs = list(list(width = '100px',className = 'dt-center',targets = "_all")),
      buttons = list('copy','print',list(
      extend = 'collection',
      buttons = c('csv', 'excel', 'pdf'),
      text = 'Download')))) %>%
      formatCurrency(c(7), currency = "", interval = 3, mark = ",",digits = 0) %>%
      formatCurrency(c(3,4,5,6,8), digits = 2, currency = "") %>% 
        formatDate(c(2), "toLocaleString",
                   params = list('en-US',list(year = 'numeric', month = 'short', day = 'numeric',hour = 'numeric',
                                              minute = 'numeric',second = 'numeric')))
)

observeEvent(input$button,{
  if (input$ticker != "") {
    storage$plot <- tq_get(input$ticker, from = input$int[1], to = input$int[2])
  } else
    return()
})

output$ts <- renderAmCharts({
  storage$plot$date <- as.POSIXct(storage$plot$date)
  
  if(input$measure == "All"){
    amTimeSeries(storage$plot, 'date', c('low','high','open','close'))
  }
  else {
    amTimeSeries(storage$plot, 'date', c(input$measure))
  }
})


}

