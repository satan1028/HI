ifeq ($(strip $(flowAnalysis/LYZfirst)),)
ALL_COMMONRULES += src_flowAnalysis_LYZfirst_src
src_flowAnalysis_LYZfirst_src_parent := flowAnalysis/LYZfirst
src_flowAnalysis_LYZfirst_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_flowAnalysis_LYZfirst_src,src/flowAnalysis/LYZfirst/src,LIBRARY))
flowAnalysisLYZfirst := self/flowAnalysis/LYZfirst
flowAnalysis/LYZfirst := flowAnalysisLYZfirst
flowAnalysisLYZfirst_files := $(patsubst src/flowAnalysis/LYZfirst/src/%,%,$(wildcard $(foreach dir,src/flowAnalysis/LYZfirst/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
flowAnalysisLYZfirst_BuildFile    := $(WORKINGDIR)/cache/bf/src/flowAnalysis/LYZfirst/BuildFile
flowAnalysisLYZfirst_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet root FWCore/Common CommonTools/UtilAlgos DataFormats/TrackReco DataFormats/VertexReco FWCore/ServiceRegistry DataFormats/HeavyIonEvent
flowAnalysisLYZfirst_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,flowAnalysisLYZfirst,flowAnalysisLYZfirst,$(SCRAMSTORENAME_LIB),src/flowAnalysis/LYZfirst/src))
flowAnalysisLYZfirst_PACKAGE := self/src/flowAnalysis/LYZfirst/src
ALL_PRODS += flowAnalysisLYZfirst
flowAnalysisLYZfirst_INIT_FUNC        += $$(eval $$(call Library,flowAnalysisLYZfirst,src/flowAnalysis/LYZfirst/src,src_flowAnalysis_LYZfirst_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
