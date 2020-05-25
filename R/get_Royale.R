#' Get RoyaleAPI key
#'
#' Retrieves RoyaleAPI key set by \code{set_Royale}.
#'
#' @return string key
#'
#' @export

get_Royale <- function(){

  # Add to environment ---------------------------------------------------------
  out <- Sys.getenv('CRAPI')

  # Check for set key ----------------------------------------------------------
  if (out == ""){
    stop('No key found. Set key with set_Royale or specify key.')
  }

  # Return key -----------------------------------------------------------------
  return(out)
}
