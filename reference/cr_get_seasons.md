# Get Global Seasons

This returns the current season if it's a valid season.

## Usage

``` r
cr_get_seasons(key = cr_get_key())
```

## Arguments

- key:

  Required. API key. See
  <https://developer.clashroyale.com/#/documentation> Default:
  [`cr_get_key()`](http://christophertkenny.com/royale/reference/key.md)

## Value

a `tibble` of season info

## Examples

``` r
if (FALSE) { # royale::cr_has_key()
cr_get_seasons()
}
```
