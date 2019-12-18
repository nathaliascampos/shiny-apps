
# Module UI

#' @title   mod_tables_ui and mod_tables_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_tables
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_tables_ui <- function(id){
    ns <- NS(id)
    tagList(
        
        
        panel(
            div(HTML(paste(icon("table"), "Tables")), id = "title"),
            
            fluidRow(
                box(title = "Tabelas disponívels no Shiny R", 
                    width = 12,
                    status = "primary",
                    solidHeader = TRUE, 
                    tabBox(
                        width = 12,
                        tabPanel(
                            "table",
                            tableOutput(ns("table1"))
                        ),
                        tabPanel(
                            "formattable",
                            formattableOutput(ns("table_formattable"))
                        ),
                        tabPanel(
                            "rHandsontable",
                            rHandsontableOutput(ns("table_rhandsontable"))
                        ),
                        tabPanel(
                            "DT",
                            DTOutput(ns("table_dt"))
                        )
                    )
                ),
                
                box(title = "Tabelas Usadas", width = 12,
                    solidHeader = TRUE, status = "primary",
                    includeMarkdown("docs/tables.md")
                )
            )
        )
        
        
        
    )
}

# Module Server

#' @rdname mod_tables
#' @export
#' @keywords internal
mod_tables_server <- function(input, output, session){
    ns <- session$ns
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
    
}

## To be copied in the UI
# mod_tables_ui("tables_ui_1")

## To be copied in the server
# callModule(mod_tables_server, "tables_ui_1")


