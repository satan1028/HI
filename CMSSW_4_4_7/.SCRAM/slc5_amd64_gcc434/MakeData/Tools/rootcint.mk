rootcint             := rootcint
ALL_TOOLS      += rootcint
rootcint_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc434/lcg/root/5.27.06b-cms31/cint
rootcint_EX_INCLUDE  := $(rootcint_LOC_INCLUDE)
rootcint_LOC_LIB := Core Cint
rootcint_EX_LIB  := $(rootcint_LOC_LIB)
rootcint_LOC_USE := root_interface sockets pcre zlib
rootcint_EX_USE  := $(rootcint_LOC_USE)
rootcint_INIT_FUNC := $$(eval $$(call ProductCommonVars,rootcint,,,rootcint))

