# Test suits for package GeoShiny
# Function to be tested
context("geocode_response")

# Test that function takes a valid address (No nulls or multiples)
test_that("geocode_response takes one address at a time", {
  expect_error(geocode_response(address = c("Kerala", "Nairobi")))
  expect_error(geocode_response(address = ""))
})

# test that no special characters in address
test_that("Found special characters",{
  expect_error(geocode_response(address = "Nai#&%"))
}
)

# test that map key is give, so that no request is sent to the api without the key
test_that("No API",{
  expect_error(geocode_response(address = "Nairobi", map_key = ""))
}
)


context("reverse_geocode_response")

#Test that the function stops if invalide ccordinates are give for latitude and longitude

test_that("reverse_geocode_response takes correct coordinates for lattitude and longitude", {
  expect_error(reverse_geocode_response(lat = 91.8867, long = 182.4321, map_key = ""))
})

test_that("API present",{
  expect_error(reverse_geocode_response(lat = 58.4108,long =15.6214, map_key = ""))
}
)

