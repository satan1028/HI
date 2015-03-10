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
ifeq ($(strip $(myProducers/V0TrackFilter)),)
src_myProducers_V0TrackFilter := self/myProducers/V0TrackFilter
myProducers/V0TrackFilter  := src_myProducers_V0TrackFilter
src_myProducers_V0TrackFilter_BuildFile    := $(WORKINGDIR)/cache/bf/src/myProducers/V0TrackFilter/BuildFile
src_myProducers_V0TrackFilter_LOC_USE := TrackingTools/TransientTrack FWCore/PluginManager RecoVertex/VertexPrimitives FWCore/Framework self DataFormats/VertexReco DataFormats/TrackReco TrackingTools/Records RecoVertex/KalmanVertexFit TrackingTools/PatternTools FWCore/ParameterSet
src_myProducers_V0TrackFilter_EX_USE   := $(foreach d,$(src_myProducers_V0TrackFilter_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_myProducers_V0TrackFilter
src_myProducers_V0TrackFilter_INIT_FUNC += $$(eval $$(call EmptyPackage,src_myProducers_V0TrackFilter,src/myProducers/V0TrackFilter))
endif

