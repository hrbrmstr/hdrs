c(
  'access-control-allow-origin',
  'content-security-policy',
  'expect-ct',
  'feature-policy',
  'server',
  'public-key-pins',
  'referrer-policy',
  'strict-transport-security',
  'x-content-type-options',
  'x-frame-options',
  'x-permitted-cross-domain-policies',
  'x-powered-by',
  'x-xss-protection'
) -> .security_headers

#' Assess "security" headers for a given URL
#'
#' @param url target URL
#' @param include_ref if `TRUE` (default: `FALSE`) the data frame will contains
#'     information reference fields from [http_headers]
#' @return data frame (tibble)
#' @export
assess_security_headers <- function(url, include_ref = FALSE) {

  res <- get_response_headers(url)

  if (length(res)) {

    if (res$scheme != "https") warning("NOTE: Request not made via HTTPS", call.=FALSE)

    h <- res$hdrs

    lapply(.security_headers, function(.x) {

      value <- h[[.x]]
      status_code <- NULL
      message <- NULL

      if (length(value)) {
        if (.x == "access-control-allow-origin") {
          status_code <- "NOTE"
          message = "Access-Control-Allow-Origin present"
        } else if (.x == "content-security-policy") {
          status_code <- "OK"
          message = "NOTE: Policy present but not parse"
        } else if (.x == "public-key-pins") {
          if (grepl("pin-sha256", tolower(value))) {
            status_code <- "OK"
            message <- "Acceptable setting found"
          } else {
            message <- "Minimum required value ('pin-sha256') not present"
          }
        } else if (.x == "expect-ct") {
          status_code <- "OK"
          message <- "Value present but not verified"
        } else if (.x == "feature-policy") {
          status_code <- "OK"
          message <- "Value present but not verified"
        } else if (.x == "referrer-policy") {
          if (tolower(value) %in% c(
            "no-referrer", "no-referrer-when-downgrade", "origin",
            "origin-when-cross-origin", "same-origin", "strict-origin",
            "strict-origin-when-cross-origin", "unsafe-url"
          )) {
            status_code <- "OK"
            message <- "Acceptable setting found"
          } else {
            status_code <- "WARN"
            message = "No legitimate value present"
          }
        } else if (.x == "server") {
          status_code <- "NOTE"
          message = "Server header found"
        } else if (.x == "strict-transport-security") {
          if (grepl("max-age", value)) {
            status_code <- "OK"
            message <- "Value present but not evaluated"
          } else {
            status_code = "WARN"
            message <- "Minimum required value ('max-age') not present"
          }
        } else if (.x == "x-xss-protection") {
          if (value == "nosniff") {
            status_code <- "OK"
            message = "Acceptable setting found"
          } else {
            status_code <- "WARN"
            message = "Required value ('nosniff') not present"
          }
        } else if (.x == "x-content-type-options") {
          if (value == "nosniff") {
            status_code <- "OK"
            message = "Acceptable setting found"
          } else {
            status_code <- "WARN"
            message = "Required value ('nosniff') not present"
          }
        } else if (.x == "x-frame-options") {
          if (tolower(value) %in% c("deny", "sameorigin")) {
            status_code = "OK"
            message <- "Acceptable setting found"
          } else if (any(grepl('allow-from', tolower(value)))) {
            status_code <- "WARN"
            message <- "Other domains are allowed to frame the site"
          } else {
            status_code <- "WARN"
            message <- "Values 'deny' or 'sameorigin' not found"
          }
        } else if (.x == "x-permitted-cross-domain-policies") {
          if (grepl("none|master-only|by-content-type|by-ftp-filename|all", tolower(value))) {
            status_code <- "OK"
            message <- "Acceptable setting found"
          } else {
            status_code <- "WARN"
            message <- "No legitimate value present"
          }
        } else if (.x == "x-powered-by") {
          status_code <- "NOTE"
          message <- "X-Powered-By header present"
        }
      } else {
        value <- NA_character_
        status_code <- "WARN"
        message <- "Header not set"
      }

      data.frame(
        url = url,
        header = .x,
        value = value,
        status_code = status_code,
        message = message,
        stringsAsFactors = FALSE
      )

    })

  } -> out

  out <- do.call(rbind.data.frame, out)

  out <- out[order(out[["header"]]),]

  if ((include_ref) && (nrow(out) > 0)) {
    utils::data("http_headers", package = "hdrs", envir = .pkgenv)
    hint <- .pkgenv$http_headers
    hint[["header_field_name"]] <- tolower(hint[["header_field_name"]])
    out <- merge(out, hint, by.x = "header", by.y = "header_field_name", all.x=TRUE)
  }

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}
