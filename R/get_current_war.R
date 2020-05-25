#' Gets current clan war
#'
#' @param clan Required. Clan tag.
#' Default: 99R2PQVR
#' @param key Required. Clash Royale API key. See \href{docs.royaleapi.com/#/}{RoyaleAPI.} \cr
#' Default: get_Royale
#'
#' @return
#' Returns clan war log
#'
#' @export

get_current_war <- function(clan = '99R2PQVR', key = get_Royale()) {
  
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
  url <- paste0('https://api.clashroyale.com/v1/clans/%23', clan, '/currentwar')
  
  # Call to API ----------------------------------------------------------------
  out <- GET(url, config = add_headers(`Authorization: Bearer` = key))
  
  # Check/Extract output -------------------------------------------------------
  if (status_code(out) != 200){
    stop(status_error(status_code(out)))
  } else {
    out <- content(x = out, as = 'parsed')
  }
  
  # Clean output ---------------------------------------------------------------
  #tib <- bind_rows(out[[1]]$participants)
  
  # Return clan war--------------------------------------------------------
  return(out)
}