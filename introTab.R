tab_one <- tabPanel(
  "Introduction",
  headerPanel(strong("A Look Into Carbon Emissions in the World")),
  h3("Cedric Brinkmann, cbrink@uw.edu, INFO 201 A"),
  img(src = "intropic.jpg", align = "center", width = "50%", height = "50%"),
  h5("This application looks at the variables year, country, coal co2 emissions as well as oil co2 emissions."),
  h5("Coal co2 looks at the annual production-based emissions of carbon dioxide (CO₂) from coal, measured in million tonnes."),
  h5("Oil co2 looks at the annual production-based emissions of carbon dioxide (CO₂) from oil, measured in million tonnes. "),
  h5("For the year selected and the emission type selected, the graph will display the emission levels for the top 10 emitting countries of that given year for the given emission type."),
  h3("Some Values to Look At"),
  h4("How many million tonnes of co2 has been emitted since 1990?"),
  textOutput(outputId = "value1"),
  h4("What is the largest per capita co2 emitted?"),
  textOutput(outputId = "value2"),
  h4("On average, how much co2 has the United States emitted?"),
  textOutput(outputId = "value3"),
  )


