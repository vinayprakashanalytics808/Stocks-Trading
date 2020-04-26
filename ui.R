library(shiny)
library(shinydashboard)
library(DT)
source("data_wrangling.R")
library(tidyquant)
library(readxl)

# Define UI for application that draws a histogram
navbarPage("Trading",
           selected = "Data",
           tags$script(src = "app.js"),
           tags$style("body {background-color: skyblue;}"),
           tabPanel("Data",
                    sidebarLayout(
                      sidebarPanel(selectInput('ticker','Ticker',choices = c("",levels(factor(Ticker$Ticker))),selected = ""),
                                   # uiOutput("measures"),
                                   # uiOutput("interval"),
                                   # uiOutput("click_button"),
                                   selectInput('ticker1','Ticker',choices = c("",levels(factor(Ticker$Ticker))),selected = ""),
                      width = 2),
                      mainPanel(dataTableOutput("display"))
                    )))
