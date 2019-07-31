################################################################################.
# Shiny App using shinydashboard
#
# Author: Nathália Campos
# Created: 2019-07-31
################################################################################.


server <- function(input, output, session) {
    
    # load variables
    
    meses <- c("Jan", "Feb", "Mar", "Apr", "Maio","Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dec")
    dados1 <- c(90, 100, 70, 80, 120, 80, 100, 80, 100, 90, 110, 120)
    dados2 <- c(120, 110, 90, 100, 80, 100, 80, 120, 80, 70, 100, 100)
    valor <- data.frame(meses, dados1, dados2)
    
    airforecast <- forecast(auto.arima(AirPassengers), level = 95)
    
    # Graphs ------------------------------------------------------------------------
    
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
    
    # Tables ------------------------------------------------------------------------
    
    df <- rock %>% head
    
    output$table_dt = renderDT(
        df, options = list(lengthChange = FALSE)
    )
    
    output$table_rhandsontable <- renderRHandsontable({
        rhandsontable(df, readOnly = TRUE, stretchH = "all") %>% 
            hot_col(1:length(df), halign = "htCenter") %>% 
            hot_cols(renderer = "
                function(instance, td, row, col, prop, value, cellProperties) {
                    Handsontable.renderers.NumericRenderer.apply(this, arguments);
                    td.style.color = 'black';
                    
                }")
    })
    
    output$table_formattable <- renderFormattable({
        formattable(df)
    })
    
    output$table1 <- renderTable(head(df, n = 6)) 
    
    
    
    
    # Testes -------------------------------------------------------------------------
    
    output$teste <- renderUI({
        
        box( width = 4,
            HTML(
                paste0(
                    '<div class="card">
                        <h1>Estimativa</h1>
                        <p></p>
                        <a href="#"><i class="fa fa-dribbble"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-linkedin"></i></a>
                    </div>'
                )
            )
        )
        
        # material_column(
        #     width = 2,
        #     material_card(
        #         title = HTML(
        #             paste0(
        #                 "<span style='font-weight:bold; color:", "#2196f3", "'>", "Card 1", "</span>&nbsp;&nbsp;",
        #                 "<span style='font-size:14px'>", "Teste2", "</span>"
        #             )
        #         ),
        #         depth = 3,
        #         HTML(
        #             paste0(
        #                 "<div class='text-right'>
        #                     <span style='font-size:28px'>", 
        #                 "teste3"
        #             ),
        #             "</span>
        #             </div>"
        #         )
        #     )
        # )
    })

}
