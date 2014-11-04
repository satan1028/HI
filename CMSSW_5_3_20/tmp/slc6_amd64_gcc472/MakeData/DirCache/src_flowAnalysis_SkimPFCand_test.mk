ALL_COMMONRULES += src_flowAnalysis_SkimPFCand_test
src_flowAnalysis_SkimPFCand_test_parent := flowAnalysis/SkimPFCand
src_flowAnalysis_SkimPFCand_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_SkimPFCand_test,src/flowAnalysis/SkimPFCand/test,TEST))
