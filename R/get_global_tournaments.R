#' Get Global Tournament details
#'
#' @param key Required. API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: `cr_get_key()`
#' @param limit `r template_var_limit()`
#' @param after `r template_var_after()`
#' @param before `r template_var_before()`
#'
#' @return tibble of card info
#'
#' @concept globaltournaments
#'
#' @export
#' @md
#' @examplesIf royale::cr_has_key()
#' cr_get_global_tournaments()
cr_get_global_tournaments <- function(limit = NULL, after = NULL, before = NULL, key = cr_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    httr2::req_url_path_append('globaltournaments') |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- lapply(resp$item, widen) |>
    dplyr::bind_rows() |>
    tidyr::unnest_wider('topRankReward', names_sep = '_') |>
    dplyr::rename_with(.fn = function(x) stringr::str_sub(x, end = -3), .cols = dplyr::ends_with('_1')) |>
    tidyr::unnest_wider('topRankReward', names_sep = '_') |>
    clean_names()

  out$milestone_rewards <- lapply(out$milestone_rewards,
                                  function(x) x |>
                                    dplyr::bind_rows() |>
                                    clean_names()
  )

  out$free_tier_rewards <- lapply(out$free_tier_rewards,
                                  function(x) x |>
                                    dplyr::bind_rows() |>
                                    clean_names()
  )

  out
}
