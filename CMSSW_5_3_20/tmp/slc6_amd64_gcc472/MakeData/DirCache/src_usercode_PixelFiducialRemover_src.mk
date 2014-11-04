ifeq ($(strip $(usercode/PixelFiducialRemover)),)
ALL_COMMONRULES += src_usercode_PixelFiducialRemover_src
src_usercode_PixelFiducialRemover_src_parent := usercode/PixelFiducialRemover
src_usercode_PixelFiducialRemover_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_PixelFiducialRemover_src,src/usercode/PixelFiducialRemover/src,LIBRARY))
usercodePixelFiducialRemover := self/usercode/PixelFiducialRemover
usercode/PixelFiducialRemover := usercodePixelFiducialRemover
usercodePixelFiducialRemover_files := $(patsubst src/usercode/PixelFiducialRemover/src/%,%,$(wildcard $(foreach dir,src/usercode/PixelFiducialRemover/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodePixelFiducialRemover_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/PixelFiducialRemover/BuildFile
usercodePixelFiducialRemover_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/SiPixelDetId DataFormats/TrackerRecHit2D DataFormats/SiPixelCluster DataFormats/DetId DataFormats/Common
usercodePixelFiducialRemover_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodePixelFiducialRemover,usercodePixelFiducialRemover,$(SCRAMSTORENAME_LIB),src/usercode/PixelFiducialRemover/src))
usercodePixelFiducialRemover_PACKAGE := self/src/usercode/PixelFiducialRemover/src
ALL_PRODS += usercodePixelFiducialRemover
usercodePixelFiducialRemover_INIT_FUNC        += $$(eval $$(call Library,usercodePixelFiducialRemover,src/usercode/PixelFiducialRemover/src,src_usercode_PixelFiducialRemover_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
