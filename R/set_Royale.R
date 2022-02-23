#' Set Clash Royale API key
#'
#' Sets your Clash Royale API key for default use.
#'
#' @param key Required. Your Clash Royale API key. See \href{}{}.
#'
#' @return None
#'
#' @export

set_Royale <- function(key) {

  # Check inputs ---------------------------------------------------------------
  if (class(key) != 'character') {
    stop('Please provide a valid character key.')
  }

  # Add to environment ---------------------------------------------------------
  Sys.setenv(CRAPI = key)
}
