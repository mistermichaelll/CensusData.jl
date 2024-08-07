# CensusData

[![Build Status](https://github.com/mistermichaelll/CensusData.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/mistermichaelll/CensusData.jl/actions/workflows/CI.yml?query=branch%3Amain)

# Usage
First step, obtain a [Census API](https://api.census.gov/data/key_signup.html) Key.

You should store this key in your Julia Environment if you'd like it to persist in all sessions.

For single session use, you can get up going by using the `census_api_key()` function:

```julia
using CensusData
census_api_key("your_api_key")
```

Currently, `CensusData.jl` offers limited support for calling data from the American Community Survey API with the `get_acs_data` function. 

As an example, this code will return a DataFrame for the 2019, ACS 1-Year Survey containing the total population, the total number of workers, bike commuters, and workers that work from home for places in Connecticut.

```julia
julia> get_acs_data(
    year=2019,
    survey="acs1",
    vars=[
        "B01001_001E",
        "B08006_001E", 
        "B08006_014E", 
        "B08006_017E"
    ],
    _for="place",
    _in="state:$(CT.fips)"
)

julia> 8×7 DataFrame
 Row │ NAME                           B01001_001E  B08006_001E  B08006_014E  B08006_017E  state   place  
     │ String                         Int64        Int64?       Int64?       Int64?       String  String 
─────┼───────────────────────────────────────────────────────────────────────────────────────────────────
   1 │ Bridgeport city, Connecticut        144365        63927            0         1260  09      08000
   2 │ Waterbury city, Connecticut         107577      missing      missing      missing  09      80000
   3 │ Danbury city, Connecticut            84692      missing      missing      missing  09      18430
   4 │ New Haven city, Connecticut         130257        62650         2066         2221  09      52000
   5 │ Stamford city, Connecticut          129636      missing      missing      missing  09      73000
   6 │ New Britain city, Connecticut        72491      missing      missing      missing  09      50370
   7 │ Hartford city, Connecticut          122107      missing      missing      missing  09      37000
   8 │ Norwalk city, Connecticut            88826        46606           40         1394  09      55990
```

Note that there are a variety of helper methods available for each state, which can be accessed and provided via the API by their two letter state abbreviation. For example:

```julia
julia> VA

State(
    fips = 51
    name = Virginia
    abbr = VA
    is_territory = false
    is_obsolete = false
    is_contiguous = true
    is_continental = true
    statehood_year = 1788
    capital = Richmond
    capital_tz = America/New_York
    ap_abbr = Va.
    time_zones = ["America/New_York"]
    name_metaphone = VRJN
)

julia> VA.fips
"51"

julia> VA.abbr
"VA"
```
