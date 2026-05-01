# Get Clash Royale API key

Retrieves Clash Royale API key set by
[`cr_set_key()`](http://christophertkenny.com/royale/reference/cr_set_key.md)
if `cr_get_key()` or indicates if one is set if `cr_has_key()`.

## Usage

``` r
cr_get_key()

cr_has_key()
```

## Value

string key, invisibly otherwise logical

## Examples

``` r
cr_has_key()
#> [1] FALSE
```
