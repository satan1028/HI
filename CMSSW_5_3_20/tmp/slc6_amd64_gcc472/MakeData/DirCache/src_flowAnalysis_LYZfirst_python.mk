ifeq ($(strip $(PyflowAnalysisLYZfirst)),)
PyflowAnalysisLYZfirst := self/src/flowAnalysis/LYZfirst/python
src_flowAnalysis_LYZfirst_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/flowAnalysis/LYZfirst/python)
PyflowAnalysisLYZfirst_files := $(patsubst src/flowAnalysis/LYZfirst/python/%,%,$(wildcard $(foreach dir,src/flowAnalysis/LYZfirst/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyflowAnalysisLYZfirst_LOC_USE := self  
PyflowAnalysisLYZfirst_PACKAGE := self/src/flowAnalysis/LYZfirst/python
ALL_PRODS += PyflowAnalysisLYZfirst
PyflowAnalysisLYZfirst_INIT_FUNC        += $$(eval $$(call PythonProduct,PyflowAnalysisLYZfirst,src/flowAnalysis/LYZfirst/python,src_flowAnalysis_LYZfirst_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyflowAnalysisLYZfirst,src/flowAnalysis/LYZfirst/python))
endif
ALL_COMMONRULES += src_flowAnalysis_LYZfirst_python
src_flowAnalysis_LYZfirst_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_LYZfirst_python,src/flowAnalysis/LYZfirst/python,PYTHON))
