module CensusData

using HTTP: get
using JSON3: read
using DataFrames: DataFrame, passmissing
using DataStructures: OrderedDict

# geography helpers
include("geography/states.jl")
using .States

# main package
include("helpers.jl")
include("ACS.jl")

export census_api_key
export get_acs_data

# export states
export AL, AK, AZ, AR, CA, CO, CT, DE, DC, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME
export MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC
export SD, TN, TX, UT, VT, VA, WA, WV, WI, WY
export AS, GU, MP, PR, VI

end
