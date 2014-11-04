ifeq ($(strip $(usercode/SiStripCMNAnalyzer)),)
ALL_COMMONRULES += src_usercode_SiStripCMNAnalyzer_src
src_usercode_SiStripCMNAnalyzer_src_parent := usercode/SiStripCMNAnalyzer
src_usercode_SiStripCMNAnalyzer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_SiStripCMNAnalyzer_src,src/usercode/SiStripCMNAnalyzer/src,LIBRARY))
usercodeSiStripCMNAnalyzer := self/usercode/SiStripCMNAnalyzer
usercode/SiStripCMNAnalyzer := usercodeSiStripCMNAnalyzer
usercodeSiStripCMNAnalyzer_files := $(patsubst src/usercode/SiStripCMNAnalyzer/src/%,%,$(wildcard $(foreach dir,src/usercode/SiStripCMNAnalyzer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodeSiStripCMNAnalyzer_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/SiStripCMNAnalyzer/BuildFile
usercodeSiStripCMNAnalyzer_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/Common DataFormats/FEDRawData DataFormats/SiStripDetId CondFormats/DataRecord CondFormats/SiStripObjects CalibFormats/SiStripObjects CalibTracker/Records RecoLocalTracker/SiStripZeroSuppression RecoLocalTracker/SiStripClusterizer FWCore/ServiceRegistry CommonTools/UtilAlgos SimTracker/SiStripDigitizer DataFormats/SiStripCluster
usercodeSiStripCMNAnalyzer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodeSiStripCMNAnalyzer,usercodeSiStripCMNAnalyzer,$(SCRAMSTORENAME_LIB),src/usercode/SiStripCMNAnalyzer/src))
usercodeSiStripCMNAnalyzer_PACKAGE := self/src/usercode/SiStripCMNAnalyzer/src
ALL_PRODS += usercodeSiStripCMNAnalyzer
usercodeSiStripCMNAnalyzer_INIT_FUNC        += $$(eval $$(call Library,usercodeSiStripCMNAnalyzer,src/usercode/SiStripCMNAnalyzer/src,src_usercode_SiStripCMNAnalyzer_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
