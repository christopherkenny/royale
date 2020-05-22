#' Get RoyaleAPI endpoints
#'
#' Gets the available endpoints for RoyaleAPI
#'
#' @param key Required. API key. See \href{docs.royaleapi.com/#/}{RoyaleAPI.} \cr
#' Default: get_Royale
#'
#' @return
#' Returns RoyaleAPI available endpoints
#'
#' @export

get_endpoints <- function(key = get_Royale()){

  # Check input ----------------------------------------------------------------
  if (nchar(key) == 0){
    stop('Please set API key with set_Royale.')
  }

  # Call to API ----------------------------------------------------------------
  out <- GET(url = 'https://api.royaleapi.com/endpoints',
             config = add_headers(auth = key))

  # Check/Clean output ---------------------------------------------------------
  if (status_code(out) != 200) {
    stop(status_error(status_code(out)))
  } else {
    out <- content(out)
  }

  # Return parsed results ------------------------------------------------------
  return(out)
}

