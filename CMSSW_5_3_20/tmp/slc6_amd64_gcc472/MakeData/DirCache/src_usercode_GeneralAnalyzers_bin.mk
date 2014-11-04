ifeq ($(strip $(PlotCaloTowers)),)
PlotCaloTowers_files := $(patsubst src/usercode/GeneralAnalyzers/bin/%,%,$(foreach file,PlotCaloTowers.cc,$(eval xfile:=$(wildcard src/usercode/GeneralAnalyzers/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/usercode/GeneralAnalyzers/bin/$(file). Please fix src/usercode/GeneralAnalyzers/bin/BuildFile.))))
PlotCaloTowers := self/src/usercode/GeneralAnalyzers/bin
PlotCaloTowers_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/GeneralAnalyzers/bin/BuildFile
PlotCaloTowers_LOC_USE := self  root boost rootcintex DataFormats/FWLite FWCore/FWLite FWCore/Framework CommonTools/Utils PhysicsTools/FWLite PhysicsTools/Utilities DataFormats/Common DataFormats/CaloTowers
PlotCaloTowers_PACKAGE := self/src/usercode/GeneralAnalyzers/bin
ALL_PRODS += PlotCaloTowers
PlotCaloTowers_INIT_FUNC        += $$(eval $$(call Binary,PlotCaloTowers,src/usercode/GeneralAnalyzers/bin,src_usercode_GeneralAnalyzers_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,PlotCaloTowers,src/usercode/GeneralAnalyzers/bin))
endif
ALL_COMMONRULES += src_usercode_GeneralAnalyzers_bin
src_usercode_GeneralAnalyzers_bin_parent := usercode/GeneralAnalyzers
src_usercode_GeneralAnalyzers_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_GeneralAnalyzers_bin,src/usercode/GeneralAnalyzers/bin,BINARY))
