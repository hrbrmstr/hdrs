
[![Travis-CI Build
Status](https://travis-ci.org/hrbrmstr/hdrs.svg?branch=master)](https://travis-ci.org/hrbrmstr/hdrs)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/hdrs/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/hdrs)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/hdrs)](https://cran.r-project.org/package=hdrs)

# hdrs

Have Some Fun with ‘HTTP’ Headers

## Description

Methods are provided to retrieve and test ‘HTTP’ headers from a website.
An ‘HTTP’ request and response header reference/explanatory data frame
is also provided via the ‘hsecsecan’ project
(<https://github.com/riramar/hsecscan>)

## What’s Inside The Tin

The following functions are implemented:

  - `as.data.frame.insensitive`: Turn `httr::headers()` objects into a
    data frame
  - `assess_security_headers`: Assess “security” headers for a given URL
  - `explain_headers`: Explain HTTP headers found from a URL request
  - `explore_app`: A Shiny App for Exploring HTTP Headers
  - `http_headers`: HTTP Header Reference

## Installation

``` r
install.packages("hdrs", repos = "https://cinc.rud.is/")
```

## Usage

``` r
library(hdrs)
library(tibble) # for printing

# current version
packageVersion("hdrs")
## [1] '0.2.0'
```

``` r
httr::HEAD("https://rud.is/b") %>% 
  httr::headers() %>% 
  as.data.frame()
## # A tibble: 20 x 2
##    name                   value                                                                                         
##    <chr>                  <chr>                                                                                         
##  1 server                 nginx                                                                                         
##  2 date                   Wed, 06 Mar 2019 12:27:15 GMT                                                                 
##  3 content-type           text/html; charset=UTF-8                                                                      
##  4 connection             keep-alive                                                                                    
##  5 vary                   Accept-Encoding                                                                               
##  6 set-cookie             PHPSESSID=0f2uckd4t1tuf55hhecpk73i63; path=/                                                  
##  7 expires                Thu, 07 Mar 2019 12:27:15 GMT                                                                 
##  8 cache-control          max-age=86400                                                                                 
##  9 pragma                 no-cache                                                                                      
## 10 link                   "<https://rud.is/b/wp-json/>; rel=\"https://api.w.org/\""                                     
## 11 link                   <https://wp.me/23idr>; rel=shortlink                                                          
## 12 strict-transport-secu… max-age=31536000; includeSubDomains; preload                                                  
## 13 content-security-poli… default-src 'self' data: fonts.gstatic.com fonts.googleapis.com cdn.ampproject.org *.ampproje…
## 14 x-frame-options        SAMEORIGIN                                                                                    
## 15 referrer-policy        no-referrer-when-downgrade                                                                    
## 16 feature-policy         geolocation 'none';midi 'none';sync-xhr 'none';microphone 'none';camera 'none';magnetometer '…
## 17 x-powered-by           <3                                                                                            
## 18 x-xss-protection       1; mode=block                                                                                 
## 19 x-content-type-options nosniff                                                                                       
## 20 content-encoding       gzip
```

``` r
assess_security_headers("https://cran.r-project.org") %>% 
  dplyr::select(-url) %>% 
  gt::gt()
```

<!--html_preserve-->

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', Arial, sans-serif;
}

#lsgjsbdkdu .gt_table {
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #000000;
  font-size: 16px;
  background-color: #FFFFFF;
  /* table.background.color */
  width: auto;
  /* table.width */
  border-top-style: solid;
  /* table.border.top.style */
  border-top-width: 2px;
  /* table.border.top.width */
  border-top-color: #A8A8A8;
  /* table.border.top.color */
}

#lsgjsbdkdu .gt_heading {
  background-color: #FFFFFF;
  /* heading.background.color */
  border-bottom-color: #FFFFFF;
}

#lsgjsbdkdu .gt_title {
  color: #000000;
  font-size: 125%;
  /* heading.title.font.size */
  padding-top: 4px;
  /* heading.top.padding */
  padding-bottom: 1px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#lsgjsbdkdu .gt_subtitle {
  color: #000000;
  font-size: 85%;
  /* heading.subtitle.font.size */
  padding-top: 1px;
  padding-bottom: 4px;
  /* heading.bottom.padding */
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#lsgjsbdkdu .gt_bottom_border {
  border-bottom-style: solid;
  /* heading.border.bottom.style */
  border-bottom-width: 2px;
  /* heading.border.bottom.width */
  border-bottom-color: #A8A8A8;
  /* heading.border.bottom.color */
}

#lsgjsbdkdu .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  padding-top: 4px;
  padding-bottom: 4px;
}

#lsgjsbdkdu .gt_col_heading {
  color: #000000;
  background-color: #FFFFFF;
  /* column_labels.background.color */
  font-size: 16px;
  /* column_labels.font.size */
  font-weight: initial;
  /* column_labels.font.weight */
  padding: 10px;
  margin: 10px;
}

#lsgjsbdkdu .gt_sep_right {
  border-right: 5px solid #FFFFFF;
}

#lsgjsbdkdu .gt_group_heading {
  padding: 8px;
  color: #000000;
  background-color: #FFFFFF;
  /* stub_group.background.color */
  font-size: 16px;
  /* stub_group.font.size */
  font-weight: initial;
  /* stub_group.font.weight */
  border-top-style: solid;
  /* stub_group.border.top.style */
  border-top-width: 2px;
  /* stub_group.border.top.width */
  border-top-color: #A8A8A8;
  /* stub_group.border.top.color */
  border-bottom-style: solid;
  /* stub_group.border.bottom  .style */
  border-bottom-width: 2px;
  /* stub_group.border.bottom  .width */
  border-bottom-color: #A8A8A8;
  /* stub_group.border.bottom  .color */
}

#lsgjsbdkdu .gt_empty_group_heading {
  padding: 0.5px;
  color: #000000;
  background-color: #FFFFFF;
  /* stub_group.background.color */
  font-size: 16px;
  /* stub_group.font.size */
  font-weight: initial;
  /* stub_group.font.weight */
  border-top-style: solid;
  /* stub_group.border.top.style */
  border-top-width: 2px;
  /* stub_group.border.top.width */
  border-top-color: #A8A8A8;
  /* stub_group.border.top.color */
  border-bottom-style: solid;
  /* stub_group.border.bottom  .style */
  border-bottom-width: 2px;
  /* stub_group.border.bottom  .width */
  border-bottom-color: #A8A8A8;
  /* stub_group.border.bottom  .color */
}

#lsgjsbdkdu .gt_striped tr:nth-child(even) {
  background-color: #f2f2f2;
}

#lsgjsbdkdu .gt_row {
  padding: 10px;
  /* row.padding */
  margin: 10px;
}

#lsgjsbdkdu .gt_stub {
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #A8A8A8;
  text-indent: 5px;
}

#lsgjsbdkdu .gt_stub.gt_row {
  background-color: #FFFFFF;
}

#lsgjsbdkdu .gt_summary_row {
  background-color: #FFFFFF;
  /* summary_row.background.color */
  padding: 6px;
  /* summary_row.padding */
  text-transform: inherit;
  /* summary_row.text_transform */
}

#lsgjsbdkdu .gt_first_summary_row {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
}

#lsgjsbdkdu .gt_table_body {
  border-top-style: solid;
  /* field.border.top.style */
  border-top-width: 2px;
  /* field.border.top.width */
  border-top-color: #A8A8A8;
  /* field.border.top.color */
  border-bottom-style: solid;
  /* field.border.bottom.style */
  border-bottom-width: 2px;
  /* field.border.bottom.width */
  border-bottom-color: #A8A8A8;
  /* field.border.bottom.color */
}

#lsgjsbdkdu .gt_footnote {
  font-size: 90%;
  /* footnote.font.size */
  padding: 4px;
  /* footnote.padding */
}

#lsgjsbdkdu .gt_sourcenote {
  font-size: 90%;
  /* sourcenote.font.size */
  padding: 4px;
  /* sourcenote.padding */
}

#lsgjsbdkdu .gt_center {
  text-align: center;
}

#lsgjsbdkdu .gt_left {
  text-align: left;
}

#lsgjsbdkdu .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#lsgjsbdkdu .gt_font_normal {
  font-weight: normal;
}

#lsgjsbdkdu .gt_font_bold {
  font-weight: bold;
}

#lsgjsbdkdu .gt_font_italic {
  font-style: italic;
}

#lsgjsbdkdu .gt_super {
  font-size: 65%;
}

#lsgjsbdkdu .gt_footnote_glyph {
  font-style: italic;
  font-size: 65%;
}
</style>

<div id="lsgjsbdkdu">

<!--gt table start-->

<table class="gt_table">

<tr>

<th class="gt_col_heading gt_left" rowspan="1" colspan="1">

header

</th>

<th class="gt_col_heading gt_left" rowspan="1" colspan="1">

value

</th>

<th class="gt_col_heading gt_left" rowspan="1" colspan="1">

status\_code

</th>

<th class="gt_col_heading gt_left" rowspan="1" colspan="1">

message

</th>

</tr>

<tbody class="gt_table_body gt_striped">

<tr>

<td class="gt_row gt_left">

access-control-allow-origin

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

content-security-policy

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

expect-ct

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

feature-policy

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

public-key-pins

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

referrer-policy

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

server

</td>

<td class="gt_row gt_left">

Apache/2.4.10 (Debian)

</td>

<td class="gt_row gt_left">

NOTE

</td>

<td class="gt_row gt_left">

Server header found

</td>

</tr>

<tr>

<td class="gt_row gt_left">

strict-transport-security

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-content-type-options

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-frame-options

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-permitted-cross-domain-policies

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-powered-by

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-xss-protection

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

</tbody>

</table>

<!--gt table end-->

</div>

<!--/html_preserve-->

Tsk, tsk…

``` r
assess_security_headers("https://rud.is/b") %>% 
  dplyr::select(-url) %>% 
  gt::gt()
```

<!--html_preserve-->

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', Arial, sans-serif;
}

#fkvlcbxjkq .gt_table {
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #000000;
  font-size: 16px;
  background-color: #FFFFFF;
  /* table.background.color */
  width: auto;
  /* table.width */
  border-top-style: solid;
  /* table.border.top.style */
  border-top-width: 2px;
  /* table.border.top.width */
  border-top-color: #A8A8A8;
  /* table.border.top.color */
}

#fkvlcbxjkq .gt_heading {
  background-color: #FFFFFF;
  /* heading.background.color */
  border-bottom-color: #FFFFFF;
}

#fkvlcbxjkq .gt_title {
  color: #000000;
  font-size: 125%;
  /* heading.title.font.size */
  padding-top: 4px;
  /* heading.top.padding */
  padding-bottom: 1px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#fkvlcbxjkq .gt_subtitle {
  color: #000000;
  font-size: 85%;
  /* heading.subtitle.font.size */
  padding-top: 1px;
  padding-bottom: 4px;
  /* heading.bottom.padding */
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#fkvlcbxjkq .gt_bottom_border {
  border-bottom-style: solid;
  /* heading.border.bottom.style */
  border-bottom-width: 2px;
  /* heading.border.bottom.width */
  border-bottom-color: #A8A8A8;
  /* heading.border.bottom.color */
}

#fkvlcbxjkq .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  padding-top: 4px;
  padding-bottom: 4px;
}

#fkvlcbxjkq .gt_col_heading {
  color: #000000;
  background-color: #FFFFFF;
  /* column_labels.background.color */
  font-size: 16px;
  /* column_labels.font.size */
  font-weight: initial;
  /* column_labels.font.weight */
  padding: 10px;
  margin: 10px;
}

#fkvlcbxjkq .gt_sep_right {
  border-right: 5px solid #FFFFFF;
}

#fkvlcbxjkq .gt_group_heading {
  padding: 8px;
  color: #000000;
  background-color: #FFFFFF;
  /* stub_group.background.color */
  font-size: 16px;
  /* stub_group.font.size */
  font-weight: initial;
  /* stub_group.font.weight */
  border-top-style: solid;
  /* stub_group.border.top.style */
  border-top-width: 2px;
  /* stub_group.border.top.width */
  border-top-color: #A8A8A8;
  /* stub_group.border.top.color */
  border-bottom-style: solid;
  /* stub_group.border.bottom  .style */
  border-bottom-width: 2px;
  /* stub_group.border.bottom  .width */
  border-bottom-color: #A8A8A8;
  /* stub_group.border.bottom  .color */
}

#fkvlcbxjkq .gt_empty_group_heading {
  padding: 0.5px;
  color: #000000;
  background-color: #FFFFFF;
  /* stub_group.background.color */
  font-size: 16px;
  /* stub_group.font.size */
  font-weight: initial;
  /* stub_group.font.weight */
  border-top-style: solid;
  /* stub_group.border.top.style */
  border-top-width: 2px;
  /* stub_group.border.top.width */
  border-top-color: #A8A8A8;
  /* stub_group.border.top.color */
  border-bottom-style: solid;
  /* stub_group.border.bottom  .style */
  border-bottom-width: 2px;
  /* stub_group.border.bottom  .width */
  border-bottom-color: #A8A8A8;
  /* stub_group.border.bottom  .color */
}

#fkvlcbxjkq .gt_striped tr:nth-child(even) {
  background-color: #f2f2f2;
}

#fkvlcbxjkq .gt_row {
  padding: 10px;
  /* row.padding */
  margin: 10px;
}

#fkvlcbxjkq .gt_stub {
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #A8A8A8;
  text-indent: 5px;
}

#fkvlcbxjkq .gt_stub.gt_row {
  background-color: #FFFFFF;
}

#fkvlcbxjkq .gt_summary_row {
  background-color: #FFFFFF;
  /* summary_row.background.color */
  padding: 6px;
  /* summary_row.padding */
  text-transform: inherit;
  /* summary_row.text_transform */
}

#fkvlcbxjkq .gt_first_summary_row {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
}

#fkvlcbxjkq .gt_table_body {
  border-top-style: solid;
  /* field.border.top.style */
  border-top-width: 2px;
  /* field.border.top.width */
  border-top-color: #A8A8A8;
  /* field.border.top.color */
  border-bottom-style: solid;
  /* field.border.bottom.style */
  border-bottom-width: 2px;
  /* field.border.bottom.width */
  border-bottom-color: #A8A8A8;
  /* field.border.bottom.color */
}

#fkvlcbxjkq .gt_footnote {
  font-size: 90%;
  /* footnote.font.size */
  padding: 4px;
  /* footnote.padding */
}

#fkvlcbxjkq .gt_sourcenote {
  font-size: 90%;
  /* sourcenote.font.size */
  padding: 4px;
  /* sourcenote.padding */
}

#fkvlcbxjkq .gt_center {
  text-align: center;
}

#fkvlcbxjkq .gt_left {
  text-align: left;
}

#fkvlcbxjkq .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#fkvlcbxjkq .gt_font_normal {
  font-weight: normal;
}

#fkvlcbxjkq .gt_font_bold {
  font-weight: bold;
}

#fkvlcbxjkq .gt_font_italic {
  font-style: italic;
}

#fkvlcbxjkq .gt_super {
  font-size: 65%;
}

#fkvlcbxjkq .gt_footnote_glyph {
  font-style: italic;
  font-size: 65%;
}
</style>

<div id="fkvlcbxjkq">

<!--gt table start-->

<table class="gt_table">

<tr>

<th class="gt_col_heading gt_left" rowspan="1" colspan="1">

header

</th>

<th class="gt_col_heading gt_left" rowspan="1" colspan="1">

value

</th>

<th class="gt_col_heading gt_left" rowspan="1" colspan="1">

status\_code

</th>

<th class="gt_col_heading gt_left" rowspan="1" colspan="1">

message

</th>

</tr>

<tbody class="gt_table_body gt_striped">

<tr>

<td class="gt_row gt_left">

access-control-allow-origin

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

content-security-policy

</td>

<td class="gt_row gt_left">

default-src ‘self’ data: fonts.gstatic.com fonts.googleapis.com
cdn.ampproject.org *.ampproject.org *.w.org w.org wp.com sendpulse.com
gravatar.com *.wp.com *.sendpulse.com *.gravatar.com wordpress.com
*.wordpress.com <http://prefetch.validatorsearch.verisignlabs.com/>;
script-src ‘self’ data: ‘unsafe-inline’ ‘unsafe-eval’ fonts.gstatic.com
fonts.googleapis.com *.w.org w.org wp.com cdn.ampproject.org
*.ampproject.org sendpulse.com gravatar.com *.wp.com *.sendpulse.com
*.gravatar.com wordpress.com *.wordpress.com; style-src ‘self’ data:
‘unsafe-inline’ ‘unsafe-eval’ fonts.gstatic.com fonts.googleapis.com
*.w.org w.org wp.com *.sendpulse.com sendpulse.com *.gravatar.com
gravatar.com *.wp.com cdn.ampproject.org \*.ampproject.org;

</td>

<td class="gt_row gt_left">

OK

</td>

<td class="gt_row gt_left">

NOTE: Policy present but not parse

</td>

</tr>

<tr>

<td class="gt_row gt_left">

expect-ct

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

feature-policy

</td>

<td class="gt_row gt_left">

geolocation ‘none’;midi ‘none’;sync-xhr ‘none’;microphone ‘none’;camera
‘none’;magnetometer ‘none’;gyroscope ‘none’;speaker ‘self’;fullscreen
‘self’;payment ‘none’;

</td>

<td class="gt_row gt_left">

OK

</td>

<td class="gt_row gt_left">

Value present but not verified

</td>

</tr>

<tr>

<td class="gt_row gt_left">

public-key-pins

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

referrer-policy

</td>

<td class="gt_row gt_left">

no-referrer-when-downgrade

</td>

<td class="gt_row gt_left">

OK

</td>

<td class="gt_row gt_left">

Acceptable setting found

</td>

</tr>

<tr>

<td class="gt_row gt_left">

server

</td>

<td class="gt_row gt_left">

nginx

</td>

<td class="gt_row gt_left">

NOTE

</td>

<td class="gt_row gt_left">

Server header found

</td>

</tr>

<tr>

<td class="gt_row gt_left">

strict-transport-security

</td>

<td class="gt_row gt_left">

max-age=31536000; includeSubDomains; preload

</td>

<td class="gt_row gt_left">

OK

</td>

<td class="gt_row gt_left">

Value present but not evaluated

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-content-type-options

</td>

<td class="gt_row gt_left">

nosniff

</td>

<td class="gt_row gt_left">

OK

</td>

<td class="gt_row gt_left">

Acceptable setting found

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-frame-options

</td>

<td class="gt_row gt_left">

SAMEORIGIN

</td>

<td class="gt_row gt_left">

OK

</td>

<td class="gt_row gt_left">

Acceptable setting found

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-permitted-cross-domain-policies

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Header not set

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-powered-by

</td>

<td class="gt_row gt_left">

\<3

</td>

<td class="gt_row gt_left">

NOTE

</td>

<td class="gt_row gt_left">

X-Powered-By header present

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-xss-protection

</td>

<td class="gt_row gt_left">

1; mode=block

</td>

<td class="gt_row gt_left">

WARN

</td>

<td class="gt_row gt_left">

Required value (‘nosniff’) not present

</td>

</tr>

</tbody>

</table>

<!--gt table end-->

</div>

<!--/html_preserve-->

Looks like I gots some ’splainin to do as well.

``` r
hdrs::explain_headers("https://community.rstudio.com/") %>% 
  dplyr::select(header,value, enable, security_reference, recommendations) %>% 
  gt::gt()
```

<!--html_preserve-->

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', Arial, sans-serif;
}

#mjauwpzaol .gt_table {
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #000000;
  font-size: 16px;
  background-color: #FFFFFF;
  /* table.background.color */
  width: auto;
  /* table.width */
  border-top-style: solid;
  /* table.border.top.style */
  border-top-width: 2px;
  /* table.border.top.width */
  border-top-color: #A8A8A8;
  /* table.border.top.color */
}

#mjauwpzaol .gt_heading {
  background-color: #FFFFFF;
  /* heading.background.color */
  border-bottom-color: #FFFFFF;
}

#mjauwpzaol .gt_title {
  color: #000000;
  font-size: 125%;
  /* heading.title.font.size */
  padding-top: 4px;
  /* heading.top.padding */
  padding-bottom: 1px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#mjauwpzaol .gt_subtitle {
  color: #000000;
  font-size: 85%;
  /* heading.subtitle.font.size */
  padding-top: 1px;
  padding-bottom: 4px;
  /* heading.bottom.padding */
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#mjauwpzaol .gt_bottom_border {
  border-bottom-style: solid;
  /* heading.border.bottom.style */
  border-bottom-width: 2px;
  /* heading.border.bottom.width */
  border-bottom-color: #A8A8A8;
  /* heading.border.bottom.color */
}

#mjauwpzaol .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  padding-top: 4px;
  padding-bottom: 4px;
}

#mjauwpzaol .gt_col_heading {
  color: #000000;
  background-color: #FFFFFF;
  /* column_labels.background.color */
  font-size: 16px;
  /* column_labels.font.size */
  font-weight: initial;
  /* column_labels.font.weight */
  padding: 10px;
  margin: 10px;
}

#mjauwpzaol .gt_sep_right {
  border-right: 5px solid #FFFFFF;
}

#mjauwpzaol .gt_group_heading {
  padding: 8px;
  color: #000000;
  background-color: #FFFFFF;
  /* stub_group.background.color */
  font-size: 16px;
  /* stub_group.font.size */
  font-weight: initial;
  /* stub_group.font.weight */
  border-top-style: solid;
  /* stub_group.border.top.style */
  border-top-width: 2px;
  /* stub_group.border.top.width */
  border-top-color: #A8A8A8;
  /* stub_group.border.top.color */
  border-bottom-style: solid;
  /* stub_group.border.bottom  .style */
  border-bottom-width: 2px;
  /* stub_group.border.bottom  .width */
  border-bottom-color: #A8A8A8;
  /* stub_group.border.bottom  .color */
}

#mjauwpzaol .gt_empty_group_heading {
  padding: 0.5px;
  color: #000000;
  background-color: #FFFFFF;
  /* stub_group.background.color */
  font-size: 16px;
  /* stub_group.font.size */
  font-weight: initial;
  /* stub_group.font.weight */
  border-top-style: solid;
  /* stub_group.border.top.style */
  border-top-width: 2px;
  /* stub_group.border.top.width */
  border-top-color: #A8A8A8;
  /* stub_group.border.top.color */
  border-bottom-style: solid;
  /* stub_group.border.bottom  .style */
  border-bottom-width: 2px;
  /* stub_group.border.bottom  .width */
  border-bottom-color: #A8A8A8;
  /* stub_group.border.bottom  .color */
}

#mjauwpzaol .gt_striped tr:nth-child(even) {
  background-color: #f2f2f2;
}

#mjauwpzaol .gt_row {
  padding: 10px;
  /* row.padding */
  margin: 10px;
}

#mjauwpzaol .gt_stub {
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #A8A8A8;
  text-indent: 5px;
}

#mjauwpzaol .gt_stub.gt_row {
  background-color: #FFFFFF;
}

#mjauwpzaol .gt_summary_row {
  background-color: #FFFFFF;
  /* summary_row.background.color */
  padding: 6px;
  /* summary_row.padding */
  text-transform: inherit;
  /* summary_row.text_transform */
}

#mjauwpzaol .gt_first_summary_row {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
}

#mjauwpzaol .gt_table_body {
  border-top-style: solid;
  /* field.border.top.style */
  border-top-width: 2px;
  /* field.border.top.width */
  border-top-color: #A8A8A8;
  /* field.border.top.color */
  border-bottom-style: solid;
  /* field.border.bottom.style */
  border-bottom-width: 2px;
  /* field.border.bottom.width */
  border-bottom-color: #A8A8A8;
  /* field.border.bottom.color */
}

#mjauwpzaol .gt_footnote {
  font-size: 90%;
  /* footnote.font.size */
  padding: 4px;
  /* footnote.padding */
}

#mjauwpzaol .gt_sourcenote {
  font-size: 90%;
  /* sourcenote.font.size */
  padding: 4px;
  /* sourcenote.padding */
}

#mjauwpzaol .gt_center {
  text-align: center;
}

#mjauwpzaol .gt_left {
  text-align: left;
}

#mjauwpzaol .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#mjauwpzaol .gt_font_normal {
  font-weight: normal;
}

#mjauwpzaol .gt_font_bold {
  font-weight: bold;
}

#mjauwpzaol .gt_font_italic {
  font-style: italic;
}

#mjauwpzaol .gt_super {
  font-size: 65%;
}

#mjauwpzaol .gt_footnote_glyph {
  font-style: italic;
  font-size: 65%;
}
</style>

<div id="mjauwpzaol">

<!--gt table start-->

<table class="gt_table">

<tr>

<th class="gt_col_heading gt_left" rowspan="1" colspan="1">

header

</th>

<th class="gt_col_heading gt_left" rowspan="1" colspan="1">

value

</th>

<th class="gt_col_heading gt_center" rowspan="1" colspan="1">

enable

</th>

<th class="gt_col_heading gt_left" rowspan="1" colspan="1">

security\_reference

</th>

<th class="gt_col_heading gt_left" rowspan="1" colspan="1">

recommendations

</th>

</tr>

<tbody class="gt_table_body gt_striped">

<tr>

<td class="gt_row gt_left">

cache-control

</td>

<td class="gt_row gt_left">

no-cache, no-store

</td>

<td class="gt_row gt_center">

TRUE

</td>

<td class="gt_row gt_left">

<https://tools.ietf.org/html/rfc7234#section-8>

</td>

<td class="gt_row gt_left">

Do not store unnecessarily sensitive information in the cache.

</td>

</tr>

<tr>

<td class="gt_row gt_left">

connection

</td>

<td class="gt_row gt_left">

keep-alive

</td>

<td class="gt_row gt_center">

FALSE

</td>

<td class="gt_row gt_left">

</td>

<td class="gt_row gt_left">

</td>

</tr>

<tr>

<td class="gt_row gt_left">

content-encoding

</td>

<td class="gt_row gt_left">

gzip

</td>

<td class="gt_row gt_center">

TRUE

</td>

<td class="gt_row gt_left">

<https://en.wikipedia.org/wiki/BREACH_(security_exploit)>

</td>

<td class="gt_row gt_left">

Another suggested approach is to disable HTTP compression whenever the
referrer header indicates a cross-site request, or when the header is
not present. This approach allows effective mitigation of the attack
without losing functionality, only incurring a performance penalty on
affected requests.

</td>

</tr>

<tr>

<td class="gt_row gt_left">

content-security-policy

</td>

<td class="gt_row gt_left">

base-uri ‘none’; object-src ‘none’; script-src ‘unsafe-eval’
‘report-sample’ <https://community.rstudio.com/logs/>
<https://community.rstudio.com/sidekiq/>
<https://community.rstudio.com/mini-profiler-resources/>
<https://community.rstudio.com/assets/>
<https://community.rstudio.com/brotli_asset/>
<https://community.rstudio.com/extra-locales/>
<https://community.rstudio.com/highlight-js/>
<https://community.rstudio.com/javascripts/>
<https://community.rstudio.com/plugins/>
<https://community.rstudio.com/theme-javascripts/>
<https://community.rstudio.com/svg-sprite/>
<https://www.google-analytics.com/analytics.js>; worker-src ‘self’ blob:

</td>

<td class="gt_row gt_center">

TRUE

</td>

<td class="gt_row gt_left">

<https://www.owasp.org/index.php/List_of_useful_HTTP_headers>

</td>

<td class="gt_row gt_left">

Read the reference <http://www.w3.org/TR/CSP/> and set according to your
case. This is not a easy job.

</td>

</tr>

<tr>

<td class="gt_row gt_left">

content-type

</td>

<td class="gt_row gt_left">

text/html; charset=utf-8

</td>

<td class="gt_row gt_center">

TRUE

</td>

<td class="gt_row gt_left">

<https://tools.ietf.org/html/rfc7231#section-3.1.1.5>

</td>

<td class="gt_row gt_left">

Properly configure their origin server to provide the correct
Content-Type for a given representation.

</td>

</tr>

<tr>

<td class="gt_row gt_left">

date

</td>

<td class="gt_row gt_left">

Wed, 06 Mar 2019 12:27:24 GMT

</td>

<td class="gt_row gt_center">

FALSE

</td>

<td class="gt_row gt_left">

</td>

<td class="gt_row gt_left">

</td>

</tr>

<tr>

<td class="gt_row gt_left">

referrer-policy

</td>

<td class="gt_row gt_left">

strict-origin-when-cross-origin

</td>

<td class="gt_row gt_center">

NA

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

NA

</td>

</tr>

<tr>

<td class="gt_row gt_left">

server

</td>

<td class="gt_row gt_left">

nginx

</td>

<td class="gt_row gt_center">

TRUE

</td>

<td class="gt_row gt_left">

<https://tools.ietf.org/html/rfc7231#section-7.4.2>

</td>

<td class="gt_row gt_left">

An origin server SHOULD NOT generate a Server field containing
needlessly fine-grained detail and SHOULD limit the addition of
subproducts by third parties.

</td>

</tr>

<tr>

<td class="gt_row gt_left">

strict-transport-security

</td>

<td class="gt_row gt_left">

max-age=31536000

</td>

<td class="gt_row gt_center">

TRUE

</td>

<td class="gt_row gt_left">

<https://tools.ietf.org/html/rfc6797>

</td>

<td class="gt_row gt_left">

Please at least read this reference:
<https://www.owasp.org/index.php/HTTP_Strict_Transport_Security>.

</td>

</tr>

<tr>

<td class="gt_row gt_left">

vary

</td>

<td class="gt_row gt_left">

Accept-Encoding

</td>

<td class="gt_row gt_center">

FALSE

</td>

<td class="gt_row gt_left">

</td>

<td class="gt_row gt_left">

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-content-type-options

</td>

<td class="gt_row gt_left">

nosniff

</td>

<td class="gt_row gt_center">

TRUE

</td>

<td class="gt_row gt_left">

<https://www.owasp.org/index.php/List_of_useful_HTTP_headers>

</td>

<td class="gt_row gt_left">

Always use the only defined value, “nosniff”.

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-discourse-route

</td>

<td class="gt_row gt_left">

list/latest

</td>

<td class="gt_row gt_center">

NA

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

NA

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-download-options

</td>

<td class="gt_row gt_left">

noopen

</td>

<td class="gt_row gt_center">

NA

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

NA

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-frame-options

</td>

<td class="gt_row gt_left">

SAMEORIGIN

</td>

<td class="gt_row gt_center">

TRUE

</td>

<td class="gt_row gt_left">

<https://tools.ietf.org/html/rfc7034>

</td>

<td class="gt_row gt_left">

In 2009 and 2010, many browser vendors (\[Microsoft-X-Frame-Options\]
and \[Mozilla-X-Frame-Options\]) introduced the use of a non-standard
HTTP \[RFC2616\] header field “X-Frame-Options” to protect against
clickjacking. Please check here
<https://www.owasp.org/index.php/Clickjacking_Defense_Cheat_Sheet>
what’s the best option for your case.

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-permitted-cross-domain-policies

</td>

<td class="gt_row gt_left">

none

</td>

<td class="gt_row gt_center">

NA

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

NA

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-request-id

</td>

<td class="gt_row gt_left">

4535cc47-f085-4bad-80ae-97aa50034956

</td>

<td class="gt_row gt_center">

NA

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

NA

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-runtime

</td>

<td class="gt_row gt_left">

0.117140

</td>

<td class="gt_row gt_center">

NA

</td>

<td class="gt_row gt_left">

NA

</td>

<td class="gt_row gt_left">

NA

</td>

</tr>

<tr>

<td class="gt_row gt_left">

x-xss-protection

</td>

<td class="gt_row gt_left">

1; mode=block

</td>

<td class="gt_row gt_center">

TRUE

</td>

<td class="gt_row gt_left">

<https://www.owasp.org/index.php/List_of_useful_HTTP_headers>

</td>

<td class="gt_row gt_left">

Use “X-XSS-Protection: 1; mode=block” whenever is possible (ref.
<http://blogs.msdn.com/b/ieinternals/archive/2011/01/31/controlling-the-internet-explorer-xss-filter-with-the-x-xss-protection-http-header.aspx>).

</td>

</tr>

</tbody>

</table>

<!--gt table end-->

</div>

<!--/html_preserve-->

### Reference

``` r
data(http_headers)

dplyr::glimpse(http_headers)
## Observations: 184
## Variables: 14
## $ header_field_name    <chr> "A-IM", "Accept", "Accept-Additions", "Accept-Charset", "Accept-Datetime", "Accept-Encod…
## $ type_1               <chr> "Permanent", "Permanent", "Permanent", "Permanent", "Permanent", "Permanent", "Permanent…
## $ protocol             <chr> "http", "http", "http", "http", "http", "http", "http", "http", "http", "http", "http", …
## $ status               <chr> "", "standard", "", "standard", "informational", "standard", "", "standard", "", "standa…
## $ reference            <chr> "https://tools.ietf.org/html/rfc3229#section-10.5.3", "https://tools.ietf.org/html/rfc72…
## $ type_2               <chr> "Request", "Request", "Request", "Request", "Request", "Request", "Request", "Request", …
## $ enable               <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, …
## $ required             <lgl> NA, NA, NA, NA, NA, NA, NA, NA, TRUE, TRUE, NA, TRUE, NA, NA, NA, TRUE, NA, NA, NA, NA, …
## $ https                <lgl> NA, NA, NA, NA, NA, NA, NA, NA, TRUE, TRUE, NA, TRUE, NA, NA, NA, TRUE, NA, NA, NA, NA, …
## $ security_description <chr> "", "", "", "", "", "", "", "", "Sometimes an HTTP intermediary might try to detect viru…
## $ security_reference   <chr> "", "", "", "", "", "", "", "", "https://tools.ietf.org/html/rfc5789#section-5", "https:…
## $ recommendations      <chr> "", "", "", "", "", "", "", "", "Antivirus software scans for viruses or worms.", "Serve…
## $ cwe                  <chr> "", "", "", "", "", "", "", "", "CWE-509: Replicating Malicious Code (Virus or Worm)", "…
## $ cwe_url              <chr> "\r", "\r", "\r", "\r", "\r", "\r", "\r", "\r", "https://cwe.mitre.org/data/definitions/…
```

## hdrs Metrics

| Lang | \# Files |  (%) | LoC | (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | --: | ----------: | ---: | -------: | ---: |
| R    |       11 | 0.92 | 186 | 0.9 |          37 | 0.57 |       85 | 0.63 |
| Rmd  |        1 | 0.08 |  21 | 0.1 |          28 | 0.43 |       50 | 0.37 |

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
