# Get Tournament

Get Tournament

## Usage

``` r
cr_get_tournament(tournament, key = cr_get_key())
```

## Arguments

- tournament:

  Tournament tag. Required.

- key:

  Required. API key. See
  <https://developer.clashroyale.com/#/documentation> Default:
  cr_get_key

## Value

a `tibble` with each row as a player

## Examples

``` r
if (FALSE) { # royale::cr_has_key()
tournament <- cr_get_tournament_search('a')$tag[1]
cr_get_tournament(tournament)
}
```
