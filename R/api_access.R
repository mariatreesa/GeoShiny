# sourcing
source("R/installing_packages.R")


 geocode_apiurl <- function(path){
   url = modify_url("https://maps.googleapis.com/maps/api/geocode/", path = path)
   GET(url)
 }
