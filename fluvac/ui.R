library(shiny)
library(lattice)

# Define UI for application that draws a histogram
shinyUI(
  navbarPage("State Flu Vaccination Trends for Children and Young Adults 2010 - 2013",
    tabPanel("Chart",  
      # Sidebar with a slider input for the number of bins
      sidebarLayout(
        sidebarPanel(
          selectInput("region", "Choose an region:", 
                  choices = c(
                              "HHS Region 1",
                              "HHS Region 2", 
                              "HHS Region 3", 
                              "HHS Region 4", 
                              "HHS Region 5", 
                              "HHS Region 6", 
                              "HHS Region 7", 
                              "HHS Region 8", 
                              "HHS Region 9")),    
      
          selectInput("agegroup", "Choose an age group:", 
                  choices = c("6 month to 4", 
                              "5 to 12", 
                              "13 to 17"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
          plotOutput("distPlot")
        )
      )
    ),
    tabPanel("Help",
             mainPanel(
               "Top chart shows State Flu Vaccination Trends. Use Region drop down box to select HHS Region.\nUse Age Group drop down box to select Age Group.\nSource of Data is CDC.\nClick Chart on top bar to return.\n"
             )
    )        
))
