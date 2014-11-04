ifeq ($(strip $(usercode/MergedTrackCorrections)),)
ALL_COMMONRULES += src_usercode_MergedTrackCorrections_src
src_usercode_MergedTrackCorrections_src_parent := usercode/MergedTrackCorrections
src_usercode_MergedTrackCorrections_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_MergedTrackCorrections_src,src/usercode/MergedTrackCorrections/src,LIBRARY))
usercodeMergedTrackCorrections := self/usercode/MergedTrackCorrections
usercode/MergedTrackCorrections := usercodeMergedTrackCorrections
usercodeMergedTrackCorrections_files := $(patsubst src/usercode/MergedTrackCorrections/src/%,%,$(wildcard $(foreach dir,src/usercode/MergedTrackCorrections/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodeMergedTrackCorrections_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/MergedTrackCorrections/BuildFile
usercodeMergedTrackCorrections_LOC_USE := self  FWCore/Framework FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities DataFormats/Math DataFormats/Common DataFormats/TrackReco DataFormats/VertexReco DataFormats/HeavyIonEvent CommonTools/Utils CommonTools/UtilAlgos
usercodeMergedTrackCorrections_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodeMergedTrackCorrections,usercodeMergedTrackCorrections,$(SCRAMSTORENAME_LIB),src/usercode/MergedTrackCorrections/src))
usercodeMergedTrackCorrections_PACKAGE := self/src/usercode/MergedTrackCorrections/src
ALL_PRODS += usercodeMergedTrackCorrections
usercodeMergedTrackCorrections_INIT_FUNC        += $$(eval $$(call Library,usercodeMergedTrackCorrections,src/usercode/MergedTrackCorrections/src,src_usercode_MergedTrackCorrections_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
