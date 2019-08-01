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
        menuItem("Charts", tabName = "charts", icon = icon("chart-bar")),
        menuItem("Cards",  tabName = "cards",  icon = icon("box")),
        menuItem("Tables", tabName = "tables", icon = icon("table"))
    )
)

body <- dashboardBody(tabItems(cards, charts, tables))

ui <- dashboardPage(title = "Shiny R", header, sidebar, body)
