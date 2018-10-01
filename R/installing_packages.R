
#'This R script is used for installing  and loading the required packages

#' @return nothing
#'
#' @export

# Check if packages is installed, else install

if("httr" %in% rownames(installed.packages()) == FALSE){
  install.packages("httr")
}
if("jsonlite" %in% rownames(installed.packages()) == FALSE){
  install.packages("jsonlite")
}

library("httr")
library("jsonlite")
