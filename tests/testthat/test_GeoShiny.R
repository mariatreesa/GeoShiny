# Test suits for package GeoShiny
# Function to be tested
context("geocode_response")

# Test that function takes a valid address (No nulls or multiples)
test_that("geocode_response takes one address at a time", {
  expect_error(geocode_response(address = c("Kerala", "Nairobi")))
  expect_error(geocode_response(address = ""))
})


