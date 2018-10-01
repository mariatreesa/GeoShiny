#' Function to get coordinates given an address, from geocode API
#' Authors: Maria Treesa Sebastian(marse306), Brian Masinde(brima748), Omkar (omkbh878)

#' @name geocode_response
#'
#' @export geocode_response
#'
#' @param address as vector
#'
#' @return latitude and longitude of the address as a matirx
#'

# sourcing
source("R/installing_packages.R")

geocode_response <- function(address) {
  if(is.vector(address) == FALSE || length(address) > 1) {
    stop("Multiple addresses given")
  }
  if(address == ""){
    stop("Please enter an address")
  }
  return.call="json"
  sample_key="Sample_key"
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



