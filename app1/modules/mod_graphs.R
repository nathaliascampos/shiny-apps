
# Module UI
mod_graphs_ui <- function(id){
    ns <- NS(id)
    tagList(
        
        panel(
            div(HTML(paste(icon("chart-bar"), "Charts")), id = "title"),
            
            fluidRow(
                
                h4("Dygraphs", id = "sub-title"), 
                
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
mod_graphs_server <- function(input, output, session){
    
    ns <- session$ns
    
    # load variables
    meses <- c("Jan", "Feb", "Mar", "Apr", "Maio","Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dec")
    dados1 <- c(90, 100, 70, 80, 120, 80, 100, 80, 100, 90, 110, 120)
    dados2 <- c(120, 110, 90, 100, 80, 100, 80, 120, 80, 70, 100, 100)
    valor <- data.frame(meses, dados1, dados2)
    airforecast <- forecast(auto.arima(AirPassengers), level = 95)
    
    # Using Highcharter package 
    output$high1 <- renderHighchart({
        
        highchart() %>%
            hc_chart(type = "line") %>%
            hc_xAxis(categories = valor$meses) %>%
            hc_add_series(valor$dados2, name = "Valor 2") 
        
    })
    
    output$high2 <- renderHighchart({
        
        highchart() %>%
            hc_chart(type = "line") %>%
            hc_xAxis(categories = valor$meses) %>%
            hc_add_series(valor$dados2, name = "Valor 2") 
        
    })
    
    output$high3 <- renderHighchart({
        highchart() %>%
            hc_chart(type = "column") %>%
            hc_xAxis(categories = valor$meses) %>%
            hc_add_series(valor$dados1, name = "Valor 1") 
    })
    
    output$arima <- renderHighchart({
        hchart(airforecast)
    })
    
    # Using Dygraphs package 
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

## To be copied in the UI
# mod_graphs_ui("graphs_ui_1")

## To be copied in the server
# callModule(mod_graphs_server, "graphs_ui_1")


