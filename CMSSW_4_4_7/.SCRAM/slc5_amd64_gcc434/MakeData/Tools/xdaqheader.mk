xdaqheader             := xdaqheader
ALL_TOOLS      += xdaqheader
xdaqheader_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/xdaq/VR17173-cms/include
xdaqheader_EX_INCLUDE  := $(xdaqheader_LOC_INCLUDE)
xdaqheader_INIT_FUNC := $$(eval $$(call ProductCommonVars,xdaqheader,,,xdaqheader))

