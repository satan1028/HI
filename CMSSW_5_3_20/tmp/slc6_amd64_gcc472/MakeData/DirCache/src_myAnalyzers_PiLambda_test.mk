ALL_COMMONRULES += src_myAnalyzers_PiLambda_test
src_myAnalyzers_PiLambda_test_parent := myAnalyzers/PiLambda
src_myAnalyzers_PiLambda_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myAnalyzers_PiLambda_test,src/myAnalyzers/PiLambda/test,TEST))
