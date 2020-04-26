library(shiny)
library(shinydashboard)
library(DT)
source("data_wrangling.R")
library(tidyquant)
library(readxl)
library(rAmCharts)
library(dplyr)
library(tidyverse)
library(stringr)

# Define UI for application that draws a histogram
navbarPage("Trading Analysis",position = "fixed-top",fluid = TRUE,id = "Main",
           tabPanel("Data", 
                    sidebarLayout(
                      sidebarPanel(style = "position:fixed;width:250px;",selectInput('ticker','Ticker',choices = c("",levels(factor(Ticker$Ticker))),selected = ""),
                                   
                                   uiOutput("interval"),
                                   uiOutput("click_button"),
                                   br(),
                                   uiOutput("measures"),
                      width = 2),
                      mainPanel(dataTableOutput("display"),
                                br(),br(),br(),br(),
                                amChartsOutput("ts"))  #timeseries chart
                    )),
           tags$style(".Main{padding-top:100px;}"),
           tags$style("body {background-color: white;}"),
           tags$style("#display tr{background-color: #696969;}","#display td, th{color: white;}"),
           tags$style("body{padding-top: 65px; padding-left:0px;}"),
           tags$head(tags$style(".shiny-output-error{visibility: hidden;}"))
           # tags$script(src = "app.js")
           )



