library(shiny)
library(tidyverse)
library(ggplot2)
library(dplyr)
file = "c:/Users/wpson/OneDrive - Texas State University/Desktop/Shiny_App_Practice/Shiny_app_work/Survey_Data_Collated_ALL_SITES.csv"
deer_data <- read.csv(file)
ui <- fluidPage(
  selectInput(inputId = "site",
             label = "Site:",
             choices = list(Wolters = "WOLTERS",
                            Maxey = "MAXEY",
                            Swift = "SWIFT",
                            Bowie = "BOWIE")),
  plotOutput(outputId = "plot"))
server <- function(input, output) {
  output$plot <- renderPlot({
    deer_data %>%
      filter(site == input$site) %>%
  ggplot(aes(x=year,y=hicount)) +
      geom_path() + 
      geom_point()
  })
}

shinyApp(ui,server)
