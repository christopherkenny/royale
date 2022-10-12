
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
#> # A tibble: 1 × 41
#>   tag      name     exp_l…¹ troph…² best_…³  wins losses battl…⁴ three…⁵ chall…⁶
#>   <chr>    <chr>      <int>   <int>   <int> <int>  <int>   <int>   <int>   <int>
#> 1 #JYJQC88 christo…      14    6012    6636  5638   4375   18224    2964    2538
#> # … with 31 more variables: challenge_max_wins <int>,
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
#> # A tibble: 50 × 28
#>    tag       name  type  descr…¹ badge…² clan_…³ clan_…⁴ locat…⁵ locat…⁶ locat…⁷
#>    <chr>     <chr> <chr> <chr>     <int>   <int>   <int>   <int> <chr>   <lgl>  
#>  1 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   57650    3550  5.70e7 Intern… FALSE  
#>  2 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   57650    3550  5.70e7 Intern… FALSE  
#>  3 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   57650    3550  5.70e7 Intern… FALSE  
#>  4 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   57650    3550  5.70e7 Intern… FALSE  
#>  5 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   57650    3550  5.70e7 Intern… FALSE  
#>  6 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   57650    3550  5.70e7 Intern… FALSE  
#>  7 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   57650    3550  5.70e7 Intern… FALSE  
#>  8 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   57650    3550  5.70e7 Intern… FALSE  
#>  9 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   57650    3550  5.70e7 Intern… FALSE  
#> 10 #99R2PQVR LeGe… invi… "LeGeN…  1.60e7   57650    3550  5.70e7 Intern… FALSE  
#> # … with 40 more rows, 18 more variables: required_trophies <int>,
#> #   donations_per_week <int>, clan_chest_status <chr>, clan_chest_level <int>,
#> #   clan_chest_max_level <int>, members <int>, player_tag <chr>,
#> #   player_name <chr>, player_role <chr>, player_last_seen <chr>,
#> #   player_exp_level <int>, player_trophies <int>, player_arena <list>,
#> #   player_clan_rank <int>, player_previous_clan_rank <int>,
#> #   player_donations <int>, player_donations_received <int>, …
```

Clans are put into long form, so each player in a clan is an
observation:

``` r
clan |> 
  dplyr::relocate(dplyr::starts_with('player'), .before = dplyr::everything())
#> # A tibble: 50 × 28
#>    player…¹ playe…² playe…³ playe…⁴ playe…⁵ playe…⁶ player_arena playe…⁷ playe…⁸
#>    <chr>    <chr>   <chr>   <chr>     <int>   <int> <list>         <int>   <int>
#>  1 #LRLVUJ… <c4> W… coLead… 202210…      14    6337 <named list>       1       1
#>  2 #2R2QPG… NotOzil member  202210…      14    6125 <named list>       2       2
#>  3 #CC2YJP… Cycles  member  202210…      14    6031 <named list>       3       4
#>  4 #229GLR… ⚡X.MA… coLead… 202210…      14    6018 <named list>       4       5
#>  5 #JYJQC88 christ… coLead… 202210…      14    6012 <named list>       5       3
#>  6 #80J022… ELECTR… member  202210…      14    5982 <named list>       6       6
#>  7 #2J0Q8R… MOHAMM… elder   202210…      14    5933 <named list>       7       9
#>  8 #20CG9P… KARIM   member  202210…      14    5923 <named list>       8       7
#>  9 #9RJ0YV… DiaMoN… coLead… 202210…      14    5921 <named list>       9       8
#> 10 #29R8RL… monsoon member  202210…      14    5891 <named list>      10      14
#> # … with 40 more rows, 19 more variables: player_donations <int>,
#> #   player_donations_received <int>, player_clan_chest_points <int>, tag <chr>,
#> #   name <chr>, type <chr>, description <chr>, badge_id <int>,
#> #   clan_score <int>, clan_war_trophies <int>, location_id <int>,
#> #   location_name <chr>, location_is_country <lgl>, required_trophies <int>,
#> #   donations_per_week <int>, clan_chest_status <chr>, clan_chest_level <int>,
#> #   clan_chest_max_level <int>, members <int>, and abbreviated variable names …
```

## RoyaleAPI Proxy

If you are using a RoyaleAPI proxy, this can be configured by setting
`options(royale.use_proxy = TRUE)`. This can be turned off by setting
\``options(royale.use_proxy = FALSE)`. It is off by default.

## Disclaimer

**This content is not affiliated with, endorsed, sponsored, or
specifically approved by Supercell and Supercell is not responsible for
it. For more information see Supercell’s Fan Content Policy:
\<www.supercell.com/fan-content-policy\>.**
