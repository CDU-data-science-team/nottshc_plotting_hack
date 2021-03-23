#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  
  # prepare data
  
  penguins_data <- reactive({
    
    palmerpenguins::penguins %>% 
      dplyr::mutate(subspecies = factor(sample(1 : input$sub_species, 
                                               nrow(palmerpenguins::penguins), 
                                               replace = TRUE)))
  })
  
  mod_plots_server("plots_ui_1", penguins_data)
}
