"""
    census_api_key(key, overwrite = false)

Sets the Census API Key in a user's Julia environment. Note that this does not persist through different sessions.

To persist between sessions, I recommend adding the API key to your `startup.jl` file.
"""
function census_api_key(key; overwrite = false)
    if haskey(ENV, "CENSUS_API_KEY") & overwrite == false
        @info "A CENSUS_API_KEY already exists. You can overwrite it with the argument `overwrite=true`."
    elseif haskey(ENV, "CENSUS_API_KEY") & overwrite == true
        @info "A CENSUS_API_KEY already exists but will be overwritten for this session."
        ENV["CENSUS_API_KEY"] = key
    end
end

"""
    get_census_api_key()

Check to see if a census API key is installed.
"""
function get_census_api_key(key = "")
    if !isempty(key)
        return key
    elseif !haskey(ENV, "CENSUS_API_KEY")
        @warn """
        You have not set a Census API Key.\nUsers without a key are limited to 500 queries a day and may experience performance limitations.\n
        For best results, get a Census API key at http://api.census.gov/data/key_signup.html\nand then supply the key to the `census_api_key()` function to use it throughout your CensusData.jl session.
        """
    else
        return ENV["CENSUS_API_KEY"]
    end
end
