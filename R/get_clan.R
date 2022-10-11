#' Get a clan
#'
#' Gets full clan details
#'
#' @param clan Required. Clan tag. Default: 99R2PQVR
#' @param key Required. API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: cr_get_key
#'
#' @return a `tibble` with each row as a player
#'
#' @concept clan
#'
#' @export
#'
#' @examplesIf royale::cr_has_key()
#' cr_get_clan('99R2PQVR')
cr_get_clan <- function(clan = '99R2PQVR', key = cr_get_key()) {

  # Check inputs ---
  check_valid_clan(clan)
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_clan(clan) |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- resp |>
    widen() |>
    tidyr::unnest_longer(.data$memberList) |>
    tidyr::unnest_wider(.data$memberList, names_sep = '_') |>
    clean_names() |>
    dplyr::rename_with(.fn = function(x) stringr::str_replace(x, 'member_list', 'player'))

  out
}
