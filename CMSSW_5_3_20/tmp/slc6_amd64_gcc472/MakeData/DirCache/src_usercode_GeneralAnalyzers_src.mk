ifeq ($(strip $(usercode/GeneralAnalyzers)),)
ALL_COMMONRULES += src_usercode_GeneralAnalyzers_src
src_usercode_GeneralAnalyzers_src_parent := usercode/GeneralAnalyzers
src_usercode_GeneralAnalyzers_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_GeneralAnalyzers_src,src/usercode/GeneralAnalyzers/src,LIBRARY))
usercodeGeneralAnalyzers := self/usercode/GeneralAnalyzers
usercode/GeneralAnalyzers := usercodeGeneralAnalyzers
usercodeGeneralAnalyzers_files := $(patsubst src/usercode/GeneralAnalyzers/src/%,%,$(wildcard $(foreach dir,src/usercode/GeneralAnalyzers/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodeGeneralAnalyzers_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/GeneralAnalyzers/BuildFile
usercodeGeneralAnalyzers_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/Common DataFormats/FEDRawData DataFormats/SiStripDetId DataFormats/TrackerRecHit2D DataFormats/SiPixelDetId DataFormats/DetId CondFormats/DataRecord CondFormats/SiStripObjects CalibFormats/SiStripObjects CalibTracker/Records FWCore/ServiceRegistry CommonTools/UtilAlgos DataFormats/SiStripCluster DataFormats/SiPixelCluster DataFormats/HeavyIonEvent DataFormats/TrackReco DataFormats/VertexReco DataFormats/HepMCCandidate DataFormats/Math Geometry/Records
usercodeGeneralAnalyzers_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodeGeneralAnalyzers,usercodeGeneralAnalyzers,$(SCRAMSTORENAME_LIB),src/usercode/GeneralAnalyzers/src))
usercodeGeneralAnalyzers_PACKAGE := self/src/usercode/GeneralAnalyzers/src
ALL_PRODS += usercodeGeneralAnalyzers
usercodeGeneralAnalyzers_INIT_FUNC        += $$(eval $$(call Library,usercodeGeneralAnalyzers,src/usercode/GeneralAnalyzers/src,src_usercode_GeneralAnalyzers_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
