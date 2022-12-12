library(ggplot2)
library(plotly)
library(dplyr)
library(markdown)
library(bslib)
library(shiny)
library(shinyWidgets)
library(tidyverse)
library(uuid)

climate_data <- read.csv("owid-co2-data.csv")
climate_data <- na.omit(climate_data)

server <- function(input, output) {
  
  total_co2 = sum(climate_data$co2)
  
  
  output$value1 <- renderText({
    paste("Since 1990, there has been", total_co2, "million tonnes emitted by the world.")
  })
  
  max_co2_per_capita <- climate_data %>%
    filter(co2_per_capita == max(co2_per_capita)) %>%
    select(co2_per_capita)
  
  output$value2 <- renderText({
    paste("The highest co2 per capita ever recorded was", max_co2_per_capita, "tonnes per person emitted.")
  })
  
  average_US <- climate_data %>%
    filter(country == "United States") %>%
    summarize(
      average = mean(co2)
    )
  
  output$value3 <- renderText({
    paste("Since 1990, the average co2 emitted by the United States is", average_US, "million tonnes emitted.")
  })
  
  
  output$sliderInput <- renderText({
    paste("The year selected is", input$year_graph)
  })
  
  output$emissionInput <- renderText({
    paste("The emission selected is", input$emission_graph)
  })

    
    output$barplot <- renderPlotly({
      
      climate_data_graph <- climate_data %>%
        select(year, country, input$emission_graph) %>%
        filter(year == input$year_graph) %>%
        arrange(desc(input$emission_graph)) %>%
        top_n(10)
      
      emission_value <- climate_data_graph[[3]]

  bar_plot <- ggplot(data = climate_data_graph) +
    geom_bar(aes(x = country, y = emission_value), stat="identity", fill="steelblue") +
    xlab("Country") +
    ylab("Million tonnes") +
    ggtitle(paste("Top 10", input$emission_graph, "Emitting Countries in the Year", input$year_graph))
    
  ggplotly(bar_plot)
  return(bar_plot)
    })
}






