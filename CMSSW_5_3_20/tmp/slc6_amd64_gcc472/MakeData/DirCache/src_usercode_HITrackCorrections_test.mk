ALL_COMMONRULES += src_usercode_HITrackCorrections_test
src_usercode_HITrackCorrections_test_parent := usercode/HITrackCorrections
src_usercode_HITrackCorrections_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_HITrackCorrections_test,src/usercode/HITrackCorrections/test,TEST))
