################################################################################
# Shiny App using shinydashboard
#
# Author: Nathália Campos
# Created: 2019-07-31
################################################################################

header <- dashboardHeader(title = "Forecasting")

sidebar <- dashboardSidebar(
    # incluindo arquivo css
    includeCSS("www/style.css"),
    
    sidebarMenu(
        id = "siderbarmenu", 
        menuItem("Cards",  tabName = "cards",  icon = icon("home")),
        menuItem("Plots",  tabName = "plots",  icon = icon("home")),
        menuItem("Tables", tabName = "tables", icon = icon("home"))
    )
)

body <- dashboardBody(tabItems(cards, tables))

ui <- dashboardPage(title = "Forecasting", header, sidebar, body)
