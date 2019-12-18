################################################################################.
# Shiny App using shinydashboard
#
# Author: Nathália Campos
# Created: 2019-07-31
################################################################################.

server <- function(input, output, session) {
    
    # load modules
    callModule(mod_graphs_server, "graphs_ui_1")
    callModule(mod_tables_server, "tables_ui_1")
    
    callModule(dygraphs_server, "dygraphs")
    
}
