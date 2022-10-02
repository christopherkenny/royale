#' Gets current River Race
#'
#' @param clan Required. Clan tag.
#' Default: 99R2PQVR
#' @param key Required. Clash Royale API key. See https://developer.clashroyale.com/#/documentation
#' Default: cr_get_key
#'
#' @return
#' Returns river race as ___
#'
#' @export
cr_get_current_riverrace <- function(clan = '99R2PQVR', key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_clan(clan)
  check_valid_key(key)

  # Use inputs -----------------------------------------------------------------
  url <- paste0(get_api_url(), 'clans/%23', clan, '/currentriverrace')

  # Call to API ----------------------------------------------------------------
  out <- GET(url, config = add_headers(`Authorization: Bearer` = key))

  # Check/Extract output -------------------------------------------------------
  if (status_code(out) != 200) {
    stop(status_error(status_code(out)))
  } else {
    out <- content(x = out, as = 'parsed')
  }

  # Clean output ---------------------------------------------------------------
  # tib <- dplyr::bind_rows(out[[1]]$participants)

  # Return clan war--------------------------------------------------------
  out
}
