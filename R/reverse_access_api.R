
#' Function to return address given latitude and longitude
#' @author: Maria,Masinde,Omkar
#'
#' @name reverse_geocode_response
#'
#' @export reverse_geocode_response
#'
#' @param lat
#'
#' @param long
#'
#' @param map_key
#'
#' @return a formatted address


reverse_geocode_respone <- function(lat, long, map_key){
  # no map key go no further
  if(map_key == FALSE){
    stop("No map_key")
  }

  # correctness of input
  if(is.numeric(lat) == FALSE){
    stop("latitude is not numeric")
  }

  if(is.numeric(long) == FALSE){
    stop("longitude is not numeric")
  }
  if(abs(lat) > 90){
    stop("latitude ranges from -90 and 90")
  }

  if(abs(long) > 180){
    stop("longitude ranges from -180 to 180")
  }

  # no space between lat and long
  latlng <- paste(lat,long, sep = ",")

  # return a json object
  return.call="json"
  root <- "https://maps.google.com/maps/api/geocode/"
  u <- paste0(root,return.call,"?latlng=",latlng,"&key=",map_key)
  res <- GET((URLencode(u)))
  result_json <- content(res, as = "text", encoding = "UTF-8")
  result_ls <- fromJSON(result_json, flatten = FALSE)

  # extract address information
  address <- result_ls$results$formatted_address[1]
 return(address)
}


