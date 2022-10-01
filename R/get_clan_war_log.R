#' Gets Clan War Log
#'
#' @param clan Required. Clan tag.
#' Default: 99R2PQVR
#' @param key Required. Clash Royale API key. See https://developer.clashroyale.com/#/documentation
#' Default: cr_get_key
#'
#' @return
#' Returns clan tibble
#'
#' @export
get_clan_war_log <- function(clan = '99R2PQVR', key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_clan(clan)
  check_valid_key(key)

  # Use inputs -----------------------------------------------------------------
  url <- paste0('https://api.clashroyale.com/v1/clans/%23', clan, '/warlog')

  # Call to API ----------------------------------------------------------------
  out <- GET(url, config = add_headers(`Authorization: Bearer` = key))

  # Check/Extract output -------------------------------------------------------
  if (status_code(out) != 200) {
    cli::cli_abort(status_error(status_code(out)))
  } else {
    out <- content(x = out, as = 'parsed')
  }

  # Clean output ---------------------------------------------------------------
  tib <- dplyr::bind_rows(out[[1]]$participants)

  # Return clan war log --------------------------------------------------------
  out
}
