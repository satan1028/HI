ALL_COMMONRULES += src_usercode_Phase1HITracking_test
src_usercode_Phase1HITracking_test_parent := usercode/Phase1HITracking
src_usercode_Phase1HITracking_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_Phase1HITracking_test,src/usercode/Phase1HITracking/test,TEST))
