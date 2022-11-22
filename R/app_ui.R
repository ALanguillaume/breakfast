#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom DT DTOutput
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(
      sidebarLayout(
        sidebarPanel = sidebarPanel(
          h2("Breakfast APP"),
          checkboxGroupInput(
            inputId = "days",
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
            inputId = "region",
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
          )
        ),
        mainPanel = mainPanel(
          h1("Dataset"),
          DTOutput(
            outputId = "table"
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "breakfast"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
