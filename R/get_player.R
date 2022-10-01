#' Get a single player
#'
#' Gets the player details for one player.
#'
#' @param tag Required. The player to return.
#' Default: JYJQC88
#' @param key Required. API key. See https://developer.clashroyale.com/#/documentation
#' Default: `cr_get_key()`
#'
#' @importFrom dplyr tibble
#' @importFrom httr GET status_code
#' @return Returns a player's info as a tibble
#'
#' @export
#' @md
#' @examples
#' #TODO
get_player <- function(tag = 'JYJQC88', key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  if (stringr::str_length(tag) != 7) {
    cli::cli_abort('`tag` must be 7 characters long.')
  }
  if (substr(tag, 1, 1) == '#') {
    cli::cli_abort('`tag` does not include "#".')
  }
  check_valid_key(key)

  # Use inputs -----------------------------------------------------------------
  url <- paste0(get_api_url(), 'players/%23', tag)

  # Call to API ----------------------------------------------------------------
  out <- httr::GET(url, config = add_headers(`Authorization: Bearer` = key))

  # Check/Clean output ---------------------------------------------------------
  if (status_code(out) != 200) {
    cli::cli_abort(status_error(status_code(out)))
  } else {
    out <- httr::content(x = out, as = 'parsed')
  }

  # Return player --------------------------------------------------------------
  out
}
