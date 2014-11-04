ifeq ($(strip $(PyflowAnalysisSkimPFCand)),)
PyflowAnalysisSkimPFCand := self/src/flowAnalysis/SkimPFCand/python
src_flowAnalysis_SkimPFCand_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/flowAnalysis/SkimPFCand/python)
PyflowAnalysisSkimPFCand_files := $(patsubst src/flowAnalysis/SkimPFCand/python/%,%,$(wildcard $(foreach dir,src/flowAnalysis/SkimPFCand/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyflowAnalysisSkimPFCand_LOC_USE := self  
PyflowAnalysisSkimPFCand_PACKAGE := self/src/flowAnalysis/SkimPFCand/python
ALL_PRODS += PyflowAnalysisSkimPFCand
PyflowAnalysisSkimPFCand_INIT_FUNC        += $$(eval $$(call PythonProduct,PyflowAnalysisSkimPFCand,src/flowAnalysis/SkimPFCand/python,src_flowAnalysis_SkimPFCand_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyflowAnalysisSkimPFCand,src/flowAnalysis/SkimPFCand/python))
endif
ALL_COMMONRULES += src_flowAnalysis_SkimPFCand_python
src_flowAnalysis_SkimPFCand_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_SkimPFCand_python,src/flowAnalysis/SkimPFCand/python,PYTHON))
