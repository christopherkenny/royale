# Get Global Player Path of Legend Rankings

Get Global Player Path of Legend Rankings

## Usage

``` r
cr_get_global_path_of_legend_players(
  season,
  limit = NULL,
  after = NULL,
  before = NULL,
  key = cr_get_key()
)
```

## Arguments

- season:

  Required. Season ID, such as '2022-09'

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
cr_get_global_path_of_legend_players('2023-02', limit = 10)
}
```
