ifeq ($(strip $(PymyProducersV0TrackFilter)),)
PymyProducersV0TrackFilter := self/src/myProducers/V0TrackFilter/python
src_myProducers_V0TrackFilter_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/myProducers/V0TrackFilter/python)
PymyProducersV0TrackFilter_files := $(patsubst src/myProducers/V0TrackFilter/python/%,%,$(wildcard $(foreach dir,src/myProducers/V0TrackFilter/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PymyProducersV0TrackFilter_LOC_USE := self  
PymyProducersV0TrackFilter_PACKAGE := self/src/myProducers/V0TrackFilter/python
ALL_PRODS += PymyProducersV0TrackFilter
PymyProducersV0TrackFilter_INIT_FUNC        += $$(eval $$(call PythonProduct,PymyProducersV0TrackFilter,src/myProducers/V0TrackFilter/python,src_myProducers_V0TrackFilter_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PymyProducersV0TrackFilter,src/myProducers/V0TrackFilter/python))
endif
ALL_COMMONRULES += src_myProducers_V0TrackFilter_python
src_myProducers_V0TrackFilter_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myProducers_V0TrackFilter_python,src/myProducers/V0TrackFilter/python,PYTHON))
