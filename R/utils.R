#' Checks status code
#'
#' Check what the api returned
#'
#' @param s status code to check
#'
#' @return Status Error Message
#'
#' @noRd
status_error <- function(s) {
  if (s == 400) {
    msg <- '400: Client provided incorrect parameters for the request.'
  } else if (s == 403) {
    msg <- '403: Access denied, either because of missing/incorrect credentials or used API token does not grant access to the requested resource.'
  } else if (s == 404) {
    msg <- '404: Resource was not found.'
  } else if (s == 429) {
    msg <- '429:	Request was throttled, because amount of requests was above the threshold defined for the used API token.'
  } else if (s == 500) {
    msg <- '500: Unknown error happened when handling the request.'
  } else if (s == 503) {
    msg <- '503:	Service is temprorarily unavailable because of maintenance.'
  } else {
    msg <- paste0('Unknown error. Status is ', s, '.')
  }

  msg
}

#' Check for valid tag
#'
#' Checks that provide player or clan tag could be a valid tag.
#' Does not verify that a player or clan has that tag.
#'
#' @noRd
check_valid_tag <- function(tag) {
  # if (!(all(unlist(strsplit(tag, '')) %in% c('0', '2', '8', '9', 'C', 'G', 'J', 'L', 'P', 'Q', 'R', 'U', 'V', 'Y')))) {
  #   cli::cli_abort('This tag includes invalid characters.')
  # }
  if (!is.character(tag)) {
    cli::cli_abort('{.arg tag} must be a character.')
  }

  if (length(tag) !=  1) {
    cli::cli_abort('{.arg tag} must be length 1.')
  }

  invisible(tag)
}

check_valid_clan <- function(clan) {
  if (stringr::str_length(clan) != 8) {
    cli::cli_abort('{.arg clan} must be 8 characters long')
  }
  if (substr(clan, 1, 1) == '#') {
    cli::cli_abort('{.arg clan} does not include "#"')
  }
  invisible(clan)
}

check_valid_key <- function(key) {
  if (nchar(key) == 0) {
    cli::cli_inform('Please set API key with {.fn cr_set_key}.')
  }
  invisible(key)
}

#' Gets the api url
#'
#' @noRd
api_url <- function() {
  if (getOption('royale.use_proxy', FALSE)) {
    'https://proxy.royaleapi.dev/v1/'
  } else {
    'https://api.clashroyale.com/v1/'
  }
}

req_base <- function() {
  httr2::request(base_url = api_url())
}

req_clan <- function(req, x) {
  httr2::req_url_path_append(req, 'clans', paste0('%23', stringr::str_remove(x, '#')))
}

req_player <- function(req, x) {
  httr2::req_url_path_append(req, 'players', paste0('%23', stringr::str_remove(x, '#')))
}

req_tournament <- function(req, x) {
  httr2::req_url_path_append(req, 'tournaments', paste0('%23', stringr::str_remove(x, '#')))
}

req_locations <- function(req, x) {
  httr2::req_url_path_append(req, 'locations', x)
}

req_header <- function(req, key) {
  httr2::req_auth_bearer_token(req, key)
}

req_where <- function(req, limit, after, before) {
  httr2::req_url_query(
    req,
    'limit' = limit,
    'after' = after,
    'before' = before
  )
}

widen <- function(x) {
  x |>
    tibble::enframe() |>
    tidyr::pivot_wider() |>
    tidyr::unnest_wider(col = where(~purrr::pluck_depth(.x) < 4), simplify = TRUE, names_sep = '_') |>
    dplyr::rename_with(.fn = function(x) stringr::str_sub(x, end = -3), .cols = dplyr::ends_with('_1'))
}

widen_clan <- function(x) {
  widen(x) |>
    tidyr::unnest_longer('participants') |>
    tidyr::unnest_wider('participants', names_sep = '_') |>
    clean_names() |>
    dplyr::rename_with(.fn = function(x) paste0('clan_', x))
}

clean_names <- function(x) {
  out <-names(x) |>
    stringr::str_replace_all('\\.', '_') |>
    stringr::str_replace_all('([a-z])([A-Z])', '\\1_\\2') |>
    stringr::str_to_lower()
  stats::setNames(object = x, nm = out)
}

list_hoist <- function(l) {
  dplyr::bind_rows(lapply(l, function(x) dplyr::bind_rows(unlist(x))))
}
