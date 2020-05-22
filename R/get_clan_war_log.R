#' Gets clan war log
#'
#' @param clan Required. Clan tag.
#' Default: 99R2PQVR
#' @param key Required. API key. See \href{docs.royaleapi.com/#/}{RoyaleAPI.} \cr
#' Default: get_Royale
#'
#' @return
#' Returns clan war log
#'
#' @export

get_clan_war_log <- function(clan = '99R2PQVR', key = get_Royale()) {

  # Check inputs ---------------------------------------------------------------
  if (stringr::str_length(clan) != 8){
    stop('"clan" must be 8 characters long')
  }
  if (substr(clan, 1, 1) == '#'){
    stop('"clan" does not include "#"')
  }
  if (nchar(key) == 0){
    stop('Please set API key with set_Royale.')
  }

  # Use inputs -----------------------------------------------------------------
  url <- paste0('https://api.royaleapi.com/clan/', clan, '/warlog')

  # Call to API ----------------------------------------------------------------
  out <- GET(url, config = add_headers(auth = key))

  # Check/Extract output -------------------------------------------------------
  if (status_code(out) != 200){
    stop(status_error(status_code(out)))
  } else {
    out <- content(x = out, as = 'parsed')
  }

  # Clean output ---------------------------------------------------------------
  tib <- bind_rows(out[[1]]$participants)

  # Return clan war log --------------------------------------------------------
  return(out)
}
