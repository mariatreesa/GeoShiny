# Test suits for package GeoShiny
# Function to be tested
context("geocode_response")

# Test that function takes a valid address (No nulls or multiples)
test_that("geocode_response takes one address at a time", {
  expect_error(geocode_response(address = c("Kerala", "Nairobi")))
  expect_error(geocode_response(address = ""))
})

# Test that correct lat and lng for "Linkoping"

test_that("Coordinates for linkoping are always...", {
 expect_equal(geocode_response("Linkoping")[[1]],
   c(58.41081)
   )
})


test_that("Coordinates linkoping", {
  expect_true(as.vector(geocode_response("Linkoping")[[1]]) %in% c(58.41081))
}
)

