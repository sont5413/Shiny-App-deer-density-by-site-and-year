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
      geom_path(color = "grey", size = 0.5) + 
      geom_point(shape=21, color="black", fill="#69b3a2", size=4) +
      labs(title= "Deer Density Trends", 
           y="Deer Density (acres per deer)",x="Year")+
      theme(axis.text.x = element_text(size = 12),
            axis.text.y = element_text(size = 12),
            axis.title.x = element_text(size = 15),axis.title.y = element_text(size = 15))

  })
}
shinyApp(ui,server)
