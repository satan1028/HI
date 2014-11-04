ifeq ($(strip $(PyGeneratorInterfaceAnaHijing)),)
PyGeneratorInterfaceAnaHijing := self/src/GeneratorInterface/AnaHijing/python
src_GeneratorInterface_AnaHijing_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/GeneratorInterface/AnaHijing/python)
PyGeneratorInterfaceAnaHijing_files := $(patsubst src/GeneratorInterface/AnaHijing/python/%,%,$(wildcard $(foreach dir,src/GeneratorInterface/AnaHijing/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyGeneratorInterfaceAnaHijing_LOC_USE := self  
PyGeneratorInterfaceAnaHijing_PACKAGE := self/src/GeneratorInterface/AnaHijing/python
ALL_PRODS += PyGeneratorInterfaceAnaHijing
PyGeneratorInterfaceAnaHijing_INIT_FUNC        += $$(eval $$(call PythonProduct,PyGeneratorInterfaceAnaHijing,src/GeneratorInterface/AnaHijing/python,src_GeneratorInterface_AnaHijing_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyGeneratorInterfaceAnaHijing,src/GeneratorInterface/AnaHijing/python))
endif
ALL_COMMONRULES += src_GeneratorInterface_AnaHijing_python
src_GeneratorInterface_AnaHijing_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_GeneratorInterface_AnaHijing_python,src/GeneratorInterface/AnaHijing/python,PYTHON))
