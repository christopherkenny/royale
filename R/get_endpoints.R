#' Get Clash Royale API endpoints
#'
#' Gets the available endpoints for Clash Royale APi
#'
#' @param key Required. API key. See \href{https://developer.clashroyale.com/#/}{Clash Royale Api} \cr
#' Default: cr_get_key
#'
#'
#' @importFrom httr status_code GET content add_headers
#' @return Returns available endpoints
#'
#' @noRd
cr_get_endpoints <- function(key = cr_get_key()) {

  # Check input ----------------------------------------------------------------
  check_valid_key(key)

  # Call to API ----------------------------------------------------------------
  out <- GET(
    url = get_api_url(),
    config = add_headers(`Authorization: Bearer` = key)
  )

  # Check/Clean output ---------------------------------------------------------
  if (status_code(out) != 200) {
    cli::cli_abort(status_error(status_code(out)))
  } else {
    out <- content(out)
  }

  # Return parsed results ------------------------------------------------------
  out
}
