#' Get Clash Royale API endpoints
#'
#' Gets the available endpoints for Clash Royale APi
#'
#' @param key Required. API key. See \href{https://developer.clashroyale.com/#/}{Clash Royale Api} \cr
#' Default: get_Royale
#'
#'
#' @importFrom httr status_code GET content add_headers
#' @return Returns available endpoints
#'
#' @enoRd
get_endpoints <- function(key = get_Royale()) {

  # Check input ----------------------------------------------------------------
  if (nchar(key) == 0) {
    stop('Please set API key with set_Royale.')
  }

  # Call to API ----------------------------------------------------------------
  out <- GET(
    url = get_api_url(),
    config = add_headers(`Authorization: Bearer` = key)
  )

  # Check/Clean output ---------------------------------------------------------
  if (status_code(out) != 200) {
    stop(status_error(status_code(out)))
  } else {
    out <- content(out)
  }

  # Return parsed results ------------------------------------------------------
  return(out)
}
