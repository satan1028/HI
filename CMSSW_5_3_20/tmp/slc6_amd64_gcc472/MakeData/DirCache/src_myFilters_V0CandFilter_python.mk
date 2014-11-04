ifeq ($(strip $(PymyFiltersV0CandFilter)),)
PymyFiltersV0CandFilter := self/src/myFilters/V0CandFilter/python
src_myFilters_V0CandFilter_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/myFilters/V0CandFilter/python)
PymyFiltersV0CandFilter_files := $(patsubst src/myFilters/V0CandFilter/python/%,%,$(wildcard $(foreach dir,src/myFilters/V0CandFilter/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PymyFiltersV0CandFilter_LOC_USE := self  
PymyFiltersV0CandFilter_PACKAGE := self/src/myFilters/V0CandFilter/python
ALL_PRODS += PymyFiltersV0CandFilter
PymyFiltersV0CandFilter_INIT_FUNC        += $$(eval $$(call PythonProduct,PymyFiltersV0CandFilter,src/myFilters/V0CandFilter/python,src_myFilters_V0CandFilter_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PymyFiltersV0CandFilter,src/myFilters/V0CandFilter/python))
endif
ALL_COMMONRULES += src_myFilters_V0CandFilter_python
src_myFilters_V0CandFilter_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myFilters_V0CandFilter_python,src/myFilters/V0CandFilter/python,PYTHON))
