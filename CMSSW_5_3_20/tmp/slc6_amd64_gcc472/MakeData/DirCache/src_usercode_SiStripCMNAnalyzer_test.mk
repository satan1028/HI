ALL_COMMONRULES += src_usercode_SiStripCMNAnalyzer_test
src_usercode_SiStripCMNAnalyzer_test_parent := usercode/SiStripCMNAnalyzer
src_usercode_SiStripCMNAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_SiStripCMNAnalyzer_test,src/usercode/SiStripCMNAnalyzer/test,TEST))
