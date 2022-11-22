#' main_panel UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom DT DTOutput
mod_main_panel_ui <- function(id){
  ns <- NS(id)
  tagList(
    h1("Dataset"),
    DTOutput(
      outputId = ns("table")
    )
  )
}

#' main_panel Server Functions
#'
#' @importFrom DT renderDT
#' @noRd
mod_main_panel_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$table <- renderDT({
      global$table
    })
  })
}

## To be copied in the UI
# mod_main_panel_ui("main_panel_1")

## To be copied in the server
# mod_main_panel_server("main_panel_1")
