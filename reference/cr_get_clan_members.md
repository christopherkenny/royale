# Get current clan members

Get current clan members

## Usage

``` r
cr_get_clan_members(
  clan = "99R2PQVR",
  limit = NULL,
  after = NULL,
  before = NULL,
  key = cr_get_key()
)
```

## Arguments

- clan:

  Required. Clan tag. Default: 99R2PQVR

- limit:

  number of items returned in the response.

- after:

  return only items that occur after this marker.

- before:

  return only items that occur before this marker.

- key:

  Required. Clash Royale API key. See
  <https://developer.clashroyale.com/#/documentation> Default:
  cr_get_key

## Value

`tibble` with list columns for clan, clans, and history.

## Examples

``` r
if (FALSE) { # royale::cr_has_key()
cr_get_clan_members('99R2PQVR')
}
```
