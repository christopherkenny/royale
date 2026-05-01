# Get Global Tournament Rankings

Get Global Tournament Rankings

## Usage

``` r
cr_get_global_ranking_tournament(
  tournament,
  limit = NULL,
  after = NULL,
  before = NULL,
  key = cr_get_key()
)
```

## Arguments

- tournament:

  Tournament tag. Required.

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
# needs an ongoing tournament at time of request
try({cr_get_global_ranking_tournament('URP8YYUU0')})
}
```
