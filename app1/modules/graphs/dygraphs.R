
### Using Dygraphs package
library(dygraphs)

# Module UI
dygraphs_ui <- function(id){
    ns <- NS(id)
    tagList(
        
        panel(
            div(HTML(paste(icon("chart-bar"), "Charts")), id = "title"),
            
            fluidRow(
                
                box(title = "Graph 1", width = 12, status = "primary", solidHeader = TRUE,
                    dygraphOutput(ns("dygraphs1"), height = "250px")
                ),
                box(title = "Graph 2", status = "primary", solidHeader = TRUE,
                    dygraphOutput(ns("dygraphs2"), height = "250px")
                ),
                box(title = "Graph 3", status = "primary", solidHeader = TRUE,
                    dygraphOutput(ns("dygraphs3"), height = "250px")
                ),
                
                hr(),
                
                h4("Highcharter", id = "sub-title"), 
                
                box(title = "Graph 1", width = 12, status = "primary", solidHeader = TRUE,
                    highchartOutput(ns("arima"), height = "250px") %>% withSpinner(type = getOption("spinner.type", default = 1))
                ),
                box(title = "Graph 2", width = 8, status = "primary", solidHeader = TRUE,
                    highchartOutput(ns("high2"), height = "250px") %>% withSpinner(type = getOption("spinner.type", default = 1))
                ),
                box(title = "Graph 3", width = 4, status = "primary", solidHeader = TRUE,
                    highchartOutput(ns("high3"), height = "250px") %>% withSpinner(type = getOption("spinner.type", default = 1))
                )
                
            )
        )
        
    )
}

# Module Server
dygraphs_server <- function(input, output, session){
    
    ns <- session$ns
    
    # load variables
    
    
    ### Gráficos 
    output$dygraphs1 <- renderDygraph({
        lungDeaths <- cbind(mdeaths, fdeaths)
        
        dygraph(lungDeaths) %>%
            dySeries("mdeaths", label = "Male") %>%
            dySeries("fdeaths", label = "Female") %>%
            dyOptions(stackedGraph = TRUE) %>%
            dyRangeSelector(height = 20)
    })
    
    output$dygraphs3 <- output$dygraphs2 <- renderDygraph({
        hw <- HoltWinters(ldeaths)
        predicted <- predict(hw, n.ahead = 72, prediction.interval = TRUE)
        
        dygraph(predicted, main = "Predicted Lung Deaths (UK)") %>%
            dyAxis("x", drawGrid = FALSE) %>%
            dySeries(c("lwr", "fit", "upr"), label = "Deaths") %>%
            dyOptions(colors = RColorBrewer::brewer.pal(3, "Set1"))
    })
    
}

