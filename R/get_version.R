#' Get RoyaleAPI version
#'
#' Gets the current version for RoyaleAPI
#'
#' @param key Required. API key. See https://developer.clashroyale.com/#/documentation
#' Default: cr_get_key
#'
#' @return
#' Returns RoyaleAPI version
#'
#' @export
get_version <- function(key = cr_get_key()) {

  # Check input ----------------------------------------------------------------
  check_valid_key(key)

  # Call to API ----------------------------------------------------------------
  out <- GET(
    url = 'https://api.royaleapi.com/version',
    config = add_headers(auth = key)
  )

  # Check/Clean output ---------------------------------------------------------
  if (status_code(out) != 200) {
    stop(status_error(status_code(out)))
  } else {
    out <- content(out)$version
  }

  # Return parsed results ------------------------------------------------------
  out
}
