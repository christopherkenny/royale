# Set Clash Royale API key

Sets your Clash Royale API key for default use.

## Usage

``` r
cr_set_key(key, overwrite = FALSE, install = FALSE)
```

## Arguments

- key:

  Required. Your Clash Royale API key. See
  <https://developer.clashroyale.com/#/getting-started>.

- overwrite:

  Defaults to FALSE. Boolean. Should existing `CR_API_KEY` in Renviron
  be overwritten?

- install:

  Defaults to FALSE. Boolean. Should this be added '~/.Renviron' file?

## Value

key, invisibly

## Examples

``` r
if (FALSE) { # \dontrun{
cr_set_key('1234')
} # }
```
