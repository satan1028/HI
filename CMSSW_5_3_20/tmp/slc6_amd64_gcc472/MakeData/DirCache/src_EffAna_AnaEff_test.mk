ALL_COMMONRULES += src_EffAna_AnaEff_test
src_EffAna_AnaEff_test_parent := EffAna/AnaEff
src_EffAna_AnaEff_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_EffAna_AnaEff_test,src/EffAna/AnaEff/test,TEST))
