castor_header             := castor_header
ALL_TOOLS      += castor_header
castor_header_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/castor/2.1.9.8-cms2/include /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/castor/2.1.9.8-cms2/include/shift
castor_header_EX_INCLUDE  := $(castor_header_LOC_INCLUDE)
castor_header_INIT_FUNC := $$(eval $$(call ProductCommonVars,castor_header,,,castor_header))

