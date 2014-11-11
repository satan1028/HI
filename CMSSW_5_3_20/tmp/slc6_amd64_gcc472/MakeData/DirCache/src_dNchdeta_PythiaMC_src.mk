ifeq ($(strip $(dNchdeta/PythiaMC)),)
ALL_COMMONRULES += src_dNchdeta_PythiaMC_src
src_dNchdeta_PythiaMC_src_parent := dNchdeta/PythiaMC
src_dNchdeta_PythiaMC_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_dNchdeta_PythiaMC_src,src/dNchdeta/PythiaMC/src,LIBRARY))
dNchdetaPythiaMC := self/dNchdeta/PythiaMC
dNchdeta/PythiaMC := dNchdetaPythiaMC
dNchdetaPythiaMC_files := $(patsubst src/dNchdeta/PythiaMC/src/%,%,$(wildcard $(foreach dir,src/dNchdeta/PythiaMC/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
dNchdetaPythiaMC_BuildFile    := $(WORKINGDIR)/cache/bf/src/dNchdeta/PythiaMC/BuildFile
dNchdetaPythiaMC_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry root CommonTools/UtilAlgos DataFormats/HeavyIonEvent SimDataFormats/HiGenData SimDataFormats/Vertex SimDataFormats/GeneratorProducts
dNchdetaPythiaMC_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,dNchdetaPythiaMC,dNchdetaPythiaMC,$(SCRAMSTORENAME_LIB),src/dNchdeta/PythiaMC/src))
dNchdetaPythiaMC_PACKAGE := self/src/dNchdeta/PythiaMC/src
ALL_PRODS += dNchdetaPythiaMC
dNchdetaPythiaMC_INIT_FUNC        += $$(eval $$(call Library,dNchdetaPythiaMC,src/dNchdeta/PythiaMC/src,src_dNchdeta_PythiaMC_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
