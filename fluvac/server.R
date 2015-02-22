library(shiny)
library(lattice)
library(googleVis)

dataset1 <- read.csv("data/6mon_4_states.csv", header = TRUE)
names(dataset1) <- c("Group", "Region", "Area", "Season", "Percent", "95_CI")
dataset2 <- read.csv("data/5_12_states.csv", header = TRUE)
names(dataset2) <- c("Group", "Region", "Area", "Season", "Percent", "95_CI")
dataset3 <- read.csv("data/13_17_states.csv", header = TRUE)
names(dataset3) <- c("Group", "Region", "Area", "Season", "Percent", "95_CI")

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
    datasetInput <- reactive({
      switch(input$agegroup,
             "6 month to 4" = dataset1,
             "5 to 12" = dataset2,
             "13 to 17" = dataset3)
    })    

    dataSelected <- subset(datasetInput(), Region==input$region)
    dataSelected$Area <- factor(dataSelected$Area)
    
    trellis.par.set(list(layout.widths=list(left.padding=0, right.padding=0, ylab.axis.padding=0, axis.right=0, key.ylab.padding=0)))    
    g <-  xyplot(Percent ~ Season, data=dataSelected,
             group=Area, type="b", 
             ylim = c(0, 100),
             drop.unused.levels=TRUE,
             auto.key=list(space="right"),
             par.settings=list(superpose.symbol=list(pch=c(1, 3, 16),
                                                     fill="white")))
    print(g)      
  })
  
  output$gvisStateMap <- renderGvis({
    datasetInput <- reactive({
      switch(input$agegroup,
             "6 month to 4" = dataset1,
             "5 to 12" = dataset2,
             "13 to 17" = dataset3)
    })    
    
    dataSelected <- subset(datasetInput(), Region==input$region)
    dataSelected$Area <- factor(dataSelected$Area)
    
    gvisGeoChart(dataSelected,
                locationvar="Area", colorvar="Percent",
                options=list(region="US", displayMode="regions",
                                resolution="provinces",
                                width=500, height=400,
                                colorAxis="{colors:['#FFFFFF', '#0000FF']}"))
  })
    
})
