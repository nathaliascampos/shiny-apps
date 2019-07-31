
########################################################################################.
# Pacotes usados:
# - shinydashboard     (box)
# - shinydashboardPlus (boxPlus)
# - highchart          (highchartOutput)
# - shinycssloaders    (withSpinner) 
########################################################################################.

charts <- tabItem(
    tabName = "charts",
    
    fluidRow(
        
        boxPlus(
            title = "Highcharter", width = 12,
            closable = FALSE, collapsible = TRUE,
            
            enable_sidebar = TRUE, sidebar_width = 20,
            sidebar_content = "Informações...",
            
            highchartOutput("arima") %>% withSpinner(type = getOption("spinner.type", default = 1))
        ),
        
        box(title = "Highcharter", width = 8,
            highchartOutput("high2", height = "250px") %>% withSpinner(type = getOption("spinner.type", default = 1))
        ),
        box(title = "Highcharter", width = 4,
            highchartOutput("high3", height = "250px") %>% withSpinner(type = getOption("spinner.type", default = 1))
        )
        
    ) 
)

