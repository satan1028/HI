ifeq ($(strip $(flowAnalysis/LYZsecond)),)
ALL_COMMONRULES += src_flowAnalysis_LYZsecond_src
src_flowAnalysis_LYZsecond_src_parent := flowAnalysis/LYZsecond
src_flowAnalysis_LYZsecond_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_flowAnalysis_LYZsecond_src,src/flowAnalysis/LYZsecond/src,LIBRARY))
flowAnalysisLYZsecond := self/flowAnalysis/LYZsecond
flowAnalysis/LYZsecond := flowAnalysisLYZsecond
flowAnalysisLYZsecond_files := $(patsubst src/flowAnalysis/LYZsecond/src/%,%,$(wildcard $(foreach dir,src/flowAnalysis/LYZsecond/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
flowAnalysisLYZsecond_BuildFile    := $(WORKINGDIR)/cache/bf/src/flowAnalysis/LYZsecond/BuildFile
flowAnalysisLYZsecond_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet root FWCore/Common CommonTools/UtilAlgos DataFormats/TrackReco DataFormats/VertexReco FWCore/ServiceRegistry DataFormats/HeavyIonEvent
flowAnalysisLYZsecond_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,flowAnalysisLYZsecond,flowAnalysisLYZsecond,$(SCRAMSTORENAME_LIB),src/flowAnalysis/LYZsecond/src))
flowAnalysisLYZsecond_PACKAGE := self/src/flowAnalysis/LYZsecond/src
ALL_PRODS += flowAnalysisLYZsecond
flowAnalysisLYZsecond_INIT_FUNC        += $$(eval $$(call Library,flowAnalysisLYZsecond,src/flowAnalysis/LYZsecond/src,src_flowAnalysis_LYZsecond_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
