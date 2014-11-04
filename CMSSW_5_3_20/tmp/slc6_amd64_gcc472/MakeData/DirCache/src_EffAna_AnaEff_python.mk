ifeq ($(strip $(PyEffAnaAnaEff)),)
PyEffAnaAnaEff := self/src/EffAna/AnaEff/python
src_EffAna_AnaEff_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/EffAna/AnaEff/python)
PyEffAnaAnaEff_files := $(patsubst src/EffAna/AnaEff/python/%,%,$(wildcard $(foreach dir,src/EffAna/AnaEff/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyEffAnaAnaEff_LOC_USE := self  
PyEffAnaAnaEff_PACKAGE := self/src/EffAna/AnaEff/python
ALL_PRODS += PyEffAnaAnaEff
PyEffAnaAnaEff_INIT_FUNC        += $$(eval $$(call PythonProduct,PyEffAnaAnaEff,src/EffAna/AnaEff/python,src_EffAna_AnaEff_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyEffAnaAnaEff,src/EffAna/AnaEff/python))
endif
ALL_COMMONRULES += src_EffAna_AnaEff_python
src_EffAna_AnaEff_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_EffAna_AnaEff_python,src/EffAna/AnaEff/python,PYTHON))
