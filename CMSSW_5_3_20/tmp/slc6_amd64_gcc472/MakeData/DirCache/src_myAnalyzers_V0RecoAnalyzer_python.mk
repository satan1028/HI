ifeq ($(strip $(PymyAnalyzersV0RecoAnalyzer)),)
PymyAnalyzersV0RecoAnalyzer := self/src/myAnalyzers/V0RecoAnalyzer/python
src_myAnalyzers_V0RecoAnalyzer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/myAnalyzers/V0RecoAnalyzer/python)
PymyAnalyzersV0RecoAnalyzer_files := $(patsubst src/myAnalyzers/V0RecoAnalyzer/python/%,%,$(wildcard $(foreach dir,src/myAnalyzers/V0RecoAnalyzer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PymyAnalyzersV0RecoAnalyzer_LOC_USE := self  
PymyAnalyzersV0RecoAnalyzer_PACKAGE := self/src/myAnalyzers/V0RecoAnalyzer/python
ALL_PRODS += PymyAnalyzersV0RecoAnalyzer
PymyAnalyzersV0RecoAnalyzer_INIT_FUNC        += $$(eval $$(call PythonProduct,PymyAnalyzersV0RecoAnalyzer,src/myAnalyzers/V0RecoAnalyzer/python,src_myAnalyzers_V0RecoAnalyzer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PymyAnalyzersV0RecoAnalyzer,src/myAnalyzers/V0RecoAnalyzer/python))
endif
ALL_COMMONRULES += src_myAnalyzers_V0RecoAnalyzer_python
src_myAnalyzers_V0RecoAnalyzer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myAnalyzers_V0RecoAnalyzer_python,src/myAnalyzers/V0RecoAnalyzer/python,PYTHON))
