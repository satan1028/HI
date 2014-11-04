ALL_COMMONRULES += src_Tutorial_ExampleGenAnalyzer_test
src_Tutorial_ExampleGenAnalyzer_test_parent := Tutorial/ExampleGenAnalyzer
src_Tutorial_ExampleGenAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Tutorial_ExampleGenAnalyzer_test,src/Tutorial/ExampleGenAnalyzer/test,TEST))
