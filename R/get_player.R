#' Get a single player
#'
#' Gets the player details for one player.
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
#' cr_get_player('JYJQC88')
cr_get_player <- function(tag = 'JYJQC88', key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_tag(tag)
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_player(tag) |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- resp |>
    widen() |>
    tidyr::unnest_wider(tidyr::any_of('leagueStatistics'), names_sep = '_') |>
    tidyr::unnest_wider(dplyr::starts_with('leagueStatistics'), names_sep = '_') |>
    tidyr::unnest_wider('currentFavouriteCard', names_sep = '_') |>
    clean_names()

  out$badges <- list(
    dplyr::bind_rows(out$badges) |>
      clean_names()
  )

  out$achievements <- list(
    dplyr::bind_rows(out$achievements) |>
      clean_names()
  )

  out$cards <- list(
    dplyr::bind_rows(out$cards) |>
      clean_names()
  )

  out$current_deck <- list(
    dplyr::bind_rows(out$current_deck) |>
      clean_names()
  )

  out$cards <- list(
    dplyr::bind_rows(lapply(out$cards, function(x) lapply(x, widen))) |>
      clean_names()
  )

  `attr<-`(out, 'paging', resp$paging)

  out
}
