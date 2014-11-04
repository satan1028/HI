ifeq ($(strip $(myProducers/V0CandProducer)),)
ALL_COMMONRULES += src_myProducers_V0CandProducer_src
src_myProducers_V0CandProducer_src_parent := myProducers/V0CandProducer
src_myProducers_V0CandProducer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_myProducers_V0CandProducer_src,src/myProducers/V0CandProducer/src,LIBRARY))
myProducersV0CandProducer := self/myProducers/V0CandProducer
myProducers/V0CandProducer := myProducersV0CandProducer
myProducersV0CandProducer_files := $(patsubst src/myProducers/V0CandProducer/src/%,%,$(wildcard $(foreach dir,src/myProducers/V0CandProducer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
myProducersV0CandProducer_LOC_USE :=  
myProducersV0CandProducer_PACKAGE := self/src/myProducers/V0CandProducer/src
ALL_PRODS += myProducersV0CandProducer
myProducersV0CandProducer_INIT_FUNC        += $$(eval $$(call Library,myProducersV0CandProducer,src/myProducers/V0CandProducer/src,src_myProducers_V0CandProducer_src,$(),,$(),$()))
endif
