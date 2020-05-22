#' Set RoyaleAPI key
#'
#' Sets your RoyaleAPI key for default use.
#'
#' @param key Required. Your RoyaleAPI key. See \href{}{}.
#'
#' @return None
#'
#' @export

set_Royale <- function(key){

  # Check inputs ---------------------------------------------------------------
  if (class(key) != 'character'){
    stop('Please provide a valid key.')
  }

  # Add to environment ---------------------------------------------------------
  Sys.setenv(CRAPI = key)

}
