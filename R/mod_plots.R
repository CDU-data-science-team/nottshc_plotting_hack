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
      column(3,
             ),
      column(9,
             plotOutput(ns("first")))
    )
  )
}
    
#' plots Server Functions
#'
#' @noRd 
mod_plots_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$first <- renderPlot({
      
      palmerpenguins::penguins %>% 
        ggplot2::ggplot(ggplot2::aes(x = bill_length_mm,
                                     y = flipper_length_mm)) + 
        ggplot2::geom_point()
    })
 
  })
}
    
## To be copied in the UI
# 
    
## To be copied in the server
# 
