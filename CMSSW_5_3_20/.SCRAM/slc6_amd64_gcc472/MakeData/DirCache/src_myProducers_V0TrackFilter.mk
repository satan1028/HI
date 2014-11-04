ifeq ($(strip $(myProducers/V0TrackFilter)),)
src_myProducers_V0TrackFilter := self/myProducers/V0TrackFilter
myProducers/V0TrackFilter  := src_myProducers_V0TrackFilter
src_myProducers_V0TrackFilter_BuildFile    := $(WORKINGDIR)/cache/bf/src/myProducers/V0TrackFilter/BuildFile
src_myProducers_V0TrackFilter_LOC_USE := TrackingTools/TransientTrack FWCore/PluginManager RecoVertex/VertexPrimitives FWCore/Framework self DataFormats/VertexReco DataFormats/TrackReco TrackingTools/Records RecoVertex/KalmanVertexFit TrackingTools/PatternTools FWCore/ParameterSet
src_myProducers_V0TrackFilter_EX_USE   := $(foreach d,$(src_myProducers_V0TrackFilter_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_myProducers_V0TrackFilter
src_myProducers_V0TrackFilter_INIT_FUNC += $$(eval $$(call EmptyPackage,src_myProducers_V0TrackFilter,src/myProducers/V0TrackFilter))
endif

