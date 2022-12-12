library("plotly")
library("ggplot2")
library("dplyr")
library("tidyr")

source("chart1.R")
source("introTab.R")

ui <- fluidPage(navbarPage("A5",
  tab_one,
  tab_two))


