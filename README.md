
<!-- README.md is generated from README.Rmd. Please edit that file -->

# royale <img src="man/figures/logo.png" align="right" height="138" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/christopherkenny/royale/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/christopherkenny/royale/actions/workflows/R-CMD-check.yaml)
[![royale status
badge](https://christopherkenny.r-universe.dev/badges/royale)](https://christopherkenny.r-universe.dev/royale)
[![](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
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
#> # A tibble: 1 × 56
#>   tag      name       exp_level trophies best_trophies  wins losses battle_count
#>   <chr>    <chr>          <int>    <int>         <int> <int>  <int>        <int>
#> 1 #JYJQC88 christoph…        57     9000          9000  7669   5617        22211
#> # ℹ 48 more variables: three_crown_wins <int>, challenge_cards_won <int>,
#> #   challenge_max_wins <int>, tournament_cards_won <int>,
#> #   tournament_battle_count <int>, role <chr>, donations <int>,
#> #   donations_received <int>, total_donations <int>, war_day_wins <int>,
#> #   clan_cards_collected <int>, clan_tag <chr>, clan_name <chr>,
#> #   clan_badge_id <int>, arena_id <int>, arena_name <chr>,
#> #   league_statistics_current_season_trophies <int>, …
```

To get a clan, we can use:

``` r
clan <- cr_get_clan('99R2PQVR')
clan
#> # A tibble: 26 × 29
#>    tag       name        type  description badge_id clan_score clan_war_trophies
#>    <chr>     <chr>       <chr> <chr>          <int>      <int>             <int>
#>  1 #99R2PQVR LeGeND Dyn… open  "LeGeND Fa… 16000169      64003              2880
#>  2 #99R2PQVR LeGeND Dyn… open  "LeGeND Fa… 16000169      64003              2880
#>  3 #99R2PQVR LeGeND Dyn… open  "LeGeND Fa… 16000169      64003              2880
#>  4 #99R2PQVR LeGeND Dyn… open  "LeGeND Fa… 16000169      64003              2880
#>  5 #99R2PQVR LeGeND Dyn… open  "LeGeND Fa… 16000169      64003              2880
#>  6 #99R2PQVR LeGeND Dyn… open  "LeGeND Fa… 16000169      64003              2880
#>  7 #99R2PQVR LeGeND Dyn… open  "LeGeND Fa… 16000169      64003              2880
#>  8 #99R2PQVR LeGeND Dyn… open  "LeGeND Fa… 16000169      64003              2880
#>  9 #99R2PQVR LeGeND Dyn… open  "LeGeND Fa… 16000169      64003              2880
#> 10 #99R2PQVR LeGeND Dyn… open  "LeGeND Fa… 16000169      64003              2880
#> # ℹ 16 more rows
#> # ℹ 22 more variables: location_id <int>, location_name <chr>,
#> #   location_is_country <lgl>, required_trophies <int>,
#> #   donations_per_week <int>, clan_chest_status <chr>, clan_chest_level <int>,
#> #   clan_chest_max_level <int>, members <int>, player_tag <chr>,
#> #   player_name <chr>, player_role <chr>, player_last_seen <chr>,
#> #   player_exp_level <int>, player_trophies <int>, player_arena_id <int>, …
```

Clans are put into long form, so each player in a clan is an
observation:

``` r
clan |> 
  dplyr::relocate(dplyr::starts_with('player'), .before = dplyr::everything())
#> # A tibble: 26 × 29
#>    player_tag player_name   player_role player_last_seen     player_exp_level
#>    <chr>      <chr>         <chr>       <chr>                           <int>
#>  1 #89U82VQ0R Frahba        elder       20240101T153108.000Z               59
#>  2 #JYJQC88   christopher26 coLeader    20240101T152702.000Z               57
#>  3 #2908VQ08  Ribal         elder       20240101T120302.000Z               56
#>  4 #GUG0R829  Barlow716     coLeader    20240101T024559.000Z               58
#>  5 #8JGJGR982 Pazzo         elder       20240101T143644.000Z               56
#>  6 #2JCJ9J02  Hlavacekjr    coLeader    20240101T143600.000Z               57
#>  7 #802YJU8CU Ptlnd         elder       20240101T072616.000Z               55
#>  8 #GCP0CY80  Dragon Sound  elder       20240101T010408.000Z               56
#>  9 #2GRYJ2QV  sontinice     elder       20240101T141434.000Z               52
#> 10 #P8CRCUP0  christopher26 elder       20240101T024123.000Z               43
#> # ℹ 16 more rows
#> # ℹ 24 more variables: player_trophies <int>, player_arena_id <int>,
#> #   player_arena_name <chr>, player_clan_rank <int>,
#> #   player_previous_clan_rank <int>, player_donations <int>,
#> #   player_donations_received <int>, player_clan_chest_points <int>, tag <chr>,
#> #   name <chr>, type <chr>, description <chr>, badge_id <int>,
#> #   clan_score <int>, clan_war_trophies <int>, location_id <int>, …
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
