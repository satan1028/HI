ALL_COMMONRULES += src_EffAna_ESAnaEff_test
src_EffAna_ESAnaEff_test_parent := EffAna/ESAnaEff
src_EffAna_ESAnaEff_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_EffAna_ESAnaEff_test,src/EffAna/ESAnaEff/test,TEST))
