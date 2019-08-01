
########################################################################################.
# Pacotes usados:
# - formattable
# - rhandsontable 
# - DT 
########################################################################################.


tables <- tabItem(
    tabName = "tables",
    
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
                        tableOutput("table1")
                    ),
                    tabPanel(
                        "formattable",
                        formattableOutput("table_formattable")
                    ),
                    tabPanel(
                        "rHandsontable",
                        rHandsontableOutput("table_rhandsontable")
                    ),
                    tabPanel(
                        "DT",
                        DTOutput("table_dt")
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