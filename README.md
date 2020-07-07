[![Build Status](https://travis-ci.org/mariatreesa/GeoShiny.svg?branch=master)](https://travis-ci.org/mariatreesa/GeoShiny)

# Introduction
This package was developed as part of Lab Assignment at Linkoping University. This package has function two functions:

1.   **geocode_response** which takes an address as input and returns the lattitude and lognitude associated with that address as a vector. The address is in turn passed to a shiny app connected to google's Geocoding API and shows the address on the map.

2.   **reverse_geocode_response** which takes latitude and longitude as input and returns a complete address. The shiny app shows the address on the map. 


It requires the user to provide an API key for google's Geocoding API. 

# Running the Shiny app (GeoShiny)
```{r run, eval=FALSE, message=FALSE, warning=FALSE, paged.print=FALSE}
# load the necessary packages
library(GeoShiny)
library(shiny)
# run the shiny app from github
runGitHub("GeocodingShiny", "mariatreesa")
```

```{r example, out.width="750px", out.height= 700}
knitr::include_graphics("screenshot.png")
```

Given a latitude and longitude instead of an address the reverse geocode returns the complete address of the location. See the example below.
```{r example2, out.width="750px", out.height= 700}
knitr::include_graphics("Screenshot2.png")
```

Map views can also be changed from default map view to satellite view
