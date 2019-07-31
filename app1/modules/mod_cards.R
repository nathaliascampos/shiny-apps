
########################################################################################.
# Pacotes usados:
# - shinydashboard
# - shinydashboardPlus (descriptionBlock, boxPlus) 
########################################################################################.


cards <- tabItem(
    tabName = "cards",
    
    bsCollapse(
        open = "Box 1",
        
        bsCollapsePanel(
            title = "Box 1", style = "primary", 
            "This panel has a generic plot. "
        ),
        bsCollapsePanel(
            title = "Box 2", style = "primary", 
            "This panel has a generic plot. "
        )
    ), 
    
    # ## cards
    # box( width = 4,
    #     HTML(
    #         paste0(
    #             '<div class="card">
    #                 <h1>Estimativa</h1>
    #                 <p>Harvard University</p>
    #                 <a href="#"><i class="fa fa-dribbble"></i></a>
    #                 <a href="#"><i class="fa fa-twitter"></i></a>
    #                 <a href="#"><i class="fa fa-linkedin"></i></a>
    #             </div>'
    #         )
    #     )
    # ),
    
    boxPlus(
        title = "Closable Box with dropdown",
        width = 12,
        status = "primary",
        closable = TRUE,
        collapsible = TRUE,
        enable_sidebar = TRUE,
        sidebar_width = 25,
        sidebar_content = sliderInput(
            "obs",
            "Number of observations:",
            min = 0,
            max = 1000,
            value = 500
        ),
        
        highchartOutput("high4", height = "250px")
    ),
    
    # uiOutput("teste"),
    
    fluidRow(
        
        ### cards 1
        valueBox(20, "Information", width = 3, color = "navy", icon = icon("credit-card")),
        valueBox(20, "Information", width = 3, color = "navy", icon = icon("credit-card")),
        valueBox(20, "Information", width = 3, color = "navy", icon = icon("credit-card")),
        valueBox(20, "Information", width = 3, color = "navy", icon = icon("credit-card")),
        
        # Box Status summary
        box(title = "Status summary", width = 12,
            status = "primary", solidHeader = TRUE,
            
            column(3,
                   descriptionBlock(
                       number = "17%", number_color = "green", number_icon = "fa fa-caret-up",
                       header = "$35,210.43", text = "TOTAL REVENUE"
                   )
            ),
            column(3,
                   descriptionBlock(
                       number = "17%", number_color = "green", number_icon = "fa fa-caret-up",
                       header = "$35,210.43", text = "TOTAL REVENUE"
                   )
            ),
            column(3,
                   descriptionBlock(
                       number = "18%", number_color = "red", number_icon = "fa fa-caret-down",
                       header = "1200", text = "GOAL COMPLETION"
                   )
            ),
            column(3,
                   descriptionBlock(
                       number = "18%", number_color = "red", number_icon = "fa fa-caret-down",
                       header = "1200", text = "GOAL COMPLETION"
                   )
            )
            # footer = fluidRow()
        )
        
    )
)

