# Get a clan

Gets full clan details

## Usage

``` r
cr_get_clan(clan = "99R2PQVR", key = cr_get_key())
```

## Arguments

- clan:

  Required. Clan tag. Default: 99R2PQVR

- key:

  Required. API key. See
  <https://developer.clashroyale.com/#/documentation> Default:
  cr_get_key

## Value

a `tibble` with each row as a player

## Examples

``` r
if (FALSE) { # royale::cr_has_key()
cr_get_clan('99R2PQVR')
}
```
