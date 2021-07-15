# ui design
library(shinydashboard)
source('helper.R')
source('server.R')

fluidPage(
  dashboardPage(
    dashboardHeader(title = "Ndotja e Ajrit ne Shqiperi"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Faqja Kryesore", tabName = "overview", icon = icon("info")),
        menuItem("Harta Ndervepruese", tabName = "map", icon = icon("map"))
        )),
    dashboardBody(tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    tabItems(
      tabItem(tabName = "overview",
              fluidRow(column(12, overviewbox)),
              fluidRow(
                column(
                  6,
                  box(
                    width = NULL,
                    baselineinfobox,
                    title = "Informacion",
                    solidHeader = TRUE,
                    status = "primary"
                  )
                ),
                box(
                  width = 6,
                  pollutantbox,
                  title = "Pershkrimi i Ndoteseve",
                  solidHeader = TRUE,
                  status = "primary"
                )
              )
              ),
      tabItem(tabName = "map",
              fluidRow(
                box(
                  width = 9,
                  leafletOutput("map", height = 500),
                  title = "Harta e Shqiperise",
                  solidHeader = TRUE,
                  status = "primary"
                ),
                column(
                  2,
                  radioButtons(
                    inputId = "finedust",
                    label = h4("Zgjidh ndotesin"),
                    choices = c( "SO2", "NO2", "O3", "PM10", "PM2.5", "CO", "Benzen"),
                    inline = TRUE
                  ),
                  br(),
                  sliderInput(
                    inputId = "year",
                    label = h4("Zgjidh vitin"),
                    min = 2012,
                    max = 2019,
                    value = c(2012),
                    sep = ""
                  ),
                )
              ),
              h5(strong("*Njesia matese e vlerave eshte 'mikrogram/m3'")),
              h5(strong("*Njesia matese e CO eshte 'miligram/m3'")),
              fluidRow(
                column(
                  11,
                  infoBoxOutput("good_neighborhood", width = 3),
                )
              ),
              fluidRow(
                column(
                  11,
                  infoBoxOutput("bad_neighborhood", width = 3)
                ),
              )
          )
        )
      )
    )
)
