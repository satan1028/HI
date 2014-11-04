ifeq ($(strip $(flowAnalysis/SkimPFCand)),)
ALL_COMMONRULES += src_flowAnalysis_SkimPFCand_src
src_flowAnalysis_SkimPFCand_src_parent := flowAnalysis/SkimPFCand
src_flowAnalysis_SkimPFCand_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_flowAnalysis_SkimPFCand_src,src/flowAnalysis/SkimPFCand/src,LIBRARY))
flowAnalysisSkimPFCand := self/flowAnalysis/SkimPFCand
flowAnalysis/SkimPFCand := flowAnalysisSkimPFCand
flowAnalysisSkimPFCand_files := $(patsubst src/flowAnalysis/SkimPFCand/src/%,%,$(wildcard $(foreach dir,src/flowAnalysis/SkimPFCand/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
flowAnalysisSkimPFCand_BuildFile    := $(WORKINGDIR)/cache/bf/src/flowAnalysis/SkimPFCand/BuildFile
flowAnalysisSkimPFCand_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet root FWCore/Common CommonTools/UtilAlgos DataFormats/TrackReco DataFormats/VertexReco DataFormats/ParticleFlowCandidate FWCore/ServiceRegistry DataFormats/HeavyIonEvent
flowAnalysisSkimPFCand_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,flowAnalysisSkimPFCand,flowAnalysisSkimPFCand,$(SCRAMSTORENAME_LIB),src/flowAnalysis/SkimPFCand/src))
flowAnalysisSkimPFCand_PACKAGE := self/src/flowAnalysis/SkimPFCand/src
ALL_PRODS += flowAnalysisSkimPFCand
flowAnalysisSkimPFCand_INIT_FUNC        += $$(eval $$(call Library,flowAnalysisSkimPFCand,src/flowAnalysis/SkimPFCand/src,src_flowAnalysis_SkimPFCand_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
