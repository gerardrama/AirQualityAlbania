# Air Pollution Visualization Project in Albania
The "AirQualityAlbania" project is a comprehensive R-based analysis and visualization tool designed to assess air quality in Albania. It consists of two main components: an R Markdown document for data analysis and a Shiny application for interactive visualization.

## Shiny App
You can find the Shiny App here:
[AirQualityAlbania](https://albania.shinyapps.io/albaniaairpollution-master/)

## Components
- **RMarkdown Document (REALPROJECT.Rmd)**: Located in the RMarkdown_dhe_dataset directory. Contains the data analysis and visualization code. Utilizes datasets stored in the Dataset subdirectory, including different CSV file statistics.
- **Shiny Application**: Located in the ShinyApp directory. 
  
  Files include
  - helper.R (functions used in the app)
  - server.R (server logic)
  - ui.R (user interface design)
  - sum_df.csv (a summary dataset)
Provides an interactive interface for exploring the air quality data.
## Features
- In-depth Data Analysis: Utilizes R Markdown to perform detailed data analysis on air quality metrics in Albania. The analysis includes various statistical methods and data visualization techniques.
- Interactive Map: Visualizes pollution levels across different regions in Albania.
- Data Visualization: Uses plotly and leaflet for dynamic and interactive visualizations.

## Getting Started
### Prerequisites
- R, RStudio
- Shiny and other required R packages (shinydashboard, leaflet, plotly, tidyverse, DT, na.tools, dplyr, rsconnect)

## Running the Application
1. Clone the repository to your local machine.
2. Open R Studio and set your working directory to the cloned repository's folder.
3. For RMarkdown run the *REALPROJECT.Rmd*.
4. For Shiny App install all packages in the .r files and then run *ui.r* 

## Contributing
This was made in collaboration with: [FrediGj](https://github.com/fredigj)

