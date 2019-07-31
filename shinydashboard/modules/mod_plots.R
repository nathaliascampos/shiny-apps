
cards <- tabItem(
    tabName = "cards",
    
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
    
    # boxPlus(
    #     title = "Closable Box with dropdown",
    #     closable = TRUE,
    #     status = "warning",
    #     solidHeader = FALSE,
    #     collapsible = TRUE,
    #     enable_sidebar = TRUE,
    #     sidebar_width = 25,
    #     sidebar_start_open = TRUE,
    #     sidebar_content = sliderInput(
    #     "obs",
    #     "Number of observations:",
    #     min = 0,
    #     max = 1000,
    #     value = 500
    #     ),
    # 
    #     highchartOutput("high4", height = "250px")
    # ),
    
    # uiOutput("teste"),
    
    fluidRow(
        
        ### cards 1
        valueBox(20, "Information", width = 3, color = "navy", icon = icon("credit-card")),
        valueBox(20, "Information", width = 3, color = "navy", icon = icon("credit-card")),
        valueBox(20, "Information", width = 3, color = "navy", icon = icon("credit-card")),
        valueBox(20, "Information", width = 3, color = "navy", icon = icon("credit-card")),
        
        ### cards 2
        box(title = "Status summary", width = 12,
            
            footer = fluidRow(
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
            )
        ),
        
        ### graphs
        boxPlus(title = "Highcharter", width = 12,
                closable = FALSE, collapsible = TRUE,
                
                enable_sidebar = TRUE, sidebar_width = 20,
                sidebar_content = "Informações about the graphs...",
                
                highchartOutput("arima") %>%
                    withSpinner(type = getOption("spinner.type", default = 4))
        ),
        box(title = "Highcharter", width = 8,
            highchartOutput("high2", height = "250px") %>%
                withSpinner(type = getOption("spinner.type", default = 4))
        ),
        box(title = "Highcharter", width = 4,
            highchartOutput("high3", height = "250px") %>%
                withSpinner(type = getOption("spinner.type", default = 4))
        )
        
    ) 
)

