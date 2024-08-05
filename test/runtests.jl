using CensusData
using DataFrames: nrow, ncol
using Test

@testset "results of get_acs_data() make sense" begin
    dc = get_acs_data(;
        year=2021,
        survey="acs5",
        vars=["B01001_001E", "B08006_001E", "B08006_014E", "B08006_017E"],
        _for="place",
        _in="state:11",
    )
    @test ncol(dc) == 7 # expect 7 columns (4 variables + the name [included by default], place, and state).
    @test nrow(dc) == 1 # there should only be one row for DC's place data.
end;

@testset "trying to get acs1 for 2020 throws an error" begin
    @test_throws "The regular 1-year ACS for 2020 was not released and is not available in CensusData.jl." get_acs_data(
        year=2020,
        survey="acs1",
        vars=["B01001_001E", "B08006_001E", "B08006_014E", "B08006_017E"],
        _for="place",
        _in="state:11",
    )
end;

# @testset "ensure columns make sense" begin
#     #TODO: need to make sure columns that are returned have a sensible type.
# end;
