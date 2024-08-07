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
