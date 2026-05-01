# Get Clan Rankings for a Location

Get Clan Rankings for a Location

## Usage

``` r
cr_get_local_ranking_clans(
  location,
  limit = NULL,
  after = NULL,
  before = NULL,
  key = cr_get_key()
)
```

## Arguments

- location:

  Required. Location ID from
  [`cr_get_locations()`](http://christophertkenny.com/royale/reference/cr_get_locations.md).

- limit:

  number of items returned in the response.

- after:

  return only items that occur after this marker.

- before:

  return only items that occur before this marker.

- key:

  Required. API key. See
  <https://developer.clashroyale.com/#/documentation> Default:
  [`cr_get_key()`](http://christophertkenny.com/royale/reference/key.md)

## Value

tibble of card info

## Examples

``` r
if (FALSE) { # royale::cr_has_key()
cr_get_local_ranking_clans(57000001, limit = 10)
}
```
