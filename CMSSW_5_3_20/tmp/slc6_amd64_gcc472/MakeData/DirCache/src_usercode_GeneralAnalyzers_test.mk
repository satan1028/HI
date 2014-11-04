ALL_COMMONRULES += src_usercode_GeneralAnalyzers_test
src_usercode_GeneralAnalyzers_test_parent := usercode/GeneralAnalyzers
src_usercode_GeneralAnalyzers_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_GeneralAnalyzers_test,src/usercode/GeneralAnalyzers/test,TEST))
