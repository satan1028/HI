boost_header             := boost_header
ALL_TOOLS      += boost_header
boost_header_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/boost/1.44.0-cms3/include
boost_header_EX_INCLUDE  := $(boost_header_LOC_INCLUDE)
boost_header_INIT_FUNC := $$(eval $$(call ProductCommonVars,boost_header,,,boost_header))

