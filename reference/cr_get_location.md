# Get One Location

Get One Location

## Usage

``` r
cr_get_location(location, key = cr_get_key())
```

## Arguments

- location:

  Required. Location ID from
  [`cr_get_locations()`](http://christophertkenny.com/royale/reference/cr_get_locations.md).

- key:

  Required. API key. See
  <https://developer.clashroyale.com/#/documentation> Default:
  [`cr_get_key()`](http://christophertkenny.com/royale/reference/key.md)

## Value

tibble of card info

## Examples

``` r
if (FALSE) { # royale::cr_has_key()
cr_get_location(57000001)
}
```
