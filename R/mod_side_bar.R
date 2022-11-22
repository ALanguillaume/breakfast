#' side_bar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_side_bar_ui <- function(id){
  ns <- NS(id)
  tagList(
    h2("Breakfast APP"),
    checkboxGroupInput(
      inputId = ns("days"),
      label = "Days",
      choices = c(
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday",
        NULL
      )
    ),
    selectInput(
      inputId = ns("region"),
      label =  "Region",
      choices = c(
        "West",
        "Ile-de-France",
        "Center",
        "Northwest",
        "Southwest",
        "East",
        "Southeast",
        "Central East"
      )
    ),
    actionButton(
      inputId = ns("trigger"),
      label = "Update filtering"
    )
  )
}

#' side_bar Server Functions
#'
#' @noRd
mod_side_bar_server <- function(id, global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    observeEvent(
      input$trigger,
      {
        global$table <- filter_breakfast_data(
          breakfast_df = breakfast,
          days_chr = input$days,
          region_chr = input$region
        )
      })

  })
}

## To be copied in the UI
# mod_side_bar_ui("side_bar_1")

## To be copied in the server
# mod_side_bar_server("side_bar_1")
