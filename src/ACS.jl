"""
    get_acs_variable_types()

Helper function which returns an OrderedDict{Symbol, Type} containing the variables of interest and their associated type.

This function is used to ensure that DataFrame columns corresponding to Census variables have the proper type.
"""
function get_acs_variable_types(vars::Vector{String}, year, survey)
    variable_def_url = "https://api.census.gov/data/$year/acs/$survey/variables.json"

    function parse_census_types(type::String)
        if type == "int"
            Int64
        elseif type == "float"
            Float64
        else
            String
        end
    end

    r = get(variable_def_url)
    var_defs_json = read(r.body)[:variables]

    types = OrderedDict{Symbol,Type}()
    for var in vars
        try
            types[Symbol(var)] = parse_census_types(
                var_defs_json[Symbol(var)][:predicateType]
            )
        catch e
        end
    end

    return types
end

"""
    get_acs_data(; year=nothing, survey=nothing, vars=[], _for="", _in="")

Fetches data from the American Community Survey (ACS) API for a specified year, survey type, and set of variables.

# Arguments
- `year::Int`: The year of the ACS data to retrieve. Default is `nothing`. If `year` is 2020 and `survey` is "acs1", an error will be raised as the 1-year ACS for 2020 is not available.
- `survey::String`: The type of ACS survey to retrieve. This should be either "acs1" for the 1-year ACS or "acs5" for the 5-year ACS. Default is `nothing`.
- `vars::Vector{String}`: A list of variables to include in the query. The variable names should be valid ACS variable codes.
- `_for::String`: Specifies the geographic unit for which data is requested. There are a variety of valid options (see the Census API guide) such as "place", "cbg" (block group), "zcta" (zip code tabulation area), or "puma" (public use microdata area). Default is an empty string.
- `_in::String`: Specifies a geographic unit to subset the results by. Should be in the format of a geographic unit type and ID, such as a state code or county code. Default is an empty string.

# Returns
- `DataFrame`: A DataFrame containing the ACS data for the specified parameters. Column names correspond to the variables requested, and rows correspond to the data retrieved from the API.

# Errors
- Raises an error with a detailed message if `year` is 2020 and `survey` is "acs1", as the 1-year ACS for 2020 was not released.

# Examples

## Straightforward Call to Place in State, with Convenience FIPS
```julia-repl
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
    _in="state:\$(CT.fips)"
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

## 2020 1-Year ACS Throws an Error
```julia-repl
julia> get_acs_data(
    year=2020,
    survey="acs1",
    vars=[
        "B01001_001E",
        "B08006_001E",
        "B08006_014E",
        "B08006_017E"
    ],
    _for="place",
    _in="state:\$(CT.fips)"
)

ERROR: The regular 1-year ACS for 2020 was not released and is not available in CensusData.jl.

Due to low response rates, the Census Bureau instead released a set of experimental estimates for the 2020 1-year ACS.

These estimates can be downloaded at https://www.census.gov/programs-surveys/acs/data/experimental-data/1-year.html.

1-year ACS data can still be accessed for other years by supplying an appropriate year to the `year` parameter.

## 5-Year ACS by ZCTA for Washington, D.C.
```julia-repl
julia> get_acs_data(
    year=2019,
    survey="acs5",
    vars=[
        "B01001_001E",
        "B08006_001E",
        "B08006_014E",
        "B08006_017E"
    ],
    _for="zcta",
    _in="state:]\$(DC.fips)"
)

53×7 DataFrame
 Row │ NAME         B01001_001E  B08006_001E  B08006_014E  B08006_017E  state   zip code tabulation area
     │ String       Int64        Int64        Int64        Int64        String  String
─────┼───────────────────────────────────────────────────────────────────────────────────────────────────
   1 │ ZCTA5 20012        17576         9151          112          771  11      20012
   2 │ ZCTA5 20427            0            0            0            0  11      20427
   3 │ ZCTA5 20015        16202         7984          130         1070  11      20015
   4 │ ZCTA5 20045            0            0            0            0  11      20045
   5 │ ZCTA5 20052          126           25            0            3  11      20052
   6 │ ZCTA5 20053            0            0            0            0  11      20053
   7 │ ZCTA5 20057         3900         1382            0          120  11      20057
   8 │ ZCTA5 20064         2175          706           13           77  11      20064
   9 │ ZCTA5 20202            0            0            0            0  11      20202
  10 │ ZCTA5 20204            0            0            0            0  11      20204
  [...]
```

## 1 Year ACS by County, Full US
```julia-repl
julia> get_acs_data(
    year=2019,
    survey="acs5",
    vars=[
        "B01001_001E",
        "B08006_001E",
        "B08006_014E",
        "B08006_017E"
    ],
    _for="county"
)

3220×7 DataFrame
  Row │ NAME                          B01001_001E  B08006_001E  B08006_014E  B08006_017E  state   county
      │ String                        Int64        Int64        Int64        Int64        String  String
──────┼──────────────────────────────────────────────────────────────────────────────────────────────────
    1 │ Fayette County, Illinois            21565         8633            8          183  17      051
    2 │ Logan County, Illinois              29003        12211           77          599  17      107
    3 │ Saline County, Illinois             23994         9631            3          322  17      165
    4 │ Lake County, Illinois              701473       355918          603        24486  17      097
    5 │ Massac County, Illinois             14219         5602            0          178  17      127
    6 │ Cass County, Illinois               12493         5870            6          175  17      017
    7 │ Huntington County, Indiana          36359        18229           15          615  18      069
    8 │ White County, Indiana               24149        10964           23          458  18      181
    9 │ Jay County, Indiana                 20840         9400           24          490  18      075
   10 │ Shelby County, Indiana              44438        21938           39          623  18      145
```

"""
function get_acs_data(; year=nothing, survey=nothing, vars=[], _for="", _in="")
    url = join(["https://api.census.gov/data", "$year", "acs", "$survey"], "/")

    ## handle the 2020 1-Year ACS
    if year == 2020 && survey == "acs1"
        msg = [
            "The regular 1-year ACS for 2020 was not released and is not available in CensusData.jl.",
            "Due to low response rates, the Census Bureau instead released a set of experimental estimates for the 2020 1-year ACS.",
            "These estimates can be downloaded at https://www.census.gov/programs-surveys/acs/data/experimental-data/1-year.html.",
            "1-year ACS data can still be accessed for other years by supplying an appropriate year to the `year` parameter.",
        ]

        # Combine messages into a single formatted string
        msg_combined = join(msg, "\n\n")

        # Throw an error with the combined message
        error(msg_combined)
    end

    ## make the geographies easier
    if _for == "cbg"
        _for = "block group"
    elseif _for == "zcta"
        _for = "zip code tabulation area"
    elseif _for == "puma"
        _for = "public use microdata area"
    end

    census_query = Dict("get" => join(pushfirst!(vars, "NAME"), ","))

    if !isempty(_for)
        census_query["for"] = _for * ":*"
    end

    if !isempty(_in)
        census_query["in"] = _in
    end

    census_query["key"] = get_census_api_key()

    r = get(url; query=census_query)

    body = read(r.body)
    header, data = body[1], body[2:end]

    df = OrderedDict{Symbol,Vector}()
    for (i, col_name) in enumerate(header)
        df[Symbol(col_name)] = [
            if isnothing(row[i])
                missing
            else
                row[i]
            end for row in data
        ]
    end

    # set the correct column types for Census variables
    types = get_acs_variable_types(vars, year, survey)

    for col_name in collect(keys(types))
        df[col_name] = passmissing(parse).(types[col_name], df[col_name])
    end

    return DataFrame(df)
end
