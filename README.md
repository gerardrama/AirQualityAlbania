# Air Pollution Visualization Project in Albania
This repository contains the source code for a Shiny application that visualizes air pollution data in Albania. The application is designed to provide insights into atmospheric pollution levels across different regions in the country.

## Shiny App
You can find the Shiny App here:
[AirQualityAlbania](https://albania.shinyapps.io/albaniaairpollution-master/)

## Repository Structure
- **ui.R**: Defines the user interface of the Shiny application. It uses shinydashboard for layout and imports helper.R and server.R for additional functionalities.
- **server.R**: Contains the server logic of the Shiny application. It includes code for data processing, visualization (using libraries like leaflet and plotly), and reactive elements.
- **helper.R**: Contains helper functions and UI components to keep ui.R clean and readable. It defines various UI boxes used in the application.
- **sum_df.csv**: The dataset used in the application. It contains summarized air pollution data for different regions in Albania.

## Features
- Interactive Map: Visualizes pollution levels across different regions in Albania.
- Data Visualization: Uses plotly and leaflet for dynamic and interactive visualizations.

## Getting Started
### Prerequisites
- R
- Shiny and other required R packages (shinydashboard, leaflet, plotly, tidyverse, DT, na.tools, dplyr, rsconnect)

## Running the Application
Clone the repository to your local machine.
Open R Studio and set your working directory to the cloned repository's folder.
Install the necessary packages of all .r files.
Run the ui.r file and the Shiny application should now be running on your local server.

## Contributing
This was made in collaboration with: [FrediGj](https://github.com/fredigj)

