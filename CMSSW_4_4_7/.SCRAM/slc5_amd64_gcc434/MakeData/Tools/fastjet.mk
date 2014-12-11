fastjet             := fastjet
ALL_TOOLS      += fastjet
fastjet_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/fastjet/2.4.4-cms/include
fastjet_EX_INCLUDE  := $(fastjet_LOC_INCLUDE)
fastjet_LOC_LIB := CMSIterativeConePlugin SISConePlugin CDFConesPlugin ATLASConePlugin siscone siscone_spherical fastjet
fastjet_EX_LIB  := $(fastjet_LOC_LIB)
fastjet_INIT_FUNC := $$(eval $$(call ProductCommonVars,fastjet,,,fastjet))

