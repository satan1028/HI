ALL_COMMONRULES += src_usercode_JEX_test
src_usercode_JEX_test_parent := usercode/JEX
src_usercode_JEX_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_JEX_test,src/usercode/JEX/test,TEST))
