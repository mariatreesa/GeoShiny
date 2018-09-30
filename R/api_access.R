# sourcing
source("R/installing_packages.R")


# geocode_apiurl <- function(path){
#   url = modify_url("https://maps.googleapis.com/maps/api/geocode/", path = path)
#   GET(url)
# }

# start with url function

url <- function(address, outputformat = "json") {
  sample_key="sample key"
  root <- "http://maps.google.com/maps/api/geocode/"
  u <- paste(root, outputformat, "?api_key=",sample_key,"&address=",address)
  return(URLencode(u))
}

GET(url("india"))
