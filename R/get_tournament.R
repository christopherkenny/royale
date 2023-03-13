#' Get Tournament
#'
#' @param tournament Tournament tag. Required.
#' @param key Required. API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: cr_get_key
#'
#' @return a `tibble` with each row as a player
#'
#' @concept tournament
#'
#' @export
#'
#' @examplesIf royale::cr_has_key()
#' tournament <- cr_get_tournament_search('a')$tag[1]
#' cr_get_tournament(tournament)
cr_get_tournament <- function(tournament, key = cr_get_key()) {

  # Check inputs ---
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_tournament(tournament) |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- resp |>
    widen() |>
    clean_names()

  `attr<-`(out, 'paging', resp$paging)

  out
}
