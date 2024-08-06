module CensusData
using HTTP: get
using JSON3: read
using DataFrames: DataFrame, passmissing
using DataStructures: OrderedDict

include("helpers.jl")
include("acs.jl")

export census_api_key
export get_acs_data

end
