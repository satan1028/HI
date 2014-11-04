ifeq ($(strip $(PyTutorialExampleGenAnalyzer)),)
PyTutorialExampleGenAnalyzer := self/src/Tutorial/ExampleGenAnalyzer/python
src_Tutorial_ExampleGenAnalyzer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/Tutorial/ExampleGenAnalyzer/python)
PyTutorialExampleGenAnalyzer_files := $(patsubst src/Tutorial/ExampleGenAnalyzer/python/%,%,$(wildcard $(foreach dir,src/Tutorial/ExampleGenAnalyzer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyTutorialExampleGenAnalyzer_LOC_USE := self  
PyTutorialExampleGenAnalyzer_PACKAGE := self/src/Tutorial/ExampleGenAnalyzer/python
ALL_PRODS += PyTutorialExampleGenAnalyzer
PyTutorialExampleGenAnalyzer_INIT_FUNC        += $$(eval $$(call PythonProduct,PyTutorialExampleGenAnalyzer,src/Tutorial/ExampleGenAnalyzer/python,src_Tutorial_ExampleGenAnalyzer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyTutorialExampleGenAnalyzer,src/Tutorial/ExampleGenAnalyzer/python))
endif
ALL_COMMONRULES += src_Tutorial_ExampleGenAnalyzer_python
src_Tutorial_ExampleGenAnalyzer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Tutorial_ExampleGenAnalyzer_python,src/Tutorial/ExampleGenAnalyzer/python,PYTHON))
