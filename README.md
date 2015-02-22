# State Flu Vaccination Trends 2010 to 2013

This is a shiny application for class project in Coursera Data Science Course Developing Data Product.
It shows the state flu vaccination rate in the United States from 2010 to 2013 season.

## R program files

ui.R is at fluvac/ui.R
server.R is at fluvac/server.R

## Data
data is at fluvac/data
Source of data is CDC

## Deployed application
Deployed the applicaiton is at http://bin2000.shinyapps.io/fluvac

## Running locally

Make sure you have these libraries installed. 

```
install.packages('shiny')
install.packages('lattice')
install.packages('googleVis')
```

Then run

```
library(shiny)

shiny::runApp('fluvac')

```
