ifeq ($(strip $(GeneratorInterface/AnaHijing)),)
ALL_COMMONRULES += src_GeneratorInterface_AnaHijing_src
src_GeneratorInterface_AnaHijing_src_parent := GeneratorInterface/AnaHijing
src_GeneratorInterface_AnaHijing_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_GeneratorInterface_AnaHijing_src,src/GeneratorInterface/AnaHijing/src,LIBRARY))
GeneratorInterfaceAnaHijing := self/GeneratorInterface/AnaHijing
GeneratorInterface/AnaHijing := GeneratorInterfaceAnaHijing
GeneratorInterfaceAnaHijing_files := $(patsubst src/GeneratorInterface/AnaHijing/src/%,%,$(wildcard $(foreach dir,src/GeneratorInterface/AnaHijing/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
GeneratorInterfaceAnaHijing_BuildFile    := $(WORKINGDIR)/cache/bf/src/GeneratorInterface/AnaHijing/BuildFile
GeneratorInterfaceAnaHijing_LOC_USE := self  boost root heppdt FWCore/Framework FWCore/PluginManager FWCore/ParameterSet SimDataFormats/Vertex SimDataFormats/GeneratorProducts SimDataFormats/HiGenData SimGeneral/HepPDTRecord CommonTools/UtilAlgos FWCore/ServiceRegistry FWCore/Utilities
GeneratorInterfaceAnaHijing_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,GeneratorInterfaceAnaHijing,GeneratorInterfaceAnaHijing,$(SCRAMSTORENAME_LIB),src/GeneratorInterface/AnaHijing/src))
GeneratorInterfaceAnaHijing_PACKAGE := self/src/GeneratorInterface/AnaHijing/src
ALL_PRODS += GeneratorInterfaceAnaHijing
GeneratorInterfaceAnaHijing_INIT_FUNC        += $$(eval $$(call Library,GeneratorInterfaceAnaHijing,src/GeneratorInterface/AnaHijing/src,src_GeneratorInterface_AnaHijing_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
