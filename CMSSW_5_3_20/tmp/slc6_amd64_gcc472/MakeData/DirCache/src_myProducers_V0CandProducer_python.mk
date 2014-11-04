ifeq ($(strip $(PymyProducersV0CandProducer)),)
PymyProducersV0CandProducer := self/src/myProducers/V0CandProducer/python
src_myProducers_V0CandProducer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/myProducers/V0CandProducer/python)
PymyProducersV0CandProducer_files := $(patsubst src/myProducers/V0CandProducer/python/%,%,$(wildcard $(foreach dir,src/myProducers/V0CandProducer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PymyProducersV0CandProducer_LOC_USE := self  
PymyProducersV0CandProducer_PACKAGE := self/src/myProducers/V0CandProducer/python
ALL_PRODS += PymyProducersV0CandProducer
PymyProducersV0CandProducer_INIT_FUNC        += $$(eval $$(call PythonProduct,PymyProducersV0CandProducer,src/myProducers/V0CandProducer/python,src_myProducers_V0CandProducer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PymyProducersV0CandProducer,src/myProducers/V0CandProducer/python))
endif
ALL_COMMONRULES += src_myProducers_V0CandProducer_python
src_myProducers_V0CandProducer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myProducers_V0CandProducer_python,src/myProducers/V0CandProducer/python,PYTHON))
