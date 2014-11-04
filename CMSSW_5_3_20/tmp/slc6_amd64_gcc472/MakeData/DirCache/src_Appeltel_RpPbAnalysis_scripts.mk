src_Appeltel_RpPbAnalysis_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/Appeltel/RpPbAnalysis/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_Appeltel_RpPbAnalysis_scripts,src/Appeltel/RpPbAnalysis/scripts,$(SCRAMSTORENAME_BIN),*))
