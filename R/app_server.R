#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  global <- reactiveValues(
    table = NULL
  )
  mod_side_bar_server("side_bar_1", global = global)
  mod_main_panel_server("main_panel_1", global = global)
}
