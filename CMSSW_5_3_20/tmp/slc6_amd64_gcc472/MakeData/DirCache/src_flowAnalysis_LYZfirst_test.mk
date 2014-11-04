ALL_COMMONRULES += src_flowAnalysis_LYZfirst_test
src_flowAnalysis_LYZfirst_test_parent := flowAnalysis/LYZfirst
src_flowAnalysis_LYZfirst_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_LYZfirst_test,src/flowAnalysis/LYZfirst/test,TEST))
