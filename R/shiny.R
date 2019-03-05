#' A Shiny App for Exploring HTTP Headers
#'
#' @export
explore_app <- function() {
  shiny::runApp(system.file("shiny/http-header-explorer", package = "hdrs"))
}
