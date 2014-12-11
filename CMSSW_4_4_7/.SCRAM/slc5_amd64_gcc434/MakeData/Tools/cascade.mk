cascade             := cascade
ALL_TOOLS      += cascade
cascade_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/cascade/2.2.0-cms6/include
cascade_EX_INCLUDE  := $(cascade_LOC_INCLUDE)
cascade_LOC_LIB := cascade2 bases mycern
cascade_EX_LIB  := $(cascade_LOC_LIB)
cascade_LOC_USE := f77compiler
cascade_EX_USE  := $(cascade_LOC_USE)
cascade_INIT_FUNC := $$(eval $$(call ProductCommonVars,cascade,,,cascade))

