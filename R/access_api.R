# sourcing
source("R/installing_packages.R")


# geocode_apiurl <- function(path){
#   url = modify_url("https://maps.googleapis.com/maps/api/geocode/", path = path)
#   GET(url)
# }

# start with url function

geocode_response <- function(address, return.call="json") {
  sample_key="samplekey"
  root <- "https://maps.google.com/maps/api/geocode/"
  u <- paste0(root,return.call,"?address=",address,"&key=",sample_key)
  res <- GET((URLencode(u)))
  result <- content(res, as = "text", encoding = "UTF-8")
  result <- fromJSON(result,flatten = TRUE)
  print(result)
}


geocode_response("Nairobi")
