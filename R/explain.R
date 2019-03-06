#' Explain HTTP headers found from a URL request
#'
#' Fetches headers from a URL and merges in information reference fields
#'  from [http_headers].
#'
#' @param url target URL
#' @param ... passed on to the final [httr::HEAD()] request.
#' @return data frame (tibble)
#' @export
explain_headers <- function(url, ...) {

  res <- get_response_headers(url, ...)

  if (length(res)) {

    if (res$scheme != "https") warning("NOTE: Request not made via HTTPS", call.=FALSE)

    data.frame(
      header = names(res$h),
      value = unlist(res$h, use.names = FALSE),
      stringsAsFactors = FALSE
    ) -> out

    if (nrow(out) > 0) {
      utils::data("http_headers", package = "hdrs", envir = .pkgenv)
      hint <- .pkgenv$http_headers
      hint[["header_field_name"]] <- tolower(hint[["header_field_name"]])
      out <- merge(out, hint, by.x = "header", by.y = "header_field_name", all.x=TRUE)
    }

    class(out) <- c("tbl_df", "tbl", "data.frame")

    out

  }

}
