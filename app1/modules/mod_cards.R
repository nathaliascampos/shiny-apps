
# Module UI
mod_cards_ui <- function(id){
    ns <- NS(id)
    tagList(
        
        panel(
            div(HTML(paste(icon("box"), "Cards")), id = "title"),
            
            # bsCollapse - package 'shinyBS
            h4("bsCollapse - package 'shinyBS' ", id = "sub-title"), 
            bsCollapse(
                multiple = TRUE,
                open = c("Title Box 1", "Title Box 2"),
                bsCollapsePanel(
                    title = "Title Box 1", style = "primary", 
                    "This panel has a generic plot. "
                ),
                bsCollapsePanel(
                    title = "Title Box 2", style = "primary", 
                    "This panel has a generic plot. "
                )
            ),
            
            h4("box created with HTML", id = "sub-title"),
            
            box(width = 12,
                HTML(
                    paste0(
                        '<div class="card">
                        <h1>Estimativa</h1>
                        <p>Harvard University</p>
                        <a href="#"><i class="fa fa-dribbble"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-linkedin"></i></a>
                    </div>'
                    )
                )
            ),
            
            fluidRow(
                
                # boxPlus - package 'shinydashboardPlus'
                h4("boxPlus - package 'shinydashboardPlus'", id = "sub-title"), 
                boxPlus(
                    title = "Title Box",
                    width = 12, status = "primary",
                    solidHeader = TRUE, closable = TRUE, collapsible = TRUE,
                    enable_sidebar = TRUE, sidebar_width = 25,
                    sidebar_content = sliderInput(
                        "obs",
                        "Number of observations:",
                        min = 0,
                        max = 1000,
                        value = 500
                    ),
                    
                    h5("Text here!!!!"),
                    h5("Text here!!!!"),
                    h5("Text here!!!!"),
                    h5("Text here!!!!"),
                    h5("Text here!!!!"),
                    h5("Text here!!!!")
                )
            ),
            
            valueBox(20, "Information", width = 3, color = "navy", icon = icon("credit-card")),
            valueBox(20, "Information", width = 3, color = "navy", icon = icon("credit-card")),
            valueBox(20, "Information", width = 3, color = "navy", icon = icon("credit-card")),
            valueBox(20, "Information", width = 3, color = "navy", icon = icon("credit-card")),
            
            h4("descriptionBlock - package 'shinydashboardPlus'", id = "sub-title"), 
            
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
                # footer = fluidRow() # to add um footer
            )
            
        )
        
    )
}

# Module Server
mod_cards_server <- function(input, output, session){
    ns <- session$ns
    
}

## To be copied in the UI
# mod_cards_ui("cards_ui_1")

## To be copied in the server
# callModule(mod_cards_server, "cards_ui_1")



