sqlite             := sqlite
ALL_TOOLS      += sqlite
sqlite_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/sqlite/3.6.10-cms2/include
sqlite_EX_INCLUDE  := $(sqlite_LOC_INCLUDE)
sqlite_LOC_LIB := sqlite3
sqlite_EX_LIB  := $(sqlite_LOC_LIB)
sqlite_INIT_FUNC := $$(eval $$(call ProductCommonVars,sqlite,,,sqlite))

