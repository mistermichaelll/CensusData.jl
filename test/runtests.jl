using CensusData
using DataFrames: nrow, ncol
using Test

@testset "results of get_acs_data() make sense for DC" begin
        dc = get_acs_data(
            year = 2021,
            survey = "acs5",
            vars = [
                "B01001_001E", # total population
                "B08006_001E", # total commuters
                "B08006_014E", # bike commuters
                "B08006_017E", # worked from home
            ],
            _for = "place",
            _in = "state:11"
        )
        @test ncol(a) == 7 # expect 7 columns (4 variables + the name [included by default], place, and state).
        @test nrow(a) == 1 # there should only be one row for DC's place data.
end;
