ifeq ($(strip $(usercode/PixelTracksRun2010)),)
ALL_COMMONRULES += src_usercode_PixelTracksRun2010_src
src_usercode_PixelTracksRun2010_src_parent := usercode/PixelTracksRun2010
src_usercode_PixelTracksRun2010_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_PixelTracksRun2010_src,src/usercode/PixelTracksRun2010/src,LIBRARY))
usercodePixelTracksRun2010 := self/usercode/PixelTracksRun2010
usercode/PixelTracksRun2010 := usercodePixelTracksRun2010
usercodePixelTracksRun2010_files := $(patsubst src/usercode/PixelTracksRun2010/src/%,%,$(wildcard $(foreach dir,src/usercode/PixelTracksRun2010/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodePixelTracksRun2010_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/PixelTracksRun2010/BuildFile
usercodePixelTracksRun2010_LOC_USE := self  DataFormats/Common DataFormats/DetId DataFormats/Math DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/TrackCandidate DataFormats/TrackReco DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit DataFormats/TrajectorySeed DataFormats/VertexReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities Geometry/CommonDetUnit Geometry/CommonTopologies Geometry/Records Geometry/TrackerGeometryBuilder MagneticField/Engine MagneticField/Records TrackingTools/PatternTools RecoLocalTracker/SiStripClusterizer RecoLocalTracker/Records TrackingTools/TransientTrack TrackingTools/TrajectoryCleaning TrackingTools/TrajectoryFiltering TrackingTools/Records RecoTracker/TrackProducer RecoPixelVertexing/PixelTriplets RecoPixelVertexing/PixelTrackFitting RecoPixelVertexing/PixelLowPtUtilities SimDataFormats/GeneratorProducts RecoVertex/VertexTools CommonTools/Utils clhep
usercodePixelTracksRun2010_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodePixelTracksRun2010,usercodePixelTracksRun2010,$(SCRAMSTORENAME_LIB),src/usercode/PixelTracksRun2010/src))
usercodePixelTracksRun2010_PACKAGE := self/src/usercode/PixelTracksRun2010/src
ALL_PRODS += usercodePixelTracksRun2010
usercodePixelTracksRun2010_INIT_FUNC        += $$(eval $$(call Library,usercodePixelTracksRun2010,src/usercode/PixelTracksRun2010/src,src_usercode_PixelTracksRun2010_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
