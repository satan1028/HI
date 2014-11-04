ifeq ($(strip $(DataFormats/HeavyIonEvent)),)
ALL_COMMONRULES += src_DataFormats_HeavyIonEvent_src
src_DataFormats_HeavyIonEvent_src_parent := DataFormats/HeavyIonEvent
src_DataFormats_HeavyIonEvent_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_DataFormats_HeavyIonEvent_src,src/DataFormats/HeavyIonEvent/src,LIBRARY))
DataFormatsHeavyIonEvent := self/DataFormats/HeavyIonEvent
DataFormats/HeavyIonEvent := DataFormatsHeavyIonEvent
DataFormatsHeavyIonEvent_files := $(patsubst src/DataFormats/HeavyIonEvent/src/%,%,$(wildcard $(foreach dir,src/DataFormats/HeavyIonEvent/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
DataFormatsHeavyIonEvent_BuildFile    := $(WORKINGDIR)/cache/bf/src/DataFormats/HeavyIonEvent/BuildFile
DataFormatsHeavyIonEvent_LOC_USE := self  root rootrflx DataFormats/Common CondFormats/HIObjects CondFormats/DataRecord
DataFormatsHeavyIonEvent_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,DataFormatsHeavyIonEventCapabilities,DataFormatsHeavyIonEvent,$(SCRAMSTORENAME_LIB),src/DataFormats/HeavyIonEvent/src))
DataFormatsHeavyIonEvent_LCGDICTS  := x 
DataFormatsHeavyIonEvent_PRE_INIT_FUNC += $$(eval $$(call LCGDict,DataFormatsHeavyIonEvent,0,src/DataFormats/HeavyIonEvent/src/classes.h,src/DataFormats/HeavyIonEvent/src/classes_def.xml,$(SCRAMSTORENAME_LIB),$(GENREFLEX_ARGS) --fail_on_warnings,Capabilities))
DataFormatsHeavyIonEvent_ROOTDICT  := LinkDef
DataFormatsHeavyIonEvent_PRE_INIT_FUNC += $$(eval $$(call RootDict,DataFormatsHeavyIonEvent,src/DataFormats/HeavyIonEvent/src,LinkDef.h,$(SCRAMSTORENAME_LIB)))
DataFormatsHeavyIonEvent_EX_LIB   := DataFormatsHeavyIonEvent
DataFormatsHeavyIonEvent_EX_USE   := $(foreach d,$(DataFormatsHeavyIonEvent_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsHeavyIonEvent_PACKAGE := self/src/DataFormats/HeavyIonEvent/src
ALL_PRODS += DataFormatsHeavyIonEvent
DataFormatsHeavyIonEvent_INIT_FUNC        += $$(eval $$(call Library,DataFormatsHeavyIonEvent,src/DataFormats/HeavyIonEvent/src,src_DataFormats_HeavyIonEvent_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(V0Eff/V0DeltaREffAnalyzer)),)
ALL_COMMONRULES += src_V0Eff_V0DeltaREffAnalyzer_src
src_V0Eff_V0DeltaREffAnalyzer_src_parent := V0Eff/V0DeltaREffAnalyzer
src_V0Eff_V0DeltaREffAnalyzer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_V0Eff_V0DeltaREffAnalyzer_src,src/V0Eff/V0DeltaREffAnalyzer/src,LIBRARY))
V0EffV0DeltaREffAnalyzer := self/V0Eff/V0DeltaREffAnalyzer
V0Eff/V0DeltaREffAnalyzer := V0EffV0DeltaREffAnalyzer
V0EffV0DeltaREffAnalyzer_files := $(patsubst src/V0Eff/V0DeltaREffAnalyzer/src/%,%,$(wildcard $(foreach dir,src/V0Eff/V0DeltaREffAnalyzer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
V0EffV0DeltaREffAnalyzer_LOC_USE :=  
V0EffV0DeltaREffAnalyzer_PACKAGE := self/src/V0Eff/V0DeltaREffAnalyzer/src
ALL_PRODS += V0EffV0DeltaREffAnalyzer
V0EffV0DeltaREffAnalyzer_INIT_FUNC        += $$(eval $$(call Library,V0EffV0DeltaREffAnalyzer,src/V0Eff/V0DeltaREffAnalyzer/src,src_V0Eff_V0DeltaREffAnalyzer_src,$(),,$(),$()))
endif
ifeq ($(strip $(myAnalyzers/PiLambda)),)
ALL_COMMONRULES += src_myAnalyzers_PiLambda_src
src_myAnalyzers_PiLambda_src_parent := myAnalyzers/PiLambda
src_myAnalyzers_PiLambda_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_myAnalyzers_PiLambda_src,src/myAnalyzers/PiLambda/src,LIBRARY))
myAnalyzersPiLambda := self/myAnalyzers/PiLambda
myAnalyzers/PiLambda := myAnalyzersPiLambda
myAnalyzersPiLambda_files := $(patsubst src/myAnalyzers/PiLambda/src/%,%,$(wildcard $(foreach dir,src/myAnalyzers/PiLambda/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
myAnalyzersPiLambda_LOC_USE :=  
myAnalyzersPiLambda_PACKAGE := self/src/myAnalyzers/PiLambda/src
ALL_PRODS += myAnalyzersPiLambda
myAnalyzersPiLambda_INIT_FUNC        += $$(eval $$(call Library,myAnalyzersPiLambda,src/myAnalyzers/PiLambda/src,src_myAnalyzers_PiLambda_src,$(),,$(),$()))
endif
ifeq ($(strip $(myFilters/V0CandFilter)),)
ALL_COMMONRULES += src_myFilters_V0CandFilter_src
src_myFilters_V0CandFilter_src_parent := myFilters/V0CandFilter
src_myFilters_V0CandFilter_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_myFilters_V0CandFilter_src,src/myFilters/V0CandFilter/src,LIBRARY))
myFiltersV0CandFilter := self/myFilters/V0CandFilter
myFilters/V0CandFilter := myFiltersV0CandFilter
myFiltersV0CandFilter_files := $(patsubst src/myFilters/V0CandFilter/src/%,%,$(wildcard $(foreach dir,src/myFilters/V0CandFilter/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
myFiltersV0CandFilter_LOC_USE :=  
myFiltersV0CandFilter_PACKAGE := self/src/myFilters/V0CandFilter/src
ALL_PRODS += myFiltersV0CandFilter
myFiltersV0CandFilter_INIT_FUNC        += $$(eval $$(call Library,myFiltersV0CandFilter,src/myFilters/V0CandFilter/src,src_myFilters_V0CandFilter_src,$(),,$(),$()))
endif
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
ifeq ($(strip $(myProducers/V0TrackFilter)),)
src_myProducers_V0TrackFilter := self/myProducers/V0TrackFilter
myProducers/V0TrackFilter  := src_myProducers_V0TrackFilter
src_myProducers_V0TrackFilter_BuildFile    := $(WORKINGDIR)/cache/bf/src/myProducers/V0TrackFilter/BuildFile
src_myProducers_V0TrackFilter_LOC_USE := TrackingTools/TransientTrack FWCore/PluginManager RecoVertex/VertexPrimitives FWCore/Framework self DataFormats/VertexReco DataFormats/TrackReco TrackingTools/Records RecoVertex/KalmanVertexFit TrackingTools/PatternTools FWCore/ParameterSet
src_myProducers_V0TrackFilter_EX_USE   := $(foreach d,$(src_myProducers_V0TrackFilter_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_myProducers_V0TrackFilter
src_myProducers_V0TrackFilter_INIT_FUNC += $$(eval $$(call EmptyPackage,src_myProducers_V0TrackFilter,src/myProducers/V0TrackFilter))
endif

ifeq ($(strip $(GeneratorInterface/HijingInterface)),)
ALL_COMMONRULES += src_GeneratorInterface_HijingInterface_src
src_GeneratorInterface_HijingInterface_src_parent := GeneratorInterface/HijingInterface
src_GeneratorInterface_HijingInterface_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_GeneratorInterface_HijingInterface_src,src/GeneratorInterface/HijingInterface/src,LIBRARY))
GeneratorInterfaceHijingInterface := self/GeneratorInterface/HijingInterface
GeneratorInterface/HijingInterface := GeneratorInterfaceHijingInterface
GeneratorInterfaceHijingInterface_files := $(patsubst src/GeneratorInterface/HijingInterface/src/%,%,$(wildcard $(foreach dir,src/GeneratorInterface/HijingInterface/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
GeneratorInterfaceHijingInterface_BuildFile    := $(WORKINGDIR)/cache/bf/src/GeneratorInterface/HijingInterface/BuildFile
GeneratorInterfaceHijingInterface_LOC_USE := self  clhep boost GeneratorInterface/Core FWCore/Framework SimDataFormats/GeneratorProducts GeneratorInterface/ExternalDecays f77compiler
GeneratorInterfaceHijingInterface_EX_LIB   := GeneratorInterfaceHijingInterface
GeneratorInterfaceHijingInterface_EX_USE   := $(foreach d,$(GeneratorInterfaceHijingInterface_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeneratorInterfaceHijingInterface_PACKAGE := self/src/GeneratorInterface/HijingInterface/src
ALL_PRODS += GeneratorInterfaceHijingInterface
GeneratorInterfaceHijingInterface_INIT_FUNC        += $$(eval $$(call Library,GeneratorInterfaceHijingInterface,src/GeneratorInterface/HijingInterface/src,src_GeneratorInterface_HijingInterface_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
