ifeq ($(strip $(Tutorial/ExampleGenAnalyzer)),)
ALL_COMMONRULES += src_Tutorial_ExampleGenAnalyzer_src
src_Tutorial_ExampleGenAnalyzer_src_parent := Tutorial/ExampleGenAnalyzer
src_Tutorial_ExampleGenAnalyzer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_Tutorial_ExampleGenAnalyzer_src,src/Tutorial/ExampleGenAnalyzer/src,LIBRARY))
TutorialExampleGenAnalyzer := self/Tutorial/ExampleGenAnalyzer
Tutorial/ExampleGenAnalyzer := TutorialExampleGenAnalyzer
TutorialExampleGenAnalyzer_files := $(patsubst src/Tutorial/ExampleGenAnalyzer/src/%,%,$(wildcard $(foreach dir,src/Tutorial/ExampleGenAnalyzer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
TutorialExampleGenAnalyzer_BuildFile    := $(WORKINGDIR)/cache/bf/src/Tutorial/ExampleGenAnalyzer/BuildFile
TutorialExampleGenAnalyzer_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/JetReco FWCore/ServiceRegistry CommonTools/UtilAlgos SimDataFormats/GeneratorProducts SimDataFormats/JetMatching DataFormats/HepMCCandidate SimGeneral/HepPDTRecord hepmc
TutorialExampleGenAnalyzer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,TutorialExampleGenAnalyzer,TutorialExampleGenAnalyzer,$(SCRAMSTORENAME_LIB),src/Tutorial/ExampleGenAnalyzer/src))
TutorialExampleGenAnalyzer_PACKAGE := self/src/Tutorial/ExampleGenAnalyzer/src
ALL_PRODS += TutorialExampleGenAnalyzer
TutorialExampleGenAnalyzer_INIT_FUNC        += $$(eval $$(call Library,TutorialExampleGenAnalyzer,src/Tutorial/ExampleGenAnalyzer/src,src_Tutorial_ExampleGenAnalyzer_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
