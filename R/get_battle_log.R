#' Get Battle Log
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
#' cr_get_battle_log('JYJQC88')
cr_get_battle_log <- function(tag = 'JYJQC88', key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_tag(tag)
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_player(tag) |>
    httr2::req_url_path_append('battlelog') |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- resp |>
    tibble::enframe() |>
    tidyr::unnest_wider('value') |>
    dplyr::select(-'name') |>
    tidyr::unnest_wider(c('opponent', 'arena', 'gameMode', 'team', 'opponent'), names_sep = '_') |>
    dplyr::rename_with(.fn = function(x) stringr::str_sub(x, end = -3), .cols = dplyr::ends_with('_1')) |>
    tidyr::unnest_wider(c('team', 'opponent'), names_sep = '_') |>
    tidyr::unnest_wider(c('team_clan', 'opponent_clan'), names_sep = '_') |>
    dplyr::rename_with(.fn = function(x) stringr::str_sub(x, end = -3), .cols = dplyr::ends_with('_1')) |>
    clean_names()

  out$team_cards <- lapply(out$team_cards, dplyr::bind_rows)
  out$opponent_cards <- lapply(out$opponent_cards, dplyr::bind_rows)

  out
}
