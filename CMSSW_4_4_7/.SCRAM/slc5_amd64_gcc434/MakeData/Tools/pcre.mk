pcre             := pcre
ALL_TOOLS      += pcre
pcre_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/pcre/4.4-cms/include
pcre_EX_INCLUDE  := $(pcre_LOC_INCLUDE)
pcre_LOC_LIB := pcre
pcre_EX_LIB  := $(pcre_LOC_LIB)
pcre_INIT_FUNC := $$(eval $$(call ProductCommonVars,pcre,,,pcre))

