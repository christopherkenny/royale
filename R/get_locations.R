#' Get Locations
#'
#' @param key Required. API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: `cr_get_key()`
#' @templateVar limit TRUE
#' @templateVar after TRUE
#' @templateVar before TRUE
#' @template  template
#'
#' @return tibble of card info
#'
#' @concept locations
#'
#' @export
#' @md
#' @examplesIf royale::cr_has_key()
#' cr_get_locations()
cr_get_locations <- function(limit = NULL, after = NULL, before = NULL, key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    httr2::req_url_path_append('locations') |>
    req_header(key) |>
    req_where(limit, after, before) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- resp$items |>
    dplyr::bind_rows() |>
    clean_names()

  `attr<-`(out, 'paging', resp$paging)

  out
}
