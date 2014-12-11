expat             := expat
ALL_TOOLS      += expat
expat_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/expat/2.0.0-cms3/include
expat_EX_INCLUDE  := $(expat_LOC_INCLUDE)
expat_LOC_LIB := expat
expat_EX_LIB  := $(expat_LOC_LIB)
expat_INIT_FUNC := $$(eval $$(call ProductCommonVars,expat,,,expat))

