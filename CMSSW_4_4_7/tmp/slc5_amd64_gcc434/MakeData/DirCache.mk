ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/flowAnalysis)
subdirs_src_flowAnalysis = src_flowAnalysis_SkimTrack
ALL_PACKAGES += $(patsubst src/%,%,src/flowAnalysis/SkimTrack)
subdirs_src_flowAnalysis_SkimTrack := src_flowAnalysis_SkimTrack_python src_flowAnalysis_SkimTrack_src src_flowAnalysis_SkimTrack_test
ifeq ($(strip $(PyflowAnalysisSkimTrack)),)
PyflowAnalysisSkimTrack := self/src/flowAnalysis/SkimTrack/python
PyflowAnalysisSkimTrack_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/flowAnalysis/SkimTrack/python)
ALL_PRODS += PyflowAnalysisSkimTrack
PyflowAnalysisSkimTrack_INIT_FUNC        += $$(eval $$(call PythonProduct,PyflowAnalysisSkimTrack,src/flowAnalysis/SkimTrack/python,src_flowAnalysis_SkimTrack_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyflowAnalysisSkimTrack,src/flowAnalysis/SkimTrack/python))
endif
ALL_COMMONRULES += src_flowAnalysis_SkimTrack_python
src_flowAnalysis_SkimTrack_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_SkimTrack_python,src/flowAnalysis/SkimTrack/python,PYTHON))
ALL_COMMONRULES += src_flowAnalysis_SkimTrack_test
src_flowAnalysis_SkimTrack_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_SkimTrack_test,src/flowAnalysis/SkimTrack/test,TEST))
