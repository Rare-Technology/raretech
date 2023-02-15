# raretech
R package containing utility functions and datasets for Rare Science &amp; Tech data analysis workflows

## Installation

You can install from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("Rare-Technology/raretech")
```

## Usage

Rather than keeping track of url's to import Fish Forever data, use `getData` to download whatever you need:

``` r
> library(raretech)
> fish <- getData("fish")
Rows: 196925 Columns: 22                                         
── Column specification ───────────────────────────────────────────
Delimiter: ","
chr  (12): country, ma_name, location_name, location_status, tr...
dbl   (9): year, lat, lon, count, density_ind_ha, biomass_kg_ha...
date  (1): survey_date

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
Rows: 22 Columns: 2                                              
── Column specification ───────────────────────────────────────────
Delimiter: ","
chr (2): columnname, description

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

As you can see, there were two tables loaded. One is the actual fish survey data, `fish$data`, and the other is column metadata:
```r
> head(fish$metadata)
# A tibble: 6 x 2
  columnname    description                                        
  <chr>         <chr>                                              
1 country       Full country name. A country contains SNU's.       
2 year          survey year. Does not necessarily correspond to th…
3 lat           Latitude of survey site                            
4 lon           Longitude of survey site                           
5 ma_name       Managed access area. A managed access area contain…
6 location_name Survey site. A survey site contains transects.
```

Additionally, you can see the data.world source url for the data:
```r
> fish$source
[1] "https://data.world/rare/fish-surveys"
```

Use `?getData` for a list of valid inputs and more info.
