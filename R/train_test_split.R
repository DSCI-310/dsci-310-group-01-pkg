#' Splitting test data into testing and training data
#'
#' Creates two data frames, one for testing and one for training,
#' from the parent data frame
#'
#' @param data_frame A data frame or data frame extension (e.g. a tibble).
#' @param train_percent The percent of the parent dataframe to be train-test split
#' @param col_name The column name to group by in the testing dataframe
#'
#' @return A list with two data frames
#'   A user-input percent of the parent dataframe training dataframe split of the parent dataframe
#'   A user-input percent's compliment of the parent dataframe testing dataframe split of the parent dataframe
#'
#' @export
#'
#' @examples
#' train_test_split(mtcars, 0.75, "mpg")

train_test_split <- function(data_frame, train_percent, col_name) {
  if (!is.data.frame(data_frame)) {
    stop("data must be a data frame. Please try again.")
  }

  if (train_percent <= 0 || train_percent > 1) {
    stop("train_percent must be between 0 (exclusive) and 1 (inclusive). Please try again.")
  }

  col_names <- names(data_frame)

  if (!(col_name %in% col_names)) {
    stop("Please enter a column name from within the provided data frame")
  }

  training_data <- dplyr::sample_n(data_frame, size = nrow(data_frame) * train_percent,
                                   replace = FALSE
  )

  testing_data <- dplyr::anti_join(data_frame,
                                   training_data,
                                   by = {{col_name}}

  )

  return (list(training_data, testing_data))
}
