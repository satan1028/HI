ALL_COMMONRULES += src_usercode_PixelTrackAnalysis_test
src_usercode_PixelTrackAnalysis_test_parent := usercode/PixelTrackAnalysis
src_usercode_PixelTrackAnalysis_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_PixelTrackAnalysis_test,src/usercode/PixelTrackAnalysis/test,TEST))
