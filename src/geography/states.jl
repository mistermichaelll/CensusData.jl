"""
    This module is heavily based on the `us` Python package, located here: https://github.com/unitedstates/python-us
"""

module States

export AL, AK, AZ, AR, CA, CO, CT, DE, DC, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME
export MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC
export SD, TN, TX, UT, VT, VA, WA, WV, WI, WY
export AS, GU, MP, PR, VI

@kwdef struct State
    abbr::String
    ap_abbr::String
    capital::String
    capital_tz::String
    fips::String
    is_territory::Bool
    is_obsolete::Bool
    is_contiguous::Bool
    is_continental::Bool
    name::String
    statehood_year::Int64
    time_zones::Vector{String}
    name_metaphone::String
end

function Base.show(io::IO, s::State)
    print(io, "State(\n")
    print(io, "    fips = ", s.fips, "\n")
    print(io, "    name = ", s.name, "\n")
    print(io, "    abbr = ", s.abbr, "\n")
    print(io, "    is_territory = ", s.is_territory, "\n")
    print(io, "    is_obsolete = ", s.is_obsolete, "\n")
    print(io, "    is_contiguous = ", s.is_contiguous, "\n")
    print(io, "    is_continental = ", s.is_continental, "\n")
    print(io, "    statehood_year = ", s.statehood_year, "\n")
    print(io, "    capital = ", s.capital, "\n")
    print(io, "    capital_tz = ", s.capital_tz, "\n")
    print(io, "    ap_abbr = ", s.ap_abbr, "\n")
    print(io, "    time_zones = ", s.time_zones, "\n")
    print(io, "    name_metaphone = ", s.name_metaphone, "\n")
    return print(io, ")\n")
end

AL = State(;
    fips="01",
    name="Alabama",
    abbr="AL",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1819,
    capital="Montgomery",
    capital_tz="America/Chicago",
    ap_abbr="Ala.",
    time_zones=["America/Chicago"],
    name_metaphone="ALBM",
)

AK = State(;
    fips="02",
    name="Alaska",
    abbr="AK",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=false,
    is_continental=false,
    statehood_year=1959,
    capital="Juneau",
    capital_tz="America/Anchorage",
    ap_abbr="Alaska",
    time_zones=["America/Anchorage", "America/Adak"],
    name_metaphone="ALSK",
)

AZ = State(;
    fips="04",
    name="Arizona",
    abbr="AZ",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1912,
    capital="Phoenix",
    capital_tz="America/Phoenix",
    ap_abbr="Ariz.",
    time_zones=["America/Phoenix"],
    name_metaphone="ARZN",
)

AR = State(;
    fips="05",
    name="Arkansas",
    abbr="AR",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1836,
    capital="Little Rock",
    capital_tz="America/Chicago",
    ap_abbr="Ark.",
    time_zones=["America/Chicago"],
    name_metaphone="ARKN",
)

CA = State(;
    fips="06",
    name="California",
    abbr="CA",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1850,
    capital="Sacramento",
    capital_tz="America/Los_Angeles",
    ap_abbr="Calif.",
    time_zones=["America/Los_Angeles"],
    name_metaphone="KLFR",
)

CO = State(;
    fips="08",
    name="Colorado",
    abbr="CO",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1876,
    capital="Denver",
    capital_tz="America/Denver",
    ap_abbr="Colo.",
    time_zones=["America/Denver"],
    name_metaphone="KLRT",
)

CT = State(;
    fips="09",
    name="Connecticut",
    abbr="CT",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1788,
    capital="Hartford",
    capital_tz="America/New_York",
    ap_abbr="Conn.",
    time_zones=["America/New_York"],
    name_metaphone="KNKT",
)

DE = State(;
    fips="10",
    name="Delaware",
    abbr="DE",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1787,
    capital="Dover",
    capital_tz="America/New_York",
    ap_abbr="Del.",
    time_zones=["America/New_York"],
    name_metaphone="DLWR",
)

FL = State(;
    fips="12",
    name="Florida",
    abbr="FL",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1845,
    capital="Tallahassee",
    capital_tz="America/New_York",
    ap_abbr="Fla.",
    time_zones=["America/New_York", "America/Chicago"],
    name_metaphone="FLRT",
)

GA = State(;
    fips="13",
    name="Georgia",
    abbr="GA",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1788,
    capital="Atlanta",
    capital_tz="America/New_York",
    ap_abbr="Ga.",
    time_zones=["America/New_York"],
    name_metaphone="JRJ",
)

HI = State(;
    fips="15",
    name="Hawaii",
    abbr="HI",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=false,
    is_continental=false,
    statehood_year=1959,
    capital="Honolulu",
    capital_tz="Pacific/Honolulu",
    ap_abbr="Hawaii",
    time_zones=["Pacific/Honolulu"],
    name_metaphone="HWY",
)

ID = State(;
    fips="16",
    name="Idaho",
    abbr="ID",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1890,
    capital="Boise",
    capital_tz="America/Denver",
    ap_abbr="Idaho",
    time_zones=["America/Denver", "America/Los_Angeles"],
    name_metaphone="IHT",
)

IL = State(;
    fips="17",
    name="Illinois",
    abbr="IL",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1818,
    capital="Springfield",
    capital_tz="America/Chicago",
    ap_abbr="Ill.",
    time_zones=["America/Chicago"],
    name_metaphone="ILNS",
)

IN = State(;
    fips="18",
    name="Indiana",
    abbr="IN",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1816,
    capital="Indianapolis",
    capital_tz="America/Indiana/Indianapolis",
    ap_abbr="Ind.",
    time_zones=["America/Indiana/Indianapolis", "America/Chicago"],
    name_metaphone="INTN",
)

IA = State(;
    fips="19",
    name="Iowa",
    abbr="IA",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1846,
    capital="Des Moines",
    capital_tz="America/Chicago",
    ap_abbr="Iowa",
    time_zones=["America/Chicago"],
    name_metaphone="I",
)

KS = State(;
    fips="20",
    name="Kansas",
    abbr="KS",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1861,
    capital="Topeka",
    capital_tz="America/Chicago",
    ap_abbr="Kan.",
    time_zones=["America/Chicago"],
    name_metaphone="KNS",
)

KY = State(;
    fips="21",
    name="Kentucky",
    abbr="KY",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1792,
    capital="Frankfort",
    capital_tz="America/New_York",
    ap_abbr="Ky.",
    time_zones=["America/New_York", "America/Chicago"],
    name_metaphone="KNTK",
)

LA = State(;
    fips="22",
    name="Louisiana",
    abbr="LA",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1812,
    capital="Baton Rouge",
    capital_tz="America/Chicago",
    ap_abbr="La.",
    time_zones=["America/Chicago"],
    name_metaphone="LSN",
)

ME = State(;
    fips="23",
    name="Maine",
    abbr="ME",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1820,
    capital="Augusta",
    capital_tz="America/New_York",
    ap_abbr="Maine",
    time_zones=["America/New_York"],
    name_metaphone="MN",
)

MD = State(;
    fips="24",
    name="Maryland",
    abbr="MD",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1788,
    capital="Annapolis",
    capital_tz="America/New_York",
    ap_abbr="Md.",
    time_zones=["America/New_York"],
    name_metaphone="MRLT",
)

MA = State(;
    fips="25",
    name="Massachusetts",
    abbr="MA",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1788,
    capital="Boston",
    capital_tz="America/New_York",
    ap_abbr="Mass.",
    time_zones=["America/New_York"],
    name_metaphone="MSXS",
)

MI = State(;
    fips="26",
    name="Michigan",
    abbr="MI",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1837,
    capital="Lansing",
    capital_tz="America/Detroit",
    ap_abbr="Mich.",
    time_zones=["America/Detroit", "America/Chicago"],
    name_metaphone="MXKN",
)

MN = State(;
    fips="27",
    name="Minnesota",
    abbr="MN",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1858,
    capital="Saint Paul",
    capital_tz="America/Chicago",
    ap_abbr="Minn.",
    time_zones=["America/Chicago"],
    name_metaphone="MNST",
)

MS = State(;
    fips="28",
    name="Mississippi",
    abbr="MS",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1817,
    capital="Jackson",
    capital_tz="America/Chicago",
    ap_abbr="Miss.",
    time_zones=["America/Chicago"],
    name_metaphone="MSSP",
)

MO = State(;
    fips="29",
    name="Missouri",
    abbr="MO",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1821,
    capital="Jefferson City",
    capital_tz="America/Chicago",
    ap_abbr="Mo.",
    time_zones=["America/Chicago"],
    name_metaphone="MSR",
)

MT = State(;
    fips="30",
    name="Montana",
    abbr="MT",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1889,
    capital="Helena",
    capital_tz="America/Denver",
    ap_abbr="Mont.",
    time_zones=["America/Denver"],
    name_metaphone="MNTN",
)

NE = State(;
    fips="31",
    name="Nebraska",
    abbr="NE",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1867,
    capital="Lincoln",
    capital_tz="America/Chicago",
    ap_abbr="Neb.",
    time_zones=["America/Chicago", "America/Denver"],
    name_metaphone="NBRS",
)

NV = State(;
    fips="32",
    name="Nevada",
    abbr="NV",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1864,
    capital="Carson City",
    capital_tz="America/Los_Angeles",
    ap_abbr="Nev.",
    time_zones=["America/Los_Angeles"],
    name_metaphone="NFT",
)

NH = State(;
    fips="33",
    name="New Hampshire",
    abbr="NH",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1788,
    capital="Concord",
    capital_tz="America/New_York",
    ap_abbr="N.H.",
    time_zones=["America/New_York"],
    name_metaphone="NHMP",
)

NJ = State(;
    fips="34",
    name="New Jersey",
    abbr="NJ",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1787,
    capital="Trenton",
    capital_tz="America/New_York",
    ap_abbr="N.J.",
    time_zones=["America/New_York"],
    name_metaphone="NJRS",
)

NM = State(;
    fips="35",
    name="New Mexico",
    abbr="NM",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1912,
    capital="Santa Fe",
    capital_tz="America/Denver",
    ap_abbr="N.M.",
    time_zones=["America/Denver"],
    name_metaphone="NMKS",
)

NY = State(;
    fips="36",
    name="New York",
    abbr="NY",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1788,
    capital="Albany",
    capital_tz="America/New_York",
    ap_abbr="N.Y.",
    time_zones=["America/New_York"],
    name_metaphone="NYRK",
)

NC = State(;
    fips="37",
    name="North Carolina",
    abbr="NC",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1789,
    capital="Raleigh",
    capital_tz="America/New_York",
    ap_abbr="N.C.",
    time_zones=["America/New_York"],
    name_metaphone="NRTHKRLN",
)

ND = State(;
    fips="38",
    name="North Dakota",
    abbr="ND",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1889,
    capital="Bismarck",
    capital_tz="America/Chicago",
    ap_abbr="N.D.",
    time_zones=["America/Chicago", "America/Denver"],
    name_metaphone="NRTHKT",
)

OH = State(;
    fips="39",
    name="Ohio",
    abbr="OH",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1803,
    capital="Columbus",
    capital_tz="America/New_York",
    ap_abbr="Ohio",
    time_zones=["America/New_York"],
    name_metaphone="OH",
)

OK = State(;
    fips="40",
    name="Oklahoma",
    abbr="OK",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1907,
    capital="Oklahoma City",
    capital_tz="America/Chicago",
    ap_abbr="Okla.",
    time_zones=["America/Chicago"],
    name_metaphone="OKLHM",
)

OR = State(;
    fips="41",
    name="Oregon",
    abbr="OR",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1859,
    capital="Salem",
    capital_tz="America/Los_Angeles",
    ap_abbr="Ore.",
    time_zones=["America/Los_Angeles"],
    name_metaphone="ORG",
)

PA = State(;
    fips="42",
    name="Pennsylvania",
    abbr="PA",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1787,
    capital="Harrisburg",
    capital_tz="America/New_York",
    ap_abbr="Pa.",
    time_zones=["America/New_York"],
    name_metaphone="PNNSLVN",
)

RI = State(;
    fips="44",
    name="Rhode Island",
    abbr="RI",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1790,
    capital="Providence",
    capital_tz="America/New_York",
    ap_abbr="R.I.",
    time_zones=["America/New_York"],
    name_metaphone="RDILND",
)

SC = State(;
    fips="45",
    name="South Carolina",
    abbr="SC",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1788,
    capital="Columbia",
    capital_tz="America/New_York",
    ap_abbr="S.C.",
    time_zones=["America/New_York"],
    name_metaphone="STHKRLN",
)

SD = State(;
    fips="46",
    name="South Dakota",
    abbr="SD",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1889,
    capital="Pierre",
    capital_tz="America/Chicago",
    ap_abbr="S.D.",
    time_zones=["America/Chicago", "America/Denver"],
    name_metaphone="STHKDT",
)

TN = State(;
    fips="47",
    name="Tennessee",
    abbr="TN",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1796,
    capital="Nashville",
    capital_tz="America/Chicago",
    ap_abbr="Tenn.",
    time_zones=["America/Chicago"],
    name_metaphone="TNS",
)

TX = State(;
    fips="48",
    name="Texas",
    abbr="TX",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1845,
    capital="Austin",
    capital_tz="America/Chicago",
    ap_abbr="Tex.",
    time_zones=["America/Chicago", "America/Denver"],
    name_metaphone="TXS",
)

UT = State(;
    fips="49",
    name="Utah",
    abbr="UT",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1896,
    capital="Salt Lake City",
    capital_tz="America/Denver",
    ap_abbr="Utah",
    time_zones=["America/Denver"],
    name_metaphone="UT",
)

VT = State(;
    fips="50",
    name="Vermont",
    abbr="VT",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1791,
    capital="Montpelier",
    capital_tz="America/New_York",
    ap_abbr="Vt.",
    time_zones=["America/New_York"],
    name_metaphone="VMT",
)

VA = State(;
    fips="51",
    name="Virginia",
    abbr="VA",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1788,
    capital="Richmond",
    capital_tz="America/New_York",
    ap_abbr="Va.",
    time_zones=["America/New_York"],
    name_metaphone="VRJN",
)

WA = State(;
    fips="53",
    name="Washington",
    abbr="WA",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1889,
    capital="Olympia",
    capital_tz="America/Los_Angeles",
    ap_abbr="Wash.",
    time_zones=["America/Los_Angeles"],
    name_metaphone="WSNGTN",
)

WV = State(;
    fips="54",
    name="West Virginia",
    abbr="WV",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1863,
    capital="Charleston",
    capital_tz="America/New_York",
    ap_abbr="W.Va.",
    time_zones=["America/New_York"],
    name_metaphone="WSTVRJN",
)

WI = State(;
    fips="55",
    name="Wisconsin",
    abbr="WI",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1848,
    capital="Madison",
    capital_tz="America/Chicago",
    ap_abbr="Wis.",
    time_zones=["America/Chicago"],
    name_metaphone="WSCN",
)

WY = State(;
    fips="56",
    name="Wyoming",
    abbr="WY",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1890,
    capital="Cheyenne",
    capital_tz="America/Denver",
    ap_abbr="Wyo.",
    time_zones=["America/Denver"],
    name_metaphone="WYMN",
)

DC = State(;
    fips="11",
    name="District of Columbia",
    abbr="DC",
    is_territory=false,
    is_obsolete=false,
    is_contiguous=true,
    is_continental=true,
    statehood_year=1800, # Note: DC is not a state, but it was established in 1800
    capital="Washington",
    capital_tz="America/New_York",
    ap_abbr="D.C.",
    time_zones=["America/New_York"],
    name_metaphone="DCK",
)

PR = State(;
    fips="72",
    name="Puerto Rico",
    abbr="PR",
    is_territory=true,
    is_obsolete=false,
    is_contiguous=false,
    is_continental=false,
    statehood_year=1898, # Note: PR is a territory, not a state
    capital="San Juan",
    capital_tz="America/Puerto_Rico",
    ap_abbr="P.R.",
    time_zones=["America/Puerto_Rico"],
    name_metaphone="PRK",
)

GU = State(;
    fips="66",
    name="Guam",
    abbr="GU",
    is_territory=true,
    is_obsolete=false,
    is_contiguous=false,
    is_continental=false,
    statehood_year=1898, # Note: GU is a territory, not a state
    capital="Hagatna",
    capital_tz="Pacific/Guam",
    ap_abbr="Guam",
    time_zones=["Pacific/Guam"],
    name_metaphone="GM",
)

VI = State(;
    fips="78",
    name="U.S. Virgin Islands",
    abbr="VI",
    is_territory=true,
    is_obsolete=false,
    is_contiguous=false,
    is_continental=false,
    statehood_year=1917, # Note: VI is a territory, not a state
    capital="Charlotte Amalie",
    capital_tz="America/St_Thomas",
    ap_abbr="U.S. V.I.",
    time_zones=["America/St_Thomas"],
    name_metaphone="V",
)

AS = State(;
    fips="60",
    name="American Samoa",
    abbr="AS",
    is_territory=true,
    is_obsolete=false,
    is_contiguous=false,
    is_continental=false,
    statehood_year=1900, # Note: AS is a territory, not a state
    capital="Pago Pago",
    capital_tz="Pacific/Pago_Pago",
    ap_abbr="Am. Samoa",
    time_zones=["Pacific/Pago_Pago"],
    name_metaphone="ASM",
)

MP = State(;
    fips="69",
    name="Northern Mariana Islands",
    abbr="MP",
    is_territory=true,
    is_obsolete=false,
    is_contiguous=false,
    is_continental=false,
    statehood_year=1978, # Note: MP is a territory, not a state
    capital="Saipan",
    capital_tz="Pacific/Saipan",
    ap_abbr="N.M.I.",
    time_zones=["Pacific/Saipan"],
    name_metaphone="MP",
)

TERRITORIES::Vector{State} = [AS, GU, MP, PR, VI]

STATES::Vector{State} = [
    AL,
    AK,
    AZ,
    AR,
    CA,
    CO,
    CT,
    DE,
    FL,
    GA,
    HI,
    ID,
    IL,
    IN,
    IA,
    KS,
    KY,
    LA,
    ME,
    MD,
    MA,
    MI,
    MN,
    MS,
    MO,
    MT,
    NE,
    NV,
    NH,
    NJ,
    NM,
    NY,
    NC,
    ND,
    OH,
    OK,
    OR,
    PA,
    RI,
    SC,
    SD,
    TN,
    TX,
    UT,
    VT,
    VA,
    WA,
    WV,
    WI,
    WY,
]

STATES_CONTIGUOUS::Vector{State} = [
    AL,
    AZ,
    AR,
    CA,
    CO,
    CT,
    DE,
    FL,
    GA,
    ID,
    IL,
    IN,
    IA,
    KS,
    KY,
    LA,
    ME,
    MD,
    MA,
    MI,
    MN,
    MS,
    MO,
    MT,
    NE,
    NV,
    NH,
    NJ,
    NM,
    NY,
    NC,
    ND,
    OH,
    OK,
    OR,
    PA,
    RI,
    SC,
    SD,
    TN,
    TX,
    UT,
    VT,
    VA,
    WA,
    WV,
    WI,
    WY,
]

STATES_CONTINENTAL::Vector{State} = [
    AL,
    AK,
    AZ,
    AR,
    CA,
    CO,
    CT,
    DE,
    FL,
    GA,
    ID,
    IL,
    IN,
    IA,
    KS,
    KY,
    LA,
    ME,
    MD,
    MA,
    MI,
    MN,
    MS,
    MO,
    MT,
    NE,
    NV,
    NH,
    NJ,
    NM,
    NY,
    NC,
    ND,
    OH,
    OK,
    OR,
    PA,
    RI,
    SC,
    SD,
    TN,
    TX,
    UT,
    VT,
    VA,
    WA,
    WV,
    WI,
    WY,
]

STATES_AND_TERRITORIES::Vector{State} = [STATES; TERRITORIES]

COMMONWEALTHS::Vector{State} = [KY, MA, PA, VA]
end
