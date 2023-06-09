library(testthat)
test_that("`train_test_split` should ask the user to input a valid integer", {
  expect_error(train_test_split(test_df, 1.1, "rating"))
  expect_error(train_test_split(test_df, 0, "genre"))
  expect_error(train_test_split(test_df, -0.1, "movie"))
  expect_error(train_test_split(test_df, "a", "rating"))
  expect_error(train_test_split(test_df, "movie"))
})

test_that("`train_test_split` should ask the user to enter a valid column name present within the data frame", {
  expect_error(train_test_split(test_df, 0.5, "name"))
  expect_error(train_test_split(test_df, 0.6, 2))
  expect_error(train_test_split(test_df, 0.9))
})

test_that("`train_test_split` should return two data frames, one for testing and one for training", {
  expect_type(train_test_split(test_df, 0.7, "genre"), "list")
})

test_that("`train_test_split` should return an error when a data frame is not inputed", {
  expect_error(train_test_split("test_df", 0.5, "name"),"data must be a data frame. Please try again.")
})
