ifeq ($(strip $(usercode/JEX)),)
ALL_COMMONRULES += src_usercode_JEX_src
src_usercode_JEX_src_parent := usercode/JEX
src_usercode_JEX_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_JEX_src,src/usercode/JEX/src,LIBRARY))
usercodeJEX := self/usercode/JEX
usercode/JEX := usercodeJEX
usercodeJEX_files := $(patsubst src/usercode/JEX/src/%,%,$(wildcard $(foreach dir,src/usercode/JEX/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodeJEX_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/JEX/BuildFile
usercodeJEX_LOC_USE := self  DataFormats/Common DataFormats/DetId DataFormats/Math DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/TrackCandidate DataFormats/TrackReco DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit DataFormats/TrajectorySeed DataFormats/VertexReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities Geometry/CommonDetUnit Geometry/CommonTopologies Geometry/Records Geometry/TrackerGeometryBuilder MagneticField/Engine MagneticField/Records TrackingTools/PatternTools RecoLocalTracker/SiStripClusterizer RecoLocalTracker/Records TrackingTools/TransientTrack TrackingTools/TrajectoryCleaning TrackingTools/TrajectoryFiltering TrackingTools/Records RecoTracker/TrackProducer RecoPixelVertexing/PixelTriplets RecoPixelVertexing/PixelTrackFitting RecoPixelVertexing/PixelLowPtUtilities SimDataFormats/GeneratorProducts RecoVertex/VertexTools CommonTools/Utils clhep
usercodeJEX_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodeJEX,usercodeJEX,$(SCRAMSTORENAME_LIB),src/usercode/JEX/src))
usercodeJEX_PACKAGE := self/src/usercode/JEX/src
ALL_PRODS += usercodeJEX
usercodeJEX_INIT_FUNC        += $$(eval $$(call Library,usercodeJEX,src/usercode/JEX/src,src_usercode_JEX_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
