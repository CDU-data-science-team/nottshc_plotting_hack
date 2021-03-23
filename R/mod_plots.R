#' plots UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_plots_ui <- function(id){
  ns <- NS(id)
  tagList(
    
    fluidRow(
      column(12,
             tabsetPanel(
               tabPanel("Scatter plot",
                        plotOutput(ns("scatter"))
               ),
               tabPanel("Bar graph",
                        sliderInput(ns("penguin_number"), "Penguin numbers",
                                    min = 5, max = 200, value = 25),
                        plotOutput(ns("bargraph"))
               )
             )
      )
    )
  )
}

#' plots Server Functions
#'
#' @noRd 
mod_plots_server <- function(id, penguins_data){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$scatter <- renderPlot({
      
      penguins_data() %>% 
        ggplot2::ggplot(ggplot2::aes(x = bill_length_mm,
                                     y = flipper_length_mm,
                                     group = subspecies,
                                     colour = subspecies)) + 
        ggplot2::geom_point()
    })
    
    output$bargraph <- renderPlot({
      
      penguin_names <- paste(c("Steve", "Mark", "Karen"), 1 : 400)
      
      penguins_data() %>% 
        dplyr::mutate(name = sample(penguin_names, 
                                    nrow(palmerpenguins::penguins), 
                                    replace = FALSE)) %>% 
        dplyr::sample_n(input$penguin_number) %>% 
        ggplot2::ggplot(ggplot2::aes(x = name, y = flipper_length_mm,
                                     fill = subspecies, group = subspecies)) + 
        ggplot2::geom_bar(stat = "identity")
    })
    
  })
}

## To be copied in the UI
# 

## To be copied in the server
# 
