library(shiny)


source("app_ui.R")
source("app_server.R")
rsconnect::setAccountInfo(name='cedricbri',
                          token='FCED4D1014247263B42E8FCD65DD6266',
                          secret='HI7//auP4gwZDwnPBPiLGnHBZLZEIBlyrnrfdvBQ')


shinyApp(ui = ui, server = server)
