library(shiny)
library(DT)

'
$(document).on("keyup", function(e) {
  if(e.keyCode == 13){
    Shiny.onInputChange("keyPressed", Math.random());
  }
});
' -> js

ui <- fluidPage(

  tags$script(js),

  titlePanel("HTTP Header Explorer"),

  fluidRow(
    column(
      width = 12,
      shiny::textInput(
        inputId = "i_url",
        label = "Enter URL to grab HTTP headers from:",
        width = "100%"
      ),
      shiny::checkboxInput(
        inputId = "i_sec",
        label = "Only include 'security'-related headers? ",
        value = TRUE
      )
    )
  ),
  fluidRow(
    column(width = 12, shiny::dataTableOutput("header_info"))
  )

)

server <- function(input, output) {

  URL <- reactiveVal()

  observeEvent(input[["keyPressed"]], {
    URL(input[["i_url"]])
  })

  output$header_info <- shiny::renderDataTable({

    site_url <- URL()

    message("Called rdt(", site_url, ")")

    if (length(site_url) && (grepl("http[s]*://.*", site_url))) {

      if (input$i_sec) {
        out <- hdrs::assess_security_headers(site_url, include_ref = TRUE)
      } else {
        out <- hdrs::explain_headers(site_url)
      }

      out[["url"]] <- NULL
      out[["type_1"]] <- NULL
      out[["type_2"]] <- NULL
      out[["protocol"]] <- NULL
      out[["status"]] <- NULL
      out[["reference"]] <- NULL
      out[["security_reference"]] <- NULL
      out[["cwe"]] <- NULL
      out[["cwe_url"]] <- NULL

      return(out)

    }
  }, options = list(
    columnDefs = list(
      list(width = '100px', targets = "_all")
    )
  ))
}

shinyApp(ui = ui, server = server)
