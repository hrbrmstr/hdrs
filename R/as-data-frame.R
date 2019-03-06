#' Turn `httr::headers()`` objects into a data frame
#'
#' @param x an object returned from a call to [httr::headers()]. This is
#'        a `list` classed as `insensitive` which is pretty generic but
#'        this method has a pretty thin use case and shouldn't cause issues.
#' @param tbl if `TRUE` (the default) will class the output as a tibble
#' @param ... ignored
#' @param stringsAsFactors _always_ `FALSE` (unless you say otherwise)
#' @export
as.data.frame.insensitive <- function(x, tbl=TRUE, ..., stringsAsFactors = FALSE) {

  data.frame(
    name = names(x),
    value = unlist(x, use.names = FALSE),
    row.names = NULL,
    check.names = FALSE,
    stringsAsFactors = stringsAsFactors
  ) -> out

  if (tbl) class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}