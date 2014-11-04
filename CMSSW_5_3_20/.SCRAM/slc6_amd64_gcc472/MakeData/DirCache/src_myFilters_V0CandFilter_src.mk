ifeq ($(strip $(myFilters/V0CandFilter)),)
ALL_COMMONRULES += src_myFilters_V0CandFilter_src
src_myFilters_V0CandFilter_src_parent := myFilters/V0CandFilter
src_myFilters_V0CandFilter_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_myFilters_V0CandFilter_src,src/myFilters/V0CandFilter/src,LIBRARY))
myFiltersV0CandFilter := self/myFilters/V0CandFilter
myFilters/V0CandFilter := myFiltersV0CandFilter
myFiltersV0CandFilter_files := $(patsubst src/myFilters/V0CandFilter/src/%,%,$(wildcard $(foreach dir,src/myFilters/V0CandFilter/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
myFiltersV0CandFilter_LOC_USE :=  
myFiltersV0CandFilter_PACKAGE := self/src/myFilters/V0CandFilter/src
ALL_PRODS += myFiltersV0CandFilter
myFiltersV0CandFilter_INIT_FUNC        += $$(eval $$(call Library,myFiltersV0CandFilter,src/myFilters/V0CandFilter/src,src_myFilters_V0CandFilter_src,$(),,$(),$()))
endif
