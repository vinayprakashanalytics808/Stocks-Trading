library(shiny)
library(shinydashboard)
library(DT)
source("data_wrangling.R")
library(tidyquant)
library(readxl)
library(rAmCharts)
library(dplyr)
library(tidyverse)

# Define UI for application that draws a histogram
navbarPage("Trading Analysis",position = "fixed-top",
           selected = "Data", 
           tags$script(src = "app.js"),
           tags$style("body {background-color: skyblue;}"),
           tags$head(tags$style(".shiny-output-error{visibility: hidden;}")),
           tags$style(type = "text/css", "body{padding-top: 65px; padding-left:0px;}"),
           tags$head(tags$style(HTML('.navbar-brand{width: 200px; font-size:20px; text-align:center;}'))),
           tabPanel("Data",
                    sidebarLayout(
                      sidebarPanel(selectInput('ticker','Ticker',choices = c("",levels(factor(Ticker$Ticker))),selected = ""),
                                   # uiOutput("measures"),
                                   uiOutput("interval"),
                                   uiOutput("click_button"),
                      width = 2),
                      mainPanel(dataTableOutput("display"),
                                br(),br(),br(),br(),
                                amChartsOutput("ts"))
                    )))


