#' Get current River Race
#'
#' @param clan Required. Clan tag.
#' Default: 99R2PQVR
#' @param key Required. Clash Royale API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: cr_get_key
#' @param limit `r template_var_limit()`
#' @param after `r template_var_after()`
#' @param before `r template_var_before()`
#'
#' @return `tibble` with list columns for clan, clans, and history.
#'
#' @concept clan
#'
#' @export
#'
#' @examplesIf royale::cr_has_key()
#' cr_get_riverrace_current('99R2PQVR')
cr_get_riverrace_current <- function(clan = '99R2PQVR',
                                     limit = NULL, after = NULL, before = NULL,
                                     key = cr_get_key()) {

  # Check inputs ---
  check_valid_clan(clan)
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_clan(clan) |>
    httr2::req_url_path_append('currentriverrace') |>
    req_header(key) |>
    req_where(limit, after, before) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  # Clean output ---
  out <- resp |>
    widen() |>
    clean_names()

  out$clan <- list(
    widen_clan(resp$clan)
  )

  out$clans <- list(
    dplyr::bind_rows(lapply(resp$clans, widen_clan))
  )

  if ('period_logs' %in% names(out)) {
    out$period_logs <- list(
      dplyr::bind_rows(resp$periodLogs) |>
        tidyr::unnest_wider('items') |>
        tidyr::unnest_wider('clan', names_sep = '_') |>
        clean_names()
    )
  }

  `attr<-`(out, 'paging', resp$paging)

  out
}
