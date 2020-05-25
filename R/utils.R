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
    return('400: Client provided incorrect parameters for the request.')
  } else if (s == 403){
    return('403: Access denied, either because of missing/incorrect credentials or used API token does not grant access to the requested resource.')
  } else if (s == 404) {
    return('404: Resource was not found.')
  } else if (s == 429) {
    return('429:	Request was throttled, because amount of requests was above the threshold defined for the used API token.')
  } else if (s == 500) {
    return(  '500: Unknown error happened when handling the request.')
  } else if (s == 503) {
    return(  '503:	Service is temprorarily unavailable because of maintenance..')
  } else {
    return(paste0('Unknown error. Status is ', s, '.'))
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
