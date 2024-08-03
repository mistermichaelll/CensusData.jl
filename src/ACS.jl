using HTTP
using JSON3
using DataFrames
using DataStructures
using .Helpers

"""
    get_acs_data()
"""
function get_acs_data(; year = nothing, survey = nothing, vars = [], _for = "", _in = "")
    url = join(
        [
            "https://api.census.gov/data",
            "$year",
            "acs",
            "$survey"
        ],
        "/"
    )

    ## handle the 2020 1-Year ACS
    if year == 2020 && survey == "acs1"
        msg = [
            "The regular 1-year ACS for 2020 was not released and is not available in CensusData.jl.",
            "Due to low response rates, the Census Bureau instead released a set of experimental estimates for the 2020 1-year ACS.",
            "These estimates can be downloaded at https://www.census.gov/programs-surveys/acs/data/experimental-data/1-year.html.",
            "1-year ACS data can still be accessed for other years by supplying an appropriate year to the `year` parameter."
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

    census_query = Dict("get" => join(push!(vars, "NAME"), ","))

    if !isempty(_for)
        census_query["for"] = _for * ":*"
    end

    if !isempty(_in)
        census_query["in"] = _in
    end

    census_query["key"] = get_census_api_key()

    r = HTTP.get(
        url,
        query = census_query
    )

    body = JSON3.read(r.body)
    header, data = body[1], body[2:end]

    df = OrderedDict{Symbol, Vector}()
    for (i, col_name) in enumerate(header)
        df[Symbol(col_name)] = [row[i] for row in data]
    end

    return DataFrame(df)
end