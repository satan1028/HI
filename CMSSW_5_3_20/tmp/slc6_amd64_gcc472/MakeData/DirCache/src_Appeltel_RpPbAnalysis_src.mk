ifeq ($(strip $(Appeltel/RpPbAnalysis)),)
ALL_COMMONRULES += src_Appeltel_RpPbAnalysis_src
src_Appeltel_RpPbAnalysis_src_parent := Appeltel/RpPbAnalysis
src_Appeltel_RpPbAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_Appeltel_RpPbAnalysis_src,src/Appeltel/RpPbAnalysis/src,LIBRARY))
AppeltelRpPbAnalysis := self/Appeltel/RpPbAnalysis
Appeltel/RpPbAnalysis := AppeltelRpPbAnalysis
AppeltelRpPbAnalysis_files := $(patsubst src/Appeltel/RpPbAnalysis/src/%,%,$(wildcard $(foreach dir,src/Appeltel/RpPbAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
AppeltelRpPbAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/Appeltel/RpPbAnalysis/BuildFile
AppeltelRpPbAnalysis_LOC_USE := self  hepmc FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/Common DataFormats/FEDRawData DataFormats/SiStripDetId DataFormats/TrackerRecHit2D DataFormats/SiPixelDetId DataFormats/DetId CondFormats/DataRecord CondFormats/SiStripObjects CalibFormats/SiStripObjects CalibTracker/Records FWCore/ServiceRegistry CommonTools/UtilAlgos DataFormats/SiStripCluster DataFormats/SiPixelCluster DataFormats/HeavyIonEvent DataFormats/TrackReco DataFormats/VertexReco DataFormats/HepMCCandidate DataFormats/Math DataFormats/Scalers Geometry/TrackerGeometryBuilder SimTracker/Records SimTracker/TrackAssociation SimTracker/TrackHistory SimDataFormats/GeneratorProducts SimGeneral/HepPDTRecord
AppeltelRpPbAnalysis_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,AppeltelRpPbAnalysis,AppeltelRpPbAnalysis,$(SCRAMSTORENAME_LIB),src/Appeltel/RpPbAnalysis/src))
AppeltelRpPbAnalysis_PACKAGE := self/src/Appeltel/RpPbAnalysis/src
ALL_PRODS += AppeltelRpPbAnalysis
AppeltelRpPbAnalysis_INIT_FUNC        += $$(eval $$(call Library,AppeltelRpPbAnalysis,src/Appeltel/RpPbAnalysis/src,src_Appeltel_RpPbAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
