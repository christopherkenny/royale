#' Get a single player
#'
#' Gets the player details for one player.
#'
#' @param tag Required. The player to return.
#' Default: JYJQC88
#' @param key Required. API key. See \href{docs.royaleapi.com/#/}{RoyaleAPI.} \cr
#' Default: get_Royale
#'
#' @return
#' Returns a player.
#'
#' @export

get_player <- function(tag = 'JYJQC88', key = get_Royale()){

  # Check inputs ---------------------------------------------------------------
  if (stringr::str_length(tag) != 7){
    stop('"tag" must be 7 characters long')
  }
  if (substr(tag, 1, 1) == '#'){
    stop('"tag" does not include "#"')
  }
  if (nchar(key) == 0){
    stop('Please set API key with set_Royale.')
  }

  # Use inputs -----------------------------------------------------------------
  url <- paste0('https://api.royaleapi.com/player/', tag)

  # Call to API ----------------------------------------------------------------
  out <- GET(url, config = add_headers(auth = key))

  # Check/Clean output ---------------------------------------------------------
  if (status_code(out) != 200){
    stop(status_error(status_code(out)))
  } else {
    out <- content(x = out, as = 'parsed')
  }

  # Return player --------------------------------------------------------------
  return(out)
}
