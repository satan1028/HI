ifeq ($(strip $(myProducers/V0CandProducer)),)
ALL_COMMONRULES += src_myProducers_V0CandProducer_src
src_myProducers_V0CandProducer_src_parent := myProducers/V0CandProducer
src_myProducers_V0CandProducer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_myProducers_V0CandProducer_src,src/myProducers/V0CandProducer/src,LIBRARY))
myProducersV0CandProducer := self/myProducers/V0CandProducer
myProducers/V0CandProducer := myProducersV0CandProducer
myProducersV0CandProducer_files := $(patsubst src/myProducers/V0CandProducer/src/%,%,$(wildcard $(foreach dir,src/myProducers/V0CandProducer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
myProducersV0CandProducer_BuildFile    := $(WORKINGDIR)/cache/bf/src/myProducers/V0CandProducer/BuildFile
myProducersV0CandProducer_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/PatCandidates DataFormats/RecoCandidate DataFormats/V0Candidate TrackingTools/Records TrackingTools/TransientTrack RecoVertex/KalmanVertexFit RecoVertex/VertexTools
myProducersV0CandProducer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,myProducersV0CandProducer,myProducersV0CandProducer,$(SCRAMSTORENAME_LIB),src/myProducers/V0CandProducer/src))
myProducersV0CandProducer_PACKAGE := self/src/myProducers/V0CandProducer/src
ALL_PRODS += myProducersV0CandProducer
myProducersV0CandProducer_INIT_FUNC        += $$(eval $$(call Library,myProducersV0CandProducer,src/myProducers/V0CandProducer/src,src_myProducers_V0CandProducer_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
