side_panel <- sidebarPanel(
  sliderInput(
    inputId = "year_graph",
    label = h5("Slide to pick a year"),
    min = 1990,
    max = 2021,
    value = c(1990),
    step = 1,
  ),
  textOutput(outputId = "sliderInput"),
  radioButtons(
    inputId = "emission_graph", 
    label = h5("Select a type of emission"),
    choices = list("Oil co2" = "oil_co2", 
                   "Coal co2" = "coal_co2")),
  textOutput(outputId = "emissionInput")
)

main_panel <- mainPanel(
  plotlyOutput(outputId = "barplot")
)


tab_two <- tabPanel(
  "Interactive Graph",
  headerPanel("2021 Top 10 Emitting Countries Throughout the Years"),
  sidebarLayout(
    side_panel,
    main_panel
  ),
  h5("Although some fluctuation, the top 10 emitting countries for both emission types remain mostly the same. This tells us that the same few countries have been responsible for contributing large amounts of co2 emissions for almost 30 years."),
  h5("This allows us to see what countries the UN might need to address individually and more severely look at action plans that can be taken to combat the effects of co2 such as placing sanctions and creating treaties and incentives with those consisit countries.")
)
