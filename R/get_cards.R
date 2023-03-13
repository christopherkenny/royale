#' Get card details
#'
#' @param key Required. API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: `cr_get_key()`
#' @param limit `r template_var_limit()`
#' @param after `r template_var_after()`
#' @param before `r template_var_before()`
#'
#' @return tibble of card info
#'
#' @concept cards
#'
#' @export
#' @md
#' @examplesIf royale::cr_has_key()
#' cr_get_cards()
cr_get_cards <- function(limit = NULL, after = NULL, before = NULL, key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    httr2::req_url_path_append('cards') |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- resp$items |>
    dplyr::bind_rows() |>
    tidyr::unnest_wider('iconUrls', names_sep = '_') |>
    dplyr::rename_with(.fn = function(x) stringr::str_sub(x, end = -3), .cols = dplyr::ends_with('_1')) |>
    clean_names()

  out
}
