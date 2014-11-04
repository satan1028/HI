ifeq ($(strip $(PyV0EffV0DeltaREffAnalyzer)),)
PyV0EffV0DeltaREffAnalyzer := self/src/V0Eff/V0DeltaREffAnalyzer/python
src_V0Eff_V0DeltaREffAnalyzer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/V0Eff/V0DeltaREffAnalyzer/python)
PyV0EffV0DeltaREffAnalyzer_files := $(patsubst src/V0Eff/V0DeltaREffAnalyzer/python/%,%,$(wildcard $(foreach dir,src/V0Eff/V0DeltaREffAnalyzer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyV0EffV0DeltaREffAnalyzer_LOC_USE := self  
PyV0EffV0DeltaREffAnalyzer_PACKAGE := self/src/V0Eff/V0DeltaREffAnalyzer/python
ALL_PRODS += PyV0EffV0DeltaREffAnalyzer
PyV0EffV0DeltaREffAnalyzer_INIT_FUNC        += $$(eval $$(call PythonProduct,PyV0EffV0DeltaREffAnalyzer,src/V0Eff/V0DeltaREffAnalyzer/python,src_V0Eff_V0DeltaREffAnalyzer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyV0EffV0DeltaREffAnalyzer,src/V0Eff/V0DeltaREffAnalyzer/python))
endif
ALL_COMMONRULES += src_V0Eff_V0DeltaREffAnalyzer_python
src_V0Eff_V0DeltaREffAnalyzer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_V0Eff_V0DeltaREffAnalyzer_python,src/V0Eff/V0DeltaREffAnalyzer/python,PYTHON))
