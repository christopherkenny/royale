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
cr_get_clan <- function(clan = '99R2PQVR', key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_clan(clan)
  check_valid_key(key)

  # Use inputs -----------------------------------------------------------------
  url <- paste0(get_api_url(), 'clans/%23', clan)

  # Call to API ----------------------------------------------------------------
  out <- GET(url, config = add_headers(`Authorization: Bearer` = key))

  # Check/Clean output ---------------------------------------------------------
  if (status_code(out) != 200) {
    cli::cli_abort(status_error(status_code(out)))
  } else {
    out <- content(x = out, as = 'parsed')
  }

  # Return player --------------------------------------------------------------
  out
}
