ALL_COMMONRULES += src_CentralityTest_CentralityAnalyzer_test
src_CentralityTest_CentralityAnalyzer_test_parent := CentralityTest/CentralityAnalyzer
src_CentralityTest_CentralityAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CentralityTest_CentralityAnalyzer_test,src/CentralityTest/CentralityAnalyzer/test,TEST))
