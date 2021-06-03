#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


#load R packages
library(shiny)
library(leaflet)
library(RColorBrewer)
library(xts)
library(rgdal)
library(plotly)
library(ComputationalMovementAnalysisData)


#load boars data set
boars <- wildschwein_BE
boars<- na.omit(boars)
boars$DatetimeUTC <- as.Date(boars$DatetimeUTC)

#define pal for chart legend
pal <- colorFactor(pal = "Set1", domain = boars$TierName)

#shiny UI
ui <- fluidPage(
    titlePanel("COVID-19  Micromobilitty Modal Share Development"),
    
    sidebarPanel(width = 3,
                 h3("Map Controls"),
                 
                 radioButtons(inputId = "mapType",
                              label = "Select Map Type",
                              choices = c("Markers", "Choropleth"),
                              selected = "Markers",
                              inline = TRUE),
                 
                 radioButtons(inputId = "frequency",
                              label = "Select Data Frequency",
                              choices = c("days", "weeks"),
                              selected = "weeks",
                              inline = TRUE
                 ),
                 
                 uiOutput("dateUI")

    ),
    
    mainPanel(width = 9,
              
              leafletOutput("map", width = "100%", height = "500px"),
              h3("Average Daily Mircomobility Modal Share in Zurich")
              
    )
)


#shiny server
server <- function(input, output, session) {
    
    #create slider input depending on data frequency
    observe({
        
        allDates <- unique(boars$DatetimeUTC)
        eligibleDates <- allDates[xts::endpoints(allDates, on = input$frequency)]
        
        output$dateUI <- renderUI({
            sliderInput("dateSel", "Date",
                        min = min(eligibleDates),
                        max = max(eligibleDates),
                        value = min(eligibleDates),
                        step = stepSize,
                        timeFormat = "%d %b %Y", #This is purley cosmetic, no influence on data read
                        br(),
                        animate = animationOptions(interval = 500, loop = FALSE)
            )
        })
    })
    
    #filter data depending on selected date
    filteredData <- reactive({
        req(input$dateSel)
        boars[boars$DatetimeUTC == input$dateSel, ]
    })
    
    #create the base leaflet map
    output$map <- renderLeaflet({
        leaflet(boars) %>% 
            crs = epsg2056 %>%
            addCircles(lng = ~E, lat = ~N) %>% 
            addTiles() %>%
            addCircleMarkers(data = boars, lng = ~E, lat = ~N, 
                             radius = 3, popup = ~as.character(cntnt), 
                             color = pal,
                             stroke = FALSE, fillOpacity = 0.8)%>%
            addLegend(pal=pal, values=boars$ZierName,opacity=1, na.label = "Not Available")%>%
            addEasyButton(easyButton(
                icon="fa-crosshairs", title="ME",
                onClick=JS("function(btn, map){ map.locate({setView: true}); }")))
    })
    #################################3
    output$map <- renderLeaflet({
        leaflet(boars) %>%
            crs = epsg2056 %>%
            addCircles(lng = ~E, lat = ~N) %>% 
            addTiles()  %>% 
            setView(lat = 1204123.5, lng = 2571202.2, zoom = 12)%>% 
            addProviderTiles("CartoDB.PositronNoLabels") %>% #Choosing the bg map tile style
            
            
            
            #need to specify the leaflet::addLegend function here to avoid ambiguity with the xts::addLegend function
            leaflet::addLegend(pal = pal, values = boars$TierName, opacity = 0.9, title = "Shared Mobility % of Modal Share", position = "bottomleft")
        
    })
    
    
}

shinyApp(ui = ui, server = server)
