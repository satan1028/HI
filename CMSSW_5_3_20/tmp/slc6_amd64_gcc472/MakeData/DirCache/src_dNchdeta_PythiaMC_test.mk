ALL_COMMONRULES += src_dNchdeta_PythiaMC_test
src_dNchdeta_PythiaMC_test_parent := dNchdeta/PythiaMC
src_dNchdeta_PythiaMC_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_dNchdeta_PythiaMC_test,src/dNchdeta/PythiaMC/test,TEST))
