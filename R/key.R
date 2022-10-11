#' Set Clash Royale API key
#'
#' Sets your Clash Royale API key for default use.
#'
#' @param key Required. Your Clash Royale API key. See <https://developer.clashroyale.com/#/getting-started>.
#' @param overwrite Defaults to FALSE. Boolean. Should existing `CR_API_KEY` in Renviron be overwritten?
#' @param install Defaults to FALSE. Boolean. Should this be added '~/.Renviron' file?
#'
#' @return None
#'
#' @export
#'
#' @examples
#' \dontrun{
#' cr_set_key('1234')
#' }
#'
cr_set_key <- function(key, overwrite = FALSE, install = FALSE) {
  if (missing(key)) {
    cli::cli_abort('Input {.arg key} cannot be missing.')
  }
  name <- 'CR_API_KEY'

  key <- list(key)
  names(key) <- name

  if (install) {
    r_env <- file.path(Sys.getenv('HOME'), '.Renviron')

    if (!file.exists(r_env)) {
      file.create(r_env)
    }

    lines <- readLines(r_env)
    newline <- paste0(name, "='", key, "'")

    exists <- stringr::str_detect(lines, paste0(name, '='))

    if (any(exists)) {
      if (sum(exists) > 1) {
        cli::cli_abort('Multiple entries in .Renviron found.\nEdit manually with {.fn usethis::edit_r_environ}.')
      }

      if (overwrite) {
        lines[exists] <- newline
        writeLines(lines, r_env)
        do.call(Sys.setenv, key)
      } else {
        cli::cli_inform(c('{.val CR_API_KEY} already exists in .Renviron.',
                        i = 'Edit manually with {.fn usethis::edit_r_environ} or set {.code overwrite = TRUE}.'))
      }
    } else {
      lines[length(lines) + 1] <- newline
      writeLines(lines, r_env)
      do.call(Sys.setenv, key)
    }
  } else {
    do.call(Sys.setenv, key)
  }

  invisible(key)
}

#' Get RoyaleAPI key
#'
#' Retrieves RoyaleAPI key set by `cr_set_key()` if `cr_get_key()` or indicates if
#' one is set if `cr_has_key()`.
#'
#' @return string key
#'
#' @name key
#'
#' @export
#'
#' @examples
#' cr_has_key()
cr_get_key <- function() {

  # Add to environment ---------------------------------------------------------
  out <- Sys.getenv('CR_API_KEY')

  # Check for set key ----------------------------------------------------------
  # if (out == '') {
  #   cli::cli_abort('No key found. Set key with {.fn cr_set_key} or specify key.')
  # }

  # Return key -----------------------------------------------------------------
  out
}

#' @rdname key
#' @export
cr_has_key <- function() {
  Sys.getenv('CR_API_KEY') != ''
}
