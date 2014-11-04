ifeq ($(strip $(CheckPixelTracks)),)
CheckPixelTracks_files := $(patsubst src/usercode/PixelTracksRun2010/bin/%,%,$(foreach file,CheckPixelTracks.cc,$(eval xfile:=$(wildcard src/usercode/PixelTracksRun2010/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/usercode/PixelTracksRun2010/bin/$(file). Please fix src/usercode/PixelTracksRun2010/bin/BuildFile.))))
CheckPixelTracks := self/src/usercode/PixelTracksRun2010/bin
CheckPixelTracks_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/PixelTracksRun2010/bin/BuildFile
CheckPixelTracks_LOC_USE := self  root boost rootcintex DataFormats/FWLite FWCore/FWLite FWCore/Framework CommonTools/Utils PhysicsTools/FWLite PhysicsTools/Utilities DataFormats/Common DataFormats/TrackReco DataFormats/VertexReco
CheckPixelTracks_PACKAGE := self/src/usercode/PixelTracksRun2010/bin
ALL_PRODS += CheckPixelTracks
CheckPixelTracks_INIT_FUNC        += $$(eval $$(call Binary,CheckPixelTracks,src/usercode/PixelTracksRun2010/bin,src_usercode_PixelTracksRun2010_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,CheckPixelTracks,src/usercode/PixelTracksRun2010/bin))
endif
ALL_COMMONRULES += src_usercode_PixelTracksRun2010_bin
src_usercode_PixelTracksRun2010_bin_parent := usercode/PixelTracksRun2010
src_usercode_PixelTracksRun2010_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_PixelTracksRun2010_bin,src/usercode/PixelTracksRun2010/bin,BINARY))
