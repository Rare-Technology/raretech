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
> hhs <- getData("hhs")
Rows: 32676 Columns: 400                                                                      
 0s── Column specification ────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (268): submissionid, iso3, subnational, local, lat, lon, maa, ma_area, ma_status, 1_int...
dbl  (121): 14a_months_farming, 14a_income_farming, 14b_months_harvesting, 14b_income_harves...
lgl   (10): 13o_no_strategy, 31l_emergency_ngo_group_specify, 31m_emergency_insurance_specif...
dttm   (1): updatedat

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

Use `?getData` for a list of valid inputs and more info.
