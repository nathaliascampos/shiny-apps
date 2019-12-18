################################################################################
# Shiny App using shinydashboard
#
# Author: Nathália Campos
# Created: 2019-07-31
################################################################################

header <- dashboardHeader(title = "Shiny R")

sidebar <- dashboardSidebar(
    # incluindo arquivo css
    includeCSS("www/style.css"),
    
    sidebarMenu(
        id = "siderbarmenu", 
        menuItem("Graphs", tabName = "graphs", icon = icon("chart-bar")),
        
        menuItem("Graphs", icon = icon("chart-bar"),
                 menuSubItem("Dygraphs", tabName = "dygraphs")
        ),
        
        menuItem("Cards",  tabName = "cards",  icon = icon("box")),
        menuItem("Tables", tabName = "tables", icon = icon("table"))
    )
)

body <- dashboardBody(
    tabItems(
        
        tabItem(tabName = "graphs", mod_graphs_ui("graphs_ui_1")),
        
        tabItem(tabName = "dygraphs", dygraphs_ui("dygraphs")),
        
        
        tabItem(tabName = "tables", mod_tables_ui("tables_ui_1")),
        tabItem(tabName = "cards", mod_cards_ui("cards_ui_1"))
    
    )
)

ui <- dashboardPage(title = "Shiny R", header, sidebar, body)
