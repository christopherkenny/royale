#' Get One Location
#'
#' @param location Required. Location ID from `cr_get_locations()`.
#' @param key Required. API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: `cr_get_key()`
#'
#' @return tibble of card info
#'
#' @concept locations
#'
#' @export
#' @md
#' @examplesIf royale::cr_has_key()
#' cr_get_location(57000001)
cr_get_location <- function(location, key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_locations(location) |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- resp |>
    dplyr::bind_rows() |>
    clean_names()

  `attr<-`(out, 'paging', resp$paging)

  out
}
