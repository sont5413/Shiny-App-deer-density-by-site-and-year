library(shiny)
library(tidyverse)
library(ggplot2)
library(dplyr)
deer_data <- read.csv("Survey_Data_Collated_ALL_SITES.csv")
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
      geom_point() +
      labs(title= "Deer Density by Year", 
           y="Deer Density",x="Year")
  })
}
shinyApp(ui,server)
