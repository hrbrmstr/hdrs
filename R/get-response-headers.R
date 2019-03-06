get_response_headers <- function(url, ...) {

  tryCatch(
    httr::HEAD(url, ...),
    error = function(e) stop(e)
  ) -> res

  httr::warn_for_status(res)

  list(
    hdrs = httr::headers(res),
    scheme = httr::parse_url(res$url)[["scheme"]]
  ) -> out

  invisible(out)

}
