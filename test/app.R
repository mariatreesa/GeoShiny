#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(GeoShiny)
library(shiny)
library(googleway)
library(shinyjs)


# Define UI for application that draws a histogram
ui <- fluidPage(
  useShinyjs(),
  # Application title
  titlePanel("Geo Locations"),

  # Sidebar
  sidebarPanel(
    textInput("Address", "Address:", ""),
    actionButton("do", "Get GeoLocation")
  ),

  # Show a plot of the generated distribution
  google_mapOutput("mapplot")
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  map_key <- "AIzaSyD80OXQy4HTR3igDo_Sc0g4foUghixMVZI"

  observeEvent(input$do,{

    cordinatematrix <- geocode_response(input$Address)
    df = data.frame(lat = cordinatematrix[1], lon = cordinatematrix[2])


    output$mapplot <- renderGoogle_map({


      google_map(key = map_key,
                 location = c(cordinatematrix[1], cordinatematrix[2]),
                 zoom = 10,
                 split_view = "pano")%>%
        add_markers(data =df, lat = "lat", lon = "lon", marker_icon = "", update_map_view = FALSE)

    })

  }
  )}
# Run the application
shinyApp(ui = ui, server = server)
