# Get Battle Log

Get Battle Log

## Usage

``` r
cr_get_battle_log(tag = "JYJQC88", key = cr_get_key())
```

## Arguments

- tag:

  Required. The player to return. Default: JYJQC88

- key:

  Required. API key. See
  <https://developer.clashroyale.com/#/documentation> Default:
  [`cr_get_key()`](http://christophertkenny.com/royale/reference/key.md)

## Value

tibble of player info

## Examples

``` r
if (FALSE) { # royale::cr_has_key()
cr_get_battle_log('JYJQC88')
}
```
