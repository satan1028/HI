ifeq ($(strip $(EffAna/ESAnaEff)),)
ALL_COMMONRULES += src_EffAna_ESAnaEff_src
src_EffAna_ESAnaEff_src_parent := EffAna/ESAnaEff
src_EffAna_ESAnaEff_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_EffAna_ESAnaEff_src,src/EffAna/ESAnaEff/src,LIBRARY))
EffAnaESAnaEff := self/EffAna/ESAnaEff
EffAna/ESAnaEff := EffAnaESAnaEff
EffAnaESAnaEff_files := $(patsubst src/EffAna/ESAnaEff/src/%,%,$(wildcard $(foreach dir,src/EffAna/ESAnaEff/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
EffAnaESAnaEff_BuildFile    := $(WORKINGDIR)/cache/bf/src/EffAna/ESAnaEff/BuildFile
EffAnaESAnaEff_LOC_USE := self  FWCore/PluginManager FWCore/ParameterSet FWCore/Framework FWCore/MessageLogger FWCore/ServiceRegistry FWCore/Common root boost heppdt CommonTools/UtilAlgos DataFormats/HcalDetId DataFormats/HcalRecHit DataFormats/HcalDigi DataFormats/JetReco DataFormats/FEDRawData DataFormats/HeavyIonEvent DataFormats/VertexReco DataFormats/TrackReco CondFormats/CastorObjects CalibFormats/CastorObjects EventFilter/CastorRawToDigi Geometry/CaloGeometry SimDataFormats/HiGenData SimDataFormats/Vertex SimDataFormats/GeneratorProducts SimGeneral/HepPDTRecord rootmath
EffAnaESAnaEff_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,EffAnaESAnaEff,EffAnaESAnaEff,$(SCRAMSTORENAME_LIB),src/EffAna/ESAnaEff/src))
EffAnaESAnaEff_PACKAGE := self/src/EffAna/ESAnaEff/src
ALL_PRODS += EffAnaESAnaEff
EffAnaESAnaEff_INIT_FUNC        += $$(eval $$(call Library,EffAnaESAnaEff,src/EffAna/ESAnaEff/src,src_EffAna_ESAnaEff_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
