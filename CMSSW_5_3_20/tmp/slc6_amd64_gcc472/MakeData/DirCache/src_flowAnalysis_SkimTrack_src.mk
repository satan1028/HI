ifeq ($(strip $(flowAnalysis/SkimTrack)),)
ALL_COMMONRULES += src_flowAnalysis_SkimTrack_src
src_flowAnalysis_SkimTrack_src_parent := flowAnalysis/SkimTrack
src_flowAnalysis_SkimTrack_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_flowAnalysis_SkimTrack_src,src/flowAnalysis/SkimTrack/src,LIBRARY))
flowAnalysisSkimTrack := self/flowAnalysis/SkimTrack
flowAnalysis/SkimTrack := flowAnalysisSkimTrack
flowAnalysisSkimTrack_files := $(patsubst src/flowAnalysis/SkimTrack/src/%,%,$(wildcard $(foreach dir,src/flowAnalysis/SkimTrack/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
flowAnalysisSkimTrack_BuildFile    := $(WORKINGDIR)/cache/bf/src/flowAnalysis/SkimTrack/BuildFile
flowAnalysisSkimTrack_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet root FWCore/Common CommonTools/UtilAlgos DataFormats/TrackReco DataFormats/VertexReco FWCore/ServiceRegistry DataFormats/HeavyIonEvent
flowAnalysisSkimTrack_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,flowAnalysisSkimTrack,flowAnalysisSkimTrack,$(SCRAMSTORENAME_LIB),src/flowAnalysis/SkimTrack/src))
flowAnalysisSkimTrack_PACKAGE := self/src/flowAnalysis/SkimTrack/src
ALL_PRODS += flowAnalysisSkimTrack
flowAnalysisSkimTrack_INIT_FUNC        += $$(eval $$(call Library,flowAnalysisSkimTrack,src/flowAnalysis/SkimTrack/src,src_flowAnalysis_SkimTrack_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
