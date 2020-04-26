library(shiny)
library(shinydashboard)
library(DT)
source("data_wrangling.R")

# Define UI for application that draws a histogram
navbarPage("Trading",
           selected = "Data",
           # tags$script(src = "app.js"),
           tags$style("body {background-color: skyblue;}"),
           tabPanel("Data",
                    sidebarLayout(
                      sidebarPanel(selectInput('span','Span',choices = c("", "TIME_SERIES_INTRADAY", "TIME_SERIES_DAILY"),selected = ""),
                                   uiOutput("check_intraday"),
                                   uiOutput("check_daily"),
                                   uiOutput("click_button"),
                                   width = 2), 
                      mainPanel(dataTableOutput("display"))
                    )))
