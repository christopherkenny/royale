#' Get Global Tournament Rankings
#'
#' @param tournament Tournament tag. Required.
#' @param key Required. API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: `cr_get_key()`
#' @param limit `r template_var_limit()`
#' @param after `r template_var_after()`
#' @param before `r template_var_before()`
#'
#' @return tibble of card info
#'
#' @concept locations
#'
#' @export
#' @md
#' @examplesIf royale::cr_has_key()
#' # needs an ongoing tournament at time of request
#' try({cr_get_global_ranking_tournament('URP8YYUU0')})
cr_get_global_ranking_tournament <- function(tournament,
                                          limit = NULL, after = NULL, before = NULL,
                                          key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    httr2::req_url_path_append('locations', 'global', 'rankings', 'tournaments', tournament) |>
    req_where(limit, after, before) |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- dplyr::bind_rows(lapply(resp$items, widen)) |>
    clean_names()

  `attr<-`(out, 'paging', resp$paging)

  out
}
