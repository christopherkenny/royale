#' Get Global Seasons
#'
#' This returns the current season if it's a valid season.
#'
#' @param key Required. API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: `cr_get_key()`
#'
#' @return a `tibble` of season info
#'
#' @concept locations
#'
#' @export
#' @md
#' @examplesIf royale::cr_has_key()
#' cr_get_seasons()
cr_get_seasons <- function(key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    httr2::req_url_path_append('locations', 'global', 'seasonsV2') |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- resp |>
    purrr::pluck('items') |>
    dplyr::bind_rows() |>
    clean_names() |>
    dplyr::arrange(desc(dplyr::row_number()))

  `attr<-`(out, 'paging', resp$paging)

  out
}
