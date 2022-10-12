#' Get Player Rankings for a Location
#'
#' @param location Required. Location ID from `cr_get_locations()`. Must be a country.
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
#' cr_get_local_ranking_players(57000249, limit = 10)
cr_get_local_ranking_players <- function(location,
                                       limit = NULL, after = NULL, before = NULL,
                                       key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_locations(location) |>
    httr2::req_url_path_append('rankings', 'players') |>
    req_where(limit, after, before) |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- dplyr::bind_rows(lapply(resp$items, widen)) |>
    clean_names()

  `attr<-`(out, 'paging', resp$paging)

  out
}
