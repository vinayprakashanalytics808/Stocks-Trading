
# Alpha Vantage -----------------------------------------------------------

#' #' to get stocks data
#' 
#' # install.packages("alphavantager")
#' library(alphavantager)
#' 
#' # av_api_key("XK83T6JIZ627TCEJ")
#' av_api_key(Sys.getenv("AlphaVantageAPI"))


#' 
#' 

library(readxl)
# Ticker <- read_excel("C:/Users/admin/Documents/R shiny/Stocks-Trading/Ticker.xlsx")
Ticker <- read_excel("Ticker.xlsx")
Ticker <- Ticker %>% filter(!str_detect(Ticker, ".BO"))
Ticker <- as.data.frame(Ticker)
