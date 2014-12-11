castor             := castor
ALL_TOOLS      += castor
castor_LOC_LIB := shift castorrfio castorclient castorcommon
castor_EX_LIB  := $(castor_LOC_LIB)
castor_LOC_USE := castor_header
castor_EX_USE  := $(castor_LOC_USE)
castor_INIT_FUNC := $$(eval $$(call ProductCommonVars,castor,,,castor))

