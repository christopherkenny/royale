
<!-- README.md is generated from README.Rmd. Please edit that file -->

# royale <img src="man/figures/logo.png" align="right" height="138" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/christopherkenny/royale/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/christopherkenny/royale/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

`royale` provides an R interface to the [Clash Royale
API](https://developer.clashroyale.com/#/).

## Installation

You can install the development version of `royale` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("christopherkenny/royale")
```

## Example

Current endpoints are included for cards, rankings, tournaments,
players, and clans.

To get a player’s data, we can use:

``` r
library(royale)

cr_get_player('JYJQC88')
#> # A tibble: 1 × 42
#>   tag      name     exp_l…¹ troph…² best_…³  wins losses battl…⁴ three…⁵ chall…⁶
#>   <chr>    <chr>      <int>   <int>   <int> <int>  <int>   <int>   <int>   <int>
#> 1 #JYJQC88 christo…      50    7500    7500  6668   5052   20224    3297    2538
#> # … with 32 more variables: challenge_max_wins <int>,
#> #   tournament_cards_won <int>, tournament_battle_count <int>, role <chr>,
#> #   donations <int>, donations_received <int>, total_donations <int>,
#> #   war_day_wins <int>, clan_cards_collected <int>, clan_tag <chr>,
#> #   clan_name <chr>, clan_badge_id <int>, arena_id <int>, arena_name <chr>,
#> #   league_statistics_current_season_trophies <int>,
#> #   league_statistics_current_season_best_trophies <int>, …
```

To get a clan, we can use:

``` r
clan <- cr_get_clan('99R2PQVR')
clan
#> # A tibble: 42 × 29
#>    tag       name  type  descr…¹ badge…² clan_…³ clan_…⁴ locat…⁵ locat…⁶ locat…⁷
#>    <chr>     <chr> <chr> <chr>     <int>   <int>   <int>   <int> <chr>   <lgl>  
#>  1 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   65911    3495  5.70e7 North … FALSE  
#>  2 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   65911    3495  5.70e7 North … FALSE  
#>  3 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   65911    3495  5.70e7 North … FALSE  
#>  4 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   65911    3495  5.70e7 North … FALSE  
#>  5 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   65911    3495  5.70e7 North … FALSE  
#>  6 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   65911    3495  5.70e7 North … FALSE  
#>  7 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   65911    3495  5.70e7 North … FALSE  
#>  8 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   65911    3495  5.70e7 North … FALSE  
#>  9 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   65911    3495  5.70e7 North … FALSE  
#> 10 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   65911    3495  5.70e7 North … FALSE  
#> # … with 32 more rows, 19 more variables: required_trophies <int>,
#> #   donations_per_week <int>, clan_chest_status <chr>, clan_chest_level <int>,
#> #   clan_chest_max_level <int>, members <int>, player_tag <chr>,
#> #   player_name <chr>, player_role <chr>, player_last_seen <chr>,
#> #   player_exp_level <int>, player_trophies <int>, player_arena_id <int>,
#> #   player_arena_name <chr>, player_clan_rank <int>,
#> #   player_previous_clan_rank <int>, player_donations <int>, …
```

Clans are put into long form, so each player in a clan is an
observation:

``` r
clan |> 
  dplyr::relocate(dplyr::starts_with('player'), .before = dplyr::everything())
#> # A tibble: 42 × 29
#>    player_tag player_n…¹ playe…² playe…³ playe…⁴ playe…⁵ playe…⁶ playe…⁷ playe…⁸
#>    <chr>      <chr>      <chr>   <chr>     <int>   <int>   <int> <chr>     <int>
#>  1 #JYJQC88   christoph… coLead… 202303…      50    7500  5.40e7 Arena …       1
#>  2 #8G00QJPLV Yamech     member  202303…      50    7500  5.40e7 Arena …       2
#>  3 #PQL9VYJLV nicolai    coLead… 202303…      50    7500  5.40e7 Arena …       3
#>  4 #229GLRLG9 ⚡X.MAN⚡  coLead… 202303…      50    7268  5.40e7 Arena …       4
#>  5 #8Q9GJL28R Backpacke… elder   202303…      50    7149  5.40e7 Arena …       5
#>  6 #RJ0QVQJJL TC22       member  202303…      50    7139  5.40e7 Arena …       6
#>  7 #2GRYJ2QV  sontinice  elder   202303…      45    7065  5.40e7 Arena …       7
#>  8 #89U82VQ0R Frahba     elder   202303…      50    7023  5.40e7 Arena …       8
#>  9 #2908VQ08  Ribal      elder   202303…      50    7000  5.40e7 Arena …       9
#> 10 #8QGQP9JQG TBD        member  202303…      50    6903  5.40e7 Arena …      10
#> # … with 32 more rows, 20 more variables: player_previous_clan_rank <int>,
#> #   player_donations <int>, player_donations_received <int>,
#> #   player_clan_chest_points <int>, tag <chr>, name <chr>, type <chr>,
#> #   description <chr>, badge_id <int>, clan_score <int>,
#> #   clan_war_trophies <int>, location_id <int>, location_name <chr>,
#> #   location_is_country <lgl>, required_trophies <int>,
#> #   donations_per_week <int>, clan_chest_status <chr>, …
```

## RoyaleAPI Proxy

If you are using a RoyaleAPI proxy, this can be configured by setting
`options(royale.use_proxy = TRUE)`. This can be turned off by setting
`options(royale.use_proxy = FALSE)`. It is off by default.

## Disclaimer

**This content is not affiliated with, endorsed, sponsored, or
specifically approved by Supercell and Supercell is not responsible for
it. For more information see Supercell’s Fan Content Policy:
\<www.supercell.com/fan-content-policy\>.**
