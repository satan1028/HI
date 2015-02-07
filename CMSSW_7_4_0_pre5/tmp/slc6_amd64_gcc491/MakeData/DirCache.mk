ALL_SUBSYSTEMS+=CentralityTest
subdirs_src_CentralityTest = src_CentralityTest_CentralityAnalyzer
ALL_PACKAGES += CentralityTest/CentralityAnalyzer
subdirs_src_CentralityTest_CentralityAnalyzer := src_CentralityTest_CentralityAnalyzer_plugins src_CentralityTest_CentralityAnalyzer_python src_CentralityTest_CentralityAnalyzer_test src_CentralityTest_CentralityAnalyzer_doc
ifeq ($(strip $(PyCentralityTestCentralityAnalyzer)),)
PyCentralityTestCentralityAnalyzer := self/src/CentralityTest/CentralityAnalyzer/python
src_CentralityTest_CentralityAnalyzer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/CentralityTest/CentralityAnalyzer/python)
PyCentralityTestCentralityAnalyzer_files := $(patsubst src/CentralityTest/CentralityAnalyzer/python/%,%,$(wildcard $(foreach dir,src/CentralityTest/CentralityAnalyzer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyCentralityTestCentralityAnalyzer_LOC_USE := self  
PyCentralityTestCentralityAnalyzer_PACKAGE := self/src/CentralityTest/CentralityAnalyzer/python
ALL_PRODS += PyCentralityTestCentralityAnalyzer
PyCentralityTestCentralityAnalyzer_INIT_FUNC        += $$(eval $$(call PythonProduct,PyCentralityTestCentralityAnalyzer,src/CentralityTest/CentralityAnalyzer/python,src_CentralityTest_CentralityAnalyzer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyCentralityTestCentralityAnalyzer,src/CentralityTest/CentralityAnalyzer/python))
endif
ALL_COMMONRULES += src_CentralityTest_CentralityAnalyzer_python
src_CentralityTest_CentralityAnalyzer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CentralityTest_CentralityAnalyzer_python,src/CentralityTest/CentralityAnalyzer/python,PYTHON))
ALL_COMMONRULES += src_CentralityTest_CentralityAnalyzer_test
src_CentralityTest_CentralityAnalyzer_test_parent := CentralityTest/CentralityAnalyzer
src_CentralityTest_CentralityAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CentralityTest_CentralityAnalyzer_test,src/CentralityTest/CentralityAnalyzer/test,TEST))
