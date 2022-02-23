#' Get a single player
#'
#' Gets full clan details
#'
#' @param clan Required. Clan tag.
#' Default: 99R2PQVR
#' @param key Required. API key. See \href{docs.royaleapi.com/#/}{RoyaleAPI.} \cr
#' Default: get_Royale
#'
#' @importFrom dplyr tibble
#' @importFrom httr GET status_code
#' @return Returns a player's info as a tibble
#'
#' @export

get_clan <- function(clan = '99R2PQVR', key = get_Royale()) {

  # Check inputs ---------------------------------------------------------------
  if (stringr::str_length(clan) != 8) {
    stop('"clan" must be 8 characters long')
  }
  if (substr(clan, 1, 1) == '#') {
    stop('"clan" does not include "#"')
  }
  if (nchar(key) == 0) {
    stop('Please set API key with set_Royale.')
  }

  # Use inputs -----------------------------------------------------------------
  url <- paste0(get_api_url(), 'clans/%23', clan)

  # Call to API ----------------------------------------------------------------
  out <- GET(url, config = add_headers(`Authorization: Bearer` = key))

  # Check/Clean output ---------------------------------------------------------
  if (status_code(out) != 200) {
    stop(status_error(status_code(out)))
  } else {
    out <- content(x = out, as = 'parsed')
  }

  # Return player --------------------------------------------------------------
  return(out)
}
