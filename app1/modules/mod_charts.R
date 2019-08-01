
########################################################################################.
# Pacotes usados:
# - shinydashboard     (box)
# - highchart          (highchartOutput)
# - shinycssloaders    (withSpinner) 
########################################################################################.

charts <- tabItem(
    tabName = "charts",
    
    panel(
        div(HTML(paste(icon("chart-bar"), "Charts")), id = "title"),
        
        fluidRow(
            box(title = "Highcharter", width = 12, status = "primary", solidHeader = TRUE,
                highchartOutput("arima") %>% withSpinner(type = getOption("spinner.type", default = 1))
            ),
            
            box(title = "Highcharter", width = 8, status = "primary", solidHeader = TRUE,
                highchartOutput("high2", height = "250px") %>% withSpinner(type = getOption("spinner.type", default = 1))
            ),
            box(title = "Highcharter", width = 4, status = "primary", solidHeader = TRUE,
                highchartOutput("high3", height = "250px") %>% withSpinner(type = getOption("spinner.type", default = 1))
            )
        )
    )
)

