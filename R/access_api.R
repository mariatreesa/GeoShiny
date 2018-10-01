# sourcing
source("R/installing_packages.R")


# geocode_apiurl <- function(path){
#   url = modify_url("https://maps.googleapis.com/maps/api/geocode/", path = path)
#   GET(url)
# }

# start with url function

geocode_response <- function(address, return.call="json") {
 sample_key="sample_key"
  root <- "https://maps.google.com/maps/api/geocode/"
  u <- paste0(root,return.call,"?address=",address,"&key=",sample_key)
  res <- GET((URLencode(u)))
  result_json <- content(res, as = "text", encoding = "UTF-8")
  result_ls <- fromJSON(result_json, flatten = FALSE)
  # Extract latitude
  lat <- result_ls$results[[3]]$location$lat

  # Extract longitude
  long <- result_ls$results[[3]]$location$lng

  # Coordinates
  return(cbind(lat, long))
}





