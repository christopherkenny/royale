#' Checks status code
#'
#' Check what the api returned
#'
#' @param s status code to check
#'
#' @return
#' Status Error Message
#'
#' @export
status_error <- function(s) {
  if (s == 400){
    return('400: Bad Request -- Your request sucks.')
  } else if (s == 401){
    return('401: Unauthorized -- No authentication was provided, or key invalid.')
  } else if (s == 404) {
    return('404: Not Found -- The specified player / clan cannot be found. Could be invalid tags.')
  } else if (s == 417) {
    return('417: Expectation Failed -- Clan not tracked.')
  } else if (s == 429) {
    return('429:	Too Many Requests -- You have hit the API Ratelimit.')
  } else if (s == 500) {
    return(  '500:	Internal Server Error -- RoyaleAPI has a problem with their server. Try again later.')
  } else if (s == 501) {
    return(  '501:	Not Implemented Yet -- RoyaleAPI has yet to implement this feature in v3 of the API.')
  } else if (s == 503) {
    return(  '503:	Service Unavailable -- RoyaleAPI is temporarily offline for maintenance. Please try again later.')
  } else if (s == 522) {
    return(  '522:	:Service Unavailable -- RoyaleAPI is temporarily offline. Please try again later.')
  } else {
    return(paste0('Unknown error. Status is',s))
  }
}

#' Check for valid tag
#'
#' Checks that provide player or clan tag could be avalid tag.
#' Does not verify that a player or clan has that tag.
#'
#'
valid_tag <- function(tag, length){
  if (!(all(strsplit(tag) %in% c('0', '2', '8', '9', 'C', 'G', 'J', 'L', 'P', 'Q', 'R', 'U', 'V', 'Y')))) {
    stop('This tag includes invalid characters.')
  }

}
