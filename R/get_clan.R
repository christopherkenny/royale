#' Get a single player
#'
#' Gets full clan details
#'
#' @param clan Required. Clan tag. Default: 99R2PQVR
#' @param key Required. API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: cr_get_key
#'
#' @importFrom dplyr tibble
#' @importFrom httr GET status_code
#' @return Returns a player's info as a tibble
#'
#' @export
#'
#' @examplesIf royale::cr_has_key()
#'
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

  # Return player --------------------------------------------------------------
  out
}
