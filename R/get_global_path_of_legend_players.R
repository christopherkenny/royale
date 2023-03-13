#' Get Global Player Path of Legend Rankings
#'
#' @param season Required. Season ID, such as '2022-09'
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
#' cr_get_global_path_of_legend_players('2023-02', limit = 10)
cr_get_global_path_of_legend_players <- function(season,
                                         limit = NULL, after = NULL, before = NULL,
                                         key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    httr2::req_url_path_append('locations', 'global', 'pathoflegend', season, 'rankings', 'players') |>
    req_where(limit, after, before) |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- dplyr::bind_rows(lapply(resp$items, widen)) |>
    clean_names()

  `attr<-`(out, 'paging', resp$paging)

  out
}
