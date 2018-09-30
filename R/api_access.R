# sourcing
source("R/installing_packages.R")


# geocode_apiurl <- function(path){
#   url = modify_url("https://maps.googleapis.com/maps/api/geocode/", path = path)
#   GET(url)
# }

# start with url function

url <- function(address, return.call="json") {
  sample_key="sample key"
  root <- "http://maps.google.com/maps/api/geocode/"
  u <- paste(root,return.call,"?address=",address,"&key=",sample_key, "&sensor=", sensor, sep = "")
  return(URLencode(u))
}


geocode_api <- function(url, address) {
  response <- GET(url(address))
  if (http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  jsonlite::fromJSON(content(response, "text"), simplifyVector = FALSE)
}

github_api(url, "Nairobi")
