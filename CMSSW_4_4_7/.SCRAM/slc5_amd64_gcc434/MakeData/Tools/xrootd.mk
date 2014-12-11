xrootd             := xrootd
ALL_TOOLS      += xrootd
xrootd_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/xrootd/5.28.00d/src
xrootd_EX_INCLUDE  := $(xrootd_LOC_INCLUDE)
xrootd_LOC_LIB := XrdClient XrdOuc XrdNet XrdSys
xrootd_EX_LIB  := $(xrootd_LOC_LIB)
xrootd_INIT_FUNC := $$(eval $$(call ProductCommonVars,xrootd,,,xrootd))

