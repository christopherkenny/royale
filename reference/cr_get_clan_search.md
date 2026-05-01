# Search Clans

Search Clans

## Usage

``` r
cr_get_clan_search(
  name = NULL,
  location_id = NULL,
  min_members = NULL,
  max_members = NULL,
  min_score = NULL,
  limit = NULL,
  after = NULL,
  before = NULL,
  key = cr_get_key()
)
```

## Arguments

- name:

  Search clans by name

- location_id:

  Filter by clan location identifier

- min_members:

  Filter by minimum number of clan members

- max_members:

  Filter by maximum number of clan members

- min_score:

  Filter by minimum amount of clan score

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
cr_get_clan_search('Legend Dynasty!')
}
```
