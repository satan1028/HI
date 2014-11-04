ifeq ($(strip $(ClusterOut)),)
ClusterOut_files := $(patsubst src/usercode/SiStripCMNAnalyzer/bin/%,%,$(foreach file,ClusterOut.cc,$(eval xfile:=$(wildcard src/usercode/SiStripCMNAnalyzer/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/usercode/SiStripCMNAnalyzer/bin/$(file). Please fix src/usercode/SiStripCMNAnalyzer/bin/BuildFile.))))
ClusterOut := self/src/usercode/SiStripCMNAnalyzer/bin
ClusterOut_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/SiStripCMNAnalyzer/bin/BuildFile
ClusterOut_LOC_USE := self  root boost rootcintex DataFormats/FWLite FWCore/FWLite FWCore/Framework CommonTools/Utils PhysicsTools/FWLite PhysicsTools/Utilities DataFormats/SiStripCluster DataFormats/Common
ClusterOut_PACKAGE := self/src/usercode/SiStripCMNAnalyzer/bin
ALL_PRODS += ClusterOut
ClusterOut_INIT_FUNC        += $$(eval $$(call Binary,ClusterOut,src/usercode/SiStripCMNAnalyzer/bin,src_usercode_SiStripCMNAnalyzer_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,ClusterOut,src/usercode/SiStripCMNAnalyzer/bin))
endif
ALL_COMMONRULES += src_usercode_SiStripCMNAnalyzer_bin
src_usercode_SiStripCMNAnalyzer_bin_parent := usercode/SiStripCMNAnalyzer
src_usercode_SiStripCMNAnalyzer_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_SiStripCMNAnalyzer_bin,src/usercode/SiStripCMNAnalyzer/bin,BINARY))
