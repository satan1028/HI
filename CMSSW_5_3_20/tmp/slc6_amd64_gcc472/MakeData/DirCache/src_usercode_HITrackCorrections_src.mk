ifeq ($(strip $(usercode/HITrackCorrections)),)
ALL_COMMONRULES += src_usercode_HITrackCorrections_src
src_usercode_HITrackCorrections_src_parent := usercode/HITrackCorrections
src_usercode_HITrackCorrections_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_HITrackCorrections_src,src/usercode/HITrackCorrections/src,LIBRARY))
usercodeHITrackCorrections := self/usercode/HITrackCorrections
usercode/HITrackCorrections := usercodeHITrackCorrections
usercodeHITrackCorrections_files := $(patsubst src/usercode/HITrackCorrections/src/%,%,$(wildcard $(foreach dir,src/usercode/HITrackCorrections/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodeHITrackCorrections_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/HITrackCorrections/BuildFile
usercodeHITrackCorrections_LOC_USE := self  hepmc FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/Common DataFormats/FEDRawData DataFormats/SiStripDetId DataFormats/TrackerRecHit2D DataFormats/SiPixelDetId DataFormats/DetId CondFormats/DataRecord CondFormats/SiStripObjects CalibFormats/SiStripObjects CalibTracker/Records FWCore/ServiceRegistry CommonTools/UtilAlgos DataFormats/SiStripCluster DataFormats/SiPixelCluster DataFormats/HeavyIonEvent DataFormats/TrackReco DataFormats/VertexReco DataFormats/HepMCCandidate DataFormats/Math DataFormats/Scalers
usercodeHITrackCorrections_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodeHITrackCorrections,usercodeHITrackCorrections,$(SCRAMSTORENAME_LIB),src/usercode/HITrackCorrections/src))
usercodeHITrackCorrections_PACKAGE := self/src/usercode/HITrackCorrections/src
ALL_PRODS += usercodeHITrackCorrections
usercodeHITrackCorrections_INIT_FUNC        += $$(eval $$(call Library,usercodeHITrackCorrections,src/usercode/HITrackCorrections/src,src_usercode_HITrackCorrections_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
