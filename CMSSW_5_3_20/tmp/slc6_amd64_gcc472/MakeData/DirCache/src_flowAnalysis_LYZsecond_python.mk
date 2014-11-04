ifeq ($(strip $(PyflowAnalysisLYZsecond)),)
PyflowAnalysisLYZsecond := self/src/flowAnalysis/LYZsecond/python
src_flowAnalysis_LYZsecond_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/flowAnalysis/LYZsecond/python)
PyflowAnalysisLYZsecond_files := $(patsubst src/flowAnalysis/LYZsecond/python/%,%,$(wildcard $(foreach dir,src/flowAnalysis/LYZsecond/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyflowAnalysisLYZsecond_LOC_USE := self  
PyflowAnalysisLYZsecond_PACKAGE := self/src/flowAnalysis/LYZsecond/python
ALL_PRODS += PyflowAnalysisLYZsecond
PyflowAnalysisLYZsecond_INIT_FUNC        += $$(eval $$(call PythonProduct,PyflowAnalysisLYZsecond,src/flowAnalysis/LYZsecond/python,src_flowAnalysis_LYZsecond_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyflowAnalysisLYZsecond,src/flowAnalysis/LYZsecond/python))
endif
ALL_COMMONRULES += src_flowAnalysis_LYZsecond_python
src_flowAnalysis_LYZsecond_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_LYZsecond_python,src/flowAnalysis/LYZsecond/python,PYTHON))
