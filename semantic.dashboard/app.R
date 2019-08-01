################################################################################.
# Shiny App using semantic.dashboard
#
# Author: Nathália Campos
# Created: 2019-08-01
################################################################################.

# import libraries
library(shiny)
library(semantic.dashboard) 
library(shiny.semantic)
library(ggplot2)
library(plotly)
library(DT)

# Page:    title = "", suppress_bootstrap = TRUE, theme = NULL
# Header:  color = "", inverted = FALSE, disable = FALSE
# Sidebar: side = "left", size = "thin", color = "", inverted = FALSE, center = FALSE, visible = TRUE, disable = FALSE
# Box:     title = NULL, color = "", width = 8, ribbon = TRUE, title_side = "top right", collapsible = TRUE

# body ----
main <- tabItem(
    tabName = "main",
    
    fluidRow(
        
        box(title = "Shiny Semantic",
            width = 15,
            color = "blue", 
            title_side = "top left", 
            
            includeMarkdown("docs/shiny.semantic.md")
        ),
        
        box(title = "Semantic Dashboard",
            width = 15,
            color = "blue", 
            title_side = "top left", 
            
            includeMarkdown("docs/semantic.dashboard.md")
        )
    )
)

extra <- tabItem(
    tabName = "extra",
    fluidRow(
        box(title = "Graph 1",
            width = 7,
            color = "blue", 
            plotOutput("boxplot1")
        ),
        box(title = "Graph 2",
            width = 7,
            color = "blue",
            plotlyOutput("dotplot1")
        ),
        
        box(title = "Shiny Semantic",
            width = 15,
            color = "blue",
            
            h2(class = "ui icon header", uiicon("settings"), 
               div(class = "content", "Account Settings", 
                   div(class = "sub header", "Manage your account")
               )
            )
        )
        
    )
)

header <- dashboardHeader(title = "Semantic Dashboard", color = "blue", inverted = TRUE)

sidebar <- dashboardSidebar(
    color = "teal", 
    sidebarMenu(
        menuItem("Getting Started",  tabName = "main"),
        menuItem("Extra", tabName = "extra")
    )
)

# ui ----
ui <- dashboardPage(
    # theme = "cerulean",
    header, sidebar,
    dashboardBody(tabItems(main, extra))
)

# server ----
server <- shinyServer(function(input, output, session) {
    
    data("mtcars")
    
    mtcars$am <- factor(mtcars$am, levels=c(0,1), labels=c("Automatic","Manual"))
    colscale <- c(semantic_palette[["red"]], semantic_palette[["green"]], semantic_palette[["blue"]])
    
    output$boxplot1 <- renderPlot({
        ggplot(mtcars, aes(x = am, y = mpg)) +
            geom_boxplot(fill = semantic_palette[["green"]]) + 
            xlab("gearbox") + ylab("Miles per gallon")
    })
    
    output$dotplot1 <- renderPlotly({
        p <- ggplot(mtcars, aes(wt, mpg)) + 
            geom_point(aes(colour=factor(cyl), size = qsec)) + 
            scale_colour_manual(values = colscale)
        
        ggplotly(p)
    })
    
    output$carstable <- renderDataTable(mtcars)
    
})

shinyApp(ui, server)