#' Load dataset from data world.
#'
#' @import readr
#'
#' @param dataset_name Any of the following shorthand names:
#' \itemize{
#'  \item "hhs" - Household surveys. hh_survey_combined from https://data.world/rare/hh-surveys
#'  \item "benthic" - Benthic surveys. BenthicMaster from https://data.world/rare/benthic-surveys
#'  \item "ourfish" - OurFish catch data. join_ourfish_footprint_fishbase from https://data.world/rare/fisheries-dashboard
#' }
#'
#' @return A tibble from readr
#' @export
getData <- function (dataset_name) {
  dataset_name <- tolower(dataset_name)
  tryCatch(
    expr = {
      url <- URL[[dataset_name]]
      df <- readr::read_csv(url)
    },
    error = function (e) {
      stop(simpleError(paste0(
        dataset_name,
        " is not a valid dataset name.\nTry one of these options:\n",
        paste0(names(URL), collapse="\n")
      )))
    }
  )

  return(df)
}

#' List containing data world urls
#'
#' @export
URL <- list(
  hhs = "https://query.data.world/s/xbejc6dtleviak6vyrxvsc2tokxsfc",
  benthic = "https://query.data.world/s/mmj6e4cgegal77pvwqy2uihl7ia76l",
  ourfish = "https://query.data.world/s/udjqb3xcmh3uoxysd3or2ztefv5kbb"
)
