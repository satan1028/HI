ifeq ($(strip $(PyAppeltelRpPbAnalysis)),)
PyAppeltelRpPbAnalysis := self/src/Appeltel/RpPbAnalysis/python
src_Appeltel_RpPbAnalysis_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/Appeltel/RpPbAnalysis/python)
PyAppeltelRpPbAnalysis_files := $(patsubst src/Appeltel/RpPbAnalysis/python/%,%,$(wildcard $(foreach dir,src/Appeltel/RpPbAnalysis/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyAppeltelRpPbAnalysis_LOC_USE := self  
PyAppeltelRpPbAnalysis_PACKAGE := self/src/Appeltel/RpPbAnalysis/python
ALL_PRODS += PyAppeltelRpPbAnalysis
PyAppeltelRpPbAnalysis_INIT_FUNC        += $$(eval $$(call PythonProduct,PyAppeltelRpPbAnalysis,src/Appeltel/RpPbAnalysis/python,src_Appeltel_RpPbAnalysis_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyAppeltelRpPbAnalysis,src/Appeltel/RpPbAnalysis/python))
endif
ALL_COMMONRULES += src_Appeltel_RpPbAnalysis_python
src_Appeltel_RpPbAnalysis_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Appeltel_RpPbAnalysis_python,src/Appeltel/RpPbAnalysis/python,PYTHON))
