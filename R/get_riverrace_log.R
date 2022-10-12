#' Get River Race Log
#'
#' @param clan Required. Clan tag.
#' Default: 99R2PQVR
#' @param key Required. Clash Royale API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: cr_get_key
#' @templateVar limit TRUE
#' @templateVar after TRUE
#' @templateVar before TRUE
#' @template template
#'
#' @return `tibble` with list columns for clan, clans, and history.
#'
#' @concept clan
#'
#' @export
#'
#' @examplesIf royale::cr_has_key()
#' cr_get_riverrace_log('99R2PQVR')
cr_get_riverrace_log <- function(clan = '99R2PQVR',
                                     limit = NULL, after = NULL, before = NULL,
                                     key = cr_get_key()) {

  # Check inputs ---
  check_valid_clan(clan)
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_clan(clan) |>
    httr2::req_url_path_append('riverracelog') |>
    req_header(key) |>
    req_where(limit, after, before) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  # Clean output ---
  out <- dplyr::bind_rows(lapply(resp$items, widen)) |>
    clean_names()

  out$standings <- lapply(out$standings, function(y) {
    dplyr::bind_rows(
      lapply(y, function(z) {
        z <- z|>
          tibble::enframe() |>
          tidyr::pivot_wider() |>
          dplyr::mutate(dplyr::across(1:2, as.integer))

        z$clan <- list(dplyr::bind_rows(lapply(z$clan, widen_clan)))
        z
      })
    )
  })

  `attr<-`(out, 'paging', resp$paging)

  out
}
