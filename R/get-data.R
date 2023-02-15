#' Load data and its metadata from data world.
#'
#' @import readr
#' 
#' @param dataset_name Any of the following shorthand names:
#' \itemize{
#'  \item "hhs" - Household surveys. hh_survey_combined from https://data.world/rare/hh-surveys
#'  \item "fish" - Fish surveys. fish_surveys_all from https://data.world/rare/fish-surveys
#'  \item "benthic" - Benthic surveys. BenthicMaster from https://data.world/rare/benthic-surveys
#'  \item "ourfish" - OurFish catch data. join_ourfish_footprint_fishbase from https://data.world/rare/fisheries-dashboard
#' }
#'
#' @return A list containing the requested data, its column metadata, and source url.
#' @export
getData <- function (dataset_name) {
  dataset_name <- tolower(dataset_name)
  if (dataset_name %in% names(URL$data)) {
      url_data <- URL$data[[dataset_name]]
      url_metadata <- URL$metadata[[dataset_name]]
      url_source <- URL$source[[dataset_name]]
      
      df <- readr::read_csv(url_data)
      mta <- readr::read_csv(url_metadata)
      
      return(list(data=df, metadata=mta, source=url_source))
  } else {
    error_msg <- paste0(
      dataset_name,
      " is not a valid dataset name.\nTry one of these options:\n",
      paste0(names(URL$data), collapse="\n")
    )
    stop(simpleError(error_msg))
  }
  return(df)
}

#' List containing data world urls
#'
#' @export
URL <- list(
  data = list(
    benthic = "https://query.data.world/s/mmj6e4cgegal77pvwqy2uihl7ia76l",
    fish = "https://query.data.world/s/ux2vgjfktjel62zngbpbv3al7y4udx",
    hhs = "https://query.data.world/s/xbejc6dtleviak6vyrxvsc2tokxsfc",
    ourfish = "https://query.data.world/s/udjqb3xcmh3uoxysd3or2ztefv5kbb"
  ),
  metadata = list(
    fish = "https://query.data.world/s/xydjoueafevrxrfkjuijblpkvqcwt3"
  ),
  source = list(
    benthic = "https://data.world/rare/benthic-surveys",
    fish = "https://data.world/rare/fish-surveys",
    hhs = "https://data.world/rare/hh-surveys",
    ourfish = "https://data.world/rare/fisheries-dashboard"
  )
)
