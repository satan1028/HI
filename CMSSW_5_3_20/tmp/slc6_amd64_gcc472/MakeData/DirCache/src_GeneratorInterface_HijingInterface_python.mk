ifeq ($(strip $(PyGeneratorInterfaceHijingInterface)),)
PyGeneratorInterfaceHijingInterface := self/src/GeneratorInterface/HijingInterface/python
src_GeneratorInterface_HijingInterface_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/GeneratorInterface/HijingInterface/python)
PyGeneratorInterfaceHijingInterface_files := $(patsubst src/GeneratorInterface/HijingInterface/python/%,%,$(wildcard $(foreach dir,src/GeneratorInterface/HijingInterface/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyGeneratorInterfaceHijingInterface_LOC_USE := self  
PyGeneratorInterfaceHijingInterface_PACKAGE := self/src/GeneratorInterface/HijingInterface/python
ALL_PRODS += PyGeneratorInterfaceHijingInterface
PyGeneratorInterfaceHijingInterface_INIT_FUNC        += $$(eval $$(call PythonProduct,PyGeneratorInterfaceHijingInterface,src/GeneratorInterface/HijingInterface/python,src_GeneratorInterface_HijingInterface_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyGeneratorInterfaceHijingInterface,src/GeneratorInterface/HijingInterface/python))
endif
ALL_COMMONRULES += src_GeneratorInterface_HijingInterface_python
src_GeneratorInterface_HijingInterface_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_GeneratorInterface_HijingInterface_python,src/GeneratorInterface/HijingInterface/python,PYTHON))
