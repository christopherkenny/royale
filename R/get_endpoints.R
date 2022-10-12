#' Get Clash Royale API endpoints
#'
#' Gets the available endpoints for Clash Royale API
#'
#' @param key Required. API key. See <https://developer.clashroyale.com/#/>
#' Default: cr_get_key
#'
#' @concept api
#'
#' @return Returns available endpoints
#'
#' @noRd
cr_get_endpoints <- function(key = cr_get_key()) {

  check_valid_key(key)

  req_base() |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_string()
}
