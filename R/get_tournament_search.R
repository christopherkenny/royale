#' Search Tournaments
#'
#' @param name Search clans by name
#' @templateVar limit TRUE
#' @templateVar after TRUE
#' @templateVar before TRUE
#' @param key Required. API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: cr_get_key
#' @template template
#'
#' @return a `tibble` with each row as a player
#'
#' @concept tournament
#'
#' @export
#'
#' @examplesIf royale::cr_has_key()
#' cr_get_tournament_search('clash')
cr_get_tournament_search <- function(name = NULL,
                                     limit = NULL, after = NULL, before = NULL,
                                     key = cr_get_key()) {

  # Check inputs ---
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    httr2::req_url_path_append('tournaments') |>
    req_header(key) |>
    httr2::req_url_query(
      'name' = name,
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
