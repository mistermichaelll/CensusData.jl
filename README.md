# CensusData
[![Build Status](https://github.com/mistermichaelll/CensusData.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/mistermichaelll/CensusData.jl/actions/workflows/CI.yml?query=branch%3Amain)

`CensusData.jl` is a light wrapper to the United States Census Bureau's API written in Julia.

Currently, `CensusData.jl` offers limited support for calling data from the American Community Survey API with the `get_acs_data()` function.

# Installation
Install the package from GitHub via `Pkg`.

```julia
julia> using Pkg
julia> Pkg.add("https://github.com/mistermichaelll/CensusData.jl")
```

# Usage
First, obtain a [Census API](https://api.census.gov/data/key_signup.html) Key.

You should store this key in your Julia Environment if you'd like it to persist in all sessions. You can store this in your `startup.jl` for convenience, or you can alternatively use a package like [DotEnv](https://github.com/tecosaur/DotEnv.jl) and store it in a regular `.env` file.

For single session use, you can get up going by using the `census_api_key()` function from this package, which will store your API key in the Julia environment.

```julia
using CensusData
census_api_key("your_api_key")
```

As noted above, `CensusData.jl` currently offers limited support for the American Community Survey API, which can be called using the `get_acs_data()` function.

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

The various variables can be found on the Census website.

## Geography

Note that US states and territories are available as structs named after their two-letter abbreviations. These structs contain some useful information about each state, as above when I used `$(CT.fips)` so I don't have to remember FIPS codes :)

This is based heavily on the `python-us` [package](https://github.com/unitedstates/python-us), though it lacks some of the more complicated methods for shapefiles and other information.

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

The API calls for geography can get complicated, and not all geographies are supported in all years. I plan on making this easier to deal with in the future, but for now I would refer to the Census API docs for more information.


Geographic relationship files are provided on the Census developer site as a tool to help users compare the geographies from the 1990, 2000 and 2010 Censuses. From these files, data users may determine how geographies from one Census relate to those from the prior Census.

### ACS5 Geographies
- state(fields, state_fips)
- state_county(fields, state_fips, county_fips)
- state_county_blockgroup(fields, state_fips, county_fips, blockgroup)
- state_county_subdivision(fields, state_fips, county_fips, subdiv_fips)
- state_county_tract(fields, state_fips, county_fips, tract)
- state_place(fields, state_fips, place)
- state_congressional_district(fields, state_fips, congressional_district)
- state_legislative_district_upper(fields, state_fips, legislative_district)
- state_legislative_district_lower(fields, state_fips, legislative_district)
- us(fields)
- state_zipcode(fields, state_fips, zip5)
### ACS1 Geographies
- state(fields, state_fips)
- state_congressional_district(fields, state_fips, district)
- us(fields)

# Future
I'm throwing this `v0.0.1` package out into the wild because this package was born out of working with/tinkering with this data for a [blog post of mine](https://michaelkjohnson.info/posts/2024-08-02-census-biking/), and since I didn't see any Census-related Julia packages out there I thought I'd give making my own a shot 😄 Hopefully it's helpful to someone!

If you'd like to contribute - please let me know!