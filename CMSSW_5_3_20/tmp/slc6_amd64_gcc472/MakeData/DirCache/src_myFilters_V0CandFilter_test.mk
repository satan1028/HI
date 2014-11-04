ALL_COMMONRULES += src_myFilters_V0CandFilter_test
src_myFilters_V0CandFilter_test_parent := myFilters/V0CandFilter
src_myFilters_V0CandFilter_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myFilters_V0CandFilter_test,src/myFilters/V0CandFilter/test,TEST))
