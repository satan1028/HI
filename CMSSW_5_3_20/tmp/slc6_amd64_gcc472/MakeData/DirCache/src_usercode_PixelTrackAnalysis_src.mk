ifeq ($(strip $(usercode/PixelTrackAnalysis)),)
ALL_COMMONRULES += src_usercode_PixelTrackAnalysis_src
src_usercode_PixelTrackAnalysis_src_parent := usercode/PixelTrackAnalysis
src_usercode_PixelTrackAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_PixelTrackAnalysis_src,src/usercode/PixelTrackAnalysis/src,LIBRARY))
usercodePixelTrackAnalysis := self/usercode/PixelTrackAnalysis
usercode/PixelTrackAnalysis := usercodePixelTrackAnalysis
usercodePixelTrackAnalysis_files := $(patsubst src/usercode/PixelTrackAnalysis/src/%,%,$(wildcard $(foreach dir,src/usercode/PixelTrackAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodePixelTrackAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/PixelTrackAnalysis/BuildFile
usercodePixelTrackAnalysis_LOC_USE := self  FWCore/Framework FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities DataFormats/Math DataFormats/Common DataFormats/TrackReco DataFormats/VertexReco DataFormats/HeavyIonEvent CommonTools/Utils CommonTools/UtilAlgos SimDataFormats/TrackingAnalysis SimTracker/Records SimTracker/TrackAssociation DataFormats/RecoCandidate Geometry/TrackerGeometryBuilder
usercodePixelTrackAnalysis_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodePixelTrackAnalysis,usercodePixelTrackAnalysis,$(SCRAMSTORENAME_LIB),src/usercode/PixelTrackAnalysis/src))
usercodePixelTrackAnalysis_PACKAGE := self/src/usercode/PixelTrackAnalysis/src
ALL_PRODS += usercodePixelTrackAnalysis
usercodePixelTrackAnalysis_INIT_FUNC        += $$(eval $$(call Library,usercodePixelTrackAnalysis,src/usercode/PixelTrackAnalysis/src,src_usercode_PixelTrackAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
