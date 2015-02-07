ifeq ($(strip $(CentralityTestCentralityAnalyzerAuto)),)
CentralityTestCentralityAnalyzerAuto := self/src/CentralityTest/CentralityAnalyzer/plugins
PLUGINS:=yes
CentralityTestCentralityAnalyzerAuto_files := $(patsubst src/CentralityTest/CentralityAnalyzer/plugins/%,%,$(wildcard $(foreach dir,src/CentralityTest/CentralityAnalyzer/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
CentralityTestCentralityAnalyzerAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/CentralityTest/CentralityAnalyzer/plugins/BuildFile
CentralityTestCentralityAnalyzerAuto_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet PhysicsTools/UtilAlgos FWCore/ServiceRegistry
CentralityTestCentralityAnalyzerAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,CentralityTestCentralityAnalyzerAuto,CentralityTestCentralityAnalyzerAuto,$(SCRAMSTORENAME_LIB),src/CentralityTest/CentralityAnalyzer/plugins))
CentralityTestCentralityAnalyzerAuto_PACKAGE := self/src/CentralityTest/CentralityAnalyzer/plugins
ALL_PRODS += CentralityTestCentralityAnalyzerAuto
CentralityTest/CentralityAnalyzer_forbigobj+=CentralityTestCentralityAnalyzerAuto
CentralityTestCentralityAnalyzerAuto_INIT_FUNC        += $$(eval $$(call Library,CentralityTestCentralityAnalyzerAuto,src/CentralityTest/CentralityAnalyzer/plugins,src_CentralityTest_CentralityAnalyzer_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
CentralityTestCentralityAnalyzerAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,CentralityTestCentralityAnalyzerAuto,src/CentralityTest/CentralityAnalyzer/plugins))
endif
ALL_COMMONRULES += src_CentralityTest_CentralityAnalyzer_plugins
src_CentralityTest_CentralityAnalyzer_plugins_parent := CentralityTest/CentralityAnalyzer
src_CentralityTest_CentralityAnalyzer_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CentralityTest_CentralityAnalyzer_plugins,src/CentralityTest/CentralityAnalyzer/plugins,PLUGINS))
