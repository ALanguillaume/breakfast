#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom DT renderDT
#' @noRd
app_server <- function(input, output, session) {
  output$table <- renderDT({
    breakfast[1:10, ]
  })
}
