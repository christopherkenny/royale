# Search Tournaments

Search Tournaments

## Usage

``` r
cr_get_tournament_search(
  name = NULL,
  limit = NULL,
  after = NULL,
  before = NULL,
  key = cr_get_key()
)
```

## Arguments

- name:

  Search clans by name

- limit:

  number of items returned in the response.

- after:

  return only items that occur after this marker.

- before:

  return only items that occur before this marker.

- key:

  Required. API key. See
  <https://developer.clashroyale.com/#/documentation> Default:
  cr_get_key

## Value

a `tibble` with each row as a player

## Examples

``` r
if (FALSE) { # royale::cr_has_key()
cr_get_tournament_search('clash')
}
```
