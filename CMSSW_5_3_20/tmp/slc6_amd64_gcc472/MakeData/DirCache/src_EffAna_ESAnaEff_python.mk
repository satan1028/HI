ifeq ($(strip $(PyEffAnaESAnaEff)),)
PyEffAnaESAnaEff := self/src/EffAna/ESAnaEff/python
src_EffAna_ESAnaEff_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/EffAna/ESAnaEff/python)
PyEffAnaESAnaEff_files := $(patsubst src/EffAna/ESAnaEff/python/%,%,$(wildcard $(foreach dir,src/EffAna/ESAnaEff/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyEffAnaESAnaEff_LOC_USE := self  
PyEffAnaESAnaEff_PACKAGE := self/src/EffAna/ESAnaEff/python
ALL_PRODS += PyEffAnaESAnaEff
PyEffAnaESAnaEff_INIT_FUNC        += $$(eval $$(call PythonProduct,PyEffAnaESAnaEff,src/EffAna/ESAnaEff/python,src_EffAna_ESAnaEff_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyEffAnaESAnaEff,src/EffAna/ESAnaEff/python))
endif
ALL_COMMONRULES += src_EffAna_ESAnaEff_python
src_EffAna_ESAnaEff_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_EffAna_ESAnaEff_python,src/EffAna/ESAnaEff/python,PYTHON))
