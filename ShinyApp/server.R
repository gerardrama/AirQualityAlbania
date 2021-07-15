library(shiny)
library(shinydashboard)
library(leaflet)
library(plotly)
library(tidyverse)
library(DT)
library(na.tools)
library(dplyr)
library(rsconnect)

sum_df <- read.csv("sum_df.csv")

getColorSO2 <- function(colors) {
  if (colors < 10 ) {"green"} 
  else if (colors < 15 ) {"blue"} 
  else if (colors < 20) {"orange"} 
  else {"red"}
}

getColorNO2 <- function(colors) {
  if(colors < 20) {"green"} 
  else if (colors < 40) {"blue"} 
  else if (colors < 50) {"orange"} 
  else {"red"}
}

getColorO3 <- function(colors) {
  if(colors < 50) {"green"} 
  else if (colors < 110) {"blue"} 
  else if (colors < 150) {"orange"} 
  else {"red"}
}

getColorPM10 <- function(colors) {
  if(colors < 25) {"green"} 
  else if (colors < 50) {"blue"} 
  else if (colors < 60) {"orange"} 
  else {"red"}
}

getColorPM25 <- function(colors) {
  if(colors < 5) {"green"} 
  else if (colors < 10) {"blue"} 
  else if (colors < 15) {"orange"} 
  else {"red"}
}

getColorCO <- function(colors) {
  if(colors < 5) {"green"} 
  else if (colors < 10) {"blue"} 
  else if (colors < 15) {"orange"} 
  else {"red"}
}

getColorBenzen <- function(colors) {
  if(colors < 2) {"green"} 
  else if (colors < 5) {"blue"} 
  else if (colors < 7) {"orange"} 
  else {"red"}
}


#rsconnect::setAccountInfo(name='albania', token='703EAD8CFC2307BD402101C024EC66CF', secret='D/vECCT6rCue7b6Ip/j+1ZxYu2IDSL2UJZOqhS3l')
#rsconnect::deployApp("/Users/aquila/Downloads/albaniaairpollution-master")




shinyServer(function(input, output, session){
  air_map <- reactive({
    sum_df %>% 
      filter(years == input$year) %>% 
      group_by(city) %>% 
      summarise(lat = first(Latitude), 
                long = first(Longitude),
                SO2 = SO2,
                NO2 = NO2,
                O3 = O3,
                PM10 = PM10,
                PM2.5 = PM2.5,
                CO = CO,
                Benzen = Benzen) %>% 
      select(city, lat, long, contains(input$finedust)) 
  })

  output$map <- renderLeaflet({
    df <- air_map()
    vleraInput <- input$finedust
    if (input$finedust == "SO2") {
      df <- air_map() %>% filter(!is.na(SO2))
      getColor <- sapply(df$SO2, getColorSO2)
    } else if (input$finedust == "NO2") {
      df <- air_map() %>% filter(!is.na(NO2))
      getColor <- sapply(df$NO2, getColorNO2)
    } else if (input$finedust == "O3") {
      df <- air_map() %>% filter(!is.na(O3))
      getColor <- sapply(df$O3, getColorO3)
    } else if (input$finedust == "PM10") {
      df <- air_map() %>% filter(!is.na(PM10))
      getColor <- sapply(df$PM10, getColorPM10)
    } else if (input$finedust == "PM2.5") {
      df <- air_map() %>% filter(!is.na(PM2.5))
      getColor <- sapply(df$PM2.5, getColorPM25)
    } else if (input$finedust == "CO") {
      df <- air_map() %>% filter(!is.na(CO))
      getColor <- sapply(df$CO, getColorCO)
    } else {
      df <- air_map() %>% filter(!is.na(Benzen))
      getColor <- sapply(df$Benzen, getColorBenzen)
    }
    
    icons <- awesomeIcons(
      icon = "ios-cloud",
      iconColor = 'white',
      library = 'ion',
      markerColor = getColor)
    
    leaflet(df) %>%
      addTiles() %>%
      addAwesomeMarkers(lat = df$lat, 
                 lng = df$long,
                 popup = ~paste('<b>',df$city,'</b><br/>',
                                "Vlera: ", df[[vleraInput]]),
                 icon = icons) %>% 
      addLegend(
        colors = c("#4CBB17","#0099FF", "#F9A602", "#CC0000"),
        labels = customLabel(vleraInput),
        opacity = 0.8
      )
  })
  
  output$good_neighborhood <- renderInfoBox({
    best_neighborhood = air_map() %>% arrange(air_map()[[4]])
    best = best_neighborhood %>% 
      summarise(first(city), first(best_neighborhood[[4]]))
    print(best)
    col = customColor(input$finedust, best[[2]])
    infoBox(
      "Ajri me i paster", best[[1]], icon = icon("thumbs-up", lib = "glyphicon"),
      color = col)
  })
  
  output$bad_neighborhood <- renderInfoBox({
    worst_neighborhood = air_map() %>% arrange(desc(air_map()[[4]]))
    worst = worst_neighborhood %>% 
      summarise(first(city), first(worst_neighborhood[[4]]))
    col = customColor(input$finedust, worst[[2]])
    
    infoBox(
      "Ajri me i ndotur", worst[[1]], icon = icon("thumbs-down", lib = "glyphicon"),
      color = col)
  })
})

customColor <- function(inputParam, colorNumber){
  if (inputParam == "SO2") {
    return(getColorSO2(colorNumber))
  } 
  if(inputParam == "NO2"){
    return(getColorNO2(colorNumber))
  } 
  if(inputParam == "O3"){
    return(getColorO3(colorNumber))
  } 
  if(inputParam == "PM10"){
    return(getColorPM10(colorNumber))
  } 
  if(inputParam == "PM2.5"){
    return(getColorPM25(colorNumber))
  } 
  if(inputParam == "CO"){
    return(getColorCO(colorNumber))
  } 
  else {
    return(getColorBenzen(colorNumber))
  }
}

customLabel <- function(inputParam){
  if (inputParam == "SO2") {
    return(c("Good: 0 ~ 25", "Normal: 25 ~ 50", "Bad: 50 ~ 60", "Very Bad: 60+"))
  } 
  if(inputParam == "NO2"){
    return(c("Good: 0 ~ 20", "Normal: 20 ~ 40", "Bad: 40 ~ 50", "Very Bad: 50+"))
  } 
  if(inputParam == "O3"){
    return (c("Good: 0 ~ 50", "Normal: 50 ~ 110", "Bad: 110 ~ 150", "Very Bad: 150+"))
  } 
  if(inputParam == "PM10"){
    return(c("Good: 0 ~ 25", "Normal: 25 ~ 50", "Bad: 50 ~ 60", "Very Bad: 60+"))
  } 
  if(inputParam == "PM2.5"){
    return(c("Good: 0 ~ 5", "Normal: 5 ~ 10", "Bad: 10 ~ 15", "Very Bad: 15+"))
  } 
  if(inputParam == "CO"){
    return(c("Good: 0 ~ 5", "Normal: 5 ~ 10", "Bad: 10 ~ 15", "Very Bad: 15+"))
  } 
  else {
    return(c("Good: 0 ~ 1", "Normal: 2 ~ 5", "Bad: 5 ~ 7", "Very Bad: 7+"))
  }
}