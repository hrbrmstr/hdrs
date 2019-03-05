# https://www.owasp.org/index.php/OWASP_Secure_Headers_Project
library(tidyverse)

tf <- tempfile(fileext = ".db")

download.file(
  "https://github.com/riramar/hsecscan/blob/master/hsecscan/hsecscan.db?raw=true", tf
)

sc <- src_sqlite(tf)

tbl(sc, "headers") %>%
  collect() %>%
  janitor::clean_names() -> http_headers

http_headers <- http_headers[-1,]
http_headers[["enable"]] <- http_headers[["enable"]] == "Y"
http_headers[["required"]] <- case_when(
  http_headers[["required"]] == "Y" ~ TRUE,
  http_headers[["required"]] == "N" ~ TRUE,
  TRUE ~ NA
)
http_headers[["https"]] <- case_when(
  http_headers[["https"]] == "Y" ~ TRUE,
  http_headers[["https"]] == "N" ~ TRUE,
  TRUE ~ NA
)

usethis::use_data(http_headers, overwrite = TRUE)
