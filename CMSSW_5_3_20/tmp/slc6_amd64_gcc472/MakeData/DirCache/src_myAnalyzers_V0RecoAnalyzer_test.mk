ALL_COMMONRULES += src_myAnalyzers_V0RecoAnalyzer_test
src_myAnalyzers_V0RecoAnalyzer_test_parent := myAnalyzers/V0RecoAnalyzer
src_myAnalyzers_V0RecoAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myAnalyzers_V0RecoAnalyzer_test,src/myAnalyzers/V0RecoAnalyzer/test,TEST))
