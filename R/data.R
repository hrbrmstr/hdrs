#' HTTP Header Reference
#'
#' This dataset contains a very thorough reference on HTTP request and response
#' headers curated by the 'hsecsecan' project (<https://github.com/riramar/hsecscan>).
#'
#' - `header_field_name`: header field
#' - `type_1`: `Permanent` (in a standard); `Provisional` (experimental); `Personal` (unofficial)
#' - `protocol`: should always be `http` for now but may be different (e.g. `quic`)
#' - `status`: blank == unknown; otherwise the value describes the status well
#' - `reference`: where to look for more info
#' - `type_2`: `Request` (should only be found in requests); `Response` (should only be
#'   found in responses); `Request/Response` found in either; `Reserved` (not in use yet)
#' - `enable`: should you have this enabled
#' - `required`: Is this header requried
#' - `https`: HTTPS-specific header?
#' - `security_description`: Information on the header
#' - `security_reference`: Extra external reference information on the header
#' - `recommendations`: Recommended setting(s)
#' - `cwe`: Associated Common Weakness Enumeration (CWE) identifier
#' - `cwe_url`: Associated CWE URL
#'
#' @docType data
#' @keywords datasets
#' @name http_headers
#' @usage data(http_headers)
#' @note Last updated 2019-03-05
#' @format A data frame (classed as a tibble) with 184 rows and 14 observations
NULL