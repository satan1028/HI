src_usercode_PixelTracksRun2010_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/usercode/PixelTracksRun2010/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_usercode_PixelTracksRun2010_scripts,src/usercode/PixelTracksRun2010/scripts,$(SCRAMSTORENAME_BIN),*))
