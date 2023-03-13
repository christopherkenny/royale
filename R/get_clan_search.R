#' Search Clans
#'
#' @param name Search clans by name
#' @param location_id Filter by clan location identifier
#' @param min_members Filter by minimum number of clan members
#' @param max_members Filter by maximum number of clan members
#' @param min_score Filter by minimum amount of clan score
#' @param limit `r template_var_limit()`
#' @param after `r template_var_after()`
#' @param before `r template_var_before()`
#' @param key Required. API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: cr_get_key
#'
#' @return a `tibble` with each row as a player
#'
#' @concept clan
#'
#' @export
#'
#' @examplesIf royale::cr_has_key()
#' cr_get_clan_search('Legend Dynasty!')
cr_get_clan_search <- function(name = NULL, location_id = NULL, min_members = NULL,
                        max_members = NULL, min_score = NULL,
                        limit = NULL, after = NULL, before = NULL,
                        key = cr_get_key()) {

  # Check inputs ---
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    httr2::req_url_path_append('clans') |>
    req_header(key) |>
    httr2::req_url_query(
      'name' = name,
      'locationId' = location_id,
      'minMembers' = min_members,
      'maxMembers' = max_members,
      'minScore' = min_score,
      'limit' = limit,
      'after' = after,
      'before' = before
    ) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  suppressWarnings({
    out <- dplyr::bind_rows(lapply(resp$items, function(x) dplyr::bind_rows(unlist(x)))) |>
      clean_names()
  })

  `attr<-`(out, 'paging', resp$paging)

  out
}
