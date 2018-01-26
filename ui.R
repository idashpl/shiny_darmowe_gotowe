################################################################################
# Plik zawierający kod interfejsu użytkownika
################################################################################

fluidPage(
  titlePanel(windowTitle = "Wstęp do Shiny - app",
             title = div(img(src = "logo_black.png",
                             width = "10%",
                             style = "margin:5px 20px"))),
  sidebarPanel(
    selectInput("carrierName", 
                label = "Select carrier:",
                choices = sort(chosenCarrier$name),
                selected = sort(chosenCarrier$name)[1],
                multiple = T),
    numericInput("distance_val", label = "Flight distance longer than (miles):", value = 500),
    uiOutput("delayRange")
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Delay over day",
               plotOutput('ddelay_plot')
      ),
      tabPanel("Explore data",
               tableOutput("table")
      )  
    )
  )
)

