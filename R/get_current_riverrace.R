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
#'
#' @examplesIf royale::cr_has_key()
#'
#' cr_get_current_riverrace('99R2PQVR')
cr_get_current_riverrace <- function(clan = '99R2PQVR', key = cr_get_key()) {

  # Check inputs ---
  check_valid_clan(clan)
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_clan(clan) |>
    httr2::req_url_path_append('currentriverrace') |>
    req_header(key) |>
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

  out$period_logs <- list(
    dplyr::bind_rows(resp$periodLogs) |>
      tidyr::unnest_wider(col = items) |>
      tidyr::unnest_wider(.data$clan, names_sep = '_') |>
      clean_names()
  )

  out
}
