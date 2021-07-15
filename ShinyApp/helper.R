# helper.R is created separately to make ui.R look cleaner.
# The boxes created here are used in the overview tab on the Shiny App.

overviewbox = column(width = 12,
                  h4("Projekt i Vizualizimit te te Dhenave"),
                  h1("Ndotja atmosferike ne Shqiperi"),
                  p("Aplikacioni sherben per te pare dhe te kuptuar me mire ndotjen atmosferike ne Shqiperi."),
                  br())
baselineinfobox = column(width = 12,
                      p(tags$li("8 vite (2012 - 2019) jane te perfshira ne bazen e te dhenave.")),
                      p(tags$li("7 ndotes (SO2, NO2, CO, O3, PM10, PM2.5, Benzen)."))
                      
                      )
pollutantbox = column(width = 12,
                      p(tags$li(strong("Dioksid Squfuri (SO2):"))), 
                      p("Prodhohet nga vullkanet dhe proceset te ndryshme industrial."),
                      p(tags$li(strong("Dioksid azoti (NO2):"))), 
                      p("Rezultat i trafikut nga automjete dhe tymit te cigareve. Ka arome te forte."),
                      p(tags$li(strong("Ozon (O3):"))), 
                      p("E formuar nga NOx. Eshte perberes i smogut dhe mund te shkaktoj semundje respiratore."),
                      p(tags$li(strong("Monoksid Karboni (CO):"))), 
                      p("Produkt i djegies se brendshme nga gazi, qymyri ose druri. Mund te shkaktoj dhimbje koke dhe te vjella."),
                      p(tags$li(strong("Grimca 10 (PM10):"))), 
                      p("Perzierje kompleke e pluhurit, polenit, bloze, tym, qe shkakton infeksione respiratore dhe semundje te zemres."),
                      p(tags$li(strong("Grimca 2.5 (PM2.5):"))), 
                      p("Nenbashkesi e PM10, me e holle se fija e flokut. Mund te thithet brenda indit te mushkrive."),
                      p(tags$li(strong("Benzen:"))), 
                      p("Nje ndotes shume toksik dhe karcinogjen, i paklasifikuar nga OBSH pasi dhe ne sasi te vogla mund te shkaktoj probleme.")
                      )