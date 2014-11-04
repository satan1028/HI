ifeq ($(strip $(EffAna/AnaEff)),)
ALL_COMMONRULES += src_EffAna_AnaEff_src
src_EffAna_AnaEff_src_parent := EffAna/AnaEff
src_EffAna_AnaEff_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_EffAna_AnaEff_src,src/EffAna/AnaEff/src,LIBRARY))
EffAnaAnaEff := self/EffAna/AnaEff
EffAna/AnaEff := EffAnaAnaEff
EffAnaAnaEff_files := $(patsubst src/EffAna/AnaEff/src/%,%,$(wildcard $(foreach dir,src/EffAna/AnaEff/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
EffAnaAnaEff_BuildFile    := $(WORKINGDIR)/cache/bf/src/EffAna/AnaEff/BuildFile
EffAnaAnaEff_LOC_USE := self  FWCore/PluginManager FWCore/ParameterSet FWCore/Framework FWCore/MessageLogger FWCore/ServiceRegistry FWCore/Common root boost heppdt CommonTools/UtilAlgos DataFormats/HcalDetId DataFormats/HcalRecHit DataFormats/HcalDigi DataFormats/JetReco DataFormats/FEDRawData DataFormats/HeavyIonEvent DataFormats/VertexReco DataFormats/TrackReco CondFormats/CastorObjects CalibFormats/CastorObjects EventFilter/CastorRawToDigi Geometry/CaloGeometry SimDataFormats/HiGenData SimDataFormats/Vertex SimDataFormats/GeneratorProducts SimGeneral/HepPDTRecord rootmath
EffAnaAnaEff_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,EffAnaAnaEff,EffAnaAnaEff,$(SCRAMSTORENAME_LIB),src/EffAna/AnaEff/src))
EffAnaAnaEff_PACKAGE := self/src/EffAna/AnaEff/src
ALL_PRODS += EffAnaAnaEff
EffAnaAnaEff_INIT_FUNC        += $$(eval $$(call Library,EffAnaAnaEff,src/EffAna/AnaEff/src,src_EffAna_AnaEff_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
