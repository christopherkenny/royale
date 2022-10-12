#' Get Upcoming Chests
#'
#' @param tag Required. The player to return.
#' Default: JYJQC88
#' @param key Required. API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: `cr_get_key()`
#'
#' @return tibble of player info
#'
#' @concept player
#'
#' @export
#' @md
#' @examplesIf royale::cr_has_key()
#' cr_get_upcoming_chests('JYJQC88')
cr_get_upcoming_chests <- function(tag = 'JYJQC88', key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_tag(tag)
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_player(tag) |>
    httr2::req_url_path_append('upcomingchests') |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- dplyr::bind_rows(resp$items)

  out
}
